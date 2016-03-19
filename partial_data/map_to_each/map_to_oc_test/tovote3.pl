#!/usr/bin/perl

#Voting among 3 tagged test file (IOB1/IOB2/IOE1)
#Input: tagged test file(eg. test.iob2.wch.merge as input)
#Output: new test file to be evaluated(format: words POS POS-chunktype POS-predictchunktype)

#use strict;

open (inFP_iob1, "<test.from.iob1.wch100");
open (inFP_iob2, "<test.from.iob2.wch100");
open (inFP_ioe1, "<test.from.ioe1.wch100");
#open (inFP_ioe2, "<test.from.ioe2.wch100");
#open (inFP_oc, "<test.o+c.wch100.merge");

my $line_iob1;
my $line_iob2;
my $line_ioe1;
#my $line_ioe2;
#my $line_oc;

while($line_iob2=<inFP_iob2>){
	$line_iob1 = <inFP_iob1>;
	$line_ioe1 = <inFP_ioe1>;
#	$line_ioe2 = <inFP_ioe2>;
#	$line_oc = <inFP_oc>;
	
	chomp($line_iob2);
	chomp($line_iob1);
	chomp($line_ioe1);
#	chomp($line_ioe2);
#	chomp($line_oc);
	
	my @word_iob1 = split (' ',$line_iob1);
	my @word_iob2 = split (' ',$line_iob2);
	my @word_ioe1 = split (' ',$line_ioe1);
#	my @word_ioe2 = split (' ',$line_ioe2);
#	my @word_oc = split (' ',$line_oc);

	if ($#word_iob2<1){
		print "\n";
		next;
	}

	
	my %vote;
	$vote{$word_iob1[3]} = 1;
	if (not defined($vote{$word_iob2[2]})){
		$vote{$word_iob2[3]} = 1;
	}else{
		$vote{$word_iob2[3]}++;
	}
	
	if (not defined($vote{$word_ioe1[3]})){
		$vote{$word_ioe1[3]} = 1;
	}else{
		$vote{$word_ioe1[3]}++;
	}
	
#	if (not defined($vote{$word_ioe2[3]})){
#		$vote{$word_ioe2[3]} = 1;
#	}else{
#		$vote{$word_ioe2[3]}++;
#	}
	
#	if (not defined($vote{$word_oc[3]})){
#		$vote{$word_oc[3]} = 1;
#	}else{
#		$vote{$word_oc[3]}++;
#	}

	my $max = $vote{$word_iob2[3]};
	my $word_max = $word_iob2[3];
	foreach $key ( keys(%vote) ){
		if ($max < $vote{$key}){
			$word_max = $key;
			$max = $vote{$key};
		}	
	}
	
	print $word_iob2[0]," ",$word_iob2[1]," ";
	print $word_iob2[2]," ",$word_max,"\n"; 	
}


close(inFP_iob1);
close(inFP_iob2);
close(inFP_ioe1);
#close(inFP_ioe2);
#close(inFP_oc);


