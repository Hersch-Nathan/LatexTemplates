# Examples and Tutorials

This page links to working examples and shows common patterns for both classes.

## Homework examples

Starter template: `homework_template.tex`

Full feature demo: `homeworktest.tex`

### Problem sets with math
```latex
\problem{Analyze the system}
\begin{hwmath}
G(s) \eq \frac{10}{s(s+2)} \\
\text{Design } G_c(s) \eq K_p + K_i/s + K_d s \\
|G(j\omega)| \gt 1 \text{ for } \omega \lt 2 \\
f(x) \ggt 0 \text{ for all } x
\end{hwmath}
```

### Example boxes
```latex
\begin{example}{Example 3-2: Frequency Analysis}
For $H(s) = \frac{1}{s+1}$, find the magnitude at $\omega = 1$:
$$|H(j1)| = \frac{1}{\sqrt{2}} \approx 0.707$$
\end{example}
```

### Code blocks
```latex
\begin{hwpython}[caption=Computation]
import numpy as np
x = np.linspace(0,1,5)
\end{hwpython}
```

### Terminal output
```latex
\begin{hwterminal}[caption=Solver Output]
$ python solve.py
Converged in 12 iterations
\end{hwterminal}
```

### Block diagrams

Simple feedback system:
```latex
\begin{hwblocks}[scale=0.8]
\bXInput[r]{A} 
\bXComp{B}{A}
\bXBlocL{C}{$G_c(s)$}{B}
\bXBlocL{D}{$G_p(s)$}{C}
\bXOutput[3]{E}{D}
\bXLink[$r$]{A}{B}
\bXLink[$u$]{C}{D}
\bXLink[$y$]{D}{E}
\bXReturn{D-E}{B}{$H(s)$}
\end{hwblocks}
```

Complex multi-input system with branches:
```latex
\begin{hwblocks}[scale=0.7]
\bXInput[r]{A}
\bXCompSum{B}{A}{+}{-}{+}{}
\bXChain[1.5]{B}{C/$G_1(s)$,D/$G_2(s)$}
\bXOutput{E}{D}
\bXReturn{D-E}{B}{}
\bXBranchy[-3]{A}{F}
\bXBlocL{G}{Disturbance}{F}
\bXLinkyx{G}{C}
\end{hwblocks}
```

## Capstone report examples

Starter template: `capstone_template.tex`

Full demo: `capstonereporttest.tex`

### Section flow
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

## Tips

- Keep problem statements concise; use sub-problems to break down tasks.
- Prefer the provided math environments for aligned derivations.
- Use captions on listings when you need to reference them in text.
- For capstone reports, keep section order consistent week over week.
