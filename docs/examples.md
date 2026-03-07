# Examples and Tutorials

**Last Updated: March 2026**

This page links to working examples and shows common patterns for all six classes.

## File Locations

- **Templates**: Located in `templates/` directory
  - `coursenotes_template.tex` — Basic course notes starter with embedded problems
  - `homework_template.tex` — Basic homework starter (standard mode)
  - `homework_partnumbering_template.tex` — Part numbering mode template
  - `capstone_template.tex` — Basic capstone report starter
  - `designreport_template.tex` — Basic design report starter
  - `poster_template.tex` — Basic research poster starter
  - `playscript_template.tex` — Basic playscript starter
  
- **Full Examples**: Located in `examples/` directory
  - `coursenotestest.tex` — Complete feature demonstration for course notes class
  - `homeworktest.tex` — Complete feature demonstration for homework class (standard mode)
  - `homeworktest_partnumbering.tex` — Part numbering mode demonstration
  - `capstonereporttest.tex` — Complete feature demonstration for capstone reports
  - `designreporttest.tex` — Complete feature demonstration for design reports
    - `postertest.tex` — Complete feature demonstration for poster class
  - `playscripttest.tex` — Complete feature demonstration for playscripts
    - `playscript_simple_test.tex` — Minimal playscript example
  - `create_diagram.tex` — Block diagram examples

## Course Notes Examples

Starter template: `templates/coursenotes_template.tex`

Full feature demo: `examples/coursenotestest.tex`

### Complete Chapter with Problems and Inline Solutions
```latex
\documentclass{coursenotes}
\begin{document}

\courseheader{EE 571}{Control Systems}{Fall 2025}{Your Name}
\makealllists  % Generate TOC, LOF, LOT

\chapter{Time Domain Analysis}
\section{First-Order Systems}

Content here... Reference: \lectureref{3a}, \textbookref{§2.3}

\problem{System Response}

\subproblem{Calculate the time constant.}
\begin{solution}
The time constant is $\tau = RC = 0.1$ seconds.
\end{solution}

\subproblem{Find the settling time.}
\begin{solution}
The settling time is $t_s = 4\tau = 0.4$ seconds.
\end{solution}

\end{document}
```

### Math with Lecture References
```latex
\section{Transfer Functions}

The standard form is:
\begin{hwmath}
G(s) \eq \frac{K}{\tau s + 1} \\
\tau \gt 0 \text{ for stability}
\end{hwmath}

Reference: \lectureref{4b}, \textbookref{pp. 87-92}
```

### Flexible Sub-problem Numbering
```latex
\problem{First Problem}
% Default: (a), (b), (c)
\subproblem{Part a}
\begin{solution}
Solution...
\end{solution}

\setsubproblemstyle{roman}

\problem{Second Problem}
% Now uses: (i), (ii), (iii)
\subproblem{Part i}
\begin{solution}
Solution...
\end{solution}

\setsubproblemstyle{arabic}
% Now uses: (1), (2), (3)
```

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

### Figure Insertion Examples

#### Single Figure with Label
```latex
% Basic figure with caption and label
\reportfigure[0.8\textwidth]{system-diagram.png}{System Architecture}{fig:architecture}

% Using default width (0.6\textwidth)
\reportfigure{prototype.jpg}{Final Prototype}{fig:prototype}

% Reference the figure in text
As shown in Figure~\ref{fig:architecture}, the system consists of three main components.
```

#### Side-by-Side Figures
```latex
% Two related figures displayed side by side
\reportdualfigure[0.45\textwidth]
    {before-control.jpg}{System Behavior Without Control}{fig:before}
    {after-control.jpg}{System Behavior With Control}{fig:after}

% Reference both figures
Figure~\ref{fig:before} shows the unstable behavior, while 
Figure~\ref{fig:after} demonstrates the improved stability.

% Another example with different sizes
\reportdualfigure[0.4\textwidth]
    {schematic.pdf}{Circuit Schematic}{fig:schematic}
    {pcb-layout.pdf}{PCB Layout}{fig:pcb}
```

**Note**: All figure paths are automatically prefixed with `figures/`, so place your images in a `figures/` subdirectory.

## Poster Examples

Starter template: `templates/poster_template.tex`

Full demo: `examples/postertest.tex`

