def all_characters
    run_sql("SELECT * FROM characters ORDER BY id")
end

def users_characters(user_id)
    run_sql("SELECT * FROM characters WHERE user_id = $1 ORDER BY id", [user_id])

end

def create_character(user_id, name, character_portrait, race, character_class, character_strength, character_flaw)
    run_sql("INSERT INTO characters(user_id, name, character_portrait, race, character_class, character_strength, character_flaw) 
    VALUES($1, $2, $3, $4, $5, $6, $7)", 
    [user_id, name, character_portrait, race, character_class, character_strength, character_flaw])
end

def get_character(id)
    run_sql("SELECT * FROM characters WHERE id = $1", [id])[0]
end

def update_character(id, name, character_portrait, race, character_class, character_strength, character_flaw)
    run_sql("UPDATE characters SET name = $2, character_portrait = $3, race = $4, character_class = $5, character_strength = $6, character_flaw = $7 WHERE id = $1", [id, name, character_portrait, race, character_class, character_strength, character_flaw])
end

def delete_character(id)
    run_sql("DELETE FROM characters WHERE id = $1", [id])
end
