# LaTeX Templates: Academic and Professional Classes

This repository provides three robust LaTeX classes for academic and professional writing:

- **`homework.cls`** — Feature-rich homework class: automatic problem/sub-problem numbering, aligned math, example boxes, code/terminal blocks, graphics, block diagrams, appendices.
- **`capstone_report.cls`** — Standardized weekly/biweekly capstone progress reports: consistent headers, section helpers, code/figure support, customizable options.
- **`designreport.cls`** — Professional design reports (PDR): title pages, engineering requirements, impact statements, code environments, project management, and more.

## Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Quick Start](#quick-start)
- [Guides](#guides)
- [Building Documents](#building-documents)
- [Contributing](#contributing)
- [Troubleshooting](#troubleshooting)

## Overview

These LaTeX classes and templates help you write clean homework solutions, consistent capstone progress reports, and professional design documents. The homework class includes preloaded TikZ and Blox for block diagrams, extensive math alignment shortcuts (e.g., =, >, <, ≥, ≤, ≠, ≈), and boxed example environments.

## Repository Structure

```
LatexTemplates/
├── docs/               # Documentation for each class
│   ├── homework-guide.md
│   ├── capstone-guide.md
│   ├── designreport-guide.md
│   └── examples.md
├── templates/          # Starter templates
│   ├── homework_template.tex
│   ├── capstone_template.tex
│   └── designreport_template.tex
├── examples/           # Full working examples and test files
│   ├── homeworktest.tex
│   ├── capstonereporttest.tex
│   ├── designreporttest.tex
│   ├── create_diagram.tex
│   └── references.bib
├── figures/            # Place your figures here for design reports
├── homework.cls        # Homework LaTeX class
├── capstone_report.cls # Capstone report LaTeX class
└── designreport.cls    # Design report LaTeX class
```

## Quick Start

### Homework

```latex
\documentclass{homework}
\begin{document}
\hwheader{EE571}{3}{2025-09-01}{Jane Smith}
\problem{Design a PID controller}
% ...
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

## Guides

Comprehensive documentation for each class:

- **Homework**: [docs/homework-guide.md](docs/homework-guide.md) — Complete reference for all homework class commands and environments
- **Capstone Report**: [docs/capstone-guide.md](docs/capstone-guide.md) — Full guide to progress report formatting and sections
- **Design Report**: [docs/designreport-guide.md](docs/designreport-guide.md) — Detailed documentation for design reports with all features
- **Examples**: [docs/examples.md](docs/examples.md) — Usage patterns and code snippets

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
