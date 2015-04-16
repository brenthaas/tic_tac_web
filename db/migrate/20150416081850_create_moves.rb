class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :player
      t.string :location
      t.belongs_to :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
