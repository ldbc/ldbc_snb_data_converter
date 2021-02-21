
-- composite-merged-fk
COPY (SELECT * FROM Organisation)
  TO 'data/csv-composite-merged-fk/static/Organisation.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT * FROM Place)
  TO 'data/csv-composite-merged-fk/static/Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT * FROM Tag)
  TO 'data/csv-composite-merged-fk/static/Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT * FROM TagClass)
  TO 'data/csv-composite-merged-fk/static/TagClass.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, title, hasModerator_Person FROM Forum)
  TO 'data/csv-composite-merged-fk/dynamic/Forum.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, locationIP, browserUsed, content, length, hasCreator_Person, isLocatedIn_Place, replyOf_Post, replyOf_Comment FROM Comment)
  TO 'data/csv-composite-merged-fk/dynamic/Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, imageFile, locationIP, browserUsed, language, content, length, hasCreator_Person, Forum_containerOf, isLocatedIn_Place FROM Post)
  TO 'data/csv-composite-merged-fk/dynamic/Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, firstName, lastName, gender, birthday, locationIP, browserUsed, isLocatedIn_Place, speaks, email FROM Person)
  TO 'data/csv-composite-merged-fk/dynamic/Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Comment_hasTag_Tag)
  TO 'data/csv-composite-merged-fk/dynamic/Comment_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Post_hasTag_Tag)
  TO 'data/csv-composite-merged-fk/dynamic/Post_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasMember_Person FROM Forum_hasMember_Person)
  TO 'data/csv-composite-merged-fk/dynamic/Forum_hasMember_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Forum_hasTag_Tag)
  TO 'data/csv-composite-merged-fk/dynamic/Forum_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasInterest_Tag FROM Person_hasInterest_Tag)
  TO 'data/csv-composite-merged-fk/dynamic/Person_hasInterest_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, likes_Comment FROM Person_likes_Comment)
  TO 'data/csv-composite-merged-fk/dynamic/Person_likes_Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, likes_Post FROM Person_likes_Post)
  TO 'data/csv-composite-merged-fk/dynamic/Person_likes_Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, studyAt_University, classYear FROM Person_studyAt_University)
  TO 'data/csv-composite-merged-fk/dynamic/Person_studyAt_University.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, workAt_Company, workFrom FROM Person_workAt_Company)
  TO 'data/csv-composite-merged-fk/dynamic/Person_workAt_Company.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, Person1id, Person2id FROM Person_knows_Person)
  TO 'data/csv-composite-merged-fk/dynamic/Person_knows_Person.csv'
  WITH (HEADER, DELIMITER '|');

