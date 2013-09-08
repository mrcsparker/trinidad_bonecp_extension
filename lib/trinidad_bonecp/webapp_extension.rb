module Trinidad
  module Extensions
    class BonecpWebAppExtension < WebAppExtension

      def configure(tomcat, app_context)
        case @options
        when Hash
          [create_resource(tomcat, app_context, @options)]
        when Array
          @options.map { |opts| create_resource tomcat, app_context, opts }
        end
      end

      protected

      def create_resource(tomcat, app_context, options)
        jndi, url = options.delete(:jndi), options.delete(:url)
        url = protocol + url unless %r{^#{protocol}} =~ url
        options[:jdbcUrl] = url

        load_driver

        driver_name = options.delete(:driver) || options.delete(:driverName) ||
                      self.driver_name

        #<Resource type="javax.sql.DataSource"
        #   name="jdbc/jndiName"
        #   factory="com.jolbox.bonecp.BoneCPDataSource"
        #   driverClassName="org.gjt.mm.mysql.Driver"
        #   jdbcUrl="jdbc:mysql://localhost:3306/databaseName?characterEncoding=UTF-8"
        #   username="user"
        #   password="password"
        #   idleMaxAge="240"
        #   idleConnectionTestPeriod="60"
        #   partitionCount="3"
        #   acquireIncrement="3"
        #   maxConnectionsPerPartition="7"
        #   minConnectionsPerPartition="2"
        #   statementsCacheSize="50"
        #   releaseHelperThreads="5" />
        resource = Trinidad::Tomcat::ContextResource.new
        resource.set_auth(options.delete(:auth)) if options.has_key?(:auth)
        resource.set_description(options.delete(:description)) if options.has_key?(:description)
        resource.set_name(jndi)
        resource.set_type('javax.sql.DataSource')

        options.each { |key, value| resource.set_property(key.to_s, value.to_s) }
        resource.set_property('driverClassName', driver_name)
        resource.set_property('factory', 'com.jolbox.bonecp.BoneCPDataSource');

        app_context.naming_resources.add_resource(resource)
        app_context.naming_resources = resource.naming_resources

        resource
      end

      def load_driver; end

    end
  end
end
