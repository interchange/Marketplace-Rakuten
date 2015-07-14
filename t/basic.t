#!perl

use strict;
use warnings;
use Test::More tests => 14;
use Data::Dumper;

use_ok('Marketplace::Rakuten::Response');
use_ok('Marketplace::Rakuten');


# key is the sandbox one
# http://webservice.rakuten.de/documentation/howto/test
my $rakuten = Marketplace::Rakuten->new(key => '123456789a123456789a123456789a12');

ok $rakuten->key;

is $rakuten->endpoint, 'http://webservice.rakuten.de/merchants/';

test_success('get_key_info');
test_success(add_product => {
                             name => 'test',
                             price => '10.00',
                             description => 'a test product',
                            });
test_failure(add_product => {
                             name => 'test',
                             description => 'a test product',
                            });

sub test_success {
    my ($call, $arg, $sub) = @_;
    diag "Calling $call with " . Dumper($arg);
    my $res = $rakuten->$call($arg);
    ok ($res->is_success, "$call with is OK");
    ok ($res->content, "$call content ok");
    ok ($res->data, "$call data ok") and diag Dumper($res->data);
    if ($sub) {
        ok($sub->($res), "Callback test on $call success");
    }
}

sub test_failure {
    my ($call, $arg, $sub) = @_;
    diag "Calling $call with " . Dumper($arg);
    my $res = $rakuten->$call($arg);
    ok (!$res->is_success, "$call is a falure");
    ok ($res->errors, "Found errors") and diag Dumper($res->errors);
    ok ($res->content, "$call content ok");
    ok ($res->data, "$call data ok") and diag Dumper($res->data);
    if ($sub) {
        ok($sub->($res), "Callback test on $call success");
    }
}
