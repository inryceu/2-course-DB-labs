SELECT r.username    AS requester,
       a.username    AS accepter,
       f.status      AS action
FROM friends f
JOIN users r ON f.user_id = r.id
JOIN users a ON f.friend_id = a.id;