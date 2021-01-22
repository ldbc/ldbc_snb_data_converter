-- static
INSERT INTO Organisation SELECT * FROM Raw_Organisation;       
INSERT INTO Place        SELECT * FROM Raw_Place;      
INSERT INTO TagClass     SELECT * FROM Raw_TagClass;
INSERT INTO Tag          SELECT * FROM Raw_Tag;   

-- dynamic
-- many-to-many-edges
INSERT INTO Comment_hasTag_Tag        SELECT creationDate, id, hasTag_Tag                    FROM Raw_Comment_hasTag_Tag        WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Post_hasTag_Tag           SELECT creationDate, id, hasTag_Tag                    FROM Raw_Post_hasTag_Tag           WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Forum_hasMember_Person    SELECT creationDate, id, hasMember_Person              FROM Raw_Forum_hasMember_Person    WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Forum_hasTag_Tag          SELECT creationDate, id, hasTag_Tag                    FROM Raw_Forum_hasTag_Tag          WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Person_hasInterest_Tag    SELECT creationDate, id, hasInterest_Tag               FROM Raw_Person_hasInterest_Tag    WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Person_likes_Comment      SELECT creationDate, id, likes_Comment                 FROM Raw_Person_likes_Comment      WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Person_likes_Post         SELECT creationDate, id, likes_Post                    FROM Raw_Person_likes_Post         WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Person_studyAt_University SELECT creationDate, id, studyAt_University, classYear FROM Raw_Person_studyAt_University WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Person_workAt_Company     SELECT creationDate, id, workAt_Company, workFrom      FROM Raw_Person_workAt_Company     WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Person_knows_Person       SELECT creationDate, Person1id, Person2id              FROM Raw_Person_knows_Person       WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;

-- Forums/Messages and their many-to-one edges
INSERT INTO Comment SELECT creationDate, id, locationIP, browserUsed, content, length, hasCreator_Person, isLocatedIn_Place, replyOf_Post, replyOf_Comment          FROM Raw_Comment WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Forum   SELECT creationDate, id, title, hasModerator_Person                                                                                             FROM Raw_Forum   WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;
INSERT INTO Post    SELECT creationDate, id, imageFile, locationIP, browserUsed, language, content, length, hasCreator_Person, Forum_containerOf, isLocatedIn_Place FROM Raw_Post    WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;

-- Persons
INSERT INTO Person  SELECT creationDate, id, firstName, lastName, gender, birthday, locationIP, browserUsed, isLocatedIn_Place, speaks, email                       FROM Raw_Person WHERE creationDate < :bulkLoadTime AND deletionDate >= :bulkLoadTime;

-- composite-merged-fk
COPY (SELECT * FROM Organisation) TO '../csv-composite-merged-fk/Organisation.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Place)        TO '../csv-composite-merged-fk/Place.csv'        WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Tag)          TO '../csv-composite-merged-fk/Tag.csv'          WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM TagClass)     TO '../csv-composite-merged-fk/TagClass.csv'     WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum)        TO '../csv-composite-merged-fk/Forum.csv'        WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Comment)      TO '../csv-composite-merged-fk/Comment.csv'      WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Post)         TO '../csv-composite-merged-fk/Post.csv'         WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person)       TO '../csv-composite-merged-fk/Person.csv'       WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Comment_hasTag_Tag)        TO '../csv-composite-merged-fk/Comment_hasTag_Tag'        WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Post_hasTag_Tag)           TO '../csv-composite-merged-fk/Post_hasTag_Tag'           WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum_hasMember_Person)    TO '../csv-composite-merged-fk/Forum_hasMember_Person'    WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum_hasTag_Tag)          TO '../csv-composite-merged-fk/Forum_hasTag_Tag'          WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_hasInterest_Tag)    TO '../csv-composite-merged-fk/Person_hasInterest_Tag'    WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_likes_Comment)      TO '../csv-composite-merged-fk/Person_likes_Comment'      WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_likes_Post)         TO '../csv-composite-merged-fk/Person_likes_Post'         WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_studyAt_University) TO '../csv-composite-merged-fk/Person_studyAt_University' WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_workAt_Company)     TO '../csv-composite-merged-fk/Person_workAt_Company'     WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_knows_Person)       TO '../csv-composite-merged-fk/Person_knows_Person'       WITH (HEADER, DELIMITER '|');

