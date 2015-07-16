package Marketplace::Rakuten::Order::Item;

# items must implement sku quantity price subtotal
# remote_shop_order_item
# and a rw merchant_order_item

use strict;
use warnings;

use Moo;
use MooX::Types::MooseLike::Base qw(HashRef Str);
use Data::Dumper;
use namespace::clean;

has struct => (is => 'ro', isa => HashRef);
has merchant_order_item => (is => 'rw', isa => Str);
has order_number => (is => 'ro', default => sub { 'unknown' });

# sku apparently is not provided
has sku => (is => 'rw', isa => Str);

sub quantity {
    return shift->struct->{qty} || 0;
}

=head2 remote_shop_order_item

It looks like the API just passes an id with the position:

 item_id 	Integer 	ID der Bestell-Position

To be meaningful, the class will concatenate the order number with
this.


=cut

sub remote_shop_order_item {
    my $self = shift;
    return $self->order_number . '-' . $self->struct->{item_id};
}

sub price {
    return shift->struct->{price};
}

sub subtotal {
    return shift->struct->{price_sum};
}

=head2 rakuten_id

Either the variant id or the product id. You should have store the ids
when uploading them, so you can use this id to look the real sku up
and store it in the accessor.

=head2 variant_id

The rakuten variant id

=head2 product_id

The rakuten product id

=head2 canonical_sku

Rakuten's product_art_no

=cut

sub rakuten_id {
    my $self = shift;
    return $self->variant_id || $self->product_id;
}

sub variant_id {
    return shift->struct->{variant_id};
}

sub product_id {
    return shift->struct->{product_id};
}

sub canonical_sku {
    return shift->struct->{product_art_no};
}

1;
