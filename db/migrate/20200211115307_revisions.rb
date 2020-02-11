class Revisions < ActiveRecord::Migration[5.2]
  def change
    create_table :revisions do |t|
      t.string :content
      t.datetime :created_at
    end
  end
end
