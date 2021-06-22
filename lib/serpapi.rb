require 'serpapi/error'
require 'serpapi/client'
require 'serpapi/engine'
require 'serpapi/configuration'

module Serpapi
  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield config
  end
end
