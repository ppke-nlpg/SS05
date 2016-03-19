c:\perl\bin\perl conlleval.pl < test.from.o+c.wch100 > f-beta.from.o+c.wch100
c:\perl\bin\perl conlleval.pl < test.from.iob1.wch100 > f-beta.from.iob1.wch100
c:\perl\bin\perl conlleval.pl < test.from.iob2.wch100 > f-beta.from.iob2.wch100
c:\perl\bin\perl conlleval.pl < test.from.ioe1.wch100 > f-beta.from.ioe1.wch100
c:\perl\bin\perl conlleval.pl < test.ioe2.wch100.merge > f-beta.from.ioe2.wch100


c:\perl\bin\perl tovote3.pl > test.toIoe2.vote.3dr.wch100.merge
c:\perl\bin\perl conlleval.pl < test.toIoe2.vote.3dr.wch100.merge > f-beta.toIoe2.vote.3dr.wch100


c:\perl\bin\perl tovote5.pl > test.toIoe2.vote.5dr.wch100.merge
c:\perl\bin\perl conlleval.pl < test.toIoe2.vote.5dr.wch100.merge > f-beta.toIoe2.vote.5dr.wch100