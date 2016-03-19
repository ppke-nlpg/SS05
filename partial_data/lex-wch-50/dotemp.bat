c:\perl\bin\perl merge_set.test.pl iob1_wch100 > test.iob1.wch100.merge
c:\perl\bin\perl merge_set.test.pl iob2_wch100 > test.iob2.wch100.merge
c:\perl\bin\perl merge_set.test.pl ioe1_wch100 > test.ioe1.wch100.merge
c:\perl\bin\perl merge_set.test.pl ioe2_wch100 > test.ioe2.wch100.merge
c:\perl\bin\perl merge_set.test.pl o+c_wch100 > test.o+c.wch100.merge


c:\perl\bin\perl conlleval.pl < test.iob1.wch100.merge > f-beta.iob1.wch100
c:\perl\bin\perl conlleval.pl < test.iob2.wch100.merge > f-beta.iob2.wch100
c:\perl\bin\perl conlleval.pl < test.ioe1.wch100.merge > f-beta.ioe1.wch100
c:\perl\bin\perl conlleval.pl < test.ioe2.wch100.merge > f-beta.ioe2.wch100
c:\perl\bin\perl conlleval.pl < test.o+c.wch100.merge > f-beta.o+c.wch100



