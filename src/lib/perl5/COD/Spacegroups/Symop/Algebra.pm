#--*-perl-*-------------------------------------------------------------
#$Author$
#$Date$
#$Revision$
#$URL$
#-----------------------------------------------------------------------
#*
# Basic symmetry operator algebra (addition, multiplication, etc.)
#**

package COD::Spacegroups::Symop::Algebra;

use strict;
use warnings;

use COD::Algebra::Vector qw( modulo_1 matrix_vector_mul );
use POSIX;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
    symop_mul symop_apply symop_invert symop_modulo_1 symop_translation
    symop_translate symop_set_translation symop_transpose
    symop_is_unity symop_vector_mul flush_zeros_in_symop
    symop_is_inversion symop_matrices_are_equal symop_is_translation
    symop_det round_values_in_symop
);


#
# Symop array contains the following values:
# my $symop = [
#     [ r11 r12 r13 t1 ]
#     [ r21 r22 r23 t2 ]
#     [ r31 r32 r33 t3 ]
#     [   0   0   0  1 ]
# ]
#

sub symop_mul($$)
{
    my ( $s1, $s2 ) = @_;

    my @result;
    for( my $i = 0; $i < @$s1; $i++ ) {
        for( my $j = 0; $j < @$s2; $j++ ) {
            $result[$i][$j] = 0;
            for( my $k = 0; $k < @$s2; $k++ ) {
                $result[$i][$j] += $s1->[$i][$k] * $s2->[$k][$j];
            }
        }
    }

    return \@result;
}

sub symop_modulo_1($)
{
    my ( $symop ) = @_;

    my @result = (
        [ @{$symop->[0]} ],
        [ @{$symop->[1]} ],
        [ @{$symop->[2]} ],
        [ @{$symop->[3]} ],
    );

    $result[0][3] = modulo_1( $symop->[0][3] );
    $result[1][3] = modulo_1( $symop->[1][3] );
    $result[2][3] = modulo_1( $symop->[2][3] );
    $result[3][3] = 1;

    return \@result;
}

sub symop_translate($$)
{
    my ( $symop, $vector ) = @_;

    my @result = (
        [ @{$symop->[0]} ],
        [ @{$symop->[1]} ],
        [ @{$symop->[2]} ],
        [ @{$symop->[3]} ],
        );

    $result[0][3] += $vector->[0];
    $result[1][3] += $vector->[1];
    $result[2][3] += $vector->[2];

    return \@result;
}

sub symop_set_translation($$)
{
    my ( $symop, $vector ) = @_;

    my @result = (
        [ @{$symop->[0]} ],
        [ @{$symop->[1]} ],
        [ @{$symop->[2]} ],
        [ @{$symop->[3]} ],
        );

    $result[0][3] = $vector->[0];
    $result[1][3] = $vector->[1];
    $result[2][3] = $vector->[2];
    $result[3][3] = 1;

    return \@result;
}

sub symop_adjunct($$$)
{
    my ( $s, $row, $col ) = @_;
 
    my @matrix = ();
    my ( $i, $j, $mi, $mj );
    my $coef;

    die unless( $row >= 0 && $row < 4 );
    die unless( $col >= 0 && $col < 4 );

    $mi = $mj = 0;
    for( $i = 0; $i < 4; $i ++ ) {
        next if( $i == $row );
        $mj = 0;
        for( $j = 0; $j < 4; $j ++ ) {
	    next if( $j == $col );
            $matrix[$mi][$mj] = $s->[$i][$j];
            $mj ++;
        }
        $mi ++;
    }
    die unless( $mi == 3 );
    die unless( $mj == 3 );
    $coef = (($row + $col) % 2 == 0) ? +1.0 : -1.0;
    return $coef * symop_det( \@matrix );
}

sub symop_det( $ )
{
    my $s = $_[0];
    return
        + $s->[0][0] * $s->[1][1] * $s->[2][2]
        + $s->[1][0] * $s->[2][1] * $s->[0][2]
        + $s->[0][1] * $s->[1][2] * $s->[2][0]

        - $s->[0][2] * $s->[1][1] * $s->[2][0]
        - $s->[0][0] * $s->[1][2] * $s->[2][1]
        - $s->[0][1] * $s->[1][0] * $s->[2][2];
}

