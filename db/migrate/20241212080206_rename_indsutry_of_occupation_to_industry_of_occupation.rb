class RenameIndsutryOfOccupationToIndustryOfOccupation < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :indsutry_of_occupation, :industry_of_occupation
  end
end
