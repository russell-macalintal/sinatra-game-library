class CreateConsoles < ActiveRecord::Migration[6.0]
  def change
    create_table :consoles do |t|
      t.string :name
      t.string :manufacturer
      t.integer :user_id
    end
  end
end