-- singular-merged-fk
COPY (SELECT * FROM Organisation)
  TO 'data/csv-singular-merged-fk/static/Organisation.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT * FROM Place)
  TO 'data/csv-singular-merged-fk/static/Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT * FROM Tag)
  TO 'data/csv-singular-merged-fk/static/Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT * FROM TagClass)
  TO 'data/csv-singular-merged-fk/static/TagClass.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, title, hasModerator_Person FROM Forum)
  TO 'data/csv-singular-merged-fk/dynamic/Forum.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, locationIP, browserUsed, content, length, hasCreator_Person, isLocatedIn_Place, replyOf_Post, replyOf_Comment FROM Comment)
  TO 'data/csv-singular-merged-fk/dynamic/Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, imageFile, locationIP, browserUsed, language, content, length, hasCreator_Person, Forum_containerOf, isLocatedIn_Place FROM Post)
  TO 'data/csv-singular-merged-fk/dynamic/Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, firstName, lastName, gender, birthday, locationIP, browserUsed, isLocatedIn_Place FROM Person)
  TO 'data/csv-singular-merged-fk/dynamic/Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, unnest(string_split_regex(email,  ';')) AS email FROM Person)  TO 'data/csv-singular-merged-fk/dynamic/Person_email.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, unnest(string_split_regex(speaks, ';')) AS speaks FROM Person) TO 'data/csv-singular-merged-fk/dynamic/Person_speaks.csv' WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Comment_hasTag_Tag)
  TO 'data/csv-singular-merged-fk/dynamic/Comment_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Post_hasTag_Tag)
  TO 'data/csv-singular-merged-fk/dynamic/Post_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasMember_Person FROM Forum_hasMember_Person)
  TO 'data/csv-singular-merged-fk/dynamic/Forum_hasMember_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Forum_hasTag_Tag)
  TO 'data/csv-singular-merged-fk/dynamic/Forum_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasInterest_Tag FROM Person_hasInterest_Tag)
  TO 'data/csv-singular-merged-fk/dynamic/Person_hasInterest_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, likes_Comment FROM Person_likes_Comment)
  TO 'data/csv-singular-merged-fk/dynamic/Person_likes_Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, likes_Post FROM Person_likes_Post)
  TO 'data/csv-singular-merged-fk/dynamic/Person_likes_Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, studyAt_University, classYear FROM Person_studyAt_University)
  TO 'data/csv-singular-merged-fk/dynamic/Person_studyAt_University.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, workAt_Company, workFrom FROM Person_workAt_Company)
  TO 'data/csv-singular-merged-fk/dynamic/Person_workAt_Company.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, Person1id, Person2id FROM Person_knows_Person)
  TO 'data/csv-singular-merged-fk/dynamic/Person_knows_Person.csv'
  WITH (HEADER, DELIMITER '|');

-- composite-projected-fk
COPY (SELECT id, type, name, url FROM Organisation)
  TO 'data/csv-composite-projected-fk/static/Organisation.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isLocatedIn_Place FROM Organisation)
  TO 'data/csv-composite-projected-fk/static/Organisation_isLocatedIn_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url, type FROM Place)
  TO 'data/csv-composite-projected-fk/static/Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isPartOf_Place FROM Place WHERE isPartOf_Place IS NOT NULL)
  TO 'data/csv-composite-projected-fk/static/Place_isPartOf_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url FROM Tag)
  TO 'data/csv-composite-projected-fk/static/Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, hasType_TagClass FROM Tag)
  TO 'data/csv-composite-projected-fk/static/Tag_hasType_TagClass.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url FROM TagClass)
  TO 'data/csv-composite-projected-fk/static/TagClass.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isSubclassOf_TagClass FROM TagClass WHERE isSubclassOf_TagClass IS NOT NULL)
  TO 'data/csv-composite-projected-fk/static/TagClass_isSubclassOf_TagClass.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, title FROM Forum)
  TO 'data/csv-composite-projected-fk/dynamic/Forum.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasModerator_Person FROM Forum)
  TO 'data/csv-composite-projected-fk/dynamic/Forum_hasModerator_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, locationIP, browserUsed, content, length FROM Comment)
  TO 'data/csv-composite-projected-fk/dynamic/Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasCreator_Person FROM Comment)
  TO 'data/csv-composite-projected-fk/dynamic/Comment_hasCreator_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, isLocatedIn_Place FROM Comment)
  TO 'data/csv-composite-projected-fk/dynamic/Comment_isLocatedIn_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, replyOf_Post FROM Comment WHERE replyOf_Post IS NOT NULL)
  TO 'data/csv-composite-projected-fk/dynamic/Comment_replyOf_Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, replyOf_Comment FROM Comment WHERE replyOf_Comment IS NOT NULL)
  TO 'data/csv-composite-projected-fk/dynamic/Comment_replyOf_Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, imageFile, locationIP, browserUsed, language, content, length FROM Post)
  TO 'data/csv-composite-projected-fk/dynamic/Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasCreator_Person FROM Post)
  TO 'data/csv-composite-projected-fk/dynamic/Post_hasCreator_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, Forum_containerOf AS forumId, id AS postId FROM Post)
  TO 'data/csv-composite-projected-fk/dynamic/Forum_containerOf_Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, isLocatedIn_Place FROM Post)
  TO 'data/csv-composite-projected-fk/dynamic/Post_isLocatedIn_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, firstName, lastName, gender, birthday, locationIP, browserUsed, speaks, email FROM Person)
  TO 'data/csv-composite-projected-fk/dynamic/Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, isLocatedIn_Place FROM Person)
  TO 'data/csv-composite-projected-fk/dynamic/Person_isLocatedIn_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Comment_hasTag_Tag)
  TO 'data/csv-composite-projected-fk/dynamic/Comment_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Post_hasTag_Tag)
  TO 'data/csv-composite-projected-fk/dynamic/Post_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasMember_Person FROM Forum_hasMember_Person)
  TO 'data/csv-composite-projected-fk/dynamic/Forum_hasMember_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Forum_hasTag_Tag)
  TO 'data/csv-composite-projected-fk/dynamic/Forum_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasInterest_Tag FROM Person_hasInterest_Tag)
  TO 'data/csv-composite-projected-fk/dynamic/Person_hasInterest_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, likes_Comment FROM Person_likes_Comment)
  TO 'data/csv-composite-projected-fk/dynamic/Person_likes_Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, likes_Post FROM Person_likes_Post)
  TO 'data/csv-composite-projected-fk/dynamic/Person_likes_Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, studyAt_University, classYear FROM Person_studyAt_University)
  TO 'data/csv-composite-projected-fk/dynamic/Person_studyAt_University.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, workAt_Company, workFrom FROM Person_workAt_Company)
  TO 'data/csv-composite-projected-fk/dynamic/Person_workAt_Company.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, Person1id, Person2id FROM Person_knows_Person)
  TO 'data/csv-composite-projected-fk/dynamic/Person_knows_Person.csv'
  WITH (HEADER, DELIMITER '|');

