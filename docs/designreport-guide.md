# Design Report Class Guide

**Location**: `designreport.cls` (root directory)  
**Template**: `templates/designreport_template.tex`  
**Full Example**: `examples/designreporttest.tex`

## Overview

The `designreport.cls` is a comprehensive LaTeX class designed for creating professional design reports, particularly Preliminary Design Reports (PDR) for engineering and design projects. This class provides a structured framework that meets academic and industry standards while maintaining flexibility for various project types.

**Important**: Place all figures in a `figures/` subdirectory. The class automatically prepends `figures/` to image paths.

## Features

### **Core Capabilities**
- Professional title page with team information
- Automatic table of contents, list of figures, and list of tables generation
- Custom headers and footers with team branding
- IEEE-style bibliography integration (biber/biblatex)
- Times New Roman typography (12pt headings, 11pt body text)
- Proper spacing (1.5 between paragraphs, single line spacing)
- Automatic figure path management (figures/ folder)

### **Specialized Environments**
- Engineering Requirements with rationale and verification
- Sub-project management sections
- Code environments (Python, MATLAB, C++, Terminal)
- Figure insertion helpers

### **Class Options**
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
\teamname{Team X - Project Name}
\university{University Name}
\department{Department Name}
\course{Course Name}

% Team information
\teammembers{%
    \teammember{Student Name 1}{student1@university.edu}
    \teammember{Student Name 2}{student2@university.edu}
}

\classadvisors{%
    \advisor{Dr. Advisor Name}{advisor@university.edu}
}

\sponsors{%
    \sponsor{Industry Sponsor}{sponsor@company.com}
}

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

### Section Structure

The class no longer includes predefined section commands to improve modularity and customization. Instead, you can define your own section commands in your document preamble or use standard LaTeX sectioning commands directly.

#### Optional Section Commands (Add to Document Preamble)

You can add these command definitions to your document for convenience:

```latex
% Define section commands (optional - customize as needed)
\newcommand{\needsstatement}{%
    \section{Problem Statement}
    \subsection{Need}
}
\newcommand{\background}{\subsection{Background}}
\newcommand{\objective}{\subsection{Objective}}
\newcommand{\requirementsspec}{\section{Requirements Specification}}
\newcommand{\marketingreqs}{\subsection{Marketing Requirements}}
\newcommand{\engineeringreqs}{\subsection{Engineering Requirements}}

\newcommand{\designsection}{\section{Design}}
\newcommand{\designsummary}{\subsection{Design Summary}}
\newcommand{\functionaldecomp}{\subsection{Functional Decomposition}}
\newcommand{\projectplan}{\section{Project Plan}}
\newcommand{\workbreakdown}{\subsection{Work Breakdown Structure}}
```

This approach allows you to customize section titles and structure according to your specific project requirements.
\ganttchart           % Creates "Gantt Chart" subsection
\costanalysis         % Creates "Cost Analysis" subsection
```

## Specialized Environments

### Engineering Requirements

The class now supports long tables that can span multiple pages using the `longtable` package. This is ideal for engineering requirements tables that may be extensive.

```latex
\begin{longtable}{|p{1cm}|p{4cm}|p{1cm}|p{4cm}|p{4cm}|}
\caption{Engineering Requirements Table} \label{tab:engineering-requirements} \\
\hline
\textbf{ER No.} & \textbf{Engineering Requirement} & \textbf{MR} & \textbf{Justification} & \textbf{Verification} \\
\hline
\endfirsthead
\hline
\textbf{ER No.} & \textbf{Engineering Requirement} & \textbf{MR} & \textbf{Justification} & \textbf{Verification} \\
\hline
\endhead
\hline
\endfoot
\hline
\endlastfoot
1 & System shall control primary functionality & 1 & Core objective of the project & Test each control mechanism individually \\
\hline
2 & Device shall fit within specified dimensions & 2 & Physical constraints of the application & Verify using dimensional measurements \\
\hline
% Add more requirements as needed...
\end{longtable}
```

Key features of longtable:
- Automatically splits across multiple pages
- Maintains consistent headers and footers
- Supports captions and labels for cross-referencing
- Column widths can be customized using `p{width}` specifications

### Sub-projects

```latex
\begin{subproject}{Hardware Development}{John Smith}
    \item PCB design and fabrication
    \item Sensor integration and testing
    \item Hardware validation
