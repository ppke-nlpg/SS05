c:\perl\bin\perl fromIob1.pl test.toIob1.vote.3dr.wch100.merge > test.from.iob1.vote.3dr.wch100
c:\perl\bin\perl fromIoe1.pl test.toIoe1.vote.3dr.wch100.merge > test.from.ioe1.vote.3dr.wch100
c:\perl\bin\perl fromIoe2.pl test.toIoe2.vote.3dr.wch100.merge > test.from.ioe2.vote.3dr.wch100
c:\perl\bin\perl fromO+c.pl test.toOc.vote.3dr.wch100.merge > test.from.oc.vote.3dr.wch100

c:\perl\bin\perl conlleval.pl < test.toiob2.vote.3dr.wch100.merge > f-beta.iob2.vote.3dr.wch100
c:\perl\bin\perl conlleval.pl < test.from.iob1.vote.3dr.wch100 > f-beta.from.iob1.vote.3dr.wch100
c:\perl\bin\perl conlleval.pl < test.from.ioe1.vote.3dr.wch100 > f-beta.from.ioe1.vote.3dr.wch100
c:\perl\bin\perl conlleval.pl < test.from.ioe2.vote.3dr.wch100 > f-beta.from.ioe2.vote.3dr.wch100
c:\perl\bin\perl conlleval.pl < test.from.oc.vote.3dr.wch100 > f-beta.from.oc.vote.3dr.wch100
