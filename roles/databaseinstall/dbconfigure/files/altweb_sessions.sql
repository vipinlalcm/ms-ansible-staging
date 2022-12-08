CREATE TABLE IF NOT EXISTS sessions (`key` varchar(191), `data` blob(65000), `created` int, `ttl` int, `expire` int, PRIMARY KEY(`key`));
CREATE INDEX IF NOT EXISTS expire_idx ON sessions (expire);