\end{subproject}
```

## Code Environments

The class provides specialized environments for displaying code with syntax highlighting. All code environments are labeled as "Code" for consistency (rather than "Listing").

### Python Code

```latex
\begin{reportpython}[caption={Data Processing Algorithm}]
import numpy as np

def process_sensor_data(raw_data, threshold=0.5):
    """Process sensor data with filtering"""
    filtered_data = np.convolve(raw_data, 
                               np.ones(5)/5, 
                               mode='valid')
    events = filtered_data > threshold
    return filtered_data, events
\end{reportpython}
```

### MATLAB Code

```latex
\begin{reportmatlab}[caption={Signal Processing Functions}]
function processed_signal = filter_data(raw_data, sampling_freq)
    % Design filter parameters
    cutoff_freq = 50; % Hz
    filter_order = 4;
    
    % Create Butterworth filter
    [b, a] = butter(filter_order, cutoff_freq/(sampling_freq/2), 'low');
    processed_signal = filtfilt(b, a, raw_data);
end
\end{reportmatlab}
```

### Terminal Output

```latex
\begin{reportterminal}[caption={Development Environment Setup}]
$ git clone https://github.com/yourteam/project-repo.git
$ cd project-repo
$ pip install -r requirements.txt
$ python setup.py install
Installing dependencies...
Setup complete!
$ python main.py --test
All tests passed successfully!
\end{reportterminal}
```

### General Code Block

```latex
\begin{codeblock}[caption={Configuration File}]
{
  "system": {
    "debug": true,
    "timeout": 5000,
    "retries": 3
  }
}
\end{codeblock}
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

The class provides enhanced table formatting with proper spacing and professional appearance.

#### Recommended Table Formatting
```latex
\begin{table}[htbp]
\centering
\caption{Engineering Requirements Summary}
% Add proper spacing for better readability
\renewcommand{\arraystretch}{1.5}
\setlength{\tabcolsep}{8pt}
\begin{tabular}{|c|p{4cm}|c|p{4cm}|}
\hline
ER\# & Engineering Requirement & MR & Justification \\
\hline
1 & Response time $<$ 100ms & 1 & Users require immediate feedback \\
\hline
2 & Battery life $\geq$ 8 hours & 3 & Extended operation needed \\
\hline
\end{tabular}
\end{table}
```

#### Professional Style with Booktabs (Recommended)
```latex
\begin{table}[htbp]
\centering
\caption{System Specifications}
\renewcommand{\arraystretch}{1.5}
\setlength{\tabcolsep}{10pt}
\begin{tabular}{lcc}
\toprule
Parameter & Value & Units \\
\midrule
Operating Voltage & 5.0 & V \\
Power Consumption & 2.5 & W \\
Operating Temperature & -10 to 60 & °C \\
\bottomrule
\end{tabular}
\end{table}
```

#### Table Formatting Commands
- `\renewcommand{\arraystretch}{1.5}` - Increases row height for better readability
- `\setlength{\tabcolsep}{8pt}` - Adds padding between text and table lines
- Use `booktabs` package commands (`\toprule`, `\midrule`, `\bottomrule`) for professional appearance

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
\university{University of Kentucky}
\department{Department of Electrical and Computer Engineering}
\course{Senior Design}

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

% Use longtable for engineering requirements
\begin{longtable}{|p{1cm}|p{4cm}|p{1cm}|p{4cm}|p{4cm}|}
\caption{Engineering Requirements} \label{tab:engineering-reqs} \\
\hline
\textbf{ER No.} & \textbf{Engineering Requirement} & \textbf{MR} & \textbf{Justification} & \textbf{Verification} \\
\hline
\endfirsthead
\hline
\textbf{ER No.} & \textbf{Engineering Requirement} & \textbf{MR} & \textbf{Justification} & \textbf{Verification} \\
\hline
\endhead
\hline
\endfoot
\hline
\endlastfoot
1 & Performance requirement & 1 & Rationale for requirement & Verification criteria \\
\hline
\end{longtable}

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