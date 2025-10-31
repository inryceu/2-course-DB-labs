INSERT INTO games (
    title,
    price,
    release_date,
    age_rating,
    cover,
    description,
    system_requirements,
    base_game_id
)
VALUES 
(
    'Starfall Odyssey',
    59.99,
    '2024-09-12',
    '18+',
    'https://example.com/covers/starfall_odyssey.jpg',
    'An interstellar exploration RPG where you command a customizable starship and crew.',
    '{
        "OS": "Windows 11 64-bit",
        "CPU": "Intel Core i7-10700 / AMD Ryzen 7 3700X",
        "RAM": "16 GB",
        "GPU": "NVIDIA RTX 3060 / AMD RX 6700 XT",
        "Storage": "90 GB SSD"
    }',
    NULL
),
(
    'Farm Life Simulator',
    14.99,
    '2021-03-20',
    '3+',
    'https://example.com/covers/farm_life_simulator.jpg',
    'Relaxing farming simulator featuring seasons, dynamic weather, and animal breeding.',
    '{
        "OS": "Windows 10 64-bit",
        "CPU": "Intel Core i3-6100 / AMD FX-6300",
        "RAM": "4 GB",
        "GPU": "NVIDIA GTX 750 / AMD R7 260X",
        "Storage": "25 GB"
    }',
    NULL
),
(
    'Shadow Protocol',
    39.99,
    '2023-02-08',
    '16+',
    'https://example.com/covers/shadow_protocol.jpg',
    'A tactical stealth shooter set in a cyberpunk world of espionage and conspiracy.',
    '{
        "OS": "Windows 10 64-bit",
        "CPU": "Intel Core i5-8400 / AMD Ryzen 5 2600",
        "RAM": "8 GB",
        "GPU": "NVIDIA GTX 1050 Ti / AMD RX 560",
        "Storage": "50 GB"
    }',
    NULL
),
(
    'Shadow Protocol: Covert Ops',
    24.99,
    '2024-11-18',
    '16+',
    'https://example.com/covers/shadow_protocol_covert_ops.jpg',
    'Standalone expansion for "Shadow Protocol" introducing new stealth mechanics, missions, and co-op mode.',
    '{
        "OS": "Windows 11 64-bit",
        "CPU": "Intel Core i5-9400 / AMD Ryzen 5 3600",
        "RAM": "8 GB",
        "GPU": "NVIDIA GTX 1660 / AMD RX 5600 XT",
        "Storage": "30 GB"
    }',
    3
);
