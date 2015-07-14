#!perl

use strict;
use warnings;
use utf8;
use Test::More tests => 13;
use Data::Dumper;
use Marketplace::Rakuten;

my $rakuten = Marketplace::Rakuten->new(key => '123456789a123456789a123456789a12');

my @orders = $rakuten->get_pending_orders;

ok (scalar @orders);
print Dumper(\@orders);

my $order = shift @orders;
my $shipping_address = $order->shipping_address;
ok $shipping_address;

foreach my $method (qw/client_id gender first_name last_name address1
                       address2 zip city country email phone/) {
    ok($shipping_address->$method, "Got $method")
      and diag $shipping_address->$method;
}
