c:\perl\bin\perl towch.pl train.iob2.txt > train.iob2.c.wch100

c:\perl\bin\perl process_wch_train.pl iob1_100 > t_iob1_wch100.set
c:\perl\bin\perl process_wch_train.pl iob2_100 > t_iob2_wch100.set
c:\perl\bin\perl process_wch_train.pl ioe1_100 > t_ioe1_wch100.set
c:\perl\bin\perl process_wch_train.pl ioe2_100 > t_ioe2_wch100.set
c:\perl\bin\perl process_wch_train.pl o+c_100 > t_o+c_wch100.set

c:\perl\bin\perl process_wch_test.pl iob1_100 > test.iob1.wch100.set
c:\perl\bin\perl process_wch_test.pl iob2_100 > test.iob2.wch100.set
c:\perl\bin\perl process_wch_test.pl ioe1_100 > test.ioe1.wch100.set
c:\perl\bin\perl process_wch_test.pl ioe2_100 > test.ioe2.wch100.set
c:\perl\bin\perl process_wch_test.pl o+c_100 > test.o+c.wch100.set


tnt-para t_iob1_wch100.set
tnt-para t_iob2_wch100.set
tnt-para t_ioe1_wch100.set
tnt-para t_ioe2_wch100.set
tnt-para t_o+c_wch100.set

tnt t_iob1_wch100 test.iob1.wch100.set > test.iob1.wch100.tagged 
tnt t_iob2_wch100 test.iob2.wch100.set > test.iob2.wch100.tagged
tnt t_ioe1_wch100 test.ioe1.wch100.set > test.ioe1.wch100.tagged 
tnt t_ioe2_wch100 test.ioe2.wch100.set > test.ioe2.wch100.tagged 
tnt t_o+c_wch100 test.o+c.wch100.set > test.o+c.wch100.tagged


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
