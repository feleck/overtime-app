class SwapOutRationaleWithWorkPerformed < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :rationale, :work_performed
  end
end
