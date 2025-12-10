# Course Notes Class Guide (`coursenotes.cls`)

**Last Updated: December 2025**

The `coursenotes` class extends `book` with commands and environments for comprehensive semester-long course notes: chapter organization, embedded problems with inline solutions, aligned math, code listings, block diagrams, lecture/textbook references, and automatic table of contents generation.

**Location**: `coursenotes.cls` (root directory)  
**Template**: `templates/coursenotes_template.tex`  
**Full Example**: `examples/coursenotestest.tex`

## Class Overview

The course notes class provides:
- Chapter and section organization with automatic numbering
- Embedded homework problems with inline solution display
- Flexible sub-problem numbering (letters, roman numerals, or numbers)
- Math alignment shortcuts for equations (inherited from homework.cls)
- Code environments (Python, MATLAB, terminal)
- Boxed example environments
- Block diagram support with TikZ and Blox
- Graphics insertion helpers with side-by-side support
- Lecture and textbook reference commands
- Automatic Table of Contents, List of Figures, List of Tables
- Cross-referencing support with hyperlinks
- Compact margins optimized for study materials

**Required Packages**: amsmath, amssymb, listings, xparse, geometry, fix-cm, environ, xcolor, graphicx, tikz, blox, tcolorbox, hyperref, subcaption

## Quick Start

```latex
\documentclass{coursenotes}

\begin{document}

\courseheader{EE 571}{Control Systems}{Fall 2025}{Your Name}

\makealllists  % Generate TOC, LOF, LOT

\chapter{Time Domain Analysis} \label{chap:time}

\section{First-Order Systems}

Content here...

\problem{System Response}
Given a first-order system...

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

## Header and Front Matter

### Course Header

```latex
\courseheader{CourseCode}{CourseName}{Semester}{YourName}
```

Example:
```latex
\courseheader{EE 571}{Control Systems}{Fall 2025}{Jane Smith}
```

### Generating Lists

Generate all lists at once:
```latex
\makealllists
```

Or generate individually:
```latex
\maketoc  % Table of Contents
\makelof  % List of Figures
\makelot  % List of Tables
```

## Chapters and Sections

Use standard LaTeX chapter and section commands with labels for cross-referencing:

```latex
\chapter{State-Space Analysis} \label{chap:statespace}

\section{State Variables} \label{sec:statevars}

Content here...

\subsection{Choosing State Variables}

More detailed content...
```

Reference chapters and sections:
```latex
See \chapref{chap:statespace} for more details.
As discussed in \secref{sec:statevars}, we can choose...
```

## Problems and Solutions

### Problem Command

Problems are numbered automatically based on the chapter (e.g., 1.1, 1.2, 2.1, 2.2):

```latex
\problem{Problem Title or Description}
```

Example:
```latex
\problem{PID Controller Design}
Design a PID controller for the given plant transfer function...
```

### Sub-problems with Inline Solutions

Sub-problems and their solutions are displayed inline in sequence:

```latex
\problem{Multi-Part Analysis}

\subproblem{Find the transfer function.}
\begin{solution}
The transfer function is $G(s) = \frac{10}{s(s+2)}$.
\end{solution}

\subproblem{Calculate the poles.}
\begin{solution}
The poles are at $s = 0$ and $s = -2$.
\end{solution}

\subproblem{Determine stability.}
\begin{solution}
The system is marginally stable due to the pole at the origin.
\end{solution}
```

This displays as:
- **Problem 1.1:** Multi-Part Analysis
- **(a)** Find the transfer function.
- *Solution:* The transfer function is...
- **(b)** Calculate the poles.
- *Solution:* The poles are at...
- **(c)** Determine stability.
- *Solution:* The system is marginally stable...

### Custom Sub-problem Labels

Override automatic numbering with custom labels:

```latex
\subproblem[i]{First custom part}
\begin{solution}
Solution to part i.
\end{solution}

\subproblem[ii]{Second custom part}
\begin{solution}
Solution to part ii.
\end{solution}
```

### Flexible Sub-problem Styles

Change sub-problem numbering style mid-document:

```latex
% Default: (a), (b), (c)
\setsubproblemstyle{alph}

% Roman numerals: (i), (ii), (iii)
\setsubproblemstyle{roman}

% Arabic numbers: (1), (2), (3)
\setsubproblemstyle{arabic}
```

Example:
```latex
\problem{First Problem}
\subproblem{Part a}  % (a)
\begin{solution}
Solution...
\end{solution}

\setsubproblemstyle{roman}