sub symop_invert( $ )
{
    my $s = $_[0];
    my @ret;
    my $det = symop_det( $s );
    my ( $i, $j );

    for( my $i = 0; $i < 4; $i++ ) {
        for( my $j = 0; $j < 4; $j++ ) {
            $ret[$i][$j] = symop_adjunct($s,$j,$i) / $det;
        }
    }
    return \@ret;
}

sub symop_apply($$)
{
    my ( $symop, $vector ) = @_;
    my @result;

    for( my $i = 0; $i < @$vector; $i ++ ) {
        $result[$i] = 0;
        for( my $j = 0; $j < @$vector; $j ++ ) {
            $result[$i] += $symop->[$i][$j] * $vector->[$j];
        }
    }

    if( @$vector == 3 && @$symop == 4 ) {
        for( my $i = 0; $i < @$vector; $i ++ ) {
            $result[$i] += $symop->[$i][3];
        }
    }

    return \@result;
}

sub symop_is_inversion
{
    my ($symop) = @_;

    for( my $i = 0; $i < 3; $i++ ) {
        for( my $j = 0; $j < 3; $j++ ) {
            if( $i == $j && $symop->[$i][$j] != -1.0 ||
                $i != $j && $symop->[$i][$j] != 0.0 ) {
                return 0;
            }
        }
    }
    return 1;
}

sub symop_is_translation
{
    my ($symop) = @_;

    for( my $i = 0; $i < 3; $i++ ) {
        for( my $j = 0; $j < 3; $j++ ) {
            if( $i == $j && $symop->[$i][$j] != 1.0 ||
                $i != $j && $symop->[$i][$j] != 0.0 ) {
                return 0;
            }
        }
    }
    return 1;
}

sub symop_matrices_are_equal
{
    my ($s1, $s2) = @_;

    for( my $i = 0; $i < 3; $i++ ) {
        for( my $j = 0; $j < 3; $j++ ) {
            if( $s1->[$i][$j] != $s2->[$i][$j] ) {
                return 0;
            }
        }
    }
    return 1;
}

sub symop_translation($)
{
    my ( $symop ) = @_;

    my @translation = (
        $symop->[0][3],
        $symop->[1][3],
        $symop->[2][3]
    );

    return \@translation;
}

sub flush_zeros_in_symop($@)
{
    my ( $symop, $epsilon ) = @_;

    $epsilon = 1E-6 unless defined $epsilon;

    for my $row (@$symop) {
        for my $value (@$row) {
            if( abs($value) < $epsilon ) {
                $value = 0.0;
            }
        }
    }

    return $symop;
}

sub round_values_in_symop($@)
{
    my ( $symop, $eps ) = @_;

    $eps = 1E-6 unless defined $eps;

    for my $row (@$symop) {
        for my $value (@$row) {
            $value = POSIX::floor($value/$eps + 0.5)*$eps;
        }
    }

    return $symop;
}

sub symop_transpose($)
{
    my( $symop ) = @_;

    my $result = [];
    for my $i (0..$#{$symop}) {
        for my $j (0..$#{$symop->[$i]}) {
            push( @$result, [] ) if @$result <= $j;
            $result->[$j][$i] = $symop->[$i][$j];
        }
    }
    return $result;
}

sub symop_is_unity($)
{
    my($symop) = @_;
    my $eps = 1e-10;

    for(my $i = 0; $i < @{$symop}; $i++)
    {
        for(my $j = 0; $j < @{$symop}; $j++)
        {
            if($i == $j)
            {
                if(abs(${$symop}[$i][$j] - 1) > $eps) {
                    return 0;
                }
            }
            else
            {
                if(abs(${$symop}[$i][$j] - 0) > $eps) {
                    return 0;
                }
            }
        }
    }
    return 1;
}

sub symop_vector_mul($$)
{
    my($symop, $vector) = @_;

    my @new_coordinates = matrix_vector_mul($symop, $vector);

    if( @$vector == 3 && @$symop == 4 ) {
        $new_coordinates[0] += $symop->[0][3];
        $new_coordinates[1] += $symop->[1][3];
        $new_coordinates[2] += $symop->[2][3];
    }

    return wantarray ? @new_coordinates : \@new_coordinates;
}

1;
