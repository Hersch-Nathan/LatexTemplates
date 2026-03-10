# LaTeX Templates

Reusable LaTeX classes for coursework, reports, and scripts.

## Included classes

- `coursenotes.cls`: Chapter-based notes with embedded problems and solutions.
- `homework.cls`: Assignment layout with standard and `partnumbering` modes.
- `capstone_report.cls`: Periodic progress report format.
- `designreport.cls`: Engineering design report format.
- `playscript.cls`: Theatrical script format.

Shared foundations:

- `hwcoursebase.sty` for `homework.cls` and `coursenotes.cls`
- `reportbase.cls` for `designreport.cls`

## Start here

- Starters: `templates/*.tex`
- Full demos: `examples/*.tex`
- Usage reference: `docs/examples.md`

Recommended first files:

- `templates/coursenotes_template.tex`
- `templates/homework_template.tex`
- `templates/homework_partnumbering_template.tex`
- `templates/capstone_template.tex`
- `templates/designreport_template.tex`
- `templates/playscript_template.tex`

## Build

```bash
pdflatex yourdocument.tex
```

Recommended:

```bash
latexmk -pdf yourdocument.tex
```

If compiling from `examples/` or `templates/`, include parent search path:

```bash
TEXINPUTS="..:$TEXINPUTS" latexmk -pdf homeworktest.tex
```

Generated non-PDF artifacts are ignored by `.gitignore`.
Rendered PDFs in `examples/` and `templates/` are intentionally tracked for preview/reference.

## Source provenance

Some templates may be adapted from external sources.
Every non-original addition must be documented in `docs/SOURCES.md` with source link, license, date added, and modification notes.

## External template bundles

This repository includes third-party template bundles that are **not my original work** and are kept here to make my workflow easier.

- `llncs/` - Springer LNCS template bundle
- `ieeetran/` - IEEEtran template bundle

Use of files in these folders is subject to their upstream terms/licenses.
See `docs/SOURCES.md` for source URLs and licensing notes.

**Why This Is Needed:**

The template system uses a centralized architecture where shared `.sty` and `.cls` files are in the root directory. When LaTeX tries to compile from a subdirectory, it needs `TEXINPUTS` to know where to search for these dependency files.

**Alternative: Direct Compilation from Root**

You can also compile directly from the root directory without setting `TEXINPUTS`:

```bash
pdflatex examples/homeworktest.tex
```

This works because LaTeX naturally searches the working directory and its subdirectories.

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
