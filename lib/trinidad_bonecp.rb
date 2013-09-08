require 'java'

require 'trinidad'
require 'trinidad/jars'

load File.expand_path('../../trinidad-libs/guava-14.0.1.jar', __FILE__)
load File.expand_path('../../trinidad-libs/bonecp-0.7.1.RELEASE.jar', __FILE__)

require 'trinidad_bonecp/webapp_extension'