-- singular-projected-fk
COPY (SELECT id, type, name, url FROM Organisation)
  TO 'data/csv-singular-projected-fk/static/Organisation.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isLocatedIn_Place FROM Organisation)
  TO 'data/csv-singular-projected-fk/static/Organisation_isLocatedIn_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url, type FROM Place)
  TO 'data/csv-singular-projected-fk/static/Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isPartOf_Place FROM Place WHERE isPartOf_Place IS NOT NULL)
  TO 'data/csv-singular-projected-fk/static/Place_isPartOf_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url FROM Tag)
  TO 'data/csv-singular-projected-fk/static/Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, hasType_TagClass FROM Tag)
  TO 'data/csv-singular-projected-fk/static/Tag_hasType_TagClass.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url FROM TagClass)
  TO 'data/csv-singular-projected-fk/static/TagClass.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isSubclassOf_TagClass FROM TagClass WHERE isSubclassOf_TagClass IS NOT NULL)
  TO 'data/csv-singular-projected-fk/static/TagClass_isSubclassOf_TagClass.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, title FROM Forum)
  TO 'data/csv-singular-projected-fk/dynamic/Forum.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasModerator_Person FROM Forum)
  TO 'data/csv-singular-projected-fk/dynamic/Forum_hasModerator_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, locationIP, browserUsed, content, length FROM Comment)
  TO 'data/csv-singular-projected-fk/dynamic/Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasCreator_Person FROM Comment)
  TO 'data/csv-singular-projected-fk/dynamic/Comment_hasCreator_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, isLocatedIn_Place FROM Comment)
  TO 'data/csv-singular-projected-fk/dynamic/Comment_isLocatedIn_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, replyOf_Post FROM Comment WHERE replyOf_Post IS NOT NULL)
  TO 'data/csv-singular-projected-fk/dynamic/Comment_replyOf_Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, replyOf_Comment FROM Comment WHERE replyOf_Comment IS NOT NULL)
  TO 'data/csv-singular-projected-fk/dynamic/Comment_replyOf_Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, imageFile, locationIP, browserUsed, language, content, length FROM Post)
  TO 'data/csv-singular-projected-fk/dynamic/Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasCreator_Person FROM Post)
  TO 'data/csv-singular-projected-fk/dynamic/Post_hasCreator_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, Forum_containerOf AS forumId, id AS postId FROM Post)
  TO 'data/csv-singular-projected-fk/dynamic/Forum_containerOf_Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, isLocatedIn_Place FROM Post)
  TO 'data/csv-singular-projected-fk/dynamic/Post_isLocatedIn_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, firstName, lastName, gender, birthday, locationIP, browserUsed FROM Person)
  TO 'data/csv-singular-projected-fk/dynamic/Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, isLocatedIn_Place FROM Person)
  TO 'data/csv-singular-projected-fk/dynamic/Person_isLocatedIn_Place.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, unnest(string_split_regex(email,  ';')) AS email FROM Person)  TO 'data/csv-singular-projected-fk/dynamic/Person_email.csv'  WITH (HEADER, DELIMITER '|');
