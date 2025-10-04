# Design Report Class Guide

**Location**: `designreport.cls` (root directory)  
**Template**: `templates/designreport_template.tex`  
**Full Example**: `examples/designreporttest.tex`

## Overview

The `designreport.cls` is a comprehensive LaTeX class designed for creating professional design reports, particularly Preliminary Design Reports (PDR) for engineering and design projects. This class provides a structured framework that meets academic and industry standards while maintaining flexibility for various project types.

**Important**: Place all figures in a `figures/` subdirectory. The class automatically prepends `figures/` to image paths.

## Features

### 🎯 **Core Capabilities**
- Professional title page with team information
- Automatic table of contents, list of figures, and list of tables generation
- Custom headers and footers with team branding
- IEEE-style bibliography integration (biber/biblatex)
- Times New Roman typography (12pt headings, 11pt body text)
- Proper spacing (1.5 between paragraphs, single line spacing)
- Automatic figure path management (figures/ folder)

### 📝 **Specialized Environments**
- Engineering Requirements with rationale and verification
- Impact Statement sections
- Sub-project management sections
- Code environments (Python, MATLAB, C++, Terminal)
- Figure insertion helpers

### 🔧 **Class Options**
- `draft` / `final` (default: final): Draft mode with watermarks and overfull box highlighting
- `twocolumn` / `onecolumn` (default: onecolumn): Layout options
- `linenumbers`: Add line numbers for review
- `figabbrev`: Use "Fig." instead of "Figure" in references

**Required Packages**: geometry, xparse, environ, graphicx, xcolor, amsmath, listings, fancyhdr, caption, hyperref, tocloft, biblatex (IEEE style), titlesec, setspace, array, booktabs, multirow, multicol, mathptmx (Times fonts)

## Quick Start

### Basic Document Structure

```latex
\documentclass[final]{designreport}

% Bibliography file
\addbibresource{references.bib}

% Title page setup
\documentname{Preliminary Design Report}
\teamname{Team 8 - PlayPal}
\university{University of Kentucky}
\department{Department of Electrical and Computer Engineering}
\course{Senior Design}

% Team information
\teammembers{%
    \teammember{John Smith}{john.smith@uky.edu}
    \teammember{Jane Doe}{jane.doe@uky.edu}
}

\classadvisors{%
    \advisor{Dr. Professor Name}{professor@uky.edu}
}

\sponsors{%
    \sponsor{Industry Sponsor}{sponsor@company.com}
}

\title{Your Project Title}
\author{Your Team}

\begin{document}

% Generate title page
\maketitle

% Generate front matter
\makefrontmatter

% Your content here...

\end{document}
```

## Title Page Configuration

### Required Information

The title page includes the following elements, configured using these commands:

| Command | Description | Example |
|---------|-------------|---------|
| `\documentname{}` | Type of report | `Preliminary Design Report` |
| `\teamname{}` | Team identification | `Team 8 - PlayPal` |
| `\university{}` | Institution name | `University of Kentucky` |
| `\department{}` | Department name | `Department of ECE` |
| `\course{}` | Course name | `Senior Design` |
| `\reportdate{}` | Date (optional) | `October 3, 2025` |

### Team Information

Use helper commands to format team member information in two columns:

```latex
\teammembers{%
    \teammember{First Last}{email@domain.com}
    \teammember{Another Person}{another@domain.com}
    % Add more members as needed
}

\classadvisors{%
    \advisor{Dr. Advisor Name}{advisor@domain.com}
    \advisor{Dr. Another Advisor}{advisor2@domain.com}
}

\sponsors{%
    \sponsor{Sponsor Name}{sponsor@company.com}
}
```

### Optional Team Logo

```latex
\teamlogo{path/to/logo.png}
```

## Document Sections

### Predefined Section Commands

The class provides commands for standard PDR sections:

```latex
% Problem Statement
\needsstatement          % Creates "Problem Statement" section
\background             % Creates "Background" subsection
\objective              % Creates "Objective" subsection

% Requirements
\requirementsspec       % Creates "Requirements Specification"
\marketingreqs         % Creates "Marketing Requirements" subsection
\engineeringreqs       % Creates "Engineering Requirements" subsection
\impactstatements      % Creates "Impact Statements" subsection

% Design
\designsection         % Creates "Design" section
\designsummary         % Creates "Design Summary" subsection
\functionaldecomp      % Creates "Functional Decomposition" subsection

% Project Management
\projectplan           % Creates "Project Plan" section
\workbreakdown         % Creates "Work Breakdown Structure" subsection
\ganttchart           % Creates "Gantt Chart" subsection
\costanalysis         % Creates "Cost Analysis" subsection
```

## Specialized Environments

### Engineering Requirements

```latex
\begin{engineeringreq}{1}{Touch Response Time}{Children require immediate feedback}
    \item Response time shall be less than 100ms
    \item System shall detect 3 distinct pressure levels
\end{engineeringreq}
```

### Impact Statements

```latex
\begin{impactstatement}{Economic}
The economic impact extends beyond immediate development costs...
\end{impactstatement}
```

### Sub-projects

```latex
\begin{subproject}{Hardware Development}{John Smith}
    \item PCB design and fabrication
    \item Sensor integration and testing
    \item Hardware validation
\end{subproject}
```

## Code Environments

