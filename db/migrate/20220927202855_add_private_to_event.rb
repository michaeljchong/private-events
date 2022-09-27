class AddPrivateToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :private_event, :boolean
  end
end
