module FeishuBot
  class Engine < ::Rails::Engine
    isolate_namespace FeishuBot

    initializer('feishu', after: :load_config_initializers) do |app|
      Rails.application.routes.prepend do
        mount FeishuBot::Engine, at: '/feishu'
      end
    end
  end
end
