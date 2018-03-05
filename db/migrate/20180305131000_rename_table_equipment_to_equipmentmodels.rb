class RenameTableEquipmentToEquipmentmodels < ActiveRecord::Migration[5.0]
  def change
  	 rename_table :equipment, :equipmentmodels
  end
  
end
