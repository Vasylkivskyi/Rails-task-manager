class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :compleated, :completed
  end
end
