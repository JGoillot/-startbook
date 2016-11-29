class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :cover_url
      t.string :ebook_url
      t.string :amazon_url
      t.string :summary_url

      t.timestamps
    end
  end
end
