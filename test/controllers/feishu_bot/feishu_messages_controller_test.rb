require 'test_helper'

module FeishuBot
  class FeishuMessagesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get feishu_messages_index_url
      assert_response :success
    end

  end
end
