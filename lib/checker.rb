require 'pry'
require 'pry-nav'
require 'celluloid/current'
require 'rb-inotify'

require 'checker/version'
require 'checker/listener'
require 'checker/payloads/payloads'
require 'checker/strategies/strategies'
require 'checker/parser_worker'
require 'checker/loader'

require File.expand_path("../../config/config",__FILE__)

module Checker
end
