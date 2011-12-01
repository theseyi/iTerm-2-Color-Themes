#!/usr/bin/env perl
# -*- coding: utf-8 -*-

use strict;

my $color;

while (<>) {
    if (/Ansi (\d+)/) {
    	print "*color$1: #";
    } elsif (/<real>(\d+(\.\d+)?)/) {
        #print hex($1 * 255);
    	$color = sprintf("%.2X", $1 * 255) . $color;
    } elsif (/\/dict/) {
    	print "$color\n";
    	$color = '';
    } elsif (/<key>(.*) Color<\/key>/) {
    	print lc("*$1: #");
    }
}
