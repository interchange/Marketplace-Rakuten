package Marketplace::Rakuten::Order::Address;

use Moo;
use MooX::Types::MooseLike::Base qw(Str);
use namespace::clean;

has client_id => (is => 'ro', isa => Str);
has gender => (is => 'ro', isa => Str);
has first_name => (is => 'ro', isa => Str);
has last_name => (is => 'ro', isa => Str);
has company => (is => 'ro', isa => Str);
has street => (is => 'ro', isa => Str);
has street_no => (is => 'ro', isa => Str);
has address_add => (is => 'ro', isa => Str);
has zip_code => (is => 'ro', isa => Str);
has city => (is => 'ro', isa => Str);
has country => (is => 'ro', isa => Str);
has email => (is => 'ro', isa => Str);
has phone => (is => 'ro', isa => Str);

sub address1 {
    my $self = shift;
    return $self->street . ' ' . $self->street_no;
}

sub address2 {
    my $self = shift;
    return $self->address_add;
}

sub name {
    my $self = shift;
    my $out = '';
    if ($self->company) {
        $out = $self->company . ' ';
    }
    return $out . $self->first_name . ' ' . $self->last_name;
}

sub state {
    # not provided, apparently
    return '';
}

sub zip {
    return shift->zip_code;
}



1;
