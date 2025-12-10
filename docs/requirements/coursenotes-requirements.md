# Course Notes Class Requirements

**Last Updated: December 2025**

## Class Information
- **File**: `coursenotes.cls`
- **Version**: 2025-12-10
- **Purpose**: LaTeX class for comprehensive semester-long course notes with embedded problems
- **Base Class**: book (for chapter support)

## System Requirements

### LaTeX Distribution
- **Minimum**: LaTeX2e
- **Recommended**: TeX Live 2020 or newer, MiKTeX 2020 or newer

### Required Packages
The following packages must be available in your LaTeX distribution:

#### Core Mathematics and Layout
- `amsmath` - Advanced mathematical environments and equation formatting
- `amssymb` - Extended mathematical symbols (including \mathbb, \mathbb{R}, etc.)
- `geometry` - Page layout with 0.5-inch margins (compact layout for study materials)
- `fix-cm` - Computer Modern font size adjustments
- `xparse` - Modern command definitions with flexible arguments

#### Graphics and Visual Elements  
- `graphicx` - Image inclusion and manipulation
- `xcolor` - Color support for text highlighting and notes
- `tikz` - Advanced graphics and diagrams
- `blox` - Block diagram creation for control systems
- `tcolorbox` - Colored boxes and frames for examples
- `subcaption` - Side-by-side figure support with individual captions

#### Navigation and References
- `hyperref` - Hyperlinks, cross-references, and PDF bookmarks
  - Configured with colored links (blue)
  - Automatic bookmarks for chapters and sections
  - Clickable table of contents

#### Environment and Code Support
- `environ` - Custom environment creation
- `listings` - Code formatting and syntax highlighting (MATLAB, Python, bash)

## Page Layout Requirements
- **Margins**: 0.5 inches on all sides (compact layout optimized for notes)
- **Font**: Computer Modern (LaTeX default) with book class sizing
- **Spacing**: Standard book class spacing
- **Chapter Style**: Book class default (prominent chapter headings)
- **Section Style**: Consistent with homework.cls for familiarity

## Class Features

### Course Header
The `\courseheader{}{}{}{}}` command creates a formatted course title page:
1. Course code and name (large, bold, centered)
2. Semester/term designation
3. Student name
4. Automatic spacing and formatting

**Parameters**:
- Course code (e.g., "EE 571")
- Course name (e.g., "Control Systems")
- Semester (e.g., "Fall 2025")
- Student name

### Front Matter Generation
- `\makealllists` - Generates all lists (TOC, LOF, LOT) with proper formatting
- `\maketoc` - Table of Contents only
- `\makelof` - List of Figures only
- `\makelot` - List of Tables only
- Automatic page breaking between sections
- Hyperlinked entries (clickable in PDF)

### Chapter and Section Organization
- Standard book class `\chapter{}` command with automatic numbering
- Standard `\section{}`, `\subsection{}`, `\subsubsection{}` hierarchy
- Automatic TOC entries for all section levels
- Full cross-referencing support with `\label{}` and `\ref{}`

### Problem and Solution System

#### Problem Numbering
- **Format**: Chapter.Problem (e.g., 1.1, 1.2, 2.1, 2.2)
- **Auto-reset**: Problem counter resets at each new chapter
- **Command**: `\problem{title}`
- **Referencing**: Can be labeled with `\label{prob:name}` for cross-references

#### Sub-problem System
- **Flexible Styles**: Three numbering modes available
  - `alph`: (a), (b), (c), ... (default)
  - `roman`: (i), (ii), (iii), ...
  - `arabic`: (1), (2), (3), ...
- **Style Change**: `\setsubproblemstyle{style}` command for mid-document changes
- **Command**: `\subproblem{text}` or `\subproblem[custom]{text}`
- **Custom Labels**: Optional override parameter for special numbering

#### Solution Display
- **Format**: Inline display immediately after each sub-problem
- **Environment**: `\begin{solution}...\end{solution}`
- **Display**: Always visible (no toggle - optimized for study materials)
- **Layout Pattern**: 
  - Problem statement
  - Sub-problem (a) text
  - Solution: (a) answer
  - Sub-problem (b) text
  - Solution: (b) answer

### Math Environments
(Inherited from homework.cls)

#### Unnumbered Math
- **Environment**: `hwmath`
- **Features**: Left-justified alignment at equals signs
- **Shortcuts**: `\eq`, `\gt`, `\lt`, `\ggt`, `\llt`, `\geqq`, `\leqq`, `\neqq`, `\approxx`

#### Numbered Math
- **Environment**: `hwmathnumbered`
- **Features**: Automatic equation numbering with alignment
- **Cross-references**: Can be labeled and referenced

### Code Listing Environments
(Inherited from homework.cls)

#### MATLAB Environment
- **Environment**: `hwmatlab`
- **Syntax**: MATLAB syntax highlighting
- **Options**: Accepts all `listings` package options

