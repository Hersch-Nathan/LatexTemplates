# LaTeX Templates: Homework and Capstone Classes

Two LaTeX classes for coursework:

- `homework.cls` — Feature-rich homework class (problems, sub-problems, aligned math with comparison operators, example boxes, code blocks, terminal output, graphics, block diagrams, appendices).
- `capstone_report.cls` — Weekly/biweekly capstone progress reports with consistent headers, sections, figures, and listings.

## Table of Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [Guides](#guides)
- [Examples](#examples)
- [Repo Files](#repo-files)
- [Adding a New Class](#adding-a-new-class)

## Overview

This repository provides polished LaTeX classes and minimal templates to help you write clean homework solutions and consistent capstone progress reports. The homework class includes preloaded tikz and blox packages for creating block diagrams, math alignment shortcuts for comparison operators, and boxed example environments.

## Quick Start

Homework (uses implemented commands):
```latex
\documentclass{homework}
\begin{document}
\hwheader{EE571}{3}{2025-09-01}{Jane Smith}
\problem{Design a PID controller}
% ...
\end{document}
```

Capstone report:
```latex
\documentclass[titlecase]{capstone_report}
\begin{document}
% \progressreport{report#}{name}{team}{team#}{start}{end}[course]
\progressreport{01}{First Last}{Project/Team}{12}{Sep 1, 2025}{Sep 14, 2025}[Course Name]
\makeheader
\reportIntroduction
% ... other sections ...
\end{document}
```

## Guides

- Homework: see [docs/homework-guide.md](docs/homework-guide.md)
- Capstone report: see [docs/capstone-guide.md](docs/capstone-guide.md)

## Examples

- Usage patterns and snippets: [docs/examples.md](docs/examples.md)
- Starter templates in repo root: `homework_template.tex`, `capstone_template.tex`
- Full demos: `homeworktest.tex`, `capstonereporttest.tex`

## Build

To compile any `.tex` file in this repo:

```bash
latexmk -pdf filename.tex
```

For continuous compilation (rebuilds on file changes):

```bash
latexmk -pdf -pvc filename.tex
```

Clean build artifacts:

```bash
latexmk -c
```

## Repo Files

- `homework.cls` — Homework class
- `capstone_report.cls` — Capstone report class
- Templates and example .tex files

Contributions welcome. Please update docs alongside any changes.

## Adding a New Class

If you want to add another LaTeX class (for example, a lab report class), follow this pattern so the repo stays consistent and discoverable.

1) Create the class file
- Add a `your_class_name.cls` at the repo root.
- Include metadata with `\ProvidesClass{your_class_name}[YYYY/MM/DD vX.Y Description]`.
- Implement user-facing commands with `xparse` (e.g., `\NewDocumentCommand{...}{...}{...}`) and keep options documented in comments.

2) Provide docs in `docs/`
- Create `docs/your-class-guide.md` with:
	- Quick Start snippet (`\documentclass{your_class_name}` … minimal compile-able example)
	- Options and defaults (e.g., `uppercase|titlecase`)
	- Public commands and environments (syntax, purpose, short examples)
	- Figures/listings helpers if any
	- Troubleshooting section for common LaTeX errors

3) Add templates and tests at the repo root
- Minimal template: `your_class_template.tex` showing only the essential flow (metadata + a couple of sections/environments).
- Full demo: `yourclasstest.tex` that exercises all features (sections, figures, code listings, special options). Keep it compile-ready.

4) Update README and examples
- Add a bullet in README under “Repo Files” for the new class.
- Link the guide from the README “Guides” section.
- Optionally add a snippet in `docs/examples.md` if there’s reusable patterns.

5) Keep docs in sync
- When you change public behavior in the class, update both `docs/your-class-guide.md` and the template/test files in the same PR.
- Run a quick compile to ensure templates/demos still build cleanly.
