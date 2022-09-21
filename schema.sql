-- Entity Relationship Diagram (ERD) for the database schema

CREATE TABLE Comment(
  AuthorId INT NOT NULL,
  PostId INT NOT NULL,
  Text TEXT NOT NULL,
  UpdatedAt TIMESTAMP NOT NULL,
  CreatedAt TIMESTAMP NOT NULL,
  FOREIGN KEY (AuthorId) REFERENCES User(Id),
  FOREIGN KEY (PostId) REFERENCES Post(Id)
);

CREATE TABLE User(
  Id INT NOT NULL Generated Always As Identity,
  Name VARCHAR(255) NOT NULL,
  Photo VARCHAR(255) NOT NULL,
  Bio TEXT NOT NULL,
  UpdatedAt TIMESTAMP NOT NULL,
  CreatedAt TIMESTAMP NOT NULL,
  PostsCounter INT NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE Post(
  Id INT NOT NULL Generated Always As Identity,
  AuthorId INT NOT NULL,
  Title VARCHAR(255) NOT NULL,
  Text TEXT NOT NULL,
  CreatedAt TIMESTAMP NOT NULL,
  UpdatedAt TIMESTAMP NOT NULL,
  CommentsCounter INT NOT NULL,
  LikesCounter INT NOT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (AuthorId) REFERENCES User(Id)
);

CREATE TABLE Like(
  AuthorId INT NOT NULL,
  PostId INT NOT NULL,
  CreatedAt TIMESTAMP NOT NULL,
  UpdatedAt TIMESTAMP NOT NULL,
  FOREIGN KEY (AuthorId) REFERENCES User(Id),
  FOREIGN KEY (PostId) REFERENCES Post(Id)
);