
CMD_FILES  =$(wildcard *.cmd)
PDF_FILES :=$(patsubst %.cmd, %.pdf, $(CMD_FILES))

OTHER_PDF_FILES :=
TMP_FILE :=

threshold.pdf.dep = threshold.csv
evict-target.pdf.dep = effective-cloc.csv
load-balance.pdf.dep = effective-cloc.csv
ball-test.pdf.dep = effective-cloc.csv
prime-probe-curve.pdf.dep = prime-probe-curve.csv
prime-probe-prefetch-curve.pdf.dep = prime-probe-prefetch-curve.csv
fast-collect-remap.pdf.dep = fast-collect.csv
seqass-collect-remap.pdf.dep = seqass-collect.csv
spec-mpki.pdf.dep = spec-mpki.csv
mcore-power.pdf.dep = mcore-power.csv

default: all

all: $(PDF_FILES) $(OTHER_PDF_FILES)

.PHONY: all

.SECONDEXPANSION:

$(PDF_FILES): %.pdf:%.cmd $$($$@.dep)
	gnuplot -c $^
	pdfcrop $@ $@

clean:
	-rm $(PDF_FILES) $(OTHER_PDF_FILES) $(TMP_FILE)

.PHONY: clean
