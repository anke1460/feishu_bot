class CreateFeishuBotFeishuMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :feishu_bot_feishu_messages do |t|
      t.string :content
      t.integer :clazz
      t.integer :feishu_user_id
      t.string :key
      t.string :uid
      t.string :uuid
      t.boolean :is_read, default: false

      t.timestamps
    end
    add_index :feishu_bot_feishu_messages, :uuid
  end
end
