class AddAdminToSessions < ActiveRecord::Migration[8.1]
  def change
    add_reference :sessions, :admin, foreign_key: true, type: :bigint
    change_column_null :sessions, :user_id, true
  end
end
