require 'rubygems'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'fixtures'))

gem 'minitest'

require "minitest/autorun"
require 'webmock/minitest'
require 'rmoolah'