#### Python Environment
- **Environment**: `hwpython`
- **Syntax**: Python syntax highlighting
- **Options**: Accepts all `listings` package options

#### Terminal Environment
- **Environment**: `hwterminal`
- **Syntax**: Bash/shell formatting
- **Style**: Gray frame with monospace font
- **Options**: Accepts all `listings` package options

### Graphics Support

#### Single Graphics
- **Command**: `\hwgraphic{path}[title][scale]`
- **Parameters**: 
  - Required: image file path
  - Optional: title (displayed above image)
  - Optional: scale factor (default: 0.8\textwidth)
- **Features**: Automatic centering and formatting

#### Dual Graphics (Side-by-Side)
- **Command**: `\hwdualfigure{img1}{img2}[width1][width2]{cap1}{cap2}`
- **Parameters**:
  - Required: two image paths
  - Optional: individual widths (default: 0.45\textwidth each)
  - Required: individual captions
- **Features**: Automatic subfigure environment with proper spacing

### Block Diagrams
(Inherited from homework.cls)

- **Environment**: `hwblocks[scale]`
- **Package**: TikZ + Blox
- **Features**: Centered diagrams with optional scaling
- **Usage**: Control system block diagrams, flowcharts
- **Commands**: Full blox package command set available

### Visual Emphasis

#### Note Command
- **Command**: `\note` or `\note[text]`
- **Style**: Large, bold, red text
- **Purpose**: Highlight critical information

#### Example Boxes
- **Environment**: `\begin{example}{title}...\end{example}`
- **Style**: Gray background with black border
- **Purpose**: Worked examples, case studies, derivations

### Reference Commands

#### Lecture References
- **Command**: `\lectureref{identifier}`
- **Output**: "Lecture X" with any identifier
- **Purpose**: Track source material from course lectures
- **Flexibility**: Accepts numbers, letters, or text (e.g., "12b", "Week 3")

#### Textbook References
- **Command**: `\textbookref{reference}`
- **Output**: "*Textbook* X" with any reference
- **Purpose**: Track source material from textbook
- **Examples**: Section numbers (§3.2), page ranges (pp. 45-47), chapters

#### Chapter References
- **Command**: `\chapref{label}`
- **Output**: "Chapter X" with hyperlink
- **Requirement**: Target must have `\label{}`

#### Section References
- **Command**: `\secref{label}`
- **Output**: "Section X.Y" with hyperlink
- **Requirement**: Target must have `\label{}`

## Compilation Requirements

### Standard Workflow
1. First compilation: `pdflatex document.tex` (generates TOC, aux files)
2. Second compilation: `pdflatex document.tex` (resolves cross-references)
3. Third compilation (if needed): `pdflatex document.tex` (resolves complex references)

### Reference System
- Requires multiple compilations for proper cross-reference resolution
- Hyperref warnings on first compilation are normal
- Check `.log` file for undefined references

### Output Format
- **Default**: PDF with embedded hyperlinks
- **Bookmarks**: Automatic chapter/section navigation in PDF viewers
- **Links**: All cross-references are clickable

## Compatibility Notes

### Book Class Differences
- Uses book class instead of article (for chapter support)
- Chapters start on odd pages by default (use `openany` option to change)
- Different page numbering: roman for front matter, arabic for main content

### Inheritance from homework.cls
- All math environments identical to homework.cls
- All code environments identical to homework.cls
- All graphics helpers identical to homework.cls
- Block diagram system identical to homework.cls

### Known Limitations
- No class options for draft/final modes (book class default)
- No multi-column layout option (use figure* for wide figures)
- Problem counter cannot be manually reset mid-chapter

## File Organization Recommendations

### Suggested Structure
```
course-notes/
├── main.tex                 % Main document
├── figures/                 % All images
│   ├── chapter1/
│   ├── chapter2/
│   └── ...
└── coursenotes.cls         % Class file
```

### Best Practices
- Keep all figures in organized subdirectories by chapter
- Use descriptive label names with prefixes (chap:, sec:, fig:, eq:, prob:)
- Compile frequently to catch errors early
- Use vector graphics (PDF, EPS) when possible

## Version History
- **2025-12-10**: Initial release
  - Book class base for chapter support
  - Problem/solution system with inline display
  - Flexible sub-problem numbering
  - Lecture and textbook references
  - Automatic TOC/LOF/LOT generation
  - Full cross-referencing with hyperref

## Support and Documentation

### Additional Resources
- **User Guide**: `docs/coursenotes-guide.md` - Comprehensive usage guide
- **Example File**: `examples/coursenotestest.tex` - Full feature demonstration
- **Template**: `templates/coursenotes_template.tex` - Quick-start template
- **Related**: `docs/homework-guide.md` - Detailed math/code environment documentation

### Common Issues
See Troubleshooting section in `coursenotes-guide.md` for solutions to common problems.
