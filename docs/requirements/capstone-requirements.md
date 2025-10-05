# Capstone Report Class Requirements

## Class Information
- **File**: `capstone_report.cls`
- **Version**: 1.0 (2025/09/12)
- **Purpose**: LaTeX class for Capstone Biweekly Individual Progress Reports
- **Base Class**: article (11pt default)

## System Requirements

### LaTeX Distribution
- **Minimum**: LaTeX2e
- **Recommended**: TeX Live 2020 or newer, MiKTeX 2020 or newer

### Required Packages
The following packages must be available in your LaTeX distribution:

#### Core Layout and Typography
- `geometry` - Page layout and margins (1-inch margins)
- `xparse` - Modern command definitions with flexible argument handling
- `environ` - Custom environment creation capabilities
- `fontenc` (T1) - Font encoding for proper character display

#### Graphics and Visual Elements
- `graphicx` - Image inclusion and manipulation
- `xcolor` - Color support for text and graphics
- `fancyhdr` - Custom headers and footers

#### Code and Technical Content
- `listings` - Code syntax highlighting and formatting
- `iftex` - LaTeX engine detection for compatibility

#### Navigation and References
- `hyperref` - PDF hyperlinks and bookmarks
- `lastpage` - Page numbering support (X of Y format)

## Class Options

### Report Frequency
- `biweekly` (default) - Biweekly progress reports
- `weekly` - Weekly progress reports

### Text Formatting
- `titlecase` (default) - Standard title case formatting
- `uppercase` - All uppercase section headers

### Figure References
- Standard "Figure" references (default)
- `figabbrev` - Use "Fig." abbreviation in figure references

## Font Requirements
- **Base Font Size**: 11pt
- **Report Title**: 12pt bold
- **Body Text**: 11pt standard weight
- **Standard Font**: Computer Modern (LaTeX default) or similar

## Document Structure Requirements

### Report Metadata
The `\progressreport{}{}{}{}{}{}[]` command requires:
1. **Report Number** - Sequential report number
2. **Student Name** - Full name of student author
3. **Team Name** - Project team name
4. **Team Number** - Team identifier number
5. **Period Start Date** - Beginning of reporting period
6. **Period End Date** - End of reporting period
7. **Course Line** (optional) - Additional course information

### Required Document Sections
While not enforced by the class, progress reports typically include:
- Work completed during the period
- Work planned for next period
- Issues encountered and resolutions
- Team collaboration notes

## Compilation Requirements

### Basic Compilation
- Single-pass compilation with `pdflatex`
- No bibliography processing required by default
- Compatible with `xelatex` and `lualatex`

### File Structure Requirements
- Main `.tex` file with progress report content
- Class file (`capstone_report.cls`) must be in LaTeX path or same directory
- Any referenced images or figures must be accessible

## Feature Support

### Automatic Features
- Professional header generation with metadata
- Consistent formatting throughout document
- PDF metadata integration (title, author, subject)
- Hyperlink support for internal navigation

### Header Information Display
The `\makeheader` command automatically formats:
- Report type (Weekly/Biweekly) and number
- Student name and team information
- Reporting period dates
- Optional course line

### PDF Integration
- Automatic PDF title generation
- Author metadata from student name
- Subject line for document classification
- Colored hyperlinks (configurable)

## Usage Pattern

### Typical Document Structure
```latex
\documentclass[biweekly]{capstone_report}

\progressreport{1}{Student Name}{Team Name}{1}{2025-01-01}{2025-01-14}[Course Info]

\begin{document}

\makeheader

% Report content here

\end{document}
```

## Compatibility
- Compatible with pdfLaTeX, XeLaTeX, and LuaLaTeX engines
- Works with standard LaTeX distributions (TeX Live, MiKTeX)
- Minimal package dependencies for maximum compatibility
- No special bibliography or complex formatting requirements