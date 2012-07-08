module Tbone
  require 'tbone/engine' if defined?(Rails)
  def self.configure(&block)
    self.config.instance_eval(&block)
  end
  def self.config
    @config ||= Config.new
  end
  class Config
    attr_reader :params
    def add_params(p)
      @params ||= {}
      @params.merge!(p)
    end
  end
end
