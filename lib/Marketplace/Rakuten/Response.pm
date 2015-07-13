package Marketplace::Rakuten::Response;

use strict;
use warnings;

use Moo;
use MooX::Types::MooseLike::Base qw(Str Bool HashRef);
use namespace::clean;

=head1 NAME

Marketplace::Rakuten::Response - Class to handle the responses from
webservice.rakuten.de

The constructors keys map the L<HTTP::Tiny> keys, so you can feed the
constructor straight with the response.

=head1 ACCESSORS

=head2 success

Boolean indicating whether the operation returned a 2XX status code

=head2 url

URL that provided the response. This is the URL of the request
unless there were redirections, in which case it is the last URL
queried in a redirection chain

=head2 status

The HTTP status code of the response

=head2 reason

The response phrase returned by the server

=head2 content

The body of the response. If the response does not have any content or
if a data callback is provided to consume the response body, this will
be the empty string

=head2 headers

A hashref of header fields. All header field names will be normalized
to be lower case. If a header is repeated, the value will be an
arrayref; it will otherwise be a scalar string containing the value

=cut

has success => (is => 'ro', isa => Bool);
has url     => (is => 'ro', isa => Str);
has status  => (is => 'ro', isa => Str);
has reason  => (is => 'ro', isa => Str);
has content => (is => 'ro', isa => Str);
has headers => (is => 'ro', isa => HashRef);

=head1 METHODS

=head2 is_success

Alias for C<success>

=head2 struct



=cut

sub is_success {
    return shift->success;
}


1;
