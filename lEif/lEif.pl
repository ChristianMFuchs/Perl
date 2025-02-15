#
# Lale - Latein lernen
#
# 18.11.2016: Change of the save function. If a filename is specified, no filename is requested.
#			  Change of the load function. Filename is returned.
# 			  Preparation of state machine.	
# 15.11.2016: German (Deutsch) as user language und Latein als Zielsprache --> lale.
# 15.11.2016: Ported to windows 10 and continued here.
# 22.10.2016: Added short statement about correct and wrong.
# 17.01.2016: Added simple function for displaying the data, modifcation on Linux
# 16.12.2015: First running version, complete English, last modification Linux.
#
# 
use strict;
use warnings;
# =======================================================
# ----------Subroutine for doing an exercise-------------
# =======================================================
sub lEif_Test{
#
my ($Detail, $EngTry, $NumLine, $Quest, $Ans, $Trial);
my ($German, $English, $Page, $Tested, $Success, $Typee);
my ($D1, $D2);
my ($Line);
my ($LocSuccess, $LocTested);
my (@D, @DData);
#
@D = @_;
#
$D1 = $D[0];
$D2 = $D[1];
@DData = @D[2..$#D];
$NumLine = -1;
#
$LocSuccess = 0; 
$LocTested = 0;
#
print @DData;
#
foreach $Line (@DData){
	($German, $English, $Page, $Typee, $Tested, $Success) = split("\cI", $Line);
	if (($D1 eq "Deutsch") or ($D1 eq "Latein")){
		if ($D1 eq "Deutsch"){
			$Quest = $English; 
			$Ans = $German;
		}
		elsif ($D1 eq "Latein"){
			$Quest = $German; 
			$Ans = $English;
		}
		else{
			print "Keine Ahnung!";
		}
		$Trial = lEif_EnterWord($Quest);
		if ($Trial eq $Ans) {$Success = $Success + 1;
				     $LocSuccess = $LocSuccess + 1;
		}
		if ($Trial ne $Ans) {$Success = $Success + 0;
				     $LocSuccess = $LocSuccess + 0;
		}
		$Tested = $Tested + 1;
		$LocTested = $LocTested + 1;
		$NumLine = $NumLine + 1;
		@DData[$NumLine] = "$German\cI$English\cI$Page\cI$Typee\cI$Tested\cI$Success\cJ";
	}
}
print "\n";
print "## Tested:"; print $LocTested; print "\n";
print "## Success:"; print $LocSuccess; print "\n";
print "## Failed:"; print $LocTested-$LocSuccess; print "\n";
#
return @DData;
}
# =======================================================
# -----------Subroutine for displaying data--------------
# =======================================================
sub lEif_Show{
#
my @Data = @_;
print @Data;
#
}
# =======================================================
# -----------Subroutine for displaying status------------
# =======================================================
sub lEif_ShowStatus{
#
my $Value;
#
($Value) = @_;
print "## lale: Status: $Value ";
if ($Value eq "EMPTY")
{
    print "> lale: Eingabe: Neu, Laden.\n";
}
elsif ($Value eq "NEW")
{
    print "> lale: Eingabe: commads: Sichern, Zeigen\n";
}
elsif ($Value eq "SAVED")
{
    print "> lale: Eingabe: commads: Neu, Test, Zeigen.\n";
}
elsif ($Value eq "CHANGED")
{
    print "> lale: Eingabe: commads: Sichern, Zeigen\n.\n";
}
else {print "Unbekannte Situation.\n";}    
#
}
# =======================================================
# -----------Subroutine for creating the data------------
# =======================================================
sub lEif_Create{
#
my @Data = @_;
my ($German, $English, $Page, $Tested, $Success, $Typee); 
my ($CreateLine, $NumberNewLine);
#
print "[\n";
$CreateLine = "";
until ( $CreateLine eq "Ende\n" )
{ 
	$German = lEif_EnterWord("Deutsch");
	$English = lEif_EnterWord("Latein");
	$Page = lEif_EnterWord("Seite");
	$Typee = lEif_EnterWord("Typ");
	$Tested = "0";
	$Success = "0";
	$NumberNewLine = $#Data + 1;
	@Data[$NumberNewLine] = "$German\cI$English\cI$Page\cI$Typee\cI$Tested\cI$Success\cJ";
	print "Ende (Ende) oder Weiter (egal)? "; $CreateLine = readline(STDIN);
}
print "]\n";
return @Data;}
# =======================================================
# -----Subroutine for entering a word with question------
# =======================================================
sub lEif_EnterWord
{
	#
	my ($Question, $Answer, $UnUsed);
	#
	print "[ ";
	($Question) = @_;
	print "$Question ? ";
	$Answer = readline(STDIN);
	($Answer, $UnUsed) = split("\n", $Answer);
	print " ]";
	return $Answer;
}
# =======================================================
# ------------Subroutine for saving the data-------------
# =======================================================
sub lEif_Save
{
	#
	my ($Line, $STATUS);
	my ($Filename, @Data) = @_;
	#
	print "[ ";
	open(FILE, ">$Filename") or die "## lale: Datei kann nicht geöffnet werden.\n";
	foreach $Line (@Data)
	{
		print FILE $Line;
	}
	close FILE or die "## lale: Datei kann nicht geschlossen wedrden";
	$STATUS = "SAVED";
	print " ]\n";
	#
	return $STATUS;
}
# =======================================================
# -----------Subroutine for loading the data-------------
# =======================================================
sub lEif_Load
{
	#
	my $Filename;
	my @Data;
	#
	print "[ ";
	$Filename = lEif_EnterWord("Dateiname");
	#
	open(FILE, "<$Filename") or die "## lale: datei kann nicht geöffnet werden.\n";
	@Data = <FILE>;
	close FILE or die "## lale: Datei kann nicht geschlossen werden.\n";
	#
	print " ]\n";
	@DuSt = ($Filename, @Data);
	return @DuSt;
}
# =========================
# Main part
# =========================
my ($Order, $EnteredLine, $Parameters, $UnUsed, $Filename, $Line, $LenData, $P1, $P2);
my @Data;
my $STATUS = "EMPTY";
#
print "## lale: **la**tein **le**rnen ...\n";
$Order = "";
until( ($Order eq "Ende") && ($STATUS eq "SAVED") )
{
	#
	lEif_ShowStatus($STATUS);
	print "## lale: ";
	$EnteredLine = readline(STDIN);
	($Order, $P1, $P2) = split(" ", $EnteredLine);
	#--------------------------------------------- 
	#------Start-----State machine----------------
	#---------------------------------------------
	if ($STATUS eq "EMPTY")
	{
		#                            =====
		# Actions possible for state EMPTY
		#                            =====
		if ($Order eq "Laden")
		{
		}
		elsif ($Order eq "Neu")
		{
		}
		else
		{print "$STATUS -> Befehl ($Order) nicht erlaubt.\n";}
	}
	elsif ($STATUS eq "SAME")
	{
		#                            ====
		# Actions possible for state SAME
		#                            ====
		if ($Order eq "Test")
		{
		}
		elsif ($Order eq "Neu")
		{
		}
		elsif ($Order eq "Ende")
		{
		}
		else
		{print "$STATUS -> Befehl ($Order) nicht erlaubt.\n";}
	}
	elsif($STATUS eq "MODIFIED")
	{
			#                            ========
	        # Actions possible for state MODIFIED
	        #                            ========
		if ($Order eq "Test")
		{
		}
		elsif ($Order eq "Neu")
		{
		}	
		elsif ($Order eq "Laden)
		{
		}	
		elsif ($Order eq "Ende")
		{
		}	
		else
		{print "$STATUS -> Befehl ($Order) nicht erlaubt.\n";}
	}
	else
	{
		#                            =====
		# Actions possible for state SAVED
		#                            =====
		if ($Order eq "Neu")
		{
		}
		elsif ($Order eq "Test")
		{
		}
		elsif ($Order eq "Zeigen")
		{
		}
		elsif ($Order eq "Ende")
		{print "Beenden."}
		else
		{print "$STATUS -> Befehl ($Order) nicht erlaubt.\n";}
	}
	#--------------------------------------------- 
	#------End-------State machine----------------
	#---------------------------------------------
}
print "Programm wird beendet.\n";