#!/usr/bin/perl

#Merge tagged test file with original and set test file
#Input: set, tagged, and original test file(eg. use iob2_wte5 as test.iob2.wte5.set as input)
#Output: new test file to be evaluated(format: words POS POS-chunktype POS-predictchunktype)

use strict;
my $line_origin;
my $line_set;
my $line_tagged;

my @tmp = split("_",$ARGV[0]);
my $fn_origin = "<test.iob2.txt";# eg. test.iob2.txt
my $fn_set = "<test.".$tmp[0].".set";# eg. test.iob2.set
my $fn_tagged = "<test.".$tmp[0].".wch100.tagged";# eg. test.iob2.wch100.tagged

open(inFP_origin, $fn_origin);
open(inFP_set, $fn_set);
open(inFP_tagged, $fn_tagged);

while($line_origin=<inFP_origin>){
    chomp($line_origin);
    $line_set = <inFP_set>;
    $line_tagged = <inFP_tagged>;
    while ($line_tagged =~/^%%/){
    	$line_tagged = <inFP_tagged>;
    }

    my @words_origin = split(' ',$line_origin);
    my @words_set = split(' ',$line_set);
    my @words_tagged = split(' ',$line_tagged);


    if ($#words_origin < 1){# blank line
    	print "\n";
    }else{
	print $words_origin[0]," ",$words_origin[1]," ";
	my @chunk_set = split("-",$words_set[1]);
	my @chunk_tagged = split("-",$words_tagged[1]);
	if ($#chunk_set == 2){
		print $chunk_set[1],"-",$chunk_set[2]," ";
	}else{
		print $chunk_set[1]," ";
	}
	if ($#chunk_tagged == 2){
		print $chunk_tagged[1],"-",$chunk_tagged[2],"\n";
	}else{
		print $chunk_tagged[1],"\n";
	}	
    }
}

close(inFP_origin);
close(inFP_set);
close(inFP_tagged);
