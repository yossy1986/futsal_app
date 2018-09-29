class RemoveCommentColumnToCahtLinks < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat_links, :comment
  end
end
