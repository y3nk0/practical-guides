# Build and publish the practical guides.
#
#   make            build any PDF whose source changed
#   make check      build, then verify the one-pagers still fit on one page
#   make publish    check, then copy all six PDFs into the website repository
#   make clean      remove LaTeX build artefacts (the PDFs are kept)
#
# The website is assumed to be a sibling checkout. Override if yours is
# elsewhere:  make publish SITE=/path/to/y3nk0.github.io/files/guides

# Builds are reproducible: the PDF timestamp is taken from the source file's
# mtime (SOURCE_DATE_EPOCH), so rebuilding an unchanged document produces a
# byte-identical PDF and `make publish` only touches what actually changed.
LATEXMK      ?= latexmk
LATEXMKFLAGS ?= -pdf -interaction=nonstopmode -halt-on-error
SITE         ?= ../y3nk0.github.io/files/guides

PHD       := phd-ml-nlp-starter-guide phd-ml-nlp-onepager phd-ml-nlp-slides
UG        := undergrad-thesis-ml-nlp-guide undergrad-thesis-onepager undergrad-thesis-slides
DOCS      := $(PHD) $(UG)
ONEPAGERS := phd-ml-nlp-onepager undergrad-thesis-onepager
PDFS      := $(addsuffix .pdf,$(DOCS))

.PHONY: all check publish clean help

all: $(PDFS)

%.pdf: %.tex
	@printf 'building %-34s' '$@'
	@SOURCE_DATE_EPOCH=$$(date -r $< +%s); export SOURCE_DATE_EPOCH; \
	export FORCE_SOURCE_DATE=1; \
	$(LATEXMK) $(LATEXMKFLAGS) $< >$*.build.log 2>&1 || { echo FAILED; tail -40 $*.build.log; exit 1; }
	@grep -oE '\([0-9]+ pages?' $*.log | tail -1 | tr -d '(' || echo 'up to date'

# A one-pager that has silently grown to two pages is the regression that keeps
# happening: both are tuned to fill exactly one A4 page. Only horizontal
# overflow is reported - the one-pagers overflow vertically by design.
check: all
	@for d in $(DOCS); do [ -f $$d.log ] || $(MAKE) -s -B $$d.pdf >/dev/null; done
	@status=0; \
	for d in $(ONEPAGERS); do \
	  pages=$$(grep -oE 'Output written on [^ ]+ \([0-9]+ page' $$d.log | tail -1 | grep -oE '[0-9]+'); \
	  if [ "$$pages" = "1" ]; then \
	    echo "ok    $$d fits on one page"; \
	  else \
	    echo "FAIL  $$d is $$pages pages - lower its base font size a notch and rebuild"; \
	    status=1; \
	  fi; \
	done; \
	for d in $(DOCS); do \
	  n=$$(grep -c 'Overfull .hbox' $$d.log || true); \
	  [ "$$n" = "0" ] || echo "warn  $$d has $$n line(s) past the margin"; \
	done; \
	exit $$status

publish: check
	@test -d "$(SITE)" || { \
	  echo "site directory not found: $(SITE)"; \
	  echo "pass it explicitly: make publish SITE=/path/to/y3nk0.github.io/files/guides"; \
	  exit 1; }
	@cp $(PDFS) "$(SITE)/"
	@echo "copied $(words $(PDFS)) PDFs to $(SITE)"
	@echo "next: commit and push the website repository"

clean:
	@$(LATEXMK) -c $(addsuffix .tex,$(DOCS)) >/dev/null 2>&1 || true
	@rm -f *.build.log *.nav *.snm *.vrb
	@echo 'cleaned build artefacts'

help:
	@echo 'make          build changed PDFs'
	@echo 'make check    build and verify the one-pagers are one page'
	@echo 'make publish  check, then copy the PDFs into $(SITE)'
	@echo 'make clean    remove build artefacts'
