Neko::Driver->driver->dbh->do(q{
    create table user (
        id     INTEGER NOT NULL PRIMARY KEY,
        name   varchar(256) NOT NULL
    );
});
