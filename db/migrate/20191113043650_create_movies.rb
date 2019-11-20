class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.string :actors, array: true
      t.string :directors, array: true
      t.references :gender, null: false, foreign_key: true
      t.string :original_language
      t.integer :duration

      t.timestamps
    end
  end
end
