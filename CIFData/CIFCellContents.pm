#------------------------------------------------------------------------------
#$Author$
#$Date$ 
#$Revision$
#$URL$
#------------------------------------------------------------------------------
#*
#  Calculate unit cell contents from the atomic coordinates and
#  symmetry information in the CIF data structure returned by the
#  CIFParser.
#**

package CIFCellContents;

use strict;
use warnings;
use Fractional;
use SymopParse;
use SymopLookup;
use Spacegroups::SpacegroupNames;
use Formulae::FormulaPrint;
use CIFData::CIFEstimateZ;
use CIFData::CIFSymmetryGenerator;
use UserMessage;

require Exporter;
@CIFCellContents::ISA = qw(Exporter);
@CIFCellContents::EXPORT = qw(
    cif_cell_contents
    get_symmetry_operators
    symop_generate_atoms
    atomic_composition
    print_composition
);

$::format = "%g";

sub atomic_composition($$$);
sub print_composition($);

sub cif_cell_contents($$$)
{
    my ($dataset, $filename, $user_Z) = @_;

    my $values = $dataset->{values};

#   extracts atom site label or atom site type symbol
    my $loop_tag;

    if( exists $values->{"_atom_site_label"} ) {
        $loop_tag = "_atom_site_label";
    } elsif( exists $values->{"_atom_site_type_symbol"} ) {
        $loop_tag = "_atom_site_type_symbol";
    } else {
        error( $0, $filename, $dataset->{name},
               "neither _atom_site_label " .
               "nor _atom_site_type_symbol was found in the input file" );
        return undef;
    }

#   extracts cell constants
    my @unit_cell =
        CIFSymmetryGenerator::get_cell( $values, $filename, $dataset->{name} );

    my $ortho_matrix = symop_ortho_from_fract( @unit_cell );

#   extracts symmetry operators
    my $sym_data =
        CIFSymmetryGenerator::get_symmetry_operators( $dataset, $filename );

#   extract atoms
    my $atoms =
        CIFSymmetryGenerator::get_atoms( $dataset, $filename, $loop_tag );

#   compute symmetry operator matrices
    my @sym_operators = map { symop_from_string($_) } @{$sym_data};

    ## serialiseRef( \@sym_operators );

    my $sym_atoms =
        CIFSymmetryGenerator::symop_generate_atoms( \@sym_operators, $atoms,
                                                    $ortho_matrix );

    ## serialiseRef( $sym_atoms );

#   get the Z value

    my $Z;

    if( defined $user_Z ) {
        $Z = $user_Z;
        if( exists $values->{_cell_formula_units_z} ) {
            my $file_Z = $values->{_cell_formula_units_z}[0];
            if( $Z != $file_Z ) {
                warning( $0, $filename, $dataset->{name},
                         "overriding _cell_formula_units_Z ($file_Z) " .
                         "with command-line value $Z" );
            }
        }
    } else {
        if( exists $values->{_cell_formula_units_z} ) {
            $Z = $values->{_cell_formula_units_z}[0];
        } else {
            eval {
                $Z = CIFEstimateZ::cif_estimate_z( $dataset );
            };
            if( $@ ) {
                my $msg = $@;
                $msg =~ s/\n$//;
                $msg =~ s/:\n/: /g;
                $msg =~ s/\n/; /g;
                $Z = 1;
                warning( $0, $filename, $dataset->{name},
                         "$msg -- " .
                         "assuming Z = $Z" );
            } else {
                warning( $0, $filename, $dataset->{name},
                         "_cell_formula_units_Z is missing -- " .
                         "assuming Z = $Z" );
            }
        }
    }

    my %composition = atomic_composition( $sym_atoms, $Z, int(@sym_operators));

    ## print_composition( \%composition );

    wantarray ?
        %composition :
        FormulaPrint::sprint_formula( \%composition, $::format );
}

sub atomic_composition($$$)
{
    my ( $sym_atoms, $Z, $gp_multiplicity ) = @_;
    my %composition;

    for my $atom ( @$sym_atoms ) { 
        my $type = $atom->{atom_type};
        my $occupancy = defined $atom->{occupancy} ? $atom->{occupancy} : 1;
        my $amount = $occupancy  * $atom->{multiplicity};
        $composition{$type} += $amount;
    }

    my $abundance_ration = $Z * $gp_multiplicity;

    for my $type ( keys %composition ) {
        $composition{$type} /= $abundance_ration;
    }

    return wantarray ? %composition : \%composition;
}

sub print_composition($)
{
    my ( $composition ) = @_;

    ## for my $key ( sort { $a cmp $b } keys %$composition ) {
    ##     print "$key: ", $composition->{$key}, "\n";
    ## }

    FormulaPrint::print_formula( $composition, $::format );
}

1;
