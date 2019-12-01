json.data do 
  json.movies do
    json.array! @movies do |movie|
      json.id movie.id
      json.title movie.title
      json.release_date movie.release_date
      json.actors movie.actors
      json.directors movie.directors
      json.gender movie.gender.name
      json.original_language movie.original_language
      json.duration movie.duration
      json.created_at movie.created_at
      json.updated_at movie.updated_at
    end
  end
  json.total_itens @movies_tot
  json.current_page (params[:page] ? params[:page] : 1)
  json.total_pages (@movies_tot % 15 == 0 ? @movies_tot / 15 : @movies_tot / 15 + 1)
end