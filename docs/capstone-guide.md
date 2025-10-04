# Capstone Report Class Guide (`capstone_report.cls`)

The `capstone_report` class standardizes weekly/biweekly individual progress reports with consistent headers, sections, figures, and code listings.

**Location**: `capstone_report.cls` (root directory)  
**Template**: `templates/capstone_template.tex`  
**Full Example**: `examples/capstonereporttest.tex`

## Class Overview

The capstone report class provides:
- Automatic headers with report metadata
- Standardized section commands
- Code environments (Python, MATLAB, C++, terminal)
- Figure support with customizable abbreviations
- Consistent formatting with 1-inch margins
- Page headers/footers with report info and page numbers
- Optional course line in header

**Class Options**:
- `weekly` / `biweekly` (default: biweekly)
- `uppercase` / `titlecase` (default: titlecase) — controls section heading style
- `figabbrev` — use "Fig." instead of "Figure" in references

**Required Packages**: geometry, xparse, environ, graphicx, xcolor, listings, fancyhdr, hyperref, titlesec, enumitem, lastpage

## Quick start

```latex
\documentclass[titlecase]{capstone_report}

\begin{document}
% \progressreport{report#}{name}{team}{team#}{start-date}{end-date}[course]
\progressreport{01}{First Last}{Project/Team Name}{12}{Sep 1, 2025}{Sep 14, 2025}[Course Name: Capstone Design]
\makeheader

\reportIntroduction
\reportProjectDescription
\reportProgressSummary
\reportMyPlan
\reportWorkAccomplished
\reportProblems
\reportPlans
\reportReqChanges
\reportAssessment
\reportInstructorIssues

\end{document}
```

- Options: `weekly`/`biweekly` (default biweekly), `uppercase`/`titlecase` (default titlecase), `figabbrev` (use Fig. instead of Figure)
- Use `\progressreport` once, then `\makeheader` to render the top matter.

## Standard sections

Use section helpers to keep structure consistent:
- `\reportIntroduction`
- `\reportProjectDescription`
- `\reportProgressSummary`
- `\reportMyPlan` (subsection under Progress Summary)
- `\reportWorkAccomplished` (subsection under Progress Summary)
- `\reportProblems`
- `\reportPlans`
- `\reportReqChanges`
- `\reportAssessment`
- `\reportInstructorIssues`

Inline subheadings: `\subhead{Title:}`

## Figures

Use regular figure environments or the helpers:

```latex
% width (optional), path, caption (include label inside caption text)
\reportfigure[0.6\textwidth]{figures/diagram.pdf}{System Diagram \label{fig:diagram}}

See \figref{\ref{fig:diagram}} for references with Figure/Fig. depending on options.
```

For quick graphics inclusion without a formal figure environment:

```latex
% path, [optional title], [optional scale]
\reportgraphic{figures/image.png}[Circuit Diagram][0.7]
```

Standard LaTeX figures are also supported:
```latex
\begin{figure}[htb]
    \centering
    \includegraphics[width=0.6\textwidth]{path/to/figure.pdf}
    \caption{Example figure}
    \label{fig:example}
\end{figure}
```

For more complex diagrams, consider using external drawing tools and including the output via `\includegraphics`. If you need a separate `\label` command (not inside the caption), use a standard `figure` environment instead of `\reportfigure`.

## Appendices

Create an appendix with a title using:

```latex
\reportappendix{Additional Materials}
```

Note: Appendices are not auto-lettered in the current class; the heading is “Appendix: <Title>”. If you need lettered appendices (A, B, C...), add lettering manually in titles or use a counter in the class.

## Code listings

Environments powered by `listings` with sensible defaults:

- `reportpython`
- `reportmatlab`
- `reportcpp`
- `reportterminal`

```latex
\begin{reportpython}[caption=Data Analysis]
import numpy as np
print(np.mean([1,2,3]))
\end{reportpython}
```

## Headers/footers & metadata

- Header shows report number and period; footer shows "Page X of Y".
- Hyperlinks are enabled via `hyperref` and PDF metadata is set from `\progressreport`.

## Example files

- `capstone_template.tex` — Minimal starter
- `capstonereporttest.tex` — Full, compile-ready demo
