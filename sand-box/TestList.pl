use strict;
use warnings;
#
my (@Data, @Col1, @Col2, @Col3);
my ($linenumber, $line, $a, $b, $c);
#
@Data = ( "a b c", "a1 b1 c1", "a2 b2 c2" );
#
$linenumber = 0;
foreach $line (@Data)
{
($a, $b, $c) = split(" ", $line);
$Col1[$linenumber] = $a;
$Col2[$linenumber] = $b;
$Col3[$linenumber] = $c;
$linenumber = $linenumber + 1;
}
print "@Col1\n";
print "@Col2\n";
print "@Col3\n";
#
#