-- singular-merged-fk
COPY (SELECT * FROM Organisation)                                                                                             TO '../csv-singular-merged-fk/Organisation.csv'  WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Place)                                                                                                    TO '../csv-singular-merged-fk/Place.csv'         WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Tag)                                                                                                      TO '../csv-singular-merged-fk/Tag.csv'           WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM TagClass)                                                                                                 TO '../csv-singular-merged-fk/TagClass.csv'      WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum)                                                                                                    TO '../csv-singular-merged-fk/Forum.csv'         WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Comment)                                                                                                  TO '../csv-singular-merged-fk/Comment.csv'       WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Post)                                                                                                     TO '../csv-singular-merged-fk/Post.csv'          WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, firstName, lastName, gender, birthday, locationIP, browserUsed, isLocatedIn_Place FROM Person) TO '../csv-singular-merged-fk/Person.csv'        WITH (HEADER, DELIMITER '|');
COPY (SELECT id, unnest(string_split_regex(email,  ';')) AS email FROM Person)                                                TO '../csv-singular-merged-fk/Person_email.csv'  WITH (HEADER, DELIMITER '|');
COPY (SELECT id, unnest(string_split_regex(speaks, ';')) AS email FROM Person)                                                TO '../csv-singular-merged-fk/Person_speaks.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Comment_hasTag_Tag)        TO '../csv-singular-merged-fk/Comment_hasTag_Tag'        WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Post_hasTag_Tag)           TO '../csv-singular-merged-fk/Post_hasTag_Tag'           WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum_hasMember_Person)    TO '../csv-singular-merged-fk/Forum_hasMember_Person'    WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum_hasTag_Tag)          TO '../csv-singular-merged-fk/Forum_hasTag_Tag'          WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_hasInterest_Tag)    TO '../csv-singular-merged-fk/Person_hasInterest_Tag'    WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_likes_Comment)      TO '../csv-singular-merged-fk/Person_likes_Comment'      WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_likes_Post)         TO '../csv-singular-merged-fk/Person_likes_Post'         WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_studyAt_University) TO '../csv-singular-merged-fk/Person_studyAt_University' WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_workAt_Company)     TO '../csv-singular-merged-fk/Person_workAt_Company'     WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_knows_Person)       TO '../csv-singular-merged-fk/Person_knows_Person'       WITH (HEADER, DELIMITER '|');


-- composite-projected-fk
COPY (SELECT id, type, name, url FROM Organisation)                                                        TO '../csv-composite-projected-fk/Organisation.csv'                   WITH (HEADER, DELIMITER '|');
COPY (SELECT id, isLocatedIn_Place FROM Organisation)                                                      TO '../csv-composite-projected-fk/Organisation_isLocatedIn_Place.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, name, url, type FROM Place)                                                               TO '../csv-composite-projected-fk/Place.csv'                          WITH (HEADER, DELIMITER '|');
COPY (SELECT id, isPartOf_Place FROM Place)                                                                TO '../csv-composite-projected-fk/Place_isPartOf_Place.csv'           WITH (HEADER, DELIMITER '|');
COPY (SELECT id, name, url FROM Tag)                                                                       TO '../csv-composite-projected-fk/Tag.csv'                            WITH (HEADER, DELIMITER '|');
COPY (SELECT id, isSubclassOf_TagClass FROM Tag)                                                           TO '../csv-composite-projected-fk/Tag_isSubclassOf_TagClass.csv'      WITH (HEADER, DELIMITER '|');
COPY (SELECT id, name, url FROM TagClass)                                                                  TO '../csv-composite-projected-fk/TagClass.csv'                       WITH (HEADER, DELIMITER '|');
COPY (SELECT id, hasType_TagClass FROM TagClass)                                                           TO '../csv-composite-projected-fk/TagClass_hasType_TagClass.csv'      WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, title FROM Forum)                                                           TO '../csv-composite-projected-fk/Forum.csv'                          WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, hasModerator_Person FROM Forum)                                             TO '../csv-composite-projected-fk/Forum_hasModerator_Person.csv'      WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, locationIP, browserUsed, content, length FROM Comment)                      TO '../csv-composite-projected-fk/Comment.csv'                        WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, hasCreator_Person FROM Comment)                                             TO '../csv-composite-projected-fk/Comment_hasCreator_Person.csv'      WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, isLocatedIn_Place FROM Comment)                                             TO '../csv-composite-projected-fk/Comment_isLocatedIn_Place.csv'      WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, replyOf_Post FROM Comment)                                                  TO '../csv-composite-projected-fk/Comment_replyOf_Post.csv'           WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, replyOf_Comment FROM Comment)                                               TO '../csv-composite-projected-fk/Comment_replyOf_Comment.csv'        WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, imageFile, locationIP, browserUsed, language, content, length FROM Post)    TO '../csv-composite-projected-fk/Post.csv'                           WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, hasCreator_Person FROM Post)                                                TO '../csv-composite-projected-fk/Post_hasCreator_Person.csv'         WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, Forum_containerOf FROM Post)                                                TO '../csv-composite-projected-fk/Post_Forum_containerOf.csv'         WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, isLocatedIn_Place FROM Post)                                                TO '../csv-composite-projected-fk/Post_isLocatedIn_Place.csv'         WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, firstName, lastName, gender, birthday, locationIP, browserUsed FROM Person) TO '../csv-composite-projected-fk/Person.csv'                         WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, isLocatedIn_Place FROM Person)                                              TO '../csv-composite-projected-fk/Person_isLocatedIn_Place.csv'       WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Comment_hasTag_Tag)        TO '../csv-composite-projected-fk/Comment_hasTag_Tag'        WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Post_hasTag_Tag)           TO '../csv-composite-projected-fk/Post_hasTag_Tag'           WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum_hasMember_Person)    TO '../csv-composite-projected-fk/Forum_hasMember_Person'    WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum_hasTag_Tag)          TO '../csv-composite-projected-fk/Forum_hasTag_Tag'          WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_hasInterest_Tag)    TO '../csv-composite-projected-fk/Person_hasInterest_Tag'    WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_likes_Comment)      TO '../csv-composite-projected-fk/Person_likes_Comment'      WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_likes_Post)         TO '../csv-composite-projected-fk/Person_likes_Post'         WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_studyAt_University) TO '../csv-composite-projected-fk/Person_studyAt_University' WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_workAt_Company)     TO '../csv-composite-projected-fk/Person_workAt_Company'     WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_knows_Person)       TO '../csv-composite-projected-fk/Person_knows_Person'       WITH (HEADER, DELIMITER '|');

