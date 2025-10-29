INSERT INTO saves (user_id, game_id, save_data)
VALUES
(1, 1, '{
    "progress": 42,
    "location": "Andromeda Outpost",
    "inventory": ["laser pistol", "medkit", "fuel cells"],
    "last_mission": "Rescue the lost explorer"
}'),
(1, 4, '{
    "progress": 65,
    "current_chapter": "Neural Collapse",
    "unlocked_nodes": 7,
    "choices": ["spared_AI_core", "hacked_security"]
}'),

(2, 2, '{
    "progress": 88,
    "difficulty": "Hard",
    "stealth_kills": 37,
    "active_quests": ["Infiltrate the Citadel"]
}'),
(2, 3, '{
    "progress": 12,
    "sector": "Outer Rim Station",
    "missions_completed": 1,
    "equipment": ["ion blaster", "shield enhancer"]
}'),

(3, 4, '{
    "progress": 23,
    "chapter": "Echoes of Thought",
    "collected_data": ["memory_fragment_01"],
    "difficulty": "Normal"
}');
