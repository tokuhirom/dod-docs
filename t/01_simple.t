use strict;
use warnings;
use utf8;
use lib 'source/lib/';
use Test::More;

use Neko::Table::User;

load('pl/setup.pl');
load('pl/insert.pl');
load('pl/update.pl');
load('pl/remove.pl');

done_testing;

sub load {
    my $file = shift;
    open my $fh, '<', "source/$file" or die "$file: $!";
    my $src = do { local $/; <$fh> };
    eval "use 5.14.1; $src";
    die $@ if $@;
}
