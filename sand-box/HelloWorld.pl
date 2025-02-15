use strict;
use warnings;

my (@Data, @Col1, @Col2, @Col3);
my ($linenumber);

@Data = ( "a b c", "a1 b1 c1", "a2 b2 c2" );

$linenumber = 0;
foreach $Line (@Data)
{
($a, $b, $c) = split(" ", $Line);
$Col1($linenumber) = $a;
$Col2($linenumber) = $b;
$Col3($linenumber) = $c;
}
print @Col1;
print @Col2;
print @Col3;