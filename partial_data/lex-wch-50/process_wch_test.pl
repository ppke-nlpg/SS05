#!/usr/bin/perl

#Convert word-tag-chunk to tag tag-chunk
#Input:lex file(test wch file)
#Output:tag tag-chunk (format words-pos words-pos-ch or pos pos-ch)

use strict;

my $line_lex;
my $line_train;
my $line_origin;

my $str = $ARGV[0];
my @temp_t = split ("_",$str); # eg. iob2_400
my $fname_train = "<test.".$temp_t[0].".set";# eg. test.iob2.set
my $fname_lex = "<train.iob2.c.wch100";# eg. train.iob2.wch
my $freq = $temp_t[1];

open(FP_lex,$fname_lex) || die("Can not open file because $!");
open(FP_train,$fname_train)|| die("Can not open file because $!");
open(FP_origin,"<test.iob2.txt")|| die("Can not open file because $!");

#-----Build hash table for selected words(lex)-----------
my %lex;
my $flag = 0; #default is false
while($line_lex=<FP_lex>){
    chomp($line_lex);
    my @words = split(' ',$line_lex);		
    next if ($#words < 1);
    
    if ($words[0] eq "##" && $freq == $words[3]){
    	$flag = 1;
    	next;
    }
    last if ($words[0] eq "##" && $flag == 1);
    $lex{$words[0]} = 1;
}	
	

#-----Build new trainning file--------------------
while($line_origin=<FP_origin>){
    $line_train = <FP_train>;
    chomp($line_origin);
    chomp($line_train);
    my @words_origin = split(' ',$line_origin);
    my @words_origin_ch = split("-",$words_origin[2]);
    my @words_train = split(' ',$line_train);
    my $tmp = $words_origin[0]."-".$words_origin_ch[1]; 

    if ($#words_origin < 1){# blank line
    	print "\n";
    }elsif ($words_origin[1] eq "WRB"){
	print $line_train,"\n";	
    }elsif (defined($lex{$tmp})){
    	print $words_origin[0],"+",$words_origin[1]," ";
    	print $words_origin[0],"+",$words_train[1],"\n";
    }else{
    	print $line_train,"\n";
    }
}
