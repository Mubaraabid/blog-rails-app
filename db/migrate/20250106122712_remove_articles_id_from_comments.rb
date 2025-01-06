class RemoveArticlesIdFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :articles_id, :bigint
  end
end
