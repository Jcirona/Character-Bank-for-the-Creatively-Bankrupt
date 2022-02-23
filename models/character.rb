def all_characters
    run_sql("SELECT * FROM characters ORDER BY id")
end

def users_characters(user_id)
    run_sql("SELECT * FROM characters WHERE user_id = $1 ORDER BY id", [user_id])

end

def create_character(user_id, name, character_portrait, race, character_class)
    run_sql("INSERT INTO characters(user_id, name, character_portrait, race, character_class) 
    VALUES($1, $2, $3, $4, $5)", 
    [user_id, name, character_portrait, race, character_class])
end

def get_character(id)
    run_sql("SELECT * FROM characters WHERE id = $1", [id])[0]
end

def update_character(id, name, character_portrait, race, character_class)
    run_sql("UPDATE characters SET name = $2, character_portrait = $3, race = $4, character_class = $5 WHERE id = $1", [id, name, character_portrait, race, character_class])
end

def delete_character(id)
    run_sql("DELETE FROM characters WHERE id = $1", [id])
end
