#!/usr/bin/perl

use strict;
use warnings;

die <<HELP unless @ARGV;
USAGE: ualm.pl CMD

    swaps all occurences of `.ucomm' in CMD with the ssh address of a random 
    ucomm lab machine and executes it as a shell command
    each occurence in CMD will use the same lab machine

    ex. ualm.pl scp myfile.txt ccid38@.ucomm:/Documents
    ->  scp myfile.txt ccid38\@ucomm-2086-w04.cs.ualberta.ca:/Documents
HELP

my @rooms = qw/2030 2070 2086 2130 2140 3130 3140/;
my @machines = qw/4 24 33 25 25 23 21/;

my $i = rand(7);

# 2030 has no w00 so it never accesses w00 even if it exists, oh well
my $labmachine = sprintf("ucomm-%d-w%02d.cs.ualberta.ca", $rooms[$i], 1 + rand($machines[$i]));
my $cmd = join ' ', @ARGV;

$cmd =~ s/\.ucomm/$labmachine/g;
exec $cmd;
