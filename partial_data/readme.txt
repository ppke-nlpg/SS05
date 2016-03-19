Simply Specification
#--------------------------------------------------------------------------------------------
CONTENT:

This folder contain three sections, lex-wch-50, map_to_each and mapping_before_eval,

Section 1: lex-wch-50

	- Pick the words satisfy Lex-WCH >=50 and belong to chunk type NP,VP,PP,ADVP
	- Merge those words into the training and testing data
	- Train the model and test it using TnT
	- Evaluate each data representation format


Section 2: map_to_each
There contains 5 individual data representation, For each data representation, for example, IOB2
	- Convert the test data in different representation into IOB2
	- Evaluate them in format IOB2
	- Do a 3DR and 5DR voting in IOB2 format and evaluate them
	
Section 3: mapping_before_eval
There contains 2 data representaion for 3DR and 5DR voting, For each case, say 5DR in format IOB2
	- Convert each voted results in different format into IOB2 then evaluate each respectively
	
#--------------------------------------------------------------------------------------------
EXECUTION:

1.To run all above program, you will need Perl and TnT installed on your machine

2.Each folder contains a "doall" batch file, you may simply run it to execute the program

3.Some the running path is local, if you can not run the batch file, please open it and change the Perl path

4.Since some perl and data file were generated under Windows, Linux may encouter errors. 
Please convert those files or run it under windows


