class ChangeIntroductionNullOnUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :introduction, true
  end
end
