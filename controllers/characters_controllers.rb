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

post '/randomise_character' do
    user_id = session["user_id"]

    names = ['chip', 'shell', 'extra#32']
    random_name = names.sample

    portrait = "https://images.unsplash.com/photo-1605142859862-978be7eba909?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80"

    races = ['Human', 'Elf', 'Dwarf', 'Halfling', 'Half-Elf', 'Gnome', ]
    random_race = races.sample

    player_classes = ['Fighter', 'Barbarian', 'Cleric, Wizard', 'Rogue' , 'Druid']
    random_class = player_classes.sample

    strengths = ['Heckin Lorge', 'Charismatic', 'Natural Leader', 'Deft', 'Can operate a vending machine']
    random_strengths = strengths.sample

    flaws = ["Hates to adventures", "Fear of gold coins", "Double Dips", "Struggles to populate an array"]
    random_flaws = flaws.sample

    
    create_character(user_id, random_name, portrait, random_race, random_class, random_strengths, random_flaws)

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


