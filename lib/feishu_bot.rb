require "feishu_bot/engine"
require "feishu_bot/config"
require "feishu_bot/api"

require 'http'

module FeishuBot
  # Your code goes here...
  class << self
    def configure(&block)
      Config.configure(&block)
    end
  end
end
