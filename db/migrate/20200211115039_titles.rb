class Titles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :title
      t.datetime :created_at
    end
  end
end
