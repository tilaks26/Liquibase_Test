--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: src/main/resources/databaseChangeLog.sql
--  Ran at: 21/04/17 04:54
--  Against: root@localhost@jdbc:mysql://localhost:3306/example
--  Liquibase version: 3.5.3
--  *********************************************************************

--  Lock Database
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '10.0.2.15 (10.0.2.15)', LOCKGRANTED = '2017-04-21 04:54:38.631' WHERE ID = 1 AND LOCKED = 0;

--  Changeset src/main/resources/databaseChangeLog.sql::2::Sneha
CREATE TABLE ACCOUNTS (
  ACCOUNT_ID    VARCHAR(100) NOT NULL,
  USER_ID	VARCHAR(100) NOT NULL,
  ACCOUNT_NAME  VARCHAR(100) NOT NULL,
  CREATION_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ACCOUNT_ID)  
);

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'Sneha', 'src/main/resources/databaseChangeLog.sql', NOW(), 2, '7:82c779bb48689d7e0c67ad1d7455635b', 'sql', '', 'EXECUTED', NULL, NULL, '3.5.3', '2746878926');

--  Changeset src/main/resources/databaseChangeLog.sql::3::Sneha
INSERT INTO USERS (USER_ID, USER_NAME, USER_EMAIL) VALUES ('U001','Mark','mark@gmail.edu');

INSERT INTO USERS (USER_ID, USER_NAME, USER_EMAIL) VALUES ('U002','Smith','smith@gmail.edu');

INSERT INTO USERS (USER_ID, USER_NAME, USER_EMAIL) VALUES ('U003','John','john@gmail.edu');

INSERT INTO ACCOUNTS (ACCOUNT_ID, USER_ID, ACCOUNT_NAME, CREATION_DATE) VALUES ('A1001','U002','ACC01',NOW());

INSERT INTO ACCOUNTS (ACCOUNT_ID, USER_ID, ACCOUNT_NAME, CREATION_DATE) VALUES ('A1002','U003','ACC02',NOW());

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'Sneha', 'src/main/resources/databaseChangeLog.sql', NOW(), 3, '7:cf996a39e26b43d0c419a2c7dfeee558', 'sql', '', 'EXECUTED', NULL, NULL, '3.5.3', '2746878926');

--  Changeset src/main/resources/databaseChangeLog.sql::4::User
ALTER TABLE ACCOUNTS ADD CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID);

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'User', 'src/main/resources/databaseChangeLog.sql', NOW(), 4, '7:1491793940a6e236245dbb6e4f54c8fa', 'sql', '', 'EXECUTED', NULL, NULL, '3.5.3', '2746878926');

--  Release Database Lock
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

