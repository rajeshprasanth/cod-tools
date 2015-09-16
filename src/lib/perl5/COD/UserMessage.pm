#------------------------------------------------------------------------------
#$Author$
#$Date$ 
#$Revision$
#$URL$
#------------------------------------------------------------------------------
#*
#  Format run time error and warning messages in a uniform way.
#**

package COD::UserMessage;

use strict;
use warnings;
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw( print_message error warning note parse_message sprint_message );
our @EXPORT_OK = qw( debug_note prefix_dataname
                     process_warnings process_errors );

# characters that will be escaped as HTML5 entities
# '#' symbol is used for starting comment lines
my %program_escape   = ( '&' => '&amp;', ':' => '&colon;', ' ' => '&nbsp;' );
my %filename_escape  = ( '&' => '&amp;', ':' => '&colon;', ' ' => '&nbsp;',
                         '(' => '&lpar;', ')' => '&rpar;' );
my %datablock_escape = ( '&' => '&amp;', ':' => '&colon;', ' ' => '&nbsp;' );
my %message_escape   = ( '&' => '&amp;', ':' => '&colon;' );

#==============================================================================
# Print a message, reporting a program name, file name, data block
# name and am error level (ERROR or WARNING) in a uniform way.
#
# For ease of parsing error messages from log files, $message should
# probably not contain a colon (":") since colon is used to separate
# different parts of the error message.

sub sprint_message($$$$$$@)
{
    my ( $program, $filename, $datablock, $errlevel, $message,
         $explanation, $line, $column, $line_contents ) = @_;

    $message =~ s/\.?\n?$//;
    $explanation =~ s/\.?\n?$// if defined $explanation;

    #$program = "perl -e '...'" if ( $program eq '-e' );

    $program     = escape_meta( $program,     \%program_escape   );
    $filename    = escape_meta( $filename,    \%filename_escape  );
    $datablock   = escape_meta( $datablock,   \%datablock_escape );
    $message     = escape_meta( $message,     \%message_escape   );
    $explanation = escape_meta( $explanation, \%message_escape   );

    $line_contents = prefix_multiline($line_contents);

    return $program . ":" .
           (defined $filename ? ' ' . $filename .
                (defined $line ? "($line" .
                    (defined $column ? ",$column" : "") . ")"
                : "") .
                (defined $datablock ? " $datablock" : "")
           : "") . ": " .
           (defined $errlevel ? $errlevel . ", " : "") .
           $message .
           (defined $explanation ? " -- " . $explanation : "") .
           (defined $line_contents ? ":\n" . $line_contents . "\n" .
                (defined $column ? " " . " " x ($column-1) . "^\n" : "")
                : ".\n");}

#==============================================================================
# Generic function for printing messages to STDERR

sub print_message($$$$$$@)
{
    my ( $program, $filename, $datablock, $errlevel, $message,
         $explanation, $line, $column, $line_contents ) = @_;
    print STDERR sprint_message( $program, $filename, $datablock, $errlevel,
                                 $message, $explanation, $line, $column,
                                 $line_contents );
}

#==============================================================================
# Parse an error message, generated by print_message. To be parsed
# correctly, program, file and datablock names as well as error level must
# not not contain colons (':'). Error level is confined to uninterrupted
# word without colons and commas (','). Error level can be separated from
# the rest of the message by colon.
sub parse_message($)
{
    my( $message ) = @_;

    my $FNAME  = qr/[A-Za-z0-9_,\-\.\/&;#]+/ms;
    my $ELEVEL = qr/[A-Z][A-Z_0-9 ]*/ms;
    if( $message =~ /^
             ($FNAME):[ ]?
             (?:
                 ($FNAME)
                     (?: \( (\d+) (?:,(\d+))? \) )?
                     (?: [ ]([^:]+?) )?
             )?
             :[ ]?
             (?: ($ELEVEL)[,][ ])?
             (?:([^\n:]+?)(?:\.?\n?)?)
             (?: \: \s* \n
                 (
                 (?: [ ][^\n]*\n )*
                 )
             )?
         $/msxg ) {
        return {
            program      => unescape_meta($1, \%program_escape ),
            filename     => unescape_meta($2, \%filename_escape),
            line         => $3,
            column       => $4,
            datablock    => unescape_meta($5, \%datablock_escape),
            errlevel     => $6,
            message      => unescape_meta($7, \%message_escape),
            line_content => unprefix_multiline($8)
        };
    } else {
        return undef;
    }
}

#==============================================================================
# Report an error message. Errors are indicated with the "ERROR"
# keyword in the message line. This is supposed to be a fatal even,
# and the program will most probably die() or exit(255) after this
# message, but the UserMessage package does not enforce this policy.

sub error($$$$$)
{
    my ( $program, $filename, $datablock, $message, $explanation ) = @_;
    print_message( $program, $filename, $datablock,
                   "ERROR", $message, $explanation );
}

#==============================================================================
# Report a warning message. Warnings are indicated with the "WARNING"
# keyword. Program can probably continue after warnings and give a
# reasonable result, but it might be not the result which the user
# expected.

sub warning($$$$$)
{
    my ( $program, $filename, $datablock, $message, $explanation ) = @_;
    print_message( $program, $filename, $datablock,
                   "WARNING", $message, $explanation );
}

#==============================================================================
# Report a note message. Notes are indicated with the "NOTE"
# keyword. Program can always continue after issuing notes as the intent
# of note is just to provide information on the progress.

sub note($$$$$)
{
    my ( $program, $filename, $datablock, $message, $explanation ) = @_;
    print_message( $program, $filename, $datablock,
                   "NOTE", $message, $explanation );
}

#==============================================================================
# Report a debug message. Notes are indicated with the "DEBUG"
# keyword. Debug messages should only be printed uppon user request to output
# additional information.

sub debug_note($$$$$)
{
    my ( $program, $filename, $datablock, $message, $explanation ) = @_;
    print_message( $program, $filename, $datablock,
                   "DEBUG", $message, $explanation );
}

sub escape_meta {
    my ( $text, $escaped_symbols ) = @_;

    return undef if !defined $text;

    my $symbols = join "|", map { $_ = "\\$_" } keys %{$escaped_symbols};

    $text =~ s/($symbols)/$escaped_symbols->{"$1"}/g;

    return $text;
}

sub unescape_meta {
    my ( $text, $escaped_symbols ) = @_;

    return undef if !defined $text;

    my %unescaped_symbols = reverse %{$escaped_symbols};

    my $symbols = join "|", keys %unescaped_symbols;

    $text =~ s/($symbols)/$unescaped_symbols{"$1"}/g;

    return $text;
}

sub prefix_multiline
{
    my ($multiline) = @_;

    if( defined $multiline ) {
        # Empty line has to be dealt separately, as split'ting empty
        # line returns empty array:
        if( $multiline ne "" ) {
            $multiline = join( "\n", map { " $_" }
                                         split( "\n", $multiline ) );
        } else {
            $multiline = " ";
        }
    }

    return $multiline;
}

sub unprefix_multiline
{
    my ($multiline) = @_;

    $multiline =~ s/^ //msg if defined $multiline;

    return $multiline;
}

sub prefix_dataname($)
{
    my ($dataname) = @_;

    $dataname = "data_" . $dataname if defined $dataname;
    return $dataname;
}

1;