COPY (SELECT id, unnest(string_split_regex(speaks, ';')) AS speaks FROM Person) TO 'data/csv-singular-projected-fk/dynamic/Person_speaks.csv' WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Comment_hasTag_Tag)
  TO 'data/csv-singular-projected-fk/dynamic/Comment_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Post_hasTag_Tag)
  TO 'data/csv-singular-projected-fk/dynamic/Post_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasMember_Person FROM Forum_hasMember_Person)
  TO 'data/csv-singular-projected-fk/dynamic/Forum_hasMember_Person.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasTag_Tag FROM Forum_hasTag_Tag)
  TO 'data/csv-singular-projected-fk/dynamic/Forum_hasTag_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, hasInterest_Tag FROM Person_hasInterest_Tag)
  TO 'data/csv-singular-projected-fk/dynamic/Person_hasInterest_Tag.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, likes_Comment FROM Person_likes_Comment)
  TO 'data/csv-singular-projected-fk/dynamic/Person_likes_Comment.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, likes_Post FROM Person_likes_Post)
  TO 'data/csv-singular-projected-fk/dynamic/Person_likes_Post.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, studyAt_University, classYear FROM Person_studyAt_University)
  TO 'data/csv-singular-projected-fk/dynamic/Person_studyAt_University.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, id, workAt_Company, workFrom FROM Person_workAt_Company)
  TO 'data/csv-singular-projected-fk/dynamic/Person_workAt_Company.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT strftime(creationDate, '%Y-%m-%dT%H:%M:%S.%g+00:00') AS creationDate, Person1id, Person2id FROM Person_knows_Person)
  TO 'data/csv-singular-projected-fk/dynamic/Person_knows_Person.csv'
  WITH (HEADER, DELIMITER '|');

-- static-data-projected-fk-separate-labels
COPY (SELECT id, name, url FROM Organisation WHERE type = 'Company')
  TO 'data/static-data-projected-fk-separate-labels/Company.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url FROM Organisation WHERE type = 'University')
  TO 'data/static-data-projected-fk-separate-labels/University.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isLocatedIn_Place FROM Organisation WHERE type = 'Company')
  TO 'data/static-data-projected-fk-separate-labels/Company_isLocatedIn_Country.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isLocatedIn_Place FROM Organisation WHERE type = 'University')
  TO 'data/static-data-projected-fk-separate-labels/University_isLocatedIn_City.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url FROM Place WHERE type = 'Continent')
  TO 'data/static-data-projected-fk-separate-labels/Continent.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url FROM Place WHERE type = 'Country')
  TO 'data/static-data-projected-fk-separate-labels/Country.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, name, url FROM Place WHERE type = 'City')
  TO 'data/static-data-projected-fk-separate-labels/City.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isPartOf_Place FROM Place WHERE type = 'Country')
  TO 'data/static-data-projected-fk-separate-labels/Country_isPartOf_Continent.csv'
  WITH (HEADER, DELIMITER '|');

COPY (SELECT id, isPartOf_Place FROM Place WHERE type = 'City')
  TO 'data/static-data-projected-fk-separate-labels/City_isPartOf_Country.csv'
  WITH (HEADER, DELIMITER '|');
