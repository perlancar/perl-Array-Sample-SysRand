package Array::Sample::SysRand;

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(sample_sysrand);

sub sample_sysrand {
    my ($ary, $n, $opts) = @_;
    $opts //= {};

    return () if $n < 1 || @$ary < 1;

    my $k = @$ary / $n;
    my $idx = rand() * @$ary;

    my @res;
    for my $i (1..$n) {
        push @res, $opts->{pos} ? int($idx) : $ary->[int($idx)];
        $idx += $k;
        $idx -= @$ary if $idx >= @$ary;
    }

    @res;
}

1;
# ABSTRACT: Systematic random sampling from an array

=head1 SYNOPSIS

 use Array::Sample::SysRand qw(sample_sysrand);

 sample_sysrand([0,1,2,3,4,5,6,7,8,9], 5); => (5, 7, 9, 1, 3)
 sample_sysrand([0,1,2,3,4,5,6,7,8,9], 5); => (2, 4, 6, 8, 0)

 sample_sysrand([0,1,2,3,4,5,6,7,8,9], 3); => (2, 6, 9)
 sample_sysrand([0,1,2,3,4,5,6,7,8,9], 3); => (4, 8, 1)


=head1 DESCRIPTION


=head1 FUNCTIONS

All functions are not exported by default, but exportable.

=head2 sample_sysrand

Syntax: sample_sysrand(\@ary, $n [ , \%opts ]) => list

Options:

=over

=item * pos => bool

If set to true, will return positions instead of the elements.

=back

The function takes an array reference (C<\@ary>) and the number of samples
requested (C<$n>) and will return a list of samples. It will start from a random
position to get the first sample then jump at fixed interval to get the
subsequent ones.


=head1 SEE ALSO

About systematic (random) sampling:
L<https://www.investopedia.com/terms/s/systematic-sampling.asp>

Other sampling methods: L<Array::Sample::Partition>,
L<Array::Sample::SimpleRandom>, L<Array::Sample::WeightedRandom>

=cut
