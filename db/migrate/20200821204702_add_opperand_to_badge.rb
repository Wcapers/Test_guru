class AddOpperandToBadge < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :operand, :string
  end
end
