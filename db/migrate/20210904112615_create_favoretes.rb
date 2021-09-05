class CreateFavoretes < ActiveRecord::Migration[5.2]
  def change
    create_table :favoretes do |t|

      t.timestamps
    end
  end
end
