require "openssl"
require "json"
require "http/client"
require "kemal"

require "./zincir/emitter"
require "./zincir/*"
require "./zincir/storage/*"

module Zincir
  VERSION = "0.5.0"
end
