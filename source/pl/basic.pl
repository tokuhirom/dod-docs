
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
