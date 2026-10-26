# Practical guides

Practical, no-nonsense guides for students — written to be handed out,
printed, and worked through rather than read once.

Everything is LaTeX; the compiled PDFs are committed, so you can download a PDF
directly or edit the source and rebuild.

---

## Starting a PhD in Machine Learning or NLP

A starter kit for new PhD students, in three formats that share the same
content at three levels of detail.

| | File | Format | Use it for |
|---|---|---|---|
| 📘 | [`phd/phd-ml-nlp-starter-guide.pdf`](phd/phd-ml-nlp-starter-guide.pdf) | 20 pages, A4 | The full guide — read it through in week one |
| 📄 | [`phd/phd-ml-nlp-onepager.pdf`](phd/phd-ml-nlp-onepager.pdf) | 1 page, 3 columns | Print it and pin it above the desk |
| 🖥️ | [`phd/phd-ml-nlp-slides.pdf`](phd/phd-ml-nlp-slides.pdf) | 46 slides, 16:9 | A lab induction talk or a first-year seminar |

### What they cover

- **The publication landscape** — ML venues (NeurIPS, ICML, ICLR, AISTATS,
  AAAI, IJCAI, COLM …), NLP venues (ACL, EMNLP, NAACL/EACL/AACL, COLING/LREC,
  TACL, Findings …), adjacent venues and journals, how the ACL Rolling Review
  submit-then-commit cycle actually works, and how to judge a venue
  (Scholar h5, CORE, CSRankings) — plus how to spot a predatory one.
- **Deadlines** — the two countdown boards worth bookmarking, the AoE trap, and
  a calendar workflow that backward-plans from camera-ready.
- **Writing and sharing** — Overleaf (now with its own metered AI assistant),
  Prism, a local `git` + `latexmk` workflow, one-sentence-per-line diffs,
  `\citet` vs `\citep`, `latexdiff`, `arxiv-latex-cleaner`, anonymity
  periods, releasing code and checkpoints, and making the code citable with
  `CITATION.cff` and a Zenodo DOI.
