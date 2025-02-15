#
# Test program for main part of vocabulary system
#
use strict;
use warnings;
#
my $ORDER;
my $STATUS;
#
print "Learning English is fun ...\n";
$ORDER = "\n";
$STATUS = "Empty";
until( $ORDER eq "exit\n" )
{
	print "## LEif:";
	$ORDER = readline(STDIN);
	if( $ORDER eq "loadworkingdataset\n")
	{ print "## LEif: Subroutine for creation of a new dataset.\n";}
	elsif( $ORDER eq "appendworkingdataset\n" )
	{ print "## LEif: Subroutine for appending a new dataset.\n";}
	elsif( $ORDER eq "exit\n" )
	{ print "## LEif: ." }
	elsif( $ORDER eq "status\n" )
	{ print "## LEif: Status information." }
	else 
	{ print "## LEif: Unknown command.\n"}
}
print "exit\n";