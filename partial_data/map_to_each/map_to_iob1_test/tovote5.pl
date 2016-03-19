#!/usr/bin/perl

#Voting among 5 tagged test file
#Input: tagged test file(eg. test.iob2.wch.merge as input)
#Output: new test file to be evaluated(format: words POS POS-chunktype POS-predictchunktype)

#use strict;

open (inFP_iob1, "<test.iob1.wch100.merge");
open (inFP_iob2, "<test.from.iob2.wch100");
open (inFP_ioe1, "<test.from.ioe1.wch100");
open (inFP_ioe2, "<test.from.ioe2.wch100");
open (inFP_oc, "<test.from.o+c.wch100");

my $line_iob1;
my $line_iob2;
my $line_ioe1;
my $line_ioe2;
my $line_oc;

while($line_iob2=<inFP_iob2>){
	$line_iob1 = <inFP_iob1>;
	$line_ioe1 = <inFP_ioe1>;
	$line_ioe2 = <inFP_ioe2>;
	$line_oc = <inFP_oc>;
	
	chomp($line_iob2);
	chomp($line_iob1);
	chomp($line_ioe1);
	chomp($line_ioe2);
	chomp($line_oc);
	
	my @word_iob1 = split (' ',$line_iob1);
	my @word_iob2 = split (' ',$line_iob2);
	my @word_ioe1 = split (' ',$line_ioe1);
	my @word_ioe2 = split (' ',$line_ioe2);
	my @word_oc = split (' ',$line_oc);

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
	
	if (not defined($vote{$word_ioe2[3]})){
		$vote{$word_ioe2[3]} = 1;
	}else{
		$vote{$word_ioe2[3]}++;
	}
	
	if (not defined($vote{$word_oc[3]})){
		$vote{$word_oc[3]} = 1;
	}else{
		$vote{$word_oc[3]}++;
	}

	my $max = $vote{$word_oc[3]};
	my $chunk_max = $word_oc[3];
	foreach $key ( keys(%vote) ){
		if ($max < $vote{$key}){
			$chunk_max = $key;
			$max = $vote{$key};
		}	
	}
	
	#print $word_iob2[0]," ",$word_iob2[1]," ";
	#if ($chunk_max eq 'O'){
	#	print $word_iob2[2]," ",$chunk_max,"\n"; 		
	#}else{
	#	print $word_iob2[2]," ",$chunk_iob2[0],"-",$chunk_max,"\n"; 
	#}
	
	print $word_oc[0]," ",$word_oc[1]," ";
	print $word_oc[2]," ",$chunk_max,"\n"; 			
}


close(inFP_iob1);
close(inFP_iob2);
close(inFP_ioe1);
close(inFP_ioe2);
close(inFP_oc);


