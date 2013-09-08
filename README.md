# Trinidad BoneCP Database Pool

Trinidad extensions that support the BoneCP (http://jolbox.com/) connection pool library.

The code is based on the Trinidad DBPool extension (https://github.com/trinidad/trinidad_dbpool_extension).

## Usage

The configuration is modeled after the `trinidad_dbpool_extension`.

* Install the gem e.g. `jruby -S gem install trinidad_generic_bonecp_extension`
* Configure the pool with Trinidad's configuration file e.g. :

```yml
---
  extensions:
    generic_bonecp:                          # EXTENSION NAME AS KEY
      jndi: 'jdbc/MyDB'                      # JNDI name
      url: 'jdbc:db2://127.0.0.1:50000/MYDB' # specify full jdbc: URL
      username: 'mydb'                       # database username
      password: 'pass'                       # database password
      driverPath: '/opt/IBM/DB2/db2jcc4.jar' # leave out if on class-path
      driverName: com.ibm.db2.jcc.DB2Driver  # resolved from driverPath jar
```

## Copyright

Copyright (c) 2013 [Chris Parker](https://github.com/mrcsparker).
See LICENSE (http://en.wikipedia.org/wiki/MIT_License) for details.
