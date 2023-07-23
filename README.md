# JustWin32
A stripped down version of GUIDeFATE for just using Win32::GUI in windows machines

# Easy Install Steps

1. install the latest Strawberry Perl
2. download the .zip of this repository, extract it into your Documents directory

## The Windows Way (recommended for starters)

3. open Windows Explore, go to Documents/JustWin32-main
4. double click "setup" (this will ensure the Win32::GUI module is installed)
5. double click "calculator" (this will run the necessary Perl command)

## The Commandline Way

3. Open the Strawberry Perl CMD window (via Start > Programs > Strawberry Perl > Perl (commandline)
4. "cd" to ./JustWin32-main
5. type in "setup.bat", hit <enter> (this will ensure the Win32::GUI module is installed)
6. type in "calculator.bat", hit <enter> (this runs the necessary Perl command)

# Background Information

GUIDeFATE used to be notoriously difficult to install, trying to make many different backends which do make things difficult for individual projects that don't need this versatility, or when dependencies are difficult to find.  Installation of dependencies (only Win32::GUI and Imager at present.
Functionality is similar to GUIDeFATE.  The Wiki there will give you an idea of how it works while I sort out simplified [documentation](JustWin32.pod) for this.

![image](https://github.com/saiftynet/JustWin32/assets/34284663/269799bf-0cf8-4be8-9f9a-93245e53932e)

```
#!/usr/bin/env perl 
#A test script that  generates a calculator style interface
#uses GUIDeFATE::JustWin32, which is bundled with GFWin32
#Dependencies Win32::GUI and Imager
#This file designed to be called by Executioner for backend testing

use strict;
use warnings;
use  GUIDeFATE::JustWin32;;

my $window=<<END;
+------------------------+
|T  Calculator           |
+M-----------------------+
|  [                  ]  |
|  {sqr}{pi }{ C }{AC }  |
|  { 1 }{ 2 }{ 3 }{ + }  |
|  { 4 }{ 5 }{ 6 }{ - }  |
|  { 7 }{ 8 }{ 9 }{ * }  |
|  { . }{ 0 }{ = }{ / }  |
|  made with GUIdeFATE   |
|  and happy things      |
+------------------------+

END

my $result=0;
my $acc="";
my $assist="v";
my $gui= GUIDeFATE::JustWin32->new($window,$assist);
my $frame=$gui->getFrame()||$gui;
$gui->MainLoop();

sub textctrl0 #called using Text Control with default text '                    '
  {
  $result=$frame->getValue("textctrl0");
   };

sub btn1 #called using button with label V 
  {
	  my $tmp=$frame->getValue("textctrl0");
      $result=sqrt($tmp);
      $frame->setValue("textctrl0", $result)
   };

sub btn2 #called using button with label pi 
  {
     $frame->setValue("textctrl0", 3.14159267)
   };

sub btn3 #called using button with label C 
  {
      $result=0;
      $frame->setValue("textctrl0", $result)
   };

sub btn4 #called using button with label AC 
  {
      $result=0;
      $frame->setValue("textctrl0", $result) 
   };

sub btn5 #called using button with label 1 
  {  
	 my $tmp=$frame->getValue("textctrl0");
	 if ($tmp eq "0"){ $frame->setValue("textctrl0", 1) }
     else {$frame->appendValue("textctrl0", 1) }
   };

sub btn6 #called using button with label 2 
  {
	 my $tmp=$frame->getValue("textctrl0");
	 if ($tmp eq "0"){ $frame->setValue("textctrl0", 2) }
     else {$frame->appendValue("textctrl0", 2) }
   };

sub btn7 #called using button with label 3 
  {
	  my $tmp=$frame->getValue("textctrl0");
	  if ($tmp eq "0"){ $frame->setValue("textctrl0", 3) }
	  else {$frame->appendValue("textctrl0", 3) }
   };

sub btn8 #called using button with label + 
  {
	  my $tmp=$frame->getValue("textctrl0");
	  $acc.=$tmp."+";print $acc."\n";
      $frame->setValue("textctrl0", 0)
   };

sub btn9 #called using button with label 4 
  {
	  my $tmp=$frame->getValue("textctrl0");
	  if ($tmp eq "0"){ $frame->setValue("textctrl0", 4) }
	  else {$frame->appendValue("textctrl0", 4) }
  
   };

sub btn10 #called using button with label 5 
  {
	  my $tmp=$frame->getValue("textctrl0");
	  if ($tmp eq "0"){ $frame->setValue("textctrl0", 5) }
	  else {$frame->appendValue("textctrl0", 5) }
   };

sub btn11 #called using button with label 6 
  {   
	  my $tmp=$frame->getValue("textctrl0");
	  if ($tmp eq "0"){ $frame->setValue("textctrl0", 6) }
	  else {$frame->appendValue("textctrl0", 6) }
   };

sub btn12 #called using button with label - 
  {
  	  my $tmp=$frame->getValue("textctrl0");
	  $acc.=$tmp."-";print $acc."\n";
      $frame->setValue("textctrl0", 0)
   };

sub btn13 #called using button with label 7 
  {
	  my $tmp=$frame->getValue("textctrl0");
	  if ($tmp eq "0"){ $frame->setValue("textctrl0", 7) }
	  else {$frame->appendValue("textctrl0", 7) }
   };

sub btn14 #called using button with label 8 
  {
	  my $tmp=$frame->getValue("textctrl0");
	  if ($tmp eq "0"){ $frame->setValue("textctrl0", 8) }
	  else {$frame->appendValue("textctrl0", 8) }
   };

sub btn15 #called using button with label 9 
  {
	  my $tmp=$frame->getValue("textctrl0");
	  if ($tmp eq "0"){ $frame->setValue("textctrl0", 9) }
	  else {$frame->appendValue("textctrl0", 9)}
  }

sub btn16 #called using button with label * 
  {   
	  my $tmp=$frame->getValue("textctrl0");
	  $acc.=$tmp."*";print $acc."\n";
	  print $acc."\n";
      $frame->setValue("textctrl0", 0)
   };

sub btn17 #called using button with label . 
  {
	  $frame->appendValue("textctrl0", ".")
   };

sub btn18 #called using button with label 0 
  {
	  $frame->appendValue("textctrl0", 0)
   };

sub btn19 #called using button with label = 
  {   
	  my $tmp=$frame->getValue("textctrl0");
	  $acc.=$tmp;print $acc."\n";
	  $result=eval($acc);
	  print $acc."=".$result."\n";
	  $frame->setValue("textctrl0", $result );
	  $acc="";
   };

sub btn20 #called using button with label / 
  {
	   my $tmp=$frame->getValue("textctrl0");
	   $acc.=$tmp."/";
	   $frame->setValue("textctrl0", 0)
   };

```



