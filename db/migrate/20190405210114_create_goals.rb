class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null:false
      t.text :details
      t.boolean :visibility, default:true
      t.boolean :is_finished, default:false
      t.timestamps
    end
  end
end