-- singular-projected-fk
COPY (SELECT id, type, name, url FROM Organisation)                                                        TO '../csv-singular-projected-fk/Organisation.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, isLocatedIn_Place FROM Organisation)                                                      TO '../csv-singular-projected-fk/Organisation_isLocatedIn_Place.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, name, url, type FROM Place)                                                               TO '../csv-singular-projected-fk/Place.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, isPartOf_Place FROM Place)                                                                TO '../csv-singular-projected-fk/Place_isPartOf_Place.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, name, url FROM Tag)                                                                       TO '../csv-singular-projected-fk/Tag.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, isSubclassOf_TagClass FROM Tag)                                                           TO '../csv-singular-projected-fk/Tag_isSubclassOf_TagClass.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, name, url FROM TagClass)                                                                  TO '../csv-singular-projected-fk/TagClass.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, hasType_TagClass FROM TagClass)                                                           TO '../csv-singular-projected-fk/TagClass_hasType_TagClass.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, title FROM Forum)                                                           TO '../csv-singular-projected-fk/Forum.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, hasModerator_Person FROM Forum)                                             TO '../csv-singular-projected-fk/Forum_hasModerator_Person.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, locationIP, browserUsed, content, length FROM Comment)                      TO '../csv-singular-projected-fk/Comment.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, hasCreator_Person FROM Comment)                                             TO '../csv-singular-projected-fk/Comment_hasCreator_Person.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, isLocatedIn_Place FROM Comment)                                             TO '../csv-singular-projected-fk/Comment_isLocatedIn_Place.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, replyOf_Post FROM Comment)                                                  TO '../csv-singular-projected-fk/Comment_replyOf_Post.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, replyOf_Comment FROM Comment)                                               TO '../csv-singular-projected-fk/Comment_replyOf_Comment.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, imageFile, locationIP, browserUsed, language, content, length FROM Post)    TO '../csv-singular-projected-fk/Post.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, hasCreator_Person FROM Post)                                                TO '../csv-singular-projected-fk/Post_hasCreator_Person.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, Forum_containerOf FROM Post)                                                TO '../csv-singular-projected-fk/Post_Forum_containerOf.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, isLocatedIn_Place FROM Post)                                                TO '../csv-singular-projected-fk/Post_isLocatedIn_Place.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, firstName, lastName, gender, birthday, locationIP, browserUsed FROM Person) TO '../csv-singular-projected-fk/Person.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT creationDate, id, isLocatedIn_Place FROM Person)                                              TO '../csv-singular-projected-fk/Person_isLocatedIn_Place.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT id, unnest(string_split_regex(email,  ';')) AS email FROM Person)                             TO '../csv-singular-projected-fk/Person_email.csv'  WITH (HEADER, DELIMITER '|');
COPY (SELECT id, unnest(string_split_regex(speaks, ';')) AS email FROM Person)                             TO '../csv-singular-projected-fk/Person_speaks.csv' WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Comment_hasTag_Tag)         TO '../csv-singular-projected-fk/Comment_hasTag_Tag'        WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Post_hasTag_Tag)            TO '../csv-singular-projected-fk/Post_hasTag_Tag'           WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum_hasMember_Person)     TO '../csv-singular-projected-fk/Forum_hasMember_Person'    WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Forum_hasTag_Tag)           TO '../csv-singular-projected-fk/Forum_hasTag_Tag'          WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_hasInterest_Tag)     TO '../csv-singular-projected-fk/Person_hasInterest_Tag'    WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_likes_Comment)       TO '../csv-singular-projected-fk/Person_likes_Comment'      WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_likes_Post)          TO '../csv-singular-projected-fk/Person_likes_Post'         WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_studyAt_University)  TO '../csv-singular-projected-fk/Person_studyAt_University' WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_workAt_Company)      TO '../csv-singular-projected-fk/Person_workAt_Company'     WITH (HEADER, DELIMITER '|');
COPY (SELECT * FROM Person_knows_Person)        TO '../csv-singular-projected-fk/Person_knows_Person'       WITH (HEADER, DELIMITER '|');
