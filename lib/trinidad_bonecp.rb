require 'java'

require 'trinidad'
require 'trinidad/jars'

load File.expand_path('../../trinidad-libs/guava-15.0.jar', __FILE__)
load File.expand_path('../../trinidad-libs/log4j-1.2.17.jar', __FILE__)
load File.expand_path('../../trinidad-libs/slf4j-api-1.7.2.jar', __FILE__)
load File.expand_path('../../trinidad-libs/slf4j-log4j12-1.7.2.jar', __FILE__)
load File.expand_path('../../trinidad-libs/bonecp-0.8.0.RELEASE.jar', __FILE__)

require 'trinidad_bonecp/webapp_extension'
