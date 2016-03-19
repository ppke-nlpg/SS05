c:\perl\bin\perl fromIob2.pl test.iob2.wch100.merge > test.from.iob2.wch100
c:\perl\bin\perl fromIoe1.pl test.ioe1.wch100.merge > test.from.ioe1.wch100
c:\perl\bin\perl fromIoe2.pl test.ioe2.wch100.merge > test.from.ioe2.wch100
c:\perl\bin\perl fromO+c.pl test.o+c.wch100.merge > test.from.o+c.wch100


c:\perl\bin\perl conlleval.pl < test.from.o+c.wch100 > f-beta.from.o+c.wch100
c:\perl\bin\perl conlleval.pl < test.iob1.wch100.merge > f-beta.from.iob1.wch100
c:\perl\bin\perl conlleval.pl < test.from.iob2.wch100 > f-beta.from.iob2.wch100
c:\perl\bin\perl conlleval.pl < test.from.ioe1.wch100 > f-beta.from.ioe1.wch100
c:\perl\bin\perl conlleval.pl < test.from.ioe2.wch100 > f-beta.from.ioe2.wch100


c:\perl\bin\perl tovote3.pl > test.toIob1.vote.3dr.wch100.merge
c:\perl\bin\perl conlleval.pl < test.toIob1.vote.3dr.wch100.merge > f-beta.toIob1.vote.3dr.wch100

c:\perl\bin\perl tovote5.pl > test.toIob1.vote.5dr.wch100.merge
c:\perl\bin\perl conlleval.pl < test.toIob1.vote.5dr.wch100.merge > f-beta.toIob1.vote.5dr.wch100