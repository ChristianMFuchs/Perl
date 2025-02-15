# -------------------
# Test of subroutines
# -------------------
use strict;
use warnings;
# -------------------------
# Definition of subroutines
# -------------------------
sub AddToArray{
my (@Arg2, @P);
my ($NumElements, $Arg1);
#
@P = @_;
$NumElements = $#P;
#
$Arg1 = @P[0];
@Arg2 = @P[1..$NumElements];
print "$Arg1\n";
print "@Arg2\n";
return ;
}
# ------------------------
# Main part of the program
# ------------------------
my (@OldLines);
#
@OldLines = ("abcdefg", "hijklmnop");
#
AddToArray("abcxxxefg", @OldLines);