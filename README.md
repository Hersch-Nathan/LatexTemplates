# LaTeX Templates: Academic and Professional Classes

This repository provides five robust LaTeX classes for academic and professional writing:

- **`coursenotes.cls`** — Comprehensive course notes class: chapter organization, embedded problems with inline solutions, aligned math, code environments, block diagrams, lecture/textbook references, automatic TOC/LOF/LOT generation.
- **`homework.cls`** — Feature-rich homework class: automatic problem/sub-problem numbering (with standard and part-based modes), aligned math, example boxes, code/terminal blocks, graphics, block diagrams, appendices.
- **`capstone_report.cls`** — Standardized weekly/biweekly capstone progress reports: consistent headers, section helpers, code/figure support, customizable options.
- **`designreport.cls`** — Professional design reports: title pages, engineering requirements, sub-project management, code environments, and comprehensive documentation features.
- **`playscript.cls`** — Theatrical playscripts: title pages, character lists, act/scene structure, dialogue formatting, stage directions, parentheticals, professional theatrical typography.

## Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Quick Start](#quick-start)
- [Guides](#guides)
- [Building Documents](#building-documents)
- [Contributing](#contributing)
- [Troubleshooting](#troubleshooting)

## Overview

These LaTeX classes and templates help you create comprehensive course notes for studying, write clean homework solutions, produce consistent capstone progress reports, generate professional design documents, and format theatrical playscripts. The course notes and homework classes include preloaded TikZ and Blox for block diagrams, extensive math alignment shortcuts (e.g., =, >, <, ≥, ≤, ≠, ≈), and boxed example environments.

## Repository Structure

```
LatexTemplates/
├── docs/                    # Documentation for each class
│   ├── coursenotes-guide.md
│   ├── homework-guide.md
│   ├── capstone-guide.md
│   ├── designreport-guide.md
│   ├── playscript-guide.md
│   ├── examples.md
│   └── requirements/        # System requirements for each class
│       ├── coursenotes-requirements.md
│       ├── homework-requirements.md
│       ├── capstone-requirements.md
│       ├── designreport-requirements.md
│       └── playscript-requirements.md
├── templates/               # Starter templates
│   ├── coursenotes_template.tex
│   ├── homework_template.tex
│   ├── homework_partnumbering_template.tex
│   ├── capstone_template.tex
│   ├── designreport_template.tex
│   └── playscript_template.tex
├── examples/                # Full working examples and test files
│   ├── coursenotestest.tex
│   ├── homeworktest.tex
│   ├── homeworktest_partnumbering.tex
│   ├── capstonereporttest.tex
│   ├── designreporttest.tex
│   ├── playscripttest.tex
│   ├── create_diagram.tex
│   └── references.bib
├── figures/                 # Place your figures here for design reports
├── coursenotes.cls          # Course notes LaTeX class
├── homework.cls             # Homework LaTeX class
├── capstone_report.cls      # Capstone report LaTeX class
├── designreport.cls         # Design report LaTeX class
├── playscript.cls           # Playscript LaTeX class
└── .gitignore              # Excludes LaTeX auxiliary files
```

## Quick Start

### Course Notes

```latex
\documentclass{coursenotes}
\begin{document}
\courseheader{EE 571}{Control Systems}{Fall 2025}{Your Name}
\makealllists  % Generate TOC, LOF, LOT

\chapter{Time Domain Analysis}
\section{First-Order Systems}
% Lecture content with math, code, diagrams...

\problem{System Response}
\subproblem{Calculate the time constant.}
\begin{solution}
The time constant is $\tau = 0.1$ seconds.
\end{solution}
\end{document}
```

### Homework (Standard Mode)

```latex
\documentclass{homework}
\begin{document}
\hwheader{EE571}{3}{2025-09-01}{Jane Smith}
\problem{Design a PID controller}
% ...
\end{document}
```

### Homework (Part Numbering Mode)

```latex
\documentclass[partnumbering]{homework}
\begin{document}
\hwheader{EE599/699}{1}{Fall 2025}{Jane Smith}

\hwpart{Shallow Networks \& Expressive Power}

\problem{General Shallow Network Analysis}
% Problems numbered as 1.1, 1.2, etc.

\subproblem{Parameter Count}
% Subproblems formatted as A., B., etc. with title text inline

\hwpart{Deep Networks}

\problem{Depth vs Width}
% Numbered as 2.1, 2.2, etc.
\end{document}
```

### Capstone Report

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

### Design Report (PDR)

```latex
\documentclass[final]{designreport}
\addbibresource{references.bib}
\documentname{Preliminary Design Report}
\teamname{Team 8 - PlayPal}
\university{University of Kentucky}
\teammembers{\teammember{John Smith}{john@uky.edu}}
\begin{document}
\maketitle
\makefrontmatter
% ... sections with engineering requirements, impact statements ...
\end{document}
```

### Playscript

```latex
\documentclass{playscript}
\title{Hamlet}
\author{William Shakespeare}
\begin{document}
\maketitle
\begin{characters}
\character{HAMLET}
\character{OPHELIA}
\end{characters}
\act{I}
\scene{Elsinore Castle}
\speaker{HAMLET}
\dialogue{To be, or not to be, that is the question.}
\end{document}
```

## Guides

Comprehensive documentation for each class:

- **Course Notes**: [docs/coursenotes-guide.md](docs/coursenotes-guide.md) — Complete guide for semester-long course notes with embedded problems and solutions
- **Homework**: [docs/homework-guide.md](docs/homework-guide.md) — Complete reference for all homework class commands and environments
- **Capstone Report**: [docs/capstone-guide.md](docs/capstone-guide.md) — Full guide to progress report formatting and sections
- **Design Report**: [docs/designreport-guide.md](docs/designreport-guide.md) — Detailed documentation for design reports with all features
- **Playscript**: [docs/playscript-guide.md](docs/playscript-guide.md) — Complete guide to theatrical playscript formatting
- **Examples**: [docs/examples.md](docs/examples.md) — Usage patterns and code snippets
- **Requirements**: [docs/requirements/](docs/requirements/) — System requirements, package dependencies, and compatibility information for each class

## Building Documents

To use these templates in your own documents:

1. **Copy the class file** (e.g., `homework.cls`) to your project directory
2. **Copy a starter template** from `templates/` (e.g., `homework_template.tex`) as a starting point
3. **For design reports**: Place figures in a `figures/` subdirectory
4. **Compile with LaTeX**:

```bash
# Basic compilation
pdflatex yourdocument.tex

# Using latexmk (recommended)
latexmk -pdf yourdocument.tex

# Continuous compilation (rebuilds on file changes)
latexmk -pdf -pvc yourdocument.tex

# With bibliography (for design reports)
latexmk -pdf yourdocument.tex
```

To clean build artifacts:

```bash
latexmk -c
```

## Contributing

Contributions welcome! When adding features:

1. Update the relevant class file in the root directory
2. Update the corresponding guide in `docs/`
3. Add examples to `examples/` if demonstrating new features
4. Test compilation to ensure everything works
5. Update this README if adding new classes or major features

## Adding a New Class

If you want to add another LaTeX class (for example, a lab report class), follow this pattern so the repo stays consistent and discoverable:

1. **Create the class file**
   - Add a `your_class_name.cls` at the repo root.
   - Include metadata with `\ProvidesClass{your_class_name}[YYYY/MM/DD vX.Y Description]`.
   - Implement user-facing commands with `xparse` (e.g., `\NewDocumentCommand{...}{...}{...}`) and keep options documented in comments.
2. **Provide docs in `docs/`**
   - Create `docs/your-class-guide.md` with:
     - Quick Start snippet (`\documentclass{your_class_name}` … minimal compile-able example)
     - Options and defaults (e.g., `uppercase|titlecase`)
     - Public commands and environments (syntax, purpose, short examples)
     - Figures/listings helpers if any
     - Troubleshooting section for common LaTeX errors
3. **Add templates and tests at the repo root**
   - Minimal template: `your_class_template.tex` showing only the essential flow (metadata + a couple of sections/environments).
   - Full demo: `yourclasstest.tex` that exercises all features (sections, figures, code listings, special options). Keep it compile-ready.
4. **Update README and examples**
   - Add a bullet in README under “Repo Files” for the new class.
   - Link the guide from the README “Guides” section.
   - Optionally add a snippet in `docs/examples.md` if there’s reusable patterns.
5. **Keep docs in sync**
   - When you change public behavior in the class, update both `docs/your-class-guide.md` and the template/test files in the same PR.
   - Run a quick compile to ensure templates/demos still build cleanly.

## Troubleshooting

If you encounter issues:

- Ensure all required LaTeX packages are installed (see each guide for details)
- For bibliography issues, check `.bib` file paths and run `biber` if needed
- For figure errors, confirm file paths and extensions
- Run `pdflatex` twice for cross-references
- See each class guide for more troubleshooting tips
