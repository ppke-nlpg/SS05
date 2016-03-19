=========================================================================
Overview of the perl code of the article: 
	Shen and Sarkar, 
	Voting between multiple data representations for text chunking, 2005
=========================================================================

Directory structure of the code:
                           
partial_data/
	/lex-wch-50
	/map_to_each
	/mapping_before_eval

=========================================
1. perl scripts of directory lex-wch-50
=========================================

1. towch.pl creates the lexical forms (wch) above a threshold, its frequency output: train.iob2.c.wch100 
2. train and test data are converted into 5 iob formats, its results (the code of this step is missing, only its output is available): 
	test:
	    test.iob1.set
	    test.iob2.set
		test.ioe1.set
		test.ioe2.set
		test.o+c.set
	train:
		t_iob1_txt
		t_iob2_txt
		t_ioe1_txt
		t_ioe2_txt
		t_o+c_txt


3. process_wch_test.pl creates lexicalised inputs in 5 labelsets
	its inputs:
		frequency file (train.iob2.c.wch100)
		test data with an iob label set (e.g. test.iob2.set)

	output:
		lexicalised train set (e.g. test.iob1.wch100.set)

4. process_wch_train.pl creates lexicalised inputs in 5 labelsets
	its inputs:
		frequency file (train.iob2.c.wch100)
		train data with an iob label set (e.g. t_iob1_txt)

	output:
		lexicalised train set (e.g. t_iob1_wch100.set)

5. tnt: train and tag each iob representation
	e.g.:
	${TNTPATH}tnt-para t_iob1_wch100.set
	${TNTPATH}tnt t_iob1_wch100 test.iob1.wch100.set > test.iob1.wch100.tagged

6. merge_set.test.pl puts iob2 column in each test file for evaluation:
	tnt output looks like this: 
		NNP                     NNP-I-NP
	International+NNP       International+NNP-I-NP
	Corp.+NNP               Corp.+NNP-E-NP
	's+POS                  's+POS-I-NP

		output:
			Rockwell NNP I-NP I-NP
	International NNP I-NP I-NP
	Corp. NNP I-NP I-NP
	's POS B-NP B-NP


	inputs:
		original test data, from conl2k, test.iob2.txt
		no lexicalised test data, e.g. test.iob1.set
		output of tnt, tagged data (test.iob1.wch100.tagged)
	output:
		tagged data with gold column as well (e.g. test.iob1.wch100.merge)

7. these output are evaulated by conlleval.pl

=========================================
2. perl scripts of directory /map_to_each
=========================================
Outputs of the previous step are converted into 5 labelsets
 
 these files are converted into iob1, iob2, ioe1, ioe2, o+c formats, for example:

	perl fromIob2.pl ${DATAPATH}test.iob2.wch100.merge > test.from.iob2.wch100
	perl fromIoe1.pl ${DATAPATH}test.ioe1.wch100.merge > test.from.ioe1.wch100
	perl fromIoe2.pl ${DATAPATH}test.ioe2.wch100.merge > test.from.ioe2.wch100
	perl fromO+c.pl ${DATAPATH}test.o+c.wch100.merge > test.from.o+c.wch100

	perl conlleval.pl < test.from.o+c.wch100 > f-beta.from.o+c.wch100
	perl conlleval.pl < ${DATAPATH}test.iob1.wch100.merge > f-beta.from.iob1.wch100
	perl conlleval.pl < test.from.iob2.wch100 > f-beta.from.iob2.wch100
	perl conlleval.pl < test.from.ioe1.wch100 > f-beta.from.ioe1.wch100
	perl conlleval.pl < test.from.ioe2.wch100 > f-beta.from.ioe2.wch100

and also the voting is done with 3 or 5 of them by tovote3.pl, tovote5.pl
	perl tovote5.pl > test.toIob1.vote.5dr.wch100.merge

=================================================
3. perl scripts of directory /mapping_before_eval
=================================================

/map_merge_5dr_to_iob2_test
converts iob1, ioe1, ioe2, o+c formats to iob2 and evaluates them:
	perl fromiob1.pl test.toIob1.vote.5dr.wch100.merge > test.from.iob1.vote.5dr.wch100
	perl fromioe1.pl test.toIoe1.vote.5dr.wch100.merge > test.from.ioe1.vote.5dr.wch100
	perl fromioe2.pl test.toIoe2.vote.5dr.wch100.merge > test.from.ioe2.vote.5dr.wch100
	perl fromO+c.pl test.toOc.vote.5dr.wch100.merge > test.from.oc.vote.5dr.wch100

	perl conlleval.pl < test.toiob2.vote.5dr.wch100.merge > f-beta.iob2.vote.5dr.wch100
	perl conlleval.pl < test.from.iob1.vote.5dr.wch100 > f-beta.from.iob1.vote.5dr.wch100
	perl conlleval.pl < test.from.ioe1.vote.5dr.wch100 > f-beta.from.ioe1.vote.5dr.wch100
	perl conlleval.pl < test.from.ioe2.vote.5dr.wch100 > f-beta.from.ioe2.vote.5dr.wch100
	perl conlleval.pl < test.from.oc.vote.5dr.wch100 > f-beta.from.oc.vote.5dr.wch100

/map_merge_5dr_to_ioe1_test
converts iob1, iob2, ioe2, o+c formats to ioe1 and evaluates them:
	perl fromiob1.pl test.toIob1.vote.5dr.wch100.merge > test.from.iob1.vote.5dr.wch100
	perl fromiob2.pl test.toIob2.vote.5dr.wch100.merge > test.from.iob2.vote.5dr.wch100
	perl fromIoe2.pl test.toIoe2.vote.5dr.wch100.merge > test.from.ioe2.vote.5dr.wch100
	perl fromO+c.pl test.toOc.vote.5dr.wch100.merge > test.from.oc.vote.5dr.wch100

	perl conlleval.pl < test.toIoe1.vote.5dr.wch100.merge > f-beta.ioe1.vote.5dr.wch100
	perl conlleval.pl < test.from.iob1.vote.5dr.wch100 > f-beta.from.iob1.vote.5dr.wch100
	perl conlleval.pl < test.from.iob2.vote.5dr.wch100 > f-beta.from.iob2.vote.5dr.wch100
	perl conlleval.pl < test.from.ioe2.vote.5dr.wch100 > f-beta.from.ioe2.vote.5dr.wch100
	perl conlleval.pl < test.from.oc.vote.5dr.wch100 > f-beta.from.oc.vote.5dr.wch100

