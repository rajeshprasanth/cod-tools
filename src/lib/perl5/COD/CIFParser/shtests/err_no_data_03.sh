#! /bin/sh
#!perl -w # --*- Perl -*--
eval 'exec perl -x $0 ${1+"$@"}'
    if 0;
#------------------------------------------------------------------------------
#$Author$
#$Date$ 
#$Revision$
#$URL$
#------------------------------------------------------------------------------
#*
#  Perl test driver.
#**

use strict;

use lib ".";
use lib "lib/perl5";
use lib "CIFParser";

use File::Basename;
use COD::CIFParser::CIFParser;

my $script_dir  = File::Basename::dirname( $0 );
my $script_name = File::Basename::basename( $0 );

$script_name =~ s/\.sh$//;

my $filename = "${script_dir}/${script_name}.inp";

my $parser = new COD::CIFParser::CIFParser;

my $data = $parser->Run($filename);

print( ref $data, "\n" );
print( ref $data->[0], "\n" );