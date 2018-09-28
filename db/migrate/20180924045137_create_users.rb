class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id
      t.integer :now_count, default: 0
      t.integer :today_count, default: 0
      t.integer :effort_count, default: 0
    end
  end
end
