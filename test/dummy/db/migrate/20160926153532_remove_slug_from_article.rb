class RemoveSlugFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :slug, :string
  end
end
