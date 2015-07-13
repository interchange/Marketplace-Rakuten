#!perl

use strict;
use warnings;
use Test::More tests => 13;
use Data::Dumper;

use_ok('Marketplace::Rakuten::Response');
use_ok('Marketplace::Rakuten');


# key is the sandbox one
# http://webservice.rakuten.de/documentation/howto/test
my $rakuten = Marketplace::Rakuten->new(key => '123456789a123456789a123456789a12');

ok $rakuten->key;

is $rakuten->endpoint, 'http://webservice.rakuten.de/merchants/';

{
    my $res = $rakuten->get_key_info;
    ok ($res->is_success, "Request is success");
    ok ($res->content, "Content ok");
    ok ($res->data, "Found data") and diag Dumper($res->data);
    # print Dumper($res);
}

{
    my $res = $rakuten->add_product({
                                     name => 'test',
                                     price => '10.00',
                                     description => 'a test product',
                                    });
    ok ($res->is_success, "Adding a product works");
    ok ($res->content, "Content ok");
    ok ($res->data, "Found data") and diag Dumper($res->data);
    # print Dumper($res);
}

{
    my $res = $rakuten->add_product({
                                     name => 'test',
                                     description => 'a test product',
                                    });
    ok (!$res->is_success, "Adding a product without price doesn't work");
    ok ($res->content, "Content ok");
    ok ($res->data, "Found data") and diag Dumper($res->data);
    # print Dumper($res);
}

