require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Trinidad
  module Extensions
    class StubBonecpWebAppExtension < BonecpWebAppExtension
      def driver_name
        'stub.Driver'
      end

      def protocol
        'jdbc:stub://'
      end
    end
  end
end

describe Trinidad::Extensions::StubBonecpWebAppExtension do
  include BonecpExampleHelperMethods

  before(:each) do
    @defaults = { :jndi => 'jdbc/TestDB', :url => '' }
    @context = build_context
    @tomcat = mock_tomcat
  end

  it 'adds the resource to the tomcat standard context' do
    extension = build_extension @defaults
    extension.configure(@tomcat, @context)
    context_should_have_resource 'jdbc/TestDB'
  end

  it 'adds properties to the resource' do
    options = @defaults.merge :maxIdle => 300
    extension = build_extension options
    resources = extension.configure(@tomcat, @context)
    expect(resources).to be_only_and_have_property('maxIdle', '300')
  end

  it "adds the protocol if the url doesn't include it" do
    options = @defaults.merge :url => 'localhost:3306/test_protocol'
    extension = build_extension options
    resources = extension.configure(@tomcat, @context)
    expect(resources).to be_only_and_have_property('jdbcUrl', "jdbc:stub://#{options[:url]}")
  end

  it 'allows for multiple pools per driver' do
    options = [@defaults, { :jndi => 'jdbc/TestDB2', :url => '' }]
    extension = build_extension options
    resources = extension.configure(@tomcat, @context)
    expect(resources.size).to eq(2)
    context_should_have_resource 'jdbc/TestDB'
    context_should_have_resource 'jdbc/TestDB2'
  end

  def context_should_have_resource(name)
    expect(@context.naming_resources.find_resource(name)).not_to be_nil
  end

  def build_extension(options)
    Trinidad::Extensions::StubBonecpWebAppExtension.new options
  end
end
