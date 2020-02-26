class AddFieldsToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :title, :string
    add_column :items, :body, :string
  end
end