- **Zotero** — the connector, Better BibTeX with pinned keys and auto-export
  into your paper repo, group libraries, and the habits that keep a library
  trustworthy. Includes the quickest way to get an entry into your `.bib`
  (Google Scholar's BibTeX links), what to check in it, and cleaner sources —
  the ACL Anthology, DBLP, or any DOI straight from the terminal. Also the
  three BibTeX gotchas (protected capitals, author format, arXiv fields),
  `bibtex-tidy`, Zotero's retraction alerts, and a pre-submission audit that
  checks every DOI resolves.
- **A focused survey as the first project** — a 10-step protocol, inclusion
  criteria, forward and backward snowballing, ASReview for screening large
  piles, an extraction schema, and finishing with three gaps stated as
  testable questions.
- **Searching the literature** — Google Scholar as an instrument (operators,
  *search within citing articles*, alerts, profile), plus Semantic Scholar,
  OpenAlex, the ACL Anthology, OpenReview, DBLP, Connected Papers, Scite and
  Unpaywall, and Scholar Labs for question-level search.
- **Reading the signals** — citation *velocity* over volume, and what GitHub
  stars, commit history, issues and licences really tell you about a baseline.
- **Setting up an AI assistant** — project memory, MCP connectors, saved
  prompts, Google's Deep Review as a free first review of the final PDF, and
  five non-negotiable guardrails (starting with: never cite a paper you have
  not opened).
- **Your personal site** — GitHub Pages plus the AcademicPages template, step
  by step, with <https://y3nk0.github.io> as a worked example.
- **Infrastructure and habits** — reproducible experiments, seeds and variance,
  experiment tracking, the weekly advisor meeting, and checklists for week 1,
  month 1, months 2–3, year 1, and before every submission.

### Key links from the guides

- AI conference deadlines: <https://paperswithcode.co/ai-deadlines> and
  <http://aideadlines.org/?sub=ML,CV,NLP>
- Zotero <https://www.zotero.org> · Better BibTeX
  <https://retorque.re/zotero-better-bibtex/> · bibtex-tidy
  <https://github.com/FlamingTempura/bibtex-tidy>
- Overleaf <https://www.overleaf.com> · Prism <https://prism.openai.com>
- ACL Anthology <https://aclanthology.org> · OpenReview
  <https://openreview.net> · DBLP <https://dblp.org>
- AcademicPages <https://github.com/academicpages/academicpages.github.io>

---

## Doing an Undergraduate Thesis in Machine Learning or NLP

A guide for final-year students, written to be handed out at the first
supervision meeting.

| | File | Format | Use it for |
|---|---|---|---|
| 🎓 | [`undergrad-thesis/undergrad-thesis-ml-nlp-guide.pdf`](undergrad-thesis/undergrad-thesis-ml-nlp-guide.pdf) | 15 pages, A4 | The full guide — hand it out at the first supervision meeting |
| 📄 | [`undergrad-thesis/undergrad-thesis-onepager.pdf`](undergrad-thesis/undergrad-thesis-onepager.pdf) | 1 page, 3 columns | Print it and pin it above the desk |
| 🖥️ | [`undergrad-thesis/undergrad-thesis-slides.pdf`](undergrad-thesis/undergrad-thesis-slides.pdf) | 31 slides, 16:9 | A thesis-kickoff talk for a whole cohort |

### What it covers

- **What a thesis is and is not** — what examiners actually look for, and a
  three-question test for whether your scope is realistic.
- **Finding a topic** — check the supervisor's advertised topics first and do
  a small piece of research before the first meeting; if you are free to
  choose, three routes: a **shared task or challenge**
  (SemEval, workshop tasks at \*ACL venues, WMT, CoNLL, BabyLM, CLEF labs,
  TREC tracks, Kaggle and the competition platforms), an **application thesis**
  (a working method taken carefully to a new language, domain or deployment
  constraint), or an **analysis / theoretical thesis** (reproduction, ablation,
  robustness, probing, efficiency, or a critique of the metric itself).
- **Six places where gaps are written down explicitly** — limitations sections,
  future work, survey taxonomies, workshop calls for papers, task overview
  papers, and leaderboards that have plateaued.
- **The one-page proposal** to agree with your supervisor before writing code.
- **The toolkit** — Zotero, LaTeX and Overleaf, git, free GPUs, experiment
  tracking, data licensing and GDPR — plus the quickest way to get a reference
  into your `.bib`, how to check it, `bibtex-tidy`, Unpaywall, the right
  citation commands, and Scholar Labs for question-level search.
- **Using an AI assistant honestly** — five rules, starting with the one that
  decides the defence: you must be able to explain every line you submit, plus
  Google's Deep Review as a free first review of the draft.
- **Doing the work** — baselines first, the mistakes that cost marks (test-set
  leakage, one seed, unfair comparisons), and why negative results are results.
- **Writing and defending** — a chapter-by-chapter structure with sizes,
  writing advice, likely defence questions, a six-month timetable, and
  checklists for week 1, before freezing results, and before submission.

---

## Layout

```
phd/                 the PhD starter kit: full guide, one-pager, slides
undergrad-thesis/    the thesis guide: full guide, one-pager, slides
```

Each directory holds the `.tex` sources and the built PDFs side by side.

## Building

Needs a TeX distribution (TeX Live, MacTeX or TinyTeX) with `latexmk`.
The deck uses `beamer` and `tikz`; everything else is standard.

```bash
make            # build any PDF whose source changed
make check      # build, then verify the one-pagers still fit on one page
make purge      # after a push: ask the CDN to refetch the PDFs right away
make clean      # remove build artefacts (the PDFs are kept)
```

`make check` fails if a one-pager has grown to two pages, and warns about any
line that runs past the margin. The website at <https://y3nk0.github.io/guides/>
serves these PDFs from this repository through [jsDelivr](https://www.jsdelivr.com),
which refreshes a branch within about 12 hours; after pushing a rebuilt PDF, run
`make purge` to make it pick up the new build at once.

Builds are reproducible — the PDF timestamp is pinned (`SOURCE_DATE_EPOCH` in
the Makefile), so the same sources give byte-identical PDFs on any machine and
after any fresh clone, and git sees no change after a rebuild.

To build a single document by hand: `latexmk -cd -pdf phd/<file>.tex`.

> **Note on the one-pagers:** both are tuned to fill exactly one A4 page. If you
> add material, drop the base font size at the top of the document body
> (`\fontsize{6.35}{7.45}` for the PhD sheet, `\fontsize{6.05}{7.15}` for the
> thesis sheet) by a tenth of a point or two and recompile.

---

## Author

**Konstantinos Skianis** — Assistant Professor of Natural Language Processing,
Department of Computer Science and Engineering, University of Ioannina
· <https://y3nk0.github.io>

Corrections and additions are welcome — venues, deadlines and tools move fast,
so open an issue or a pull request if something here has gone stale.

## A note on how these were written

The content, structure and editorial decisions in these guides are mine. I
wrote them with the help of an AI assistant (Claude), working under my
specific directions — drafting from my outlines, typesetting the LaTeX, and
checking that links and references resolve. I reviewed and edited everything
that appears here, and any errors are my own.
