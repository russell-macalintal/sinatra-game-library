class AddDevelopersToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :developer_id, :integer
  end
end
