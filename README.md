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
| 📘 | [`phd-ml-nlp-starter-guide.pdf`](phd-ml-nlp-starter-guide.pdf) | 18 pages, A4 | The full guide — read it through in week one |
| 📄 | [`phd-ml-nlp-onepager.pdf`](phd-ml-nlp-onepager.pdf) | 1 page, 3 columns | Print it and pin it above the desk |
| 🖥️ | [`phd-ml-nlp-slides.pdf`](phd-ml-nlp-slides.pdf) | 42 slides, 16:9 | A lab induction talk or a first-year seminar |

### What they cover

- **The publication landscape** — ML venues (NeurIPS, ICML, ICLR, AISTATS,
  AAAI, IJCAI, COLM …), NLP venues (ACL, EMNLP, NAACL/EACL/AACL, COLING/LREC,
  TACL, Findings …), adjacent venues and journals, how the ACL Rolling Review
  submit-then-commit cycle actually works, and how to judge a venue
  (Scholar h5, CORE, CSRankings) — plus how to spot a predatory one.
- **Deadlines** — the two countdown boards worth bookmarking, the AoE trap, and
  a calendar workflow that backward-plans from camera-ready.
- **Writing and sharing** — Overleaf, Prism, a local `git` + `latexmk`
  workflow, one-sentence-per-line diffs, `arxiv-latex-cleaner`, anonymity
  periods, and releasing code and checkpoints.
- **Zotero** — the connector, Better BibTeX with pinned keys and auto-export
  into your paper repo, group libraries, and the habits that keep a library
  trustworthy.
- **A focused survey as the first project** — a 10-step protocol, inclusion
  criteria, forward and backward snowballing, an extraction schema, and
  finishing with three gaps stated as testable questions.
- **Searching the literature** — Google Scholar as an instrument (operators,
  *search within citing articles*, alerts, profile), plus Semantic Scholar,
  OpenAlex, the ACL Anthology, OpenReview, DBLP and Connected Papers.
- **Reading the signals** — citation *velocity* over volume, and what GitHub
  stars, commit history, issues and licences really tell you about a baseline.
- **Setting up an AI assistant** — project memory, MCP connectors, saved
  prompts, and five non-negotiable guardrails (starting with: never cite a
  paper you have not opened).
- **Your personal site** — GitHub Pages plus the AcademicPages template, step
  by step, with <https://y3nk0.github.io> as a worked example.
- **Infrastructure and habits** — reproducible experiments, seeds and variance,
  experiment tracking, the weekly advisor meeting, and checklists for week 1,
  month 1, months 2–3 and year 1.

### Key links from the guides

- AI conference deadlines: <https://paperswithcode.co/ai-deadlines> and
  <http://aideadlines.org/?sub=ML,CV,NLP>
- Zotero <https://www.zotero.org> · Better BibTeX
  <https://retorque.re/zotero-better-bibtex/>
- Overleaf <https://www.overleaf.com> · Prism <https://prism.openai.com>
- ACL Anthology <https://aclanthology.org> · OpenReview
  <https://openreview.net> · DBLP <https://dblp.org>
- AcademicPages <https://github.com/academicpages/academicpages.github.io>

---

## Doing an Undergraduate Thesis in Machine Learning or NLP

A guide for final-year students, written to be handed out at the first
supervision meeting.

| | File | Format |
|---|---|---|
| 🎓 | [`undergrad-thesis-ml-nlp-guide.pdf`](undergrad-thesis-ml-nlp-guide.pdf) | 14 pages, A4 |

### What it covers

- **What a thesis is and is not** — what examiners actually look for, and a
  three-question test for whether your scope is realistic.
- **Finding a topic by three routes** — a **shared task or challenge**
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
  tracking, data licensing and GDPR.
- **Using an AI assistant honestly** — five rules, starting with the one that
  decides the defence: you must be able to explain every line you submit.
- **Doing the work** — baselines first, the mistakes that cost marks (test-set
  leakage, one seed, unfair comparisons), and why negative results are results.
- **Writing and defending** — a chapter-by-chapter structure with sizes,
  writing advice, likely defence questions, a six-month timetable, and
  checklists for week 1, before freezing results, and before submission.

---

## Building

Needs a TeX distribution (TeX Live, MacTeX or TinyTeX) with `latexmk`.
The deck uses `beamer` and `tikz`; everything else is standard.

```bash
latexmk -pdf phd-ml-nlp-starter-guide.tex
latexmk -pdf phd-ml-nlp-onepager.tex
latexmk -pdf phd-ml-nlp-slides.tex
latexmk -pdf undergrad-thesis-ml-nlp-guide.tex
```

Clean up intermediates with `latexmk -c`.

> **Note on the one-pager:** it is tuned to fill exactly one A4 page. If you add
> material, drop the base font size in `phd-ml-nlp-onepager.tex`
> (`\fontsize{6.75}{7.9}`) by a tenth of a point or two and recompile.

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
