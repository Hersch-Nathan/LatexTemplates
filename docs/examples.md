# Examples and Tutorials

This page links to working examples and shows common patterns for all three classes.

## File Locations

- **Templates**: Located in `templates/` directory
  - `homework_template.tex` — Basic homework starter (standard mode)
  - `homework_partnumbering_template.tex` — Part numbering mode template
  - `capstone_template.tex` — Basic capstone report starter
  - `designreport_template.tex` — Basic design report starter
  
- **Full Examples**: Located in `examples/` directory
  - `homeworktest.tex` — Complete feature demonstration for homework class (standard mode)
  - `homeworktest_partnumbering.tex` — Part numbering mode demonstration
  - `capstonereporttest.tex` — Complete feature demonstration for capstone reports
  - `designreporttest.tex` — Complete feature demonstration for design reports
  - `create_diagram.tex` — Block diagram examples

## Homework Examples

Starter template (standard mode): `templates/homework_template.tex`

Part numbering template: `templates/homework_partnumbering_template.tex`

Full feature demo (standard): `examples/homeworktest.tex`

Part numbering demo: `examples/homeworktest_partnumbering.tex`

### Problem Sets with Math (Standard Mode)
```latex
\problem{Analyze the system}
\begin{hwmath}
G(s) \eq \frac{10}{s(s+2)} \\
\text{Design } G_c(s) \eq K_p + K_i/s + K_d s \\
|G(j\omega)| \gt 1 \text{ for } \omega \lt 2 \\
f(x) \ggt 0 \text{ for all } x
\end{hwmath}
```

### Problem Sets with Parts (Part Numbering Mode)
```latex
\documentclass[partnumbering]{homework}

\hwpart{Shallow Networks \& Expressive Power}

\problem{General Shallow Network Analysis}
Consider a network with inputs and hidden units...

\subproblem{Parameter Count}
Calculate the total parameters.

\subproblem{Network Visualization}
Draw the architecture.

\problem{Exploring Linear Regions}
Analyze the piecewise linear behavior...

\hwpart{Deep Networks}

\problem{Depth vs Width}
Compare shallow vs deep networks...
```

### Example Boxes
```latex
\begin{example}{Example 3-2: Frequency Analysis}
For $H(s) = \frac{1}{s+1}$, find the magnitude at $\omega = 1$:
$$|H(j1)| = \frac{1}{\sqrt{2}} \approx 0.707$$
\end{example}
```

### Code Blocks
```latex
\begin{hwpython}[caption=Computation]
import numpy as np
x = np.linspace(0,1,5)
\end{hwpython}
```

### Terminal Output
```latex
\begin{hwterminal}[caption=Solver Output]
$ python solve.py
Converged in 12 iterations
\end{hwterminal}
```

### Block Diagrams

```latex
\begin{hwblocks}
\node (a) at (0,0) {A}; 
\node (b) at (2,0) {B}; 
\draw[->] (a)--(b);
\end{hwblocks}
```

## Capstone Report Examples

Starter template: `capstone_template.tex`

Full demo: `capstonereporttest.tex`

### Section Flow
```latex
\reportIntroduction
Provide a brief summary of the reporting period objectives.

\reportWorkAccomplished
Summarize tasks completed with evidence and links to artifacts.

\reportProblems
List blockers and mitigation steps.
```

### Figures
```latex
% Label in the caption text and reference with \figref{\ref{...}}
\reportfigure[0.55\textwidth]{figures/architecture.pdf}{System Architecture \label{fig:arch}}

See \figref{\ref{fig:arch}} for details.
```

## Design Report Examples

Starter template: `designreport_template.tex`

Full demo: `designreporttest.tex`

### Title Page Setup
```latex
\documentname{Preliminary Design Report}
\teamname{Team 8 - PlayPal}
\university{University of Kentucky}
\department{Department of Electrical and Computer Engineering}
\course{Senior Design}
\teammembers{%
    \teammember{John Smith}{john.smith@uky.edu}
    \teammember{Jane Doe}{jane.doe@uky.edu}
}
```

