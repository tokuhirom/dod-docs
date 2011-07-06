package Neko::Table::User;
use parent qw(Data::ObjectDriver::BaseObject);
use Neko::Driver;

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

1;