\problem{Second Problem}
\subproblem{Part i}  % (i)
\begin{solution}
Solution...
\end{solution}
```

## Math Environments

Inherited from homework.cls, these environments provide aligned equations with shortcuts:

### Alignment Shortcuts

Use these inside `hwmath` or `hwmathnumbered` environments:

- `\eq` for `&=` (equals)
- `\gt` for `&>` (greater than)
- `\lt` for `&<` (less than)
- `\ggt` for `&>>` (much greater than)
- `\llt` for `&<<` (much less than)
- `\geqq` for `&≥` (greater than or equal)
- `\leqq` for `&≤` (less than or equal)
- `\neqq` for `&≠` (not equal)
- `\approxx` for `&≈` (approximately equal)

### Math Environments

**Unnumbered equations:**
```latex
\begin{hwmath}
G_{cl}(s) \eq \frac{G(s)}{1 + G(s)H(s)} \\
\eq \frac{10K}{s^2 + 2s + 10K} \\
|G(j\omega)| \gt 1 \text{ for } \omega \lt \omega_c \\
\text{PM} \geqq 45° \\
\text{Error} \leqq 2\%
\end{hwmath}
```

**Numbered equations:**
```latex
\begin{hwmathnumbered}
\dot{x}(t) \eq Ax(t) + Bu(t) \\
y(t) \eq Cx(t) + Du(t)
\end{hwmathnumbered}
```

## Code Listings

Inherited from homework.cls with sensible defaults. Pass any `listings` options via `[]`.

### MATLAB Code

```latex
\begin{hwmatlab}[caption=State-Space Model]
A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
D = 0;
sys = ss(A,B,C,D);
step(sys);
\end{hwmatlab}
```

### Python Code

```latex
\begin{hwpython}[caption=Control System Simulation]
import control as ct
import numpy as np

# Define transfer function
num = [10]
den = [1, 2, 10]
G = ct.tf(num, den)

# Step response
t, y = ct.step_response(G)
\end{hwpython}
```

### Terminal Output

```latex
\begin{hwterminal}[caption=Package Installation]
$ pip install control
Collecting control
Installing collected packages: control
Successfully installed control-0.9.2
\end{hwterminal}
```

## Notes and Highlights

Emphasize important points:

```latex
\note[IMPORTANT: Stability requires all poles in the left half-plane]

\note  % Prints "NOTE" in red
```

## Example Boxes

Create highlighted example boxes for worked examples:

```latex
\begin{example}{Example 3-1: Root Locus Design}
Given a plant transfer function $G_p(s) = \frac{10}{s(s+2)}$, design 
a controller using root locus method.

\textbf{Solution:}

Step 1: Plot the root locus...

Step 2: Choose the desired closed-loop poles...

Step 3: Calculate the gain K...
\end{example}
```

The example environment creates a lightly shaded box with a bold header, perfect for highlighting worked examples, case studies, or important derivations.

## Graphics

### Single Image

Center images with optional title and scale:

```latex
% \hwgraphic{path}[Title][scale]
\hwgraphic{figures/bode_plot.pdf}[Bode Plot][0.7]
```

### Side-by-Side Images

Display two images side by side with individual captions:

```latex
% \hwdualfigure{image1}{image2}[width1][width2]{caption1}{caption2}
\hwdualfigure{figures/step_response.pdf}{figures/impulse_response.pdf}
    [0.45\textwidth][0.45\textwidth]
    {Step Response}{Impulse Response}
```

You can omit the width parameters to use defaults:
```latex
\hwdualfigure{figures/plot1.pdf}{figures/plot2.pdf}
    {First Plot}{Second Plot}
