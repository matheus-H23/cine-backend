  json.array! @users do |user|
    json.id user.id
    json.email user.email
    json.firstname user.firstname
    json.lastname user.lastname
    json.birthdate user.birthdate
    json.created_at user.created_at
    json.updated_at user.updated_at
  end