# Homework Class Guide (`homework.cls`)

The `homework` class extends `article` with commands and environments for clean, consistent homework writeups: headers, problems/sub-problems, aligned math, code listings, notes, graphics, and appendices.

**Location**: `homework.cls` (root directory)  
**Template**: `templates/homework_template.tex`  
**Full Example**: `examples/homeworktest.tex`

## Class Overview

The homework class provides:
- Automatic problem and sub-problem numbering
- Math alignment shortcuts for equations
- Code environments (Python, MATLAB, terminal)
- Boxed example environments
- Block diagram support with TikZ and Blox
- Graphics insertion helpers
- Appendix formatting
- Compact margins and spacing optimized for homework

**Required Packages**: amsmath, listings, xparse, geometry, fix-cm, environ, xcolor, graphicx, tikz, blox, tcolorbox

## Quick Start

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

## Problems and Sub-problems

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

## Math Environments

Use the provided math environments to align at equals signs and comparison operators. Inside them, you can use alignment shortcuts:

- `\eq` for `&=` (equals)
- `\gt` for `&>` (greater than)
- `\lt` for `&<` (less than)
- `\ggt` for `&>>` (much greater than)
- `\llt` for `&<<` (much less than)
- `\geqq` for `&≥` (greater than or equal)
- `\leqq` for `&≤` (less than or equal)
- `\neqq` for `&≠` (not equal)
- `\approxx` for `&≈` (approximately equal)

Math environments:
- Unnumbered: `hwmath`
- Numbered: `hwmathnumbered`

```latex
\begin{hwmath}
G_{ol}(s) \eq G_c(s) G_p(s) \\
\eq \frac{10(K_d s^2 + K_p s + K_i)}{s^2(s+2)} \\
|G(j\omega)| \gt 1 \text{ for } \omega < 2 \\
|G(j\omega)| \llt 1 \text{ for } \omega \ggt 10 \\
\omega_c \geqq 5 \text{ rad/s} \\
\text{PM} \geqq 45° \\
\text{Error} \leqq 2\% \\
K_p \neqq 0 \\
G(s) \approxx H(s) \text{ for high frequencies}
\end{hwmath}

\begin{hwmathnumbered}
|G(j\omega)| \eq \frac{10K}{\omega\sqrt{\omega^2 + 4}} \\
f(x) \gt 0 \text{ for all } x \gt -1
\end{hwmathnumbered}
```

## Code Listings

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

## Notes and Highlights

Emphasize important points:
```latex
\note[IMPORTANT: Check stability margins]
\note  % prints "NOTE"
```

## Example Boxes

Create highlighted example boxes with custom headers for important worked examples:

```latex
\begin{example}{Example 5-1: PID Controller Design}
Given a plant transfer function $G_p(s) = \frac{10}{s(s+2)}$, design a PID controller 
to meet the following specifications:
\begin{itemize}
\item Steady-state error $< 2\%$ for step input
\item Phase margin $> 45^\circ$
\item Gain margin $> 6$ dB
\end{itemize}

Solution: Using root locus design...
\end{example}
```

The example environment creates a lightly shaded box with a bold header, perfect for highlighting worked examples, case studies, or important derivations.

## Graphics Helper

Center images with optional title and scale.

```latex
% \hwgraphic{path}[Title][scale]
\hwgraphic{figures/plot.pdf}[Response Plot][0.7]
```

## Block Diagrams with Blox Package

The `hwblocks` environment provides a centered wrapper around `tikzpicture` for creating block diagrams using the blox package. It automatically loads tikz and blox packages, so you can use blox commands directly without extra `\usepackage` lines.

The blox package is designed for creating control system block diagrams and algorithm flowcharts. It builds diagrams linearly from left to right, starting with an input and ending with an output.

### Design Philosophy

Block diagrams are built by creating nodes first, then connecting them with links. The order is important: you must create both endpoints before making the connecting line. This follows the pattern: "make block, make block, make connecting link" rather than "make block, make link, make block."

### Basic Usage

```latex
\begin{hwblocks}
\node (a) at (0,0) {A}; 
\node (b) at (2,0) {B}; 
\draw[->] (a)--(b);
\end{hwblocks}
```

