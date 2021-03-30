SELECT
ROUND(
    COALESCE(
    (SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id from RequestAccepted) AS num_acceptance)
    /
    (SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id from FriendRequest)AS num_request),
    0)
, 2) as accept_rate
