package Neko::Driver;
use Data::ObjectDriver::Driver::DBI;
use DBI;

my $dbh = DBI->connect(
    'dbi:SQLite:',
    '',
    '',
    {RaiseError => 1},
);
sub driver { Data::ObjectDriver::Driver::DBI->new(dbh => $dbh) }

1;
