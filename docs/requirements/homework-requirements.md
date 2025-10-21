# Homework Class Requirements

## Class Information
- **File**: `homework.cls`
- **Version**: 2025-09-01
- **Purpose**: LaTeX class for Homework Assignments
- **Base Class**: article (default font size)

## Class Options

### Standard Mode (Default)
- Problems numbered sequentially (1, 2, 3, ...)
- Sub-problems lettered in parentheses ((a), (b), (c), ...)
- No part divisions

### Part Numbering Mode
- **Option**: `partnumbering`
- **Usage**: `\documentclass[partnumbering]{homework}`
- **Features**:
  - Enables `\part{title}` command for dividing homework into major sections
  - Problems numbered as `<part>.<problem>` (e.g., 1.1, 1.2, 2.1, ...)
  - Sub-problems formatted as uppercase letters with periods (A., B., C., ...)
  - Part counter automatically resets problem counter

## System Requirements

### LaTeX Distribution
- **Minimum**: LaTeX2e
- **Recommended**: TeX Live 2020 or newer, MiKTeX 2020 or newer

### Required Packages
The following packages must be available in your LaTeX distribution:

#### Core Mathematics and Layout
- `amsmath` - Advanced mathematical environments and equation formatting
- `amssymb` - Extended mathematical symbols (including \mathbb)
- `geometry` - Page layout with 0.5-inch margins
- `fix-cm` - Computer Modern font size adjustments
- `xparse` - Modern command definitions with flexible arguments

#### Graphics and Visual Elements  
- `graphicx` - Image inclusion and manipulation
- `xcolor` - Color support for text highlighting
- `tikz` - Advanced graphics and diagrams
- `blox` - Block diagram creation
- `tcolorbox` - Colored boxes and frames for examples

#### Environment and Code Support
- `environ` - Custom environment creation
- `listings` - Code formatting and syntax highlighting

## Page Layout Requirements
- **Margins**: 0.5 inches on all sides (compact layout for homework)
- **Font**: Computer Modern (LaTeX default)
- **Spacing**: Standard article class spacing

## Class Features

### Header Creation
The `\hwheader{}{}{}{}}` command requires:
1. **Course Code** - Course identifier (e.g., "MATH 101")
2. **Assignment Number** - Homework number
3. **Student Name** - Full name of student
4. **Date/Info** - Due date or other relevant information

### Problem Structure

#### Standard Mode (Default)
- **Problem Command**: `\problem[optional_number]{title}`
  - Automatic numbering unless override provided
  - Optional problem title/description
- **Sub-problem Command**: `\subproblem[optional_letter]`
  - Automatic lettering (a, b, c, ...) unless override provided
  - Format: (a), (b), (c), ...
  - Supports nested problem parts

#### Part Numbering Mode
- **Part Command**: `\hwpart{title}`
  - Creates numbered part section (Part 1, Part 2, ...)
  - Resets problem counter to start at 1 for each new part
  - Only available when `partnumbering` option is used
- **Problem Command**: `\problem{title}`
  - Automatic numbering as `<part>.<problem>` (e.g., 1.1, 1.2, 2.1)
  - Optional override not recommended in this mode
  - Optional problem title/description
- **Sub-problem Command**: `\subproblem{title text}` or `\subproblem[optional_letter]{title text}`
  - Automatic lettering (A, B, C, ...) unless override provided
  - Format: A. Title text, B. Title text, ... (uppercase with period, inline with title)
  - Required argument for title text
  - Supports nested problem parts

### Mathematical Environments

#### Homework Math Environment (`hwmath`)
- Left-justified equations with alignment support
- Based on `align*` (unnumbered equations)
- Built-in vertical spacing for clean presentation

#### Numbered Math Environment (`hwmathnumbered`)
- Similar to `hwmath` but with equation numbering
- Based on `align` environment
- Automatic equation reference capability

#### Alignment Shortcuts
Predefined shortcuts for common mathematical operators:
- `\eq` → `&=` (equals alignment)
- `\gt` → `&>` (greater than)
- `\lt` → `&<` (less than)
- `\llt` → `&<<` (much less than)
- `\ggt` → `&>>` (much greater than)
- `\geqq` → `&\geq` (greater than or equal)
- `\leqq` → `&\leq` (less than or equal)
- `\neqq` → `&\neq` (not equal)
- `\approxx` → `&\approx` (approximately equal)

### Text Highlighting
- **Note Command**: `\note[optional_text]`
  - Creates large, bold, red text for important notes
  - Default text is "NOTE" if no argument provided
  - Useful for highlighting key points or warnings

### Example Environment
- **Framed Examples**: `\begin{example}{title} ... \end{example}`
  - Creates gray-background box with black border
  - Customizable title for each example
  - Professional appearance for worked examples

## Compilation Requirements

### Basic Compilation
- Single-pass compilation with `pdflatex` for basic documents
- Multiple passes may be needed for complex TikZ diagrams
- Compatible with `xelatex` and `lualatex`

### Advanced Features
- TikZ diagrams may require additional compilation passes
- Block diagrams using `blox` package for engineering problems
- Colored boxes require color package support

## Typical Usage Pattern

### Standard Homework Document
```latex
\documentclass{homework}

\begin{document}

\hwheader{COURSE 101}{Assignment 1}{Student Name}{\today}

\problem{Problem Title}
Problem statement and work...

\begin{hwmath}
x \eq 5 + 3 \\
x \eq 8
\end{hwmath}

\subproblem
Sub-problem work...

\end{document}
```

### Part Numbering Mode Document
```latex
\documentclass[partnumbering]{homework}

\begin{document}

\hwheader{EE599/699}{1}{Student Name}{Fall 2025}

\part{Shallow Networks \& Expressive Power}

\problem{General Shallow Network Analysis}
Consider a general shallow network...

\subproblem{Parameter Count}
State the formula...

\subproblem{Network Visualization and Structure}
...

\problem{Exploring Linear Regions}

\subproblem{Linear Regions Analysis}
The maximum number of linear regions...

\part{Deep Networks}

\problem{Depth vs Width}
Analyze the trade-offs...

\end{document}
```

## Special Features

### Compact Design
- 0.5-inch margins maximize space for problem solutions
- Efficient spacing between problems and sub-problems
- Clean, professional appearance suitable for submission

### Mathematical Focus
- Optimized for mathematical problem solving
- Easy equation alignment with shorthand operators
- Support for both numbered and unnumbered equation blocks

### Visual Enhancements
- Color support for highlighting important information
- Professional example boxes for worked solutions
- Support for technical diagrams and block diagrams

## Compatibility
- Compatible with pdfLaTeX, XeLaTeX, and LuaLaTeX engines
- Works with standard LaTeX distributions (TeX Live, MiKTeX)
- Requires moderately recent LaTeX installation for `tcolorbox` and `tikz` support
- All mathematical features work with standard `amsmath` package