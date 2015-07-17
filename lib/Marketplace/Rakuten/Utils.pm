package Marketplace::Rakuten::Utils;

sub turn_empty_hashrefs_into_empty_strings {
    my ($hashref) = @_;
    die "Missing argument" unless $hashref;
    die "Argument must be an hashref" unless ref($hashref) eq 'HASH';
    foreach my $k (keys %$hashref) {
        if (my $ref = ref($hashref->{$k})) {
            if ($ref eq 'HASH') {
                if (!%{$hashref->{$k}}) {
                    $hashref->{$k} = '';
                }
            }
        }
    }
}



1;
