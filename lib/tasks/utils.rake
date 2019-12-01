namespace :utils do 
  desc "Popular banco de dados"
  task seed_pop: :environment do
    

    puts "Populating Movies..."
      100.times do |movie|
        @gender = Gender.all.sample
        movie = Movie.new({
          title: Faker::TvShows::BreakingBad.episode,
          release_date: Time.at(rand * Time.now.to_i), 
          actors: [Faker::Name.name], 
          directors: [Faker::Name.name], 
          gender: @gender, 
          original_language: "English", 
          duration: Random.rand(30..220),
        })
        movie.save!
      end
    puts "Populating Movies...(OK)"

  end
end