dargwa.numerals.analyzer.hfst: dargwa.numerals.generator.hfst
	hfst-invert dargwa.numerals.generator.hfst -o dargwa.numerals.analyzer.hfst
	
dargwa.numerals.generator.hfst: dargwa.numerals.lexd
	lexd dargwa.numerals.lexd | hfst-txt2fst -o dargwa.numerals.generator.hfst
