get '/' do
    user_id = session['user_id']
    characters = users_characters(user_id)
    erb :'characters/index', locals: {
        characters: characters
    }
end

get '/characters/new' do
    erb :'characters/new'
end

post '/characters' do
    user_id = session["user_id"]
    name = params["name"]
    character_portrait = params["character_portrait"]
    race = params["race"]
    character_class = params["character_class"]
    character_strength = params["character_strength"]
    character_flaw = params["character_flaw"]

    create_character(user_id, name, character_portrait, race, character_class, character_strength, character_flaw)

    redirect '/'
end

get '/characters/:id/edit' do
    id = params["id"]
    character = get_character(id)
    erb :'characters/edit', locals: {
        character: character
    }
end

put '/characters/:id' do
    id = params["id"]
    name = params["name"]
    character_portrait = params["character_portrait"]
    race = params["race"]
    character_class = params["character_class"]
    character_strength = params["character_strength"]
    character_flaw = params["character_flaw"]

    update_character(id, name, character_portrait, race, character_class, character_strength, character_flaw)

    redirect '/'
end

delete '/characters/:id' do
    id = params["id"]

    delete_character(id)

    redirect '/'
end


