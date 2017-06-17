package Array::Sample::SysRand;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
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

 sample_partition([0,1,2,3,4,5,6,7,8,9], 5); => (5, 7, 9, 1, 3)


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


=head1 SEE ALSO

L<Array::Sample::Partition>

=cut
