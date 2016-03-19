c:\perl\bin\perl fromIoe1.pl test.ioe1.wch100.merge > test.from.ioe1.wch100

c:\perl\bin\perl tovote3.pl > test.toIob2.vote.3dr.wch100.merge
c:\perl\bin\perl conlleval.pl < test.toIob2.vote.3dr.wch100.merge > f-beta.toIob2.vote.3dr.wch100

c:\perl\bin\perl tovote5.pl > test.toIob2.vote.5dr.wch100.merge
c:\perl\bin\perl conlleval.pl < test.toIob2.vote.5dr.wch100.merge > f-beta.toIob2.vote.5dr.wch100