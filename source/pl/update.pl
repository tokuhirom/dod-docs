my $user = Neko::Table::User->lookup(1);
$user->name('johnkak');
$user->save();

my $user2 = Neko::Table::User->lookup(1);
say $user->name;
