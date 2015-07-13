#!perl

use strict;
use warnings;
use Test::More tests => 3;

use_ok('Marketplace::Rakuten');


my $rakuten = Marketplace::Rakuten->new(key => '123456789a123456789a123456789a12');

ok $rakuten->key;

is $rakuten->endpoint, 'http://webservice.rakuten.de/merchants/';



