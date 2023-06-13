------------------------------------------------------------
-- Run this file as sqlite3 dbName.db < create-tables.sql --
--                            OR                          --
-- Run sqlite3 dbName.db ".read create-tables.sql" to     --
-- create a secondary db holding package information to   --
-- use in dbName.db                                       --
------------------------------------------------------------

-- TODO: update in accordance with the new template format

-- TODO: find out what the best practices for creating tables in SQL is and implement that

CREATE TABLE IF NOT EXISTS pkgs (
  id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  name VARCHAR(64) NOT NULL,
  version MEDIUMTEXT NOT NULL,
  revision VARCHAR(2) NOT NULL,
  deps INTEGER,
  instructions INTEGER,
  FOREIGN KEY (instructions) REFERENCES instructions(id),
  FOREIGN KEY (deps) REFERENCES deps(id)
  );

CREATE TABLE IF NOT EXISTS deps (
  id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  bpm_deps TEXT,
  host_deps TEXT
  );

CREATE TABLE IF NOT EXISTS instructions (
  id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  url VARCHAR(255) NOT NULL,
  checksum VARCHAR(128),
  bin_name VARCHAR(64),
  build TEXT,
  patches TEXT,
  manpages TEXT,
  completions TEXT,
  desktop TEXT,
  uninstall_paths TEXT NOT NULL
  );
