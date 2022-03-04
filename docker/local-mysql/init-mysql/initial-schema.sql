
CREATE DATABASE IF NOT EXISTS MyFancyMicroservice;
USE MyFancyMicroservice;
CREATE TABLE EXTENDED_USERS (
  ExtendedUserId VARCHAR(50) NOT NULL,
  CreatedAt DATETIME NOT NULL,
  UpdatedAt DATETIME NOT NULL,
  FullName VARCHAR(512) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Telephone VARCHAR(100) NOT NULL,
  InvitesSent INTEGER NOT NULL,
  PRIMARY KEY (ExtendedUserId));

CREATE DATABASE IF NOT EXISTS test;
USE test;
CREATE TABLE IF NOT EXISTS relationships (
  relationshipId char(36) NOT NULL PRIMARY KEY,
  relationshipType varchar(64) NOT NULL,
  parent char(36) NOT NULL,
  dependant char(36) NOT NULL,
  createdAt timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;