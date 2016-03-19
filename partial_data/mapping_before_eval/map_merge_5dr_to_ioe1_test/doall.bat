c:\perl\bin\perl fromIob1.pl test.toIob1.vote.5dr.wch100.merge > test.from.iob1.vote.5dr.wch100
c:\perl\bin\perl fromIob2.pl test.toIob2.vote.5dr.wch100.merge > test.from.iob2.vote.5dr.wch100
c:\perl\bin\perl fromIoe2.pl test.toIoe2.vote.5dr.wch100.merge > test.from.ioe2.vote.5dr.wch100
c:\perl\bin\perl fromO+c.pl test.toOc.vote.5dr.wch100.merge > test.from.oc.vote.5dr.wch100

c:\perl\bin\perl conlleval.pl < test.toIoe1.vote.5dr.wch100.merge > f-beta.ioe1.vote.5dr.wch100
c:\perl\bin\perl conlleval.pl < test.from.iob1.vote.5dr.wch100 > f-beta.from.iob1.vote.5dr.wch100
c:\perl\bin\perl conlleval.pl < test.from.iob2.vote.5dr.wch100 > f-beta.from.iob2.vote.5dr.wch100
c:\perl\bin\perl conlleval.pl < test.from.ioe2.vote.5dr.wch100 > f-beta.from.ioe2.vote.5dr.wch100
c:\perl\bin\perl conlleval.pl < test.from.oc.vote.5dr.wch100 > f-beta.from.oc.vote.5dr.wch100
