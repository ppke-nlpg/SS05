#!/usr/bin/perl

#Select the words that belong to certain chunks such as SBAR,PP and VP with 
#high frequency in the trainning set
#Input: original trainning data and converted file (eg.: t_iob2_txt)
#Output: frequency table (format: words chunkType frequency)

#!/usr/bin/perl

my $line_origin;
my $line;
my %seen1;

while($line=<>){
    chomp($line);
    my @words1 = split(' ',$line);		
    my @words2 = split('-',$line);
    next if ($#words1 < 1);
    next if ($words1[2] eq "O");
     
    my $temp = $words1[0]."-".$words2[1];
    if(defined($seen1{$temp})){# word is defined in hash table
	$seen1{$temp}++;
    }else{# word is not defined in hash table
    	$seen1{$temp} = 1;
    }

}


foreach $key ( keys(%seen1) ){
    #my @tmp = split('-',$key);	
    #if ($seen1{$key} >= 50 and $key=~/VP/){
    #	print $key,"  ",$seen1{$key};    
    #	print "\n";
    
    #pick certain chunk NP,VP,PP,and ADVP
    if ($seen1{$key} >= 50 and ($key=~/NP|PP|VP/)){
    	print $key,"  ",$seen1{$key};    
    	print "\n";
    }
}