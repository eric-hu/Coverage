class CreateEhrens < ActiveRecord::Migration
  def change
    create_table :ehrens do |t|

      t.timestamps
    end
  end
end
