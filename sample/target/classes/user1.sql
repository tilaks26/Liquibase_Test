--liquibase formatted sql
--changeset user1:release_1.create_tables.sql

CREATE TABLE COMMUNITY_USER (
  GATEWAY_ID           VARCHAR(100) NOT NULL,
  COMMUNITY_USER_NAME  VARCHAR(100) NOT NULL,
  TOKEN_ID             VARCHAR(100) NOT NULL,
  COMMUNITY_USER_EMAIL VARCHAR(256) NOT NULL
);

--rollback DROP TABLE COMMUNITY_USER;

CREATE TABLE CREDENTIALS (
  GATEWAY_ID     VARCHAR(100) NOT NULL,
  TOKEN_ID       VARCHAR(100) NOT NULL,
  CREDENTIAL     BLOB         NOT NULL,
  PORTAL_USER_ID VARCHAR(256) NOT NULL,
  TIME_PERSISTED TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  DESCRIPTION VARCHAR(500),
  CREDENTIAL_OWNER_TYPE VARCHAR(10) DEFAULT 'GATEWAY' NOT NULL,
  PRIMARY KEY (GATEWAY_ID, TOKEN_ID)
);

--rollback DROP TABLE CREDENTIALS;

CREATE TABLE CONFIGURATION (
  CONFIG_KEY VARCHAR(255),
  CONFIG_VAL VARCHAR(255),
  PRIMARY KEY (CONFIG_KEY, CONFIG_VAL)
);

--rollback DROP TABLE CONFIGURATION;