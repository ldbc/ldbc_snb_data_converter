LOAD CSV WITH HEADERS FROM 'file:///' + $batch + '/deletes/Person.csv' AS row FIELDTERMINATOR '|'
WITH toInteger(row.id) AS id
MATCH (person:Person {id: id})
OPTIONAL MATCH (person)<-[:HAS_CREATOR]-(:Message)<-[:REPLY_OF*0..]-(message1:Message) // DEL 6/7
OPTIONAL MATCH (person)<-[:HAS_MODERATOR]-(forum:Forum)-[:CONTAINER_OF]->(:Post)<-[:REPLY_OF*0..]-(message2:Message) // DEL 4
WHERE forum.title STARTS WITH 'Album '
   OR forum.title STARTS WITH 'Wall '
DETACH DELETE person, forum, message1, message2
