class AddPublicToWikiPages < ActiveRecord::Migration
  def change
    add_column :wiki_pages, :public, :boolean, default: false, null: false
  end
end
