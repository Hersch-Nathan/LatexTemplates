# Design Report Class Requirements

## Class Information
- **File**: `designreport.cls`
- **Version**: 1.0 (2025/10/03)
- **Purpose**: LaTeX class for Design Reports
- **Base Class**: article (12pt default)

## System Requirements

### LaTeX Distribution
- **Minimum**: LaTeX2e
- **Recommended**: TeX Live 2020 or newer, MiKTeX 2020 or newer

### Required Packages
The following packages must be available in your LaTeX distribution:

#### Core Layout and Typography
- `geometry` - Page layout and margins (1-inch margins)
- `xparse` - Modern command definitions
- `environ` - Custom environment creation
- `fontenc` (T1) - Font encoding
- `mathptmx` - Times New Roman fonts for text and math

#### Graphics and Visual Elements
- `graphicx` - Image inclusion and manipulation
- `xcolor` - Color support
- `caption` - Caption formatting
- `fancyhdr` - Custom headers and footers

#### Mathematics and Code
- `amsmath` - Advanced mathematical environments
- `listings` - Code syntax highlighting
- `array` - Enhanced table environments
- `booktabs` - Professional table formatting
- `multirow` - Multi-row table cells
- `multicol` - Multi-column layouts

#### Bibliography and References
- `biblatex` with `biber` backend - Modern bibliography processing
- IEEE citation style support
- `hyperref` - PDF hyperlinks and bookmarks

#### Document Structure
- `tocloft` - Table of contents customization
- `titlesec` - Section title formatting
- `setspace` - Line spacing control
- `lastpage` - Page numbering (X of Y format)

#### Optional Packages (loaded conditionally)
- `lineno` - Line numbering (when `linenumbers` option used)
- `draftwatermark` - Draft watermarks (when `draft` option used)
- `iftex` - Engine detection

## Class Options

### Layout Options
- `onecolumn` (default) - Single column layout
- `twocolumn` - Two column layout for compact presentation

### Document Modes
- `final` (default) - Clean final output
- `draft` - Draft mode with watermarks and overfull box highlighting

### Additional Features
- `linenumbers` - Add line numbers for review
- `figabbrev` - Use "Fig." instead of "Figure" in references

## Font Requirements
- **Headings**: 12pt Times New Roman (bold)
- **Body Text**: 11pt Times New Roman
- **Spacing**: 1.5 spacing between paragraphs, single line spacing

## Document Structure Requirements

### Title Page Elements
- Document name (customizable)
- Team name
- Team logo (optional)
- University and department information
- Course information
- Team members list
- Class advisors (optional)
- Sponsors (optional)
- Report date

### Required Bibliography File
- Must include a `.bib` file for references
- IEEE citation style is enforced
- Bibliography processing requires `biber`

## Compilation Requirements

### Required Compilation Steps
1. `pdflatex` (or `xelatex`/`lualatex`)
2. `biber` (for bibliography processing)
3. `pdflatex` (second pass for cross-references)
4. `pdflatex` (third pass if needed for final references)

### File Structure Requirements
- Main `.tex` file in project root or subdirectory
- Class file (`designreport.cls`) must be in LaTeX path or same directory
- Bibliography file (`.bib`) must be accessible
- Figures should be placed in `figures/` subdirectory (automatically handled)

## Feature Support

### Specialized Environments
- Engineering Requirements (`engineeringreq`)
- Sub-project management (`subproject`)
- Code environments with syntax highlighting
- Custom list environments

### Automatic Features
- Table of contents generation
- List of figures and tables
- Professional title page
- IEEE-style bibliography
- Consistent formatting and spacing
- Figure path management (automatic `figures/` prefix)

## Compatibility
- Compatible with pdfLaTeX, XeLaTeX, and LuaLaTeX engines
- Works with standard LaTeX distributions (TeX Live, MiKTeX)
- Requires relatively recent LaTeX installation (2020+) for full feature support