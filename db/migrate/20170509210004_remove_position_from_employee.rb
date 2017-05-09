class RemovePositionFromEmployee < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.remove :position
    end
  end
end