### Input and Output Nodes

Every block diagram starts with an input and ends with an output:

```latex
\begin{hwblocks}
\bXInput[Input Label]{A}    % Creates input node named A
\bXOutput[2]{B}{A}          % Creates output B at distance 2 from A
\bXLink{A}{B}               % Links A to B
\end{hwblocks}
```

- `\bXInput[label]{Name}` - Creates an input node. Label is optional (can be blank or omitted entirely)
- `\bXOutput[distance]{Name}{PreviousNode}` - Creates an output node at specified distance (default: 2 em units)

### Block Creation Commands

The blox package provides several block types:

#### Basic Blocks

```latex
\begin{hwblocks}
\bXInput{A}
\bXBloc[2]{B}{$G_p(s)$}{A}          % Basic block
\bXBlocL[2]{C}{$G_c(s)$}{B}         % Block with automatic link from previous
\bXOutput{D}{C}
\bXLink{A}{B}                        % Manual link needed for \bXBloc
\bXLink{C}{D}                        % Manual link for output
\end{hwblocks}
```

- `\bXBloc[distance]{Name}{Contents}{PreviousNode}` - Creates a rectangular block
- `\bXBlocL[distance]{Name}{Contents}{PreviousNode}` - Block with automatic link from previous node

#### Feedback/Return Blocks

For blocks on feedback paths:

```latex
\begin{hwblocks}
\bXInput{A}
\bXBlocL{B}{$G(s)$}{A}
\bXOutput{C}{B}
\bXBlocr[2]{D}{$H(s)$}{A}           % Return/feedback block (goes left)
\bXBlocrL[3]{E}{$K$}{D}             % Return block with automatic link
\end{hwblocks}
```

- `\bXBlocr[distance]{Name}{Contents}{PreviousNode}` - Block for feedback path (placed to the left)
- `\bXBlocrL[distance]{Name}{Contents}{PreviousNode}` - Feedback block with automatic link

#### Special Block Shapes

```latex
\begin{hwblocks}
\bXInput{A}
\bXBlocPotato[2]{B}{Nonlinear}{A}   % Creates oval/"potato" shaped block
\bXOutput{C}{B}
\bXLink{A}{B}
\bXLink{B}{C}
\end{hwblocks}
```

### Comparators and Summing Junctions

Blox provides several commands for creating comparison and summing nodes:

#### Simple Comparators

```latex
\begin{hwblocks}
\bXInput{A}
\bXComp{B}{A}                       % Standard comparator (+ input, - feedback)
\bXBlocL{C}{$G(s)$}{B}
\bXOutput{D}{C}
\bXReturn{C-D}{B}{$H(s)$}           % Feedback path
\end{hwblocks}
```

#### Summing Junctions

```latex
\begin{hwblocks}
\bXInput{A}
\bXSuma{B}{A}                       % Sum with input from above
\bXSumb{C}{B}                       % Sum with input from below
\bXOutput{D}{C}
\end{hwblocks}
```

#### General Comparator/Summer

For custom configurations:

```latex
\begin{hwblocks}
\bXInput{A}
\bXCompSum{B}{A}{+}{-}{+}{}         % General: North, South, West, East labels
\bXBlocL{C}{$G(s)$}{B}
\bXOutput{D}{C}
\end{hwblocks}
```

- Arguments: `{Name}{PreviousNode}{North}{South}{West}{East}`
- Use `\bXCompSum*` for labels outside the circle (cleaner appearance)

### Linking Nodes

Various link types for different connection patterns:

#### Basic Links

```latex
\begin{hwblocks}
\bXInput{A}
\bXBlocL{B}{$G_1(s)$}{A}
\bXBlocL{C}{$G_2(s)$}{B}
\bXOutput{D}{C}
\bXLink[Signal]{A}{B}               % Link with label
\end{hwblocks}
```

#### Right-Angle Links

```latex
\begin{hwblocks}
\bXInput{A}
\bXBlocL{B}{$G(s)$}{A}
\bXBranchy[-3]{B}{E}                % Create branch point below B
\bXBlocL{F}{$H(s)$}{E}
\bXLinkxy{B}{F}                     % Horizontal then vertical link
\bXLinkyx{F}{A}                     % Vertical then horizontal link
\end{hwblocks}
```

