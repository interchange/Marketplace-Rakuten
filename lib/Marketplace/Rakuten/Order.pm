package Marketplace::Rakuten::Order;

use strict;
use warnings;
use Data::Dumper;

use Moo;
use MooX::Types::MooseLike::Base qw(Str HashRef Int Object);
use Marketplace::Rakuten::Order::Address;
use Marketplace::Rakuten::Order::Item;
use namespace::clean;

=head1 NAME

Marketplace::Rakuten::Order

=head1 DESCRIPTION

Class to handle the xml structures returned by
L<http://webservice.rakuten.de/documentation/method/get_orders>

The aim is to have a consistent interface with
L<Amazon::MWS::XML::Order> so importing the orders can happens almost
transparently.

=cut

=head1 ACCESSORS/METHODS

=head2 order

The raw structure got from the XML parsing

=head2 shop_type

Always returns C<rakuten>

=cut

has order => (is => 'ro', isa => HashRef, required => 1);

sub shop_type {
    return 'rakuten';
}

=head2 order_number

read-write accessor for the (shop) order number so you can set this
while importing it.

=cut

has order_number => (is => 'rw', isa => Str);

=head2 can_be_imported

=head2 order_status

Unclear (for now) what to do here. List of statuses:
 	
=over 4

=item pending

 Bestellung ist neu eingegangen

=item editable

Bestellung ist zur Bearbeitung freigegeben

=item shipped

Bestellung ist versendet

=item payout

Bestellung ist ausbezahlt

=item cancelled

Bestellung ist storniert

=back 

=cut

sub can_be_imported {
    my $self = shift;
    my %map = (
               pending => 1,
               editable => 1,
               payout => 1,
               cancelled => 0,
              );
    return $map{$self->order_status} || 0;
}

sub order_status {
    return shift->order->{status};
}

=head2 remote_shop_order_id

The Rakuten order id.

=cut

sub remote_shop_order_id {
    return shift->order->{order_no};
}


1;
