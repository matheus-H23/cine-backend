# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



namespace :genders do 
  gender_list = ["Ação", "Aventura", "Comédia", "Ficção Científica",
                "Romance", "Suspense", "Terror","Drama", "Fantasia",
                "Comédia Romantica","Super Herói"]

  gender_list.each do |gender|
    Gender.create(
      name: gender
    )
  end
end