#### Specialized Links

```latex
\begin{hwblocks}
\bXInput{A}
\bXBlocL{B}{$G(s)$}{A}
\bXBranchy[-2]{B}{C}
\bXLinktyx{B}{C}                    % Top-center to horizontal connection
\bXLinktb{A}{C}                     % Top-to-bottom straight line
\end{hwblocks}
```

### Return/Feedback Paths

Create feedback loops with the return command:

```latex
\begin{hwblocks}
\bXInput{A}
\bXComp{B}{A}
\bXBlocL{C}{$G(s)$}{B}
\bXOutput{D}{C}
\bXReturn[2]{C-D}{B}{$H(s)$}        % Creates feedback with block
\end{hwblocks}
```

- `\bXReturn[distance]{StartNode}{EndNode}{Label}`
- Distance controls how far down the return line goes before going left
- Creates a node `StartNode-EndNode` at the junction point

### Chains and Automation

For multiple blocks in series:

```latex
\begin{hwblocks}
\bXInput{A}
\bXChain[1.5]{A}{B/$G_1(s)$,C/$G_2(s)$,D/$G_3(s)$}
\bXOutput{E}{D}
\bXLink{D}{E}
\end{hwblocks}
```

Chain for feedback systems:

```latex
\begin{hwblocks}
\bXInput{A}
\bXLoop[2]{A}{B/$G_c(s)$,C/$G_p(s)$}  % Creates comparator + chain + feedback
\end{hwblocks}
```

### Branching and Multi-Path Diagrams

Create new branches for complex diagrams:

```latex
\begin{hwblocks}
\bXInput{A}
\bXBlocL{B}{$G(s)$}{A}
\bXOutput{C}{B}
\bXBranchx[3]{B}{D}                 % Horizontal branch from B
\bXBranchy[-2]{B}{E}                % Vertical branch from B
\bXBlocL{F}{$H_1(s)$}{D}
\bXBlocL{G}{$H_2(s)$}{E}
\end{hwblocks}
```

### Styling and Customization

Customize appearance using tikz styling:

```latex
\begin{hwblocks}
\bXLineStyle{red, thick}            % Change line style
\bXStyleBloc{fill=blue!20, rounded corners}  % Change block style
\bXInput{A}
\bXBlocL{B}{$G(s)$}{A}
\bXDefaultLineStyle                 % Reset to default line style
\bXStyleBlocDefault                 % Reset to default block style
\bXOutput{C}{B}
\end{hwblocks}
```

### Complete Example: PID Control System

```latex
\begin{hwblocks}[scale=0.8]
\bXInput[r(s)]{A}
\bXCompSum{B}{A}{}{-}{+}{}
\bXLink[$r(s)$]{A}{B}
\bXBlocL{C}{PID}{B}
\bXBlocL{D}{Plant}{C}
\bXOutput[3]{E}{D}
\bXLink[$u$]{C}{D}
\bXLink[$y$]{D}{E}
\bXReturn{D-E}{B}{$H(s)$}
\end{hwblocks}
```

## Troubleshooting

### Common Issues

1. **Missing Packages**: Ensure all required LaTeX packages are installed.
2. **Figure Not Found**: Check file paths and extensions.
3. **Cross-references**: Run pdflatex twice for proper references.
4. **Font Issues**: Ensure Times fonts are installed.

### Class Options Conflicts

- Use only one layout option: `onecolumn` OR `twocolumn`
- Use only one mode: `draft` OR `final`

## Best Practices

### Organization
- Use consistent section ordering.
- Include all required sections.
- Maintain professional formatting.

### Content
- Write clear, concise problem statements.
- Include proper derivations and solutions.
- Use professional language throughout.

### Technical
- Keep figures at appropriate resolution.
- Use vector graphics when possible.
- Maintain consistent naming conventions.

## Support

For additional help:
- Check existing template files in the repository.
- Review the class source code for advanced customization.
- Consult LaTeX documentation for standard commands.

The `homework.cls` provides a solid foundation for professional homework submissions while maintaining the flexibility needed for diverse academic requirements.
