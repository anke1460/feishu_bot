class CreateFeishuBotFeishuUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :feishu_bot_feishu_users do |t|
      t.string :uid
      t.string :name

      t.timestamps
    end
    add_index :feishu_bot_feishu_users, :uid
  end
end
