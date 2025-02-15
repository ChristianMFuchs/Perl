#
# Leif - (l)learning (E)nglish (i)s (f)un
#
#
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
my (@D, @DData);
#
@D = @_;
#
$D1 = $D[0];
$D2 = $D[1];
@DData = @D[2..$#D];
$NumLine = -1;
#
print @DData;
#
foreach $Line (@DData){
	($German, $English, $Page, $Typee, $Tested, $Success) = split("\cI", $Line);
	if (($D1 eq "german") or ($D1 eq "english")){
		if ($D1 eq "german"){
			$Quest = $English; 
			$Ans = $German;
		}
		elsif ($D1 eq "english"){
			$Quest = $German; 
			$Ans = $English;
		}
		else{
			print "Do nothing";
		}
		$Trial = lEif_EnterWord($Quest);
		if ($Trial eq $Ans) {$Success = $Success + 1;}
		if ($Trial ne $Ans) {$Success = $Success + 0;}
		$Tested = $Tested + 1;
		$NumLine = $NumLine + 1;
		@DData[$NumLine] = "$German\cI$English\cI$Page\cI$Typee\cI$Tested\cI$Success\cJ";
	}
}
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
print "## lEif: Status: $Value ";
if ($Value eq "EMPTY")
{
    print "> lEif: possible commads: create, load.\n";
}
elsif ($Value eq "NEW")
{
    print "> lEif: possible commads: save, show\n";
}
elsif ($Value eq "SAVED")
{
    print "> lEif: possible commads: create, test, show.\n";
}
elsif ($Value eq "CHANGED")
{
    print "> lEif: possible commads: save, show.\n";
}
else {print "Unknown status.\n";}    
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
print "[create\n";
$CreateLine = "";
until ( $CreateLine eq "exit\n" )
{ 
	$German = lEif_EnterWord("German");
	$English = lEif_EnterWord("English");
	$Page = lEif_EnterWord("Page? Seite");
	$Typee = lEif_EnterWord("Type");
	$Tested = "0";
	$Success = "0";
	$NumberNewLine = $#Data + 1;
	@Data[$NumberNewLine] = "$German\cI$English\cI$Page\cI$Typee\cI$Tested\cI$Success\cJ";
	print "exit (exit) or continue (anything)? "; $CreateLine = readline(STDIN);
}
print "(create)]\n";
return @Data;}
# =======================================================
# -----Subroutine for entering a word with question------
# =======================================================
sub lEif_EnterWord
{
	#
	my ($Question, $Answer, $UnUsed);
	#
	print "[EnterWord ";
	($Question) = @_;
	print "$Question ? ";
	$Answer = readline(STDIN);
	($Answer, $UnUsed) = split("\n", $Answer);
	print " (EnterWord)]";
	return $Answer;
}
# =======================================================
# ------------Subroutine for saving the data-------------
# =======================================================
sub lEif_Save
{
	#
	my ($Filename, $Line, $STATUS);
	my @Data = @_;
	#
	print "[Save ";
	$Filename = lEif_EnterWord("Filename? ");
	open(FILE, ">$Filename") or die "## lEif: Can't open the file.\n";
	foreach $Line (@Data)
	{
		print FILE $Line;
	}
	close FILE or die "## lEif: Can't close the file";
	$STATUS = "SAVED";
	print "(Save)]\n";
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
	print "[Load ";
	$Filename = lEif_EnterWord("Filename? ");
	#
	open(FILE, "<$Filename") or die "## lEif: Can't open the file.\n";
	@Data = <FILE>;
	close FILE or die "## lEif: Can't close the file";
	#
	print "(Load)]\n";
	return @Data;
}
# =========================
# Main part
# =========================
my ($Order, $EnteredLine, $Parameters, $UnUsed, $Filename, $Line, $LenData, $P1, $P2);
my @Data;
my $STATUS = "EMPTY";
#
print "## lEif: learning English is fun ...\n";
$Order = "";
until( ($Order eq "exit") && ($STATUS eq "SAVED") )
{
	#
	lEif_ShowStatus($STATUS);
	print "## lEif: ";
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
		if ($Order eq "load")
		{
			@Data = "";
			@Data = lEif_Load;
			print "($#Data+1) item loaded.\n";
			if($#Data>-1){$STATUS = "SAVED";}
		}
		elsif ($Order eq "create")
		{
			@Data = "";
			$LenData = 0;
			@Data = lEif_Create();
			if ( ($#Data+1) > $LenData ) {$STATUS = "NEW";}
		}
		else
		{print "$STATUS -> command ($Order) not allowed.\n";}
	}
	elsif ($STATUS eq "NEW")
	{
		#                            ===
		# Actions possible for state NEW
		#                            ===
		if ($Order eq "save")
		{
			$STATUS = lEif_Save(@Data);
		}
		elsif ($Order eq "show")
		{
			lEif_Show(@Data);
		}
		else
		{print "$STATUS -> command ($Order) not allowed.\n";}
	}
	elsif($STATUS eq "CHANGED")
	{
		#                            =======
	        # Actions possible for state CHANGED
	        #                            =======
		if ($Order eq "show")
		{
			lEif_Show(@Data);
		}
		elsif ($Order eq "save")
		{
			$STATUS = lEif_Save(@Data);
		}	
		else
		{print "$STATUS -> command ($Order) not allowed.\n";}
	}
	else
	{
		#                            =====
		# Actions possible for state SAVED
		#                            =====
		if ($Order eq "create")
		{
			$LenData = $#Data+1;
			@Data = lEif_Create(@Data);
			if (($#Data+1) > $LenData ) {$STATUS = "CHANGED";}
		}
		elsif ($Order eq "test")
		{
			@Data = ($P2, @Data);
			@Data = ($P1, @Data);
			@Data = lEif_Test(@Data);
			$STATUS = "CHANGED";
		}
		elsif ($Order eq "show")
		{
		    lEif_Show(@Data);
		}
		elsif ($Order eq "exit")
		{print "Going to exit."}
		else
		{print "$STATUS -> command ($Order) not allowed.\n";}
	}
	#--------------------------------------------- 
	#------End-------State machine----------------
	#---------------------------------------------
}
print "exit\n";
