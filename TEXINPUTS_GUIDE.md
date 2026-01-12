# LaTeX File Path Resolution Guide

## Quick Start

When compiling your LaTeX documents from the `examples/` or `templates/` subdirectories, you need to tell LaTeX where to find the shared `.sty` and `.cls` files in the parent directory.

### On macOS / Linux:

```bash
cd examples/
TEXINPUTS="..:$TEXINPUTS" pdflatex homeworktest.tex
```

### In Your Editor (VS Code):

Add the environment variable to your build task in `.vscode/tasks.json`:

```json
{
  "label": "Build LaTeX (with parent search path)",
  "type": "shell",
  "command": "pdflatex",
  "args": ["-interaction=nonstopmode", "${file}"],
  "options": {
    "env": {
      "TEXINPUTS": "..:${env:TEXINPUTS}"
    }
  }
}
```

## What This Does

- `TEXINPUTS="..:$TEXINPUTS"` tells LaTeX to search for packages and classes in:
  1. The current directory (`.`)
  2. The parent directory (`..`)
  3. All standard LaTeX directories (`$TEXINPUTS` - your system's defaults)

## Why This Is Needed

The refactored template system uses a centralized architecture:

```
LatexTemplates/
├── hwcoursebase.sty      ← Shared package
├── reportbase.cls        ← Shared base class
├── homework.cls
├── coursenotes.cls
├── designreport.cls
├── examples/
│   ├── homeworktest.tex  ← Needs to find parent .sty/.cls files
│   ├── coursenotestest.tex
│   └── ...
└── templates/
    ├── homework_template.tex
    ├── coursenotes_template.tex
    └── ...
```

When you run `pdflatex` from `examples/`:
- `\documentclass{../homework}` finds `homework.cls` in parent ✅
- `homework.cls` does `\RequirePackage{hwcoursebase}` but LaTeX needs to know where to look ➜ **TEXINPUTS**

## Alternative: Direct Compilation from Root

You can also compile directly from the root directory:

```bash
pdflatex examples/homeworktest.tex
```

This works without TEXINPUTS because LaTeX naturally searches the working directory and subdirectories.

## For TeX Distributions Other Than TeX Live

If you're using MiKTeX or MacTeX with a different setup, you can alternatively:

1. **Copy the base files temporarily:**
   ```bash
   cp *.sty examples/
   cp *.cls examples/
   # ... compile ...
   # Clean up
   rm examples/*.sty examples/*.cls
   ```

2. **Install to your texmf directory** (permanent, requires system setup):
   ```bash
   cp hwcoursebase.sty ~/Library/texmf/tex/latex/
   cp reportbase.cls ~/Library/texmf/tex/latex/
   # Then compile normally
   ```

## Troubleshooting

**Error: "! LaTeX Error: File `hwcoursebase.sty' not found"**

Solution: Ensure TEXINPUTS is set before running pdflatex:
```bash
echo $TEXINPUTS  # Should show your paths
```

If empty, the TEXINPUTS variable may not be configured. Try:
```bash
export TEXINPUTS=.:..:
pdflatex homeworktest.tex
```

**Error: "! LaTeX Error: File `../homework.cls' not found"**

Solution: Make sure you're running from the `examples/` or `templates/` directory:
```bash
cd examples/
TEXINPUTS="..:$TEXINPUTS" pdflatex homeworktest.tex
```
