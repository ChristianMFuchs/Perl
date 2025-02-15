#
# Test program loading a file
#
use strict;
use warnings;
#
my @Lines;
my $Line;
#
@Lines = ("a\cIb\cIc\cId\cIe\cJ", "a1\cIb1\cIc1\cId1\cIe1\cJ");
$Lines[2]= "a2\cIb2\cIc2\cId2\cIe2";
#
open(FILE, ">TestWrite.txt") or die "Can't open the file.\n";
#
foreach $Line (@Lines){
print FILE $Line;
}
close FILE or die "Can't close the file";