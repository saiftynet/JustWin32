#!/usr/bin/env perl 
# A test script for a combobox

use strict;
use warnings;
use lib"/lib/";  # path to lib
use GUIDeFATE::JustWin32;


# Combo options are just a comma lseparated list of items
# e.g
my $options="Option 1,Option 2,Option 3";
my $checkListItems="First item in List,Second item,Yet another item ";

my $window=<<END;
+---------------------------------------------------------+
|T  Combo-box and CheckListBox demo                       |
+M--------------------------------------------------------+
|                    Combobox                             |
|                 ^ComboContent^                          |
|                                                         |
|                CheckList Box Demo                       |
|       +C------------------------------------+           |
|       |  CheckListItems                     |           |
|       |                                     |           |
|       |                                     |           |
|       |                                     |           |
|       +-------------------------------------+           |
|       `Check_box2                                      |
|       `Check_box3                                      |
|       `Check_box4                                      |
+---------------------------------------------------------+

ComboContent=$options
CheckListItems=$checkListItems
END


my $gui=GUIDeFATE::JustWin32->new($window,"a");
my $frame=$gui->getFrame||$gui;

$gui->MainLoop;


#Static text 'Combobox'  with id stattext0
sub combo1 {#called using combobox with data from @ComboContent
print "combo1 changed, value is now:-",$frame->getValue("combo1"),"\n";
  # subroutione code goes here
   };

#Static text 'CheckList Box Demo'  with id stattext2
#SubPanel 'C' Id 4 found position  8 height 6 width 37 at row 5 with content CheckListItems 
sub chkbox5 {#called using Check Box with label Check_box2 
  # subroutione code goes here
print "chkbox5 clicked, value is now:-",$frame->getValue("chkbox5"),"\n"
   };

sub chkbox6 {#called using Check Box with label Check_box3 
  # subroutione code goes here
print "chkbox6 clicked, value is now:-",$frame->getValue("chkbox6"),"\n"
   };

sub chkbox7 {#called using Check Box with label Check_box4 
  # subroutione code goes here
print "chkbox7 clicked, value is now:-",$frame->getValue("chkbox7"),"\n";
   };