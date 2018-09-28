class AddNowAndEffortToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :now_rank, :integer
    add_column :users, :effort_rank, :integer
  end
end