### Engineering Requirements (Using Longtable)
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
1 & Touch response time < 100ms & 1 & Children require immediate feedback & Test response time under various conditions \\
\hline
2 & System detects 3 pressure levels & 1 & Provides tactile variety for users & Calibrate sensors and verify distinct levels \\
\hline
\end{longtable}
```

### Impact Statements
```latex
\begin{impactstatement}{Economic}
The economic impact extends beyond immediate development costs...
\end{impactstatement}
```

### Sub-projects
```latex
\begin{subproject}{Hardware Development}{Team Member Name}
    \item PCB design and fabrication
    \item Sensor integration and testing
    \item Hardware validation
\end{subproject}
```

### Predefined Section Commands (Optional)

The following commands can be added to your document preamble to create consistent section structures. These are examples that should be customized for your specific project:

```latex
% Comment and Response section
\newcommand{\commentresponse}{%
    \section{Comment and Response}
    This section summarizes major instructor comments and changes made based on feedback.
}

% Problem Statement sections
\newcommand{\needsstatement}{%
    \section{Problem Statement}
    \subsection{Need}
}

\newcommand{\background}{%
    \subsection{Background}
}

\newcommand{\objective}{%
    \subsection{Objective}
}

% Requirements sections
\newcommand{\requirementsspec}{%
    \section{Requirements Specification}
}

\newcommand{\marketingreqs}{%
    \subsection{Marketing Requirements}
}

\newcommand{\objectivetree}{%
    \subsection{Objective Tree}
}

\newcommand{\engineeringreqs}{%
    \subsection{Engineering Requirements}
}

\newcommand{\impactstatements}{%
    \subsection{Impact Statements}
}

% Design sections
\newcommand{\designsection}{%
    \section{Design}
}

\newcommand{\designsummary}{%
    \subsection{Design Summary}
}

\newcommand{\functionaldecomp}{%
    \subsection{Functional Decomposition}
}

\newcommand{\behavioralmodels}{%
    \subsection{Behavioral Models}
}

% Project Plan sections
\newcommand{\projectplan}{%
    \section{Project Plan}
}

\newcommand{\workbreakdown}{%
    \subsection{Work Breakdown Structure (WBS)}
}

\newcommand{\ganttchart}{%
    \subsection{Gantt Chart}
}

\newcommand{\costanalysis}{%
    \subsection{Cost Analysis}
}

% Conclusion section
\newcommand{\conclusionoutlook}{%
    \section{Conclusion/Outlook}
}
```

### Table Formatting Examples

#### Professional Table with Proper Spacing
```latex
\begin{table}[htbp]
\centering
\caption{Engineering Requirements}
% Increase row height and column padding for better readability
\renewcommand{\arraystretch}{1.5}
\setlength{\tabcolsep}{8pt}
\begin{tabular}{|c|p{3.5cm}|c|p{3.5cm}|}
\hline
ER\# & Engineering Requirement & MR & Justification \\
\hline
1 & Response time $<$ 100ms & 1 & Children require immediate feedback \\
\hline
2 & Battery life $\geq$ 8 hours & 3 & Extended play sessions needed \\
\hline
\end{tabular}
\end{table}
```

#### Professional Table with Booktabs (Recommended)
```latex
\begin{table}[htbp]
\centering
\caption{System Specifications}
\renewcommand{\arraystretch}{1.5}
\setlength{\tabcolsep}{8pt}
\begin{tabular}{lcc}
\toprule
Component & Value & Units \\
\midrule
Operating Voltage & 5.0 & V \\
Current Draw & 2.5 & A \\
Operating Temperature & -10 to 60 & °C \\
\bottomrule
\end{tabular}
\end{table}
```

## Tips

- Keep problem statements concise; use sub-problems to break down tasks.
- Prefer the provided math environments for aligned derivations.
- Use captions on listings when you need to reference them in text.
- For capstone reports, keep section order consistent week over week.
- For design reports, ensure all required sections are included and properly formatted.

## Troubleshooting

- **Missing Figures**: Ensure all figure paths are correct and files are in the `figures/` directory.
- **Bibliography Issues**: Ensure `.bib` file is included and `\addbibresource{}` is used.
- **Compilation Errors**: Run `pdflatex` twice for proper cross-references.

## Support

For additional help:
- Refer to the class-specific guides in the `docs/` directory.
- Review the example files in the `examples/` directory.
- Consult LaTeX documentation for advanced usage.
