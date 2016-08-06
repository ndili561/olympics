DROP TABLE medals;
DROP TABLE athletes;
DROP TABLE events;
DROP TABLE nations;

CREATE TABLE nations(
id serial4 primary key,
nation VARCHAR(255),
points integer, UNIQUE(nation)
);

CREATE TABLE events(
id serial4 primary key,
event VARCHAR(255),
day int,
month VARCHAR(255),
type VARCHAR(255), UNIQUE(event)
);

CREATE TABLE athletes(
id serial4 primary key,
name VARCHAR(255),
athlete_nation int4 references nations(id)ON DELETE CASCADE,
athlete_event int4 references events(id)ON DELETE CASCADE
);


CREATE TABLE medals(
id serial4 primary key,
gold_medal int4 references athletes(id)ON DELETE CASCADE,
silver_medal int4 references athletes(id)ON DELETE CASCADE,
bronze_medal int4 references athletes(id)ON DELETE CASCADE
);


