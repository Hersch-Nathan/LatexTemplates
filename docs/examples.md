# Examples

This is the primary usage reference. Use starter templates for new documents and full examples for feature coverage.

## Layout

- Starters: `templates/*.tex`
- Full demos: `examples/*.tex`
- Output previews: tracked `*.pdf` files in `templates/` and `examples/`

## By class

### Course notes

- Starter: `templates/coursenotes_template.tex`
- Full demo: `examples/coursenotestest.tex`
- Typical features: chapter workflow, problem/solution blocks, lecture/textbook references.

### Homework

- Starter (standard mode): `templates/homework_template.tex`
- Starter (part numbering mode): `templates/homework_partnumbering_template.tex`
- Full demos: `examples/homeworktest.tex`, `examples/homeworktest_partnumbering.tex`
- Typical features: problem/subproblem numbering, math blocks, code blocks, terminal blocks.

### Capstone report

- Starter: `templates/capstone_template.tex`
- Full demo: `examples/capstonereporttest.tex`
- Typical features: reporting-period header, structured report sections, report figures.

### Design report

- Starter: `templates/designreport_template.tex`
- Full demo: `examples/designreporttest.tex`
- Typical features: title/front matter, engineering requirements tables, bibliography usage.

### Playscript

- Starter: `templates/playscript_template.tex`
- Full demos: `examples/playscripttest.tex`, `examples/playscript_simple_test.tex`
- Typical features: character lists, act/scene structure, dialogue formatting.

### Engineering resume

- Starter: `templates/engresume_template.tex`
- Full demo: `examples/engresumetest.tex`
- Typical features: ATS-friendly single-column layout, section divider lines, auto-linked contact fields, compact experience blocks, IEEE-style citation support.
- Bibliography example file for starter: `templates/engresume_references.bib`
- Citation command: `\resumecitation{bibtex_key}`
- Build from `templates/`: `TEXINPUTS="..:$TEXINPUTS" latexmk -pdf engresume_template.tex`

Resume header usage now uses a name-only header and one or more 3-field subheader lines:

```latex
\header{Full Name}
\subheader{email@example.com}{(000) 000-0000}{City, ST}
\subheader{portfolio.example.com}{linkedin.com/in/username}{github.com/username}
```

Resume appearance customization commands:

```latex
% Vertical spacing between lines/items (default 1.00)
\setresumelinespacing{1.02}

% Base font family (examples: \rmdefault, \sfdefault)
\setresumefontfamily{\sfdefault}

% Base font size and baseline skip
\setresumefontsize{11pt}{13.2pt}

% Optional section divider controls
\setresumesectiondividerthickness{0.5pt}
\resumesectiondivideroff % or \resumesectiondivideron
```

## Quick patterns

### Math environments with page breaking

The `mmath` and `mathnumbered` environments automatically support page breaking for long mathematical derivations. This allows multi-page derivations to be written in a single environment block without manual splitting.

**Features:**
- `mmath`: Unnumbered aligned math (uses `align*` internally)
- `mathnumbered`: Numbered equations (uses `align` internally)
- Both support automatic page breaking with `\allowdisplaybreaks[1]`

**Example – Long derivation spanning multiple pages:**
```latex
\problem{Complete backpropagation derivation}

This derivation spans multiple pages without requiring manual breaks.

\begin{mmath}
\text{Layer 1: } \mathbf{z}^{(1)} &= \mathbf{W}^{(1)}\mathbf{x} + \mathbf{b}^{(1)} \\
\mathbf{a}^{(1)} &= \sigma(\mathbf{z}^{(1)}) \\
\text{Layer 2: } \mathbf{z}^{(2)} &= \mathbf{W}^{(2)}\mathbf{a}^{(1)} + \mathbf{b}^{(2)} \\
\mathbf{a}^{(2)} &= \sigma(\mathbf{z}^{(2)}) \\
% ... continues for many more lines across pages
\text{Gradients: } \nabla_{\mathbf{W}^{(1)}} L &= \frac{1}{m}\mathbf{dz}^{(1)}\mathbf{x}^T
\end{mmath}
```

**Page break penalties:** The environments use `\allowdisplaybreaks[1]` for soft penalties on page breaks. To adjust:
- `[1]`: Encourage breaks (default) – allows good page breaks
- `[4]`: Strict breaks only at line endings – minimizes breaks
- Modify by redefining the environment if stricter control is needed

**Full test example:** See `examples/homeworktest_pagebreak.tex` for a complete multi-page derivation test case.

### Homework with part numbering

```latex
\documentclass[partnumbering]{homework}
\begin{document}
\hwheader{EE599/699}{1}{Fall 2026}{Your Name}
\hwpart{Part One}
\problem{Main problem}
\subproblem{Subproblem title}
\end{document}
```

### Course notes problem with solution

```latex
\problem{System response}
\subproblem{Find settling time}
\begin{solution}
For a first-order response, use $t_s \approx 4\tau$.
\end{solution}
```

### Design report bibliography setup

```latex
\documentclass[final]{designreport}
\addbibresource{references.bib}
```

## Build notes

Use standard LaTeX compilation in your document folder:

```bash
latexmk -pdf yourdocument.tex
```

If compiling from inside `examples/` or `templates/`, include parent path so class/style files are found:

```bash
TEXINPUTS="..:$TEXINPUTS" latexmk -pdf homeworktest.tex
```

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