```

## Block Diagrams with Blox Package

The `hwblocks` environment provides a centered wrapper around `tikzpicture` for creating block diagrams using the blox package. (Full blox documentation inherited from homework.cls - see Block Diagrams section in homework-guide.md for complete details.)

### Basic Control System Example

```latex
\begin{hwblocks}[scale=0.8]
\bXInput[r(s)]{A}
\bXComp{B}{A}
\bXBlocL{C}{$G_c(s)$}{B}
\bXBlocL{D}{$G_p(s)$}{C}
\bXOutput[3]{E}{D}
\bXLink[$r$]{A}{B}
\bXLink[$u$]{C}{D}
\bXLink[$y$]{D}{E}
\bXReturn{D-E}{B}{}
\end{hwblocks}
```

### Common Blox Commands

- `\bXInput[label]{Name}` - Creates input node
- `\bXOutput[distance]{Name}{Previous}` - Creates output node
- `\bXBlocL[distance]{Name}{Content}{Previous}` - Block with automatic link
- `\bXComp{Name}{Previous}` - Comparator (summer with +/- inputs)
- `\bXReturn[distance]{Start-End}{ReturnPoint}{Label}` - Feedback path
- `\bXLink[label]{From}{To}` - Manual link between nodes

For complete blox documentation including advanced features, see the Block Diagrams section in `homework-guide.md`.

## Reference Commands

### Lecture References

Reference lecture numbers for tracking source material:

```latex
\lectureref{12b}
\lectureref{Week 3}
\lectureref{Guest Lecture - Dr. Smith}
```

Displays as: "Lecture 12b", "Lecture Week 3", "Lecture Guest Lecture - Dr. Smith"

### Textbook References

Reference textbook sections or pages:

```latex
\textbookref{§3.2}
\textbookref{pp. 45-47}
\textbookref{Chapter 5}
```

Displays as: "*Textbook* §3.2", "*Textbook* pp. 45-47", "*Textbook* Chapter 5"

### Chapter and Section References

Use wrapper commands for consistent formatting:

```latex
See \chapref{chap:frequency} for frequency domain methods.
As shown in \secref{sec:nyquist}, the Nyquist criterion...
```

Or use standard LaTeX `\ref{}`:
```latex
In Chapter~\ref{chap:frequency}, we discussed...
```

### Problem References

Problems can be labeled and referenced:

```latex
\problem{System Identification} \label{prob:sysid}

Later in the document:
As solved in Problem~\ref{prob:sysid}, the system parameters are...
```

## Cross-References and Hyperlinks

The class automatically loads `hyperref` for clickable PDF links. All references become clickable in the PDF output.

Label any numbered element and reference it:

```latex
% Chapters
\chapter{State-Space Methods} \label{chap:statespace}
See \chapref{chap:statespace}...

% Sections
\section{Observability} \label{sec:observability}
In \secref{sec:observability}, we showed...

% Equations
\begin{hwmathnumbered}
\dot{x} \eq Ax + Bu \label{eq:stateeq}
\end{hwmathnumbered}
Equation~\ref{eq:stateeq} describes...

% Figures
\begin{figure}
\hwgraphic{plot.pdf}[Phase Portrait]
\caption{System phase portrait}
\label{fig:phase}
\end{figure}
See Figure~\ref{fig:phase}...

% Problems
\problem{Controllability Test} \label{prob:control}
Problem~\ref{prob:control} demonstrates...
```

## Troubleshooting

### Common Issues

1. **Missing Packages**: Ensure all required LaTeX packages are installed (especially `blox` and `subcaption`).
2. **Figure Not Found**: Check file paths and extensions.
3. **Cross-references**: Run pdflatex twice for proper references.
4. **Hyperref Warnings**: Run pdflatex multiple times to resolve all links.
5. **Chapter Numbering**: Ensure you're using `\chapter{}` not `\section{}` for top-level organization.

### Book Class Specifics

The `coursenotes` class uses the `book` base class, which has some differences from `article`:
- Chapters are available and expected
- Odd pages start on the right (use `openany` option to change)
- Different default page numbering (roman for front matter, arabic for main content)

### Reference System

- Always run pdflatex at least twice for proper cross-references
- Use descriptive label names: `chap:name`, `sec:name`, `fig:name`, `eq:name`, `prob:name`
- Check the `.log` file for undefined references

## Best Practices

### Organization

- Use one chapter per major topic or week of course material
- Include lecture and textbook references at the start of each section
- Group related problems at the end of each chapter
- Use the automatic TOC to navigate large documents

### Content

- Write clear problem statements before solutions
- Use inline solutions immediately after each sub-problem
- Include worked examples in `example` environments
- Reference earlier chapters and problems when building on concepts

### Technical

- Keep figures at appropriate resolution (300 DPI for raster images)
- Use vector graphics (PDF, EPS) when possible
- Use consistent naming conventions for labels
- Compile document frequently to catch errors early

### Study Materials

- Use bold or colors sparingly for emphasis
- Include both theoretical content and practical problems
- Cross-reference related topics to build connections
- Add notes to highlight common mistakes or key concepts

## Support

For additional help:
- Check existing template files in the repository
- Review the example file (`coursenotestest.tex`) for comprehensive usage
- Consult the homework class guide for additional code/math environment details
- Review LaTeX documentation for standard `book` class features

The `coursenotes.cls` provides a comprehensive foundation for creating professional course notes and study materials while maintaining clean, consistent formatting throughout semester-long content.
