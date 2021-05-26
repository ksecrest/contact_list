class ChangeNameToFirstName < ActiveRecord::Migration[6.1]
  def change
                 #table , # column, # new column
    rename_column :contacts, :name, :first_name
  end
end
