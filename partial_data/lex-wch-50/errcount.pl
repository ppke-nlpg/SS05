#!/usr/bin/perl

#Count errors for VP
#Input: original trainning data and converted file (eg.: t_iob2_txt)
#Output: frequency table (format: words chunkType frequency)

#!/usr/bin/perl

my $line;


while($line=<>){
    chomp($line);
    my @words = split(' ',$line);		

    next if ($#words <1);

    #if (($words[2] ne $words[3]) and ($words[2]=~/VP/ or $words[3]=~/VP/) and ($words[2]!~/ADVP/ or $words[3]!~/ADVP/)){
    if (($words[2] ne $words[3]) and ($words[2]=~/VP/ or $words[3]=~/VP/)){ 
    	print $line,"\n";
    }

}


