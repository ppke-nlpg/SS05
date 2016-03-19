#!/usr/bin/perl

#Convert merged test file from O+C to IOE1
#Input: O+C
#Output: IOE1

#use strict;

open (inFP_ioe1, "<test.ioe1.wch100.merge");
my $line_ioe1;
my @ref;

my $line;
my @ioe1;
my @oc;
my $i=0;

# === read a line from file ===
while($line=<>){

    $line_ioe1=<inFP_ioe1>;	
    chomp($line_ioe1);
    $ref[$i] = $line_ioe1;
     
    chomp($line);
    $ioe1[$i] = $line;
    $oc[$i] = $line;
    #print $ioe1[$i],"\n";
    $i++; 
}


for (my $j=0;$j<=$#ioe1;$j++){
    # === split a line into words ===	
    my @ioe1_words = split(' ',$ioe1[$j]);
    
    # === skip blank line ===
    if ($#ioe1_words < 1){
    	#print "\n";
    	next;
    }        
    
    # === split a tagged chunk, eg.I-NP => "I" and "NP" ===
    my @cur = split ('-',$ioe1_words[3]);
    
    # === get previous ===
    my @prv_words = split(' ',$oc[$j-1]);
    my @prv = split('-',$prv_words[3]);
    
    # === get follow ===
    my @flw_words = split(' ',$oc[$j+1]);
    my @flw = split('-',$flw_words[3]);
       
    
    
    
    # === Case "[" ===
    if ($cur[0] eq "["){
    	$ioe1[$j] = $ioe1_words[0]." ".$ioe1_words[1]." ".$ioe1_words[2]." I-".$cur[1]; 
    }
    
    
    # === Case "]" ===
    if ($cur[0] eq "]"){
    
    	# "E" if follow = cur
    	if ($flw[1] eq $cur[1]){
       		$ioe1[$j] = $ioe1_words[0]." ".$ioe1_words[1]." ".$ioe1_words[2]." E-".$cur[1];
    	
    	# "I" if o.w.
    	}else{
    		$ioe1[$j] = $ioe1_words[0]." ".$ioe1_words[1]." ".$ioe1_words[2]." I-".$cur[1];
    	}
    	
    }
    
    # === Case "[]" ===
    if ($cur[0] eq "[]"){
        
        # "E" if follow([]) is "[]" or "[" and follow = cur
        if (($flw[0] eq "[]" or $flw[0] eq "[") and $flw[1] eq $cur[1]){
        	$ioe1[$j] = $ioe1_words[0]." ".$ioe1_words[1]." ".$ioe1_words[2]." E-".$cur[1]; 
    	
    	# "I" if o.w.
    	}else{
    		$ioe1[$j] = $ioe1_words[0]." ".$ioe1_words[1]." ".$ioe1_words[2]." I-".$cur[1]; 
    	}
    
    
    }
    
    
    # === Case "O", inside chunk ===
        if ($cur[0] eq "O" and $cur[1]!~/^$/){
        	$ioe1[$j] = $ioe1_words[0]." ".$ioe1_words[1]." ".$ioe1_words[2]." I-".$cur[1]; 
    }
    
}

for(my $j=0;$j<=$#ioe1;$j++){
    my @words = split(' ',$ioe1[$j]);
    my @words_ref = split(' ',$ref[$j]);
    print $words[0]," ";
    print $words[1]," ";
    print $words_ref[2]," ";
    print $words[3],"\n";	
}
