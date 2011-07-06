#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use 5.010000;

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

package Neko::Table::User;
use parent qw(Data::ObjectDriver::BaseObject);

__PACKAGE__->install_properties({
    columns => [qw(id name)],
    primary_key => 'id',
    datasource => 'user',
    driver => Neko::Driver->driver,
});

sub dump {
    local $_ = shift;
    say $_->id . ':' . $_->name;
}

package main;

say '-- install schema';
Neko::Driver->driver->dbh->do(q{
    create table user (
        id     INTEGER NOT NULL PRIMARY KEY,
        name   varchar(256) NOT NULL
    );
});

say '-- insert';
{
    my $user = Neko::Table::User->new();
    $user->name('nekokak');
    $user->save();
}

say '-- find one row';
{
    my $user = Neko::Table::User->lookup(1);
    say $user->id . ':' . $user->name;
say '-- remove';
    $user->remove;
}

say '-- bulk-search';
{
    Neko::Table::User->bulk_insert( [qw/name/],
        [ map { [$_] } qw/nomaneko manekineko/ ] );
}

say '-- search';
{
    my $it = Neko::Table::User->search({name => 'nekokak'});
    while (my $row = $it->()) {
         say $row->id . ':' . $row->name;
    }
}

say '-- print all rows';
{
    my $it = Neko::Table::User->search({});
    while (my $row = $it->()) {
        $row->dump;
    }
}

