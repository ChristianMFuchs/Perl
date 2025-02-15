#
# Test program loading a file
#
use strict;
use warnings;
#
my @Lines;
my ($German, $English, $date, $trials, $success, $Line);
#
open(FILE, "Example.txt") or die "Can't open the file.\n";
@Lines = <FILE>;
#
# List all lines of the file and split elements in each line.
#
foreach $Line (@Lines){
($German, $English, $date, $trials, $success) = split("\cI", $Line);
print (" $German \t is $English in English \n");
print (" Entered at $date \n");
print (" Tried $trials \t failed $success \n");
print ("\n");
}
close FILE or die "Can't close the file";