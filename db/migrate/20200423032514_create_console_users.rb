class CreateConsoleUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :consolee_users do |t|
      t.integer :console_id
      t.integer :user_id
    end
  end
end