### Python Code

```latex
\begin{reportpython}[caption={Algorithm Implementation}]
def adaptive_learning(success_rate):
    if success_rate > 0.8:
        difficulty += 1
    elif success_rate < 0.4:
        difficulty -= 1
    return difficulty
\end{reportpython}
```

### MATLAB Code

```latex
\begin{reportmatlab}[caption={Signal Processing}]
function filtered = process_signal(raw_data, fs)
    [b, a] = butter(4, 10/(fs/2), 'low');
    filtered = filtfilt(b, a, raw_data);
end
\end{reportmatlab}
```

### Terminal Output

```latex
\begin{reportterminal}[caption={System Installation}]
$ sudo apt-get install python3-pip
$ pip3 install numpy matplotlib
$ python3 main.py
System initialized successfully!
\end{reportterminal}
```

## Figures and Tables

### Figure Insertion

```latex
% Simple figure with caption
\reportfigure[0.8\textwidth]{image.png}{Caption text}

% Figure with custom width
\reportfigure[0.5\textwidth]{diagram.pdf}{System Architecture}

% Legacy compatibility
\insertFigure{0.6\textwidth}{photo.jpg}{Prototype Photo}
```

### Figure References

```latex
% Standard reference
See \figref{fig:architecture} for details.

% Abbreviated reference (with figabbrev option)
As shown in \figref{fig:results}.
```

### Professional Tables

```latex
\begin{table}[htbp]
\centering
\caption{Cost Breakdown Analysis}
\begin{tabular}{@{}lrr@{}}
\toprule
Category & Estimated & Actual \\
\midrule
Components & \$450 & \$487 \\
Fabrication & \$200 & \$195 \\
\midrule
Total & \$650 & \$682 \\
\bottomrule
\end{tabular}
\end{table}
```

## Front Matter Generation

The `\makefrontmatter` command automatically generates:

1. **Table of Contents** - Clickable navigation
2. **List of Tables** - All numbered tables
3. **List of Figures** - All numbered figures

These are generated automatically and updated on subsequent compilations.

## Headers and Footers

### Default Layout
- **Header**: Document title | Author | Page number
- **Footer**: Team name | Course | Page number

### First Page
The title page uses a clean layout without headers/footers.

## Bibliography

### Setup

```latex
% In preamble
\addbibresource{references.bib}

% At end of document
\printbibliography
```

### IEEE Style References

The class uses IEEE citation style automatically. Example `.bib` entries:

```bibtex
@article{smith2024adaptive,
    title={Adaptive Learning Systems},
    author={Smith, John A.},
    journal={Educational Technology Research},
    volume={45},
    pages={123--145},
    year={2024}
}
```

## Advanced Features

### Draft Mode

```latex
\documentclass[draft]{designreport}
```

- Adds "DRAFT" watermark
- Highlights overfull boxes
- Enables line numbers (with `linenumbers` option)

### Appendices

```latex
\makeappendix

\subsection{Technical Specifications}
Additional details...
```

## Customization

### Font Modifications

The class uses Times New Roman by default. Fonts can be customized in the class file:

```latex
% 12pt bold headings
% 11pt body text
% Automatic math font matching
```

### Spacing Adjustments

```latex
% Paragraph spacing: 1.5ex
% Line spacing: single
% Section spacing: automatic
```

## Compilation

### Standard Process

```bash
pdflatex document.tex
pdflatex document.tex  # For cross-references
```

### With Bibliography

```bash
pdflatex document.tex
biber document
pdflatex document.tex
pdflatex document.tex
```

## Troubleshooting

### Common Issues

1. **Missing Bibliography**: Ensure `.bib` file exists and `\addbibresource{}` is called
2. **Figure Not Found**: Check file paths and extensions
3. **Cross-references**: Run pdflatex twice for proper references
4. **Font Issues**: Ensure Times fonts are installed

### Class Options Conflicts

- Use only one layout option: `onecolumn` OR `twocolumn`
- Use only one mode: `draft` OR `final`

## Example Projects

### Complete PDR Structure

```latex
\documentclass[final]{designreport}
\addbibresource{references.bib}

% Title page setup
\documentname{Preliminary Design Report}
\teamname{Team 8 - PlayPal}
% ... other setup commands

\begin{document}
\maketitle
\makefrontmatter

\begin{abstract}
Project summary...
\end{abstract}

\commentresponse
Response to feedback...

\needsstatement
Problem description...

\background
Background information...

\objective
Project objectives...

\requirementsspec
\marketingreqs
Marketing requirements...

\engineeringreqs
\begin{engineeringreq}{1}{Performance}{Rationale}
    \item Verification criteria
\end{engineeringreq}

% ... continue with other sections

\printbibliography
\makeappendix

\end{document}
```

## Best Practices

### Organization
- Use consistent section ordering
- Include all required PDR sections
- Maintain professional formatting

### Content
- Write clear, concise requirements
- Include proper verification methods
- Use professional language throughout

### Technical
- Keep figures at appropriate resolution
- Use vector graphics when possible
- Maintain consistent naming conventions

## Support

For additional help:
- Check existing template files in the repository
- Review the class source code for advanced customization
- Consult LaTeX documentation for standard commands

The `designreport.cls` provides a solid foundation for professional design reports while maintaining the flexibility needed for diverse project requirements.