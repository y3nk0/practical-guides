# Build the practical guides.
#
#   make            build any PDF whose source changed
#   make check      build, then verify the one-pagers still fit on one page
#   make purge      after a push: ask the CDN to refetch the PDFs right away
#   make clean      remove LaTeX build artefacts (the PDFs are kept)
#
# The website (https://y3nk0.github.io/guides/) serves these PDFs from this
# repository through jsDelivr, which refreshes a branch within about 12 hours.
# After pushing a rebuilt PDF, `make purge` makes the CDN pick it up at once.

# Builds are reproducible: the PDF timestamp is pinned (SOURCE_DATE_EPOCH), so
# the same sources always produce byte-identical PDFs - on any machine, and
# after any fresh clone - and git sees no change after a rebuild.
# A file mtime would not do: git does not preserve mtimes, so a checkout alone
# would change every PDF.
SOURCE_DATE_EPOCH ?= 1767225600   # 2026-01-01T00:00:00Z
LATEXMK      ?= latexmk
LATEXMKFLAGS ?= -pdf -interaction=nonstopmode -halt-on-error

PHD       := phd-ml-nlp-starter-guide phd-ml-nlp-onepager phd-ml-nlp-slides
UG        := undergrad-thesis-ml-nlp-guide undergrad-thesis-onepager undergrad-thesis-slides
DOCS      := $(PHD) $(UG)
ONEPAGERS := phd-ml-nlp-onepager undergrad-thesis-onepager
PDFS      := $(addsuffix .pdf,$(DOCS))

.PHONY: all check purge clean help

all: $(PDFS)

%.pdf: %.tex
	@printf 'building %-34s' '$@'
	@export SOURCE_DATE_EPOCH=$(SOURCE_DATE_EPOCH) FORCE_SOURCE_DATE=1; \
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

# jsDelivr caches a branch for about 12 hours; this asks it to refetch now.
# Run it after `git push`, not before: it fetches whatever GitHub serves.
purge:
	@for d in $(DOCS); do \
	  printf 'purging %-34s' "$$d.pdf"; \
	  curl -sf "https://purge.jsdelivr.net/gh/y3nk0/practical_guides@main/$$d.pdf" >/dev/null && echo ok || echo FAILED; \
	done

clean:
	@$(LATEXMK) -c $(addsuffix .tex,$(DOCS)) >/dev/null 2>&1 || true
	@rm -f *.build.log *.nav *.snm *.vrb
	@echo 'cleaned build artefacts'

help:
	@echo 'make          build changed PDFs'
	@echo 'make check    build and verify the one-pagers are one page'
	@echo 'make purge    after a push, ask the CDN to refetch the PDFs'
	@echo 'make clean    remove build artefacts'
