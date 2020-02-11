class AddTitleidToRevisions < ActiveRecord::Migration[5.2]
  def change
    add_column :revisions, :title_id, :string 
  end
end
