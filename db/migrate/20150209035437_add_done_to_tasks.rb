class AddDoneToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :done, :datetime
  end
end
