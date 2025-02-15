# -------------------
# Test of subroutines
# -------------------
use strict;
use warnings;
# -------------------------
# Definition of subroutines
# -------------------------
sub AddToArray{
my @LocVar;
my $NumElements;
#
@LocVar = @_;
$NumElements = $#LocVar + 1;
$LocVar[$NumElements] = "oiuztrr";
return @LocVar;
}
# ------------------------
# Main part of the program
# ------------------------
my (@OldLines, @NewLines);
#
@OldLines = ("abcdefg", "hijklmnop");
#
@NewLines = AddToArray(@OldLines);
print @NewLines;