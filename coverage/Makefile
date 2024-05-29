analyser=dargwa.analyzer.hfstol
.PHONY: check-coverage

check-coverage-stats: corpus $(analyser) stats
	@ cd corpus; find * -name "*.txt" -print0 | xargs -0 ../stats ../$(analyser)
	
check-unrecog: corpus $(analyser) unrecog
	@ find corpus; find * -name "*.txt" -print0 | xargs -0 ./unrecog $(analyser) > unrecog.txt
	@ find corpus -name "magomedova_clean.txt" -print0 | xargs -0 ./unrecog $(analyser) > unrecog_magomedova.txt
	@ find corpus -name "Сельская_жизнь.txt" -print0 | xargs -0 ./unrecog $(analyser) > unrecog_Сельская_жизнь.txt
	@ find corpus -name "standard_dargwa_corpus.txt" -print0 | xargs -0 ./unrecog $(analyser) > unrecog_standard_dargwa_corpus.txt

check-recog: corpus $(analyser) recog
	@ find corpus -name "*.txt" -print0 | xargs -0 ./recog $(analyser) > recog.txt
	@ find corpus -name "magomedova_clean.txt" -print0 | xargs -0 ./recog $(analyser) > recog_magomedova.txt
	@ find corpus -name "Сельская_жизнь.txt" -print0 | xargs -0 ./recog $(analyser) > recog_Сельская_жизнь.txt
	@ find corpus -name "standard_dargwa_corpus.txt" -print0 | xargs -0 ./recog $(analyser) > recog_standard_dargwa_corpus.txt

check-coverage: corpus $(analyser) stats unrecog
	@ echo aggregate coverage:
	@ (make -s check-coverage-stats; find corpus -name "*.txt" -exec cat {} \; | ./stats -q $(analyser) -) | column -t
	@ echo
	@ echo unrecognised words:
	@ make -s check-coverage-unrecog | tail -n20

%.hfstol: %.hfst
	echo '?::0' | hfst-regexp2fst | hfst-repeat | hfst-compose -F $< - | hfst-minimise -E | hfst-fst2fst -w -o $@
