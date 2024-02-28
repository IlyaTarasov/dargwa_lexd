dargwa.numerals.analyzer.hfst: dargwa.numerals.generator.hfst
	hfst-invert dargwa.numerals.generator.hfst -o dargwa.numerals.analyzer.hfst

dargwa.numerals.generator.hfst: dargwa.numerals.lexd.hfst dargwa.numerals.twol.hfst 	
	hfst-compose-intersect dargwa.numerals.lexd.hfst dargwa.numerals.twol.hfst -o dargwa.numerals.generator.hfst

dargwa.numerals.twol.hfst: dargwa.numerals.twol
	hfst-twolc dargwa.numerals.twol -o dargwa.numerals.twol.hfst
	
dargwa.numerals.lexd.hfst: dargwa.numerals.lexd	
	lexd dargwa.numerals.lexd | hfst-txt2fst -o dargwa.numerals.lexd.hfst
