require_dependency "feishu_bot/application_controller"

module FeishuBot
  class FeishuMessagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      if params[:event][:type] == 'message'
        user = FeishuUser.find_or_initialize_by(uid: params[:event][:open_id])
        user.save
        message = FeishuMessage.find_or_initialize_by(uuid: params[:uuid]) do |d|
          d.uid = params[:event][:open_id]
          d.feishu_user_id = user.id
          if params[:event][:msg_type] == 'image'
            d.key = params[:event][:image_key]
          elsif params[:event][:msg_type] == 'file'
            d.key = params[:event][:file_key]
          end
          d.clazz = params[:event][:msg_type]
          d.content = params[:event][:text]
        end
        message.save
      end

      render json: {challenge: params[:challenge]}
    end
  end
end


