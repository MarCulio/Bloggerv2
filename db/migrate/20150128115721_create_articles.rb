class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    t.string :title
    t.text :body
    t.timestamps null: false
    t.integer :impressions_count, default: 0
    end
  end
end
