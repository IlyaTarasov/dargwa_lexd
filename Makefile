test.pass.txt: dargwa_tests.csv
	awk -F, '$$3 == "pass" {print $$1 ":" $$2}' $^ | sort -u > $@
check: dargwa.generator.hfst test.pass.txt
	bash compare.sh $< test.pass.txt

dargwa.analyzer.hfstol: dargwa.analyzer.hfst
	hfst-fst2fst -O -i dargwa.analyzer.hfst -o dargwa.analyzer.hfstol

dargwa.analyzer.hfst: dargwa.generator.hfst
	hfst-invert dargwa.generator.hfst -o dargwa.analyzer.hfst

dargwa.generator.hfst: dargwa.lexd.hfst dargwa.twol.hfst 	
	hfst-compose-intersect dargwa.lexd.hfst dargwa.twol.hfst -o dargwa.generator.hfst

dargwa.twol.hfst: dargwa.twol
	hfst-twolc dargwa.twol -o dargwa.twol.hfst
	
dargwa.lexd.hfst: dargwa.lexd	
	lexd dargwa.lexd | hfst-txt2fst -o dargwa.lexd.hfst
	
	
	
	
	

