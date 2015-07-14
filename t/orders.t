#!perl

use strict;
use warnings;
use utf8;
use Test::More;
use Data::Dumper;
use Marketplace::Rakuten;

my $rakuten = Marketplace::Rakuten->new(key => '123456789a123456789a123456789a12');

my @orders = $rakuten->get_pending_orders;

ok (scalar @orders);
print Dumper(\@orders);