### Basic Custom-Size Landscape Poster
```latex
\documentclass[size=custom,custom=true,width=121.92,height=91.44,orientation=landscape,scale=1.12]{poster}

\postertitle{Impact of Climate Change on Coral Reefs}
\postersubtitle{A Global Perspective}
\posterauthor{Jane Doe, John Smith, Sarah Johnson}
\posterinstitution{University of Kentucky}
\posterfooter{jane.doe@uky.edu | UK Research Symposium}

\begin{document}
\begin{frame}[t]
\makeposterheader
\startcolumns

\begin{column}{0.32\textwidth}
\begin{posterbox}{Background and Motivation}
Coral reefs are among the most biodiverse ecosystems on Earth, supporting
over 25\% of marine species despite covering less than 1\% of the ocean floor.
\end{posterbox}
\end{column}

\begin{column}{0.32\textwidth}
\begin{lightposterbox}{Research Approach}
We analyzed temperature and pH data from 50 reef sites over 20 years
using advanced statistical modeling techniques.
\end{lightposterbox}
\end{column}

\begin{column}{0.32\textwidth}
\begin{accentbox}
We found a 1.2°C average temperature increase at reef sites,
correlating with 35\% bleaching events in affected areas.
\end{accentbox}
\end{column}

\stopcolumns
\makeposterfooter
\end{frame}
\end{document}
```

### A0 Poster with Custom Colors
```latex
\documentclass[size=a0,orientation=landscape,scale=1.08]{poster}

\setprimarycolor{0,102,204}
\setaccentcolor{255,120,20}

\postertitle{Machine Learning for Medical Imaging}
\posterauthor{Dr. Jane Walker, Medical AI Lab}
\posterinstitution{University of Kentucky}
\posterleftlogo{figures/uk-logo.png}

\begin{document}
\begin{frame}[t]
\makeposterheader
\startcolumns

\begin{column}{0.49\textwidth}
\begin{posterbox}{Deep Learning Model}
Custom CNN trained on 10,000 annotated images
\end{posterbox}
\end{column}

\begin{column}{0.49\textwidth}
\begin{accentbox}
\textbf{Accuracy: 96.5\%}

Sensitivity: 94.2\% | Specificity: 97.8\%
\end{accentbox}
\end{column}

\stopcolumns
\end{frame}
\end{document}
```

### Poster with Images and References
```latex
\section{Experimental Setup}
\begin{posterbox}{Apparatus}
\includegraphics[width=0.95\linewidth]{apparatus.jpg}
\end{posterbox}

\section{References}
\begin{accentbox}
\small
[1] Smith, J. (2024). Recent advances. \textit{Journal}, 45(3), 234-251.

[2] Johnson, K. (2023). Data analysis. \textit{Research}, 12(1), 45-62.
\end{accentbox}
```

## Playscript Examples

Starter template: `playscript_template.tex`

Full demo: `playscripttest.tex`

Simple demo: `playscript_simple_test.tex`

### Basic Dialogue Structure
```latex
\speaker{HAMLET}
\dialogue{To be, or not to be, that is the question.}

\speaker{OPHELIA}
\dialogue{Good my lord, how does your honor for this many a day?}
```

### Dialogue with Parentheticals
```latex
\speaker{MACBETH}
\paren{aside}
\dialogue{If chance will have me king, why, chance may crown me
Without my stir.}
```

### Stage Directions
```latex
% Short stage direction (centered)
\stagedirection{Enter HAMLET carrying a skull}

% Long stage direction block
\begin{stage}
HAMLET crosses to the window and looks out over the battlements.
The ghost appears behind him, visible only to the audience.
Thunder rumbles in the distance.
\end{stage}
```

### Scene Structure
```latex
\act{I}

\scene{A room in the castle}

\begin{scenedesc}
The room is dimly lit by torches. A large table sits center stage
with chairs around it. Heavy curtains cover the windows.
\end{scenedesc}

\speaker{FIRST CHARACTER}
\dialogue{The scene is set for our discussion.}
```

### Multiple Speakers
```latex
\speaker{ROMEO}
\dialogue{What shall I swear by?}

\speaker{JULIET}
\dialogue{Do not swear at all.}

\speaker{ROMEO}
\dialogue{If my heart's dear love---}

\speaker{JULIET}
\dialogue{Well, do not swear.}
```

### Special Commands
```latex
% Pause in dialogue
\speaker{HAMLET}
\dialogue{I must be cruel only to be kind.}

\beat

\dialogue{Thus bad begins, and worse remains behind.}

% Continuing dialogue from previous page
\speaker{HAMLET}
\continuing
\dialogue{As I was saying before we were interrupted...}

% Transitions
\fadein     % Start of play
\curtain    % End of act
\fadeout    % End of play
```

## Tips

- Keep problem statements concise; use sub-problems to break down tasks.
- Prefer the provided math environments for aligned derivations.
- Use captions on listings when you need to reference them in text.
- For capstone reports, keep section order consistent week over week.
- For design reports, ensure all required sections are included and properly formatted.
- For playscripts, use the simplified `\dialogue{text}` syntax for easy writing.

## Troubleshooting

- **Missing Figures**: Ensure all figure paths are correct and files are in the `figures/` directory.
- **Bibliography Issues**: Ensure `.bib` file is included and `\addbibresource{}` is used.
- **Compilation Errors**: Run `pdflatex` twice for proper cross-references.

## Support

For additional help:
- Refer to the class-specific guides in the `docs/` directory.
- Review the example files in the `examples/` directory.
- Consult LaTeX documentation for advanced usage.
