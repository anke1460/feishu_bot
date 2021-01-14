module FeishuBot
  class << self
    def access_token
      Rails.cache.fetch("feishu_access_token", expires_in: 2.hours) do
        res = HTTP.post("https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal/", :json => { :app_id => Config.app_id, :app_secret=> Config.app_secret })
        JSON.parse(res.body.readpartial)['tenant_access_token']
      end
    end

    def batch_user_info(open_ids)
      res = request.get('https://open.feishu.cn/open-apis/contact/v1/user/batch_get', params: {:open_ids => open_ids})
      users = JSON.parse(res.body.readpartial)

      users['data']
    end

    # 获取机器人所在的群列表
    def group_list(page_size = 200, page = nil)
      res = request.get('https://open.feishu.cn/open-apis/chat/v4/list', params: {page_size: page_size, page_token: page})
      group_content = JSON.parse(res.body.readpartial)

      group_content['data']
    end


    # 获取群信息
    def group_info(chat_id)
      res = request.get("https://open.feishu.cn/open-apis/chat/v4/info", :params => {:chat_id=> chat_id})
      group_users_content = JSON.parse(res.body.readpartial)

      member_ids = group_users_content["data"]["members"]
    end

    #  获取群成员信息
    # def member_list(chat_id)
    #   res = request.get("https://open.feishu.cn/open-apis/chat/v4/members", :params => {:chat_id=> chat_id})
    #   group_users_content = JSON.parse(res.body.readpartial)

    #   member_ids = group_users_content["data"]
    # end

    def image_data(key)
      res = request.get('https://open.feishu.cn/open-apis/image/v4/get', params: {image_key: key})
      res.body.readpartial
    end

    def send_text(open_id, text)
      send_msg = request.post("https://open.feishu.cn/open-apis/message/v4/send/", :json => { :open_id => open_id, :msg_type => 'text', :content => { :text=> text} })
      send_res = JSON.parse(send_msg.body.readpartial)
    end

    def request
      HTTP.headers(:Authorization=> "Bearer #{self.access_token}")
    end

  end
end
