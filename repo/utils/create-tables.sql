------------------------------------------------------------
-- Run this file as sqlite3 dbName.db < create-tables.sql --
--                            OR                          --
-- Run sqlite3 dbName.db ".read create-tables.sql" to     --
-- create a secondary db holding package information to   --
-- use in dbName.db                                       --
------------------------------------------------------------

-- TODO: update in accordance with the new template format

CREATE TABLE IF NOT EXISTS "pkgs" (
  Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  Name TEXT NOT NULL,
  Version TEXT NOT NULL,
  Revision TEXT NOT NULL,
  Licence TEXT,
  Deps INTEGER,
  Instructions INTEGER,
  FOREIGN KEY ("instructions") REFERENCES instructions(Id),
  FOREIGN KEY ("deps") REFERENCES deps(Id)
  );

CREATE TABLE IF NOT EXISTS "deps" (
  Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  BPM_deps TEXT,
  Host_deps TEXT
  );

CREATE TABLE IF NOT EXISTS "instructions" (
  Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  URL TEXT NOT NULL,
  Bin_name TEXT NOT NULL,
  Build TEXT,
  Manpages TEXT,
  Libs TEXT,
  Completions TEXT,
  Uninstall_paths TEXT NOT NULL
  );
