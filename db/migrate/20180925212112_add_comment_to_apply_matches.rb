class AddCommentToApplyMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :apply_matches, :comment, :text
  end
end
