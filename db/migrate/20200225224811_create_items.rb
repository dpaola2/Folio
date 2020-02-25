class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :url
      t.boolean :archived

      t.timestamps
    end
  end
end
