# Homework Class Guide (`homework.cls`)

The `homework` class extends `article` with commands and environments for clean, consistent homework writeups: headers, problems/sub-problems, aligned math, code listings, notes, graphics, and appendices.

## Quick start

```latex
\documentclass{homework}

\begin{document}
\hwheader{EE571}{3}{2025-09-01}{Jane Smith}

\problem{Design a PID controller}
Write your solution here.

\end{document}
```

- Header: `\hwheader{Course}{AssignmentNumber}{Date}{Student Name}`
- Problems auto-number; add a title with `\problem{Title}` or custom label `\problem[2.5]{Title}`

## Problems and sub-problems

- Problem: `\problem{Problem title}` or `\problem[custom]{Problem title}` (title is optional)
- Sub-problem label: `\subproblem` or `\subproblem[iii]` (label only) — write the part statement as normal text after the macro

Example:
```latex
\problem{Multi-part example}
\subproblem
Find f'(x)

\subproblem
Evaluate at x=2

\subproblem[iii]
Discuss stability
```

## Math environments

Use the provided math environments to align at equals signs. Inside them, `\eq` is shorthand for `&=`.

- Unnumbered: `hwmath`
- Numbered: `hwmathnumbered`

```latex
\begin{hwmath}
G_{ol}(s) \eq G_c(s) G_p(s) \\
\eq \frac{10(K_d s^2 + K_p s + K_i)}{s^2(s+2)}
\end{hwmath}

\begin{hwmathnumbered}
|G(j\omega)| \eq \frac{10K}{\omega\sqrt{\omega^2 + 4}}
\end{hwmathnumbered}
```

## Code listings

These are wrappers over `listings` with sensible defaults. Pass any `listings` options via `[]`.

- MATLAB: `hwmatlab`
- Python: `hwpython`
- Terminal/console: `hwterminal`

```latex
\begin{hwmatlab}[caption=PID Design]
s = tf('s');
Gp = 10/(s*(s+2));
\end{hwmatlab}

\begin{hwpython}[caption=NumPy Example]
import numpy as np
x = np.linspace(0, 10, 100)
\end{hwpython}

\begin{hwterminal}[caption=Package Installation]
$ pip install control
Collecting control
...
\end{hwterminal}
```

## Notes and highlights

Emphasize important points:
```latex
\note[IMPORTANT: Check stability margins]
\note  % prints "NOTE"
```

## Graphics helper

Center images with optional title and scale.

```latex
% \hwgraphic{path}[Title][scale]
\hwgraphic{figures/plot.pdf}[Response Plot][0.7]
```

## Appendices

Start auto-lettered appendices, optionally with a title:
```latex
\hwappendix
Additional derivations...

\hwappendix[Reference Tables]
Useful constants and tables...
```

## Troubleshooting

- Misplaced alignment tab character `&`: Only use `\eq` (which expands to `&=`) inside alignment-capable math environments like `hwmath`, `hwmathnumbered`, or `align`.
- Code environment errors: Ensure you closed `\begin{...}`/`\end{...}` and used `hwmatlab`, `hwpython`, `hwterminal` (not `matlab`/`python`/`terminal`).
- Spacing: Avoid manual `\vspace`; the class manages spacing around sections and math.

## Files to explore

- `homework_template.tex` — Minimal starter
- `homeworktest.tex` — Full feature demo
