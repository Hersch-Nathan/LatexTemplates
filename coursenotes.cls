\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{coursenotes}[2026-01-12 Course Notes Class]

% Load shared base class (but override to use book instead of article)
\LoadClass[]{hwcoursebase}

% Switch to book class for chapter support
\LoadClass{book}

% Re-load required packages from hwcoursebase manually since we're using book
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{listings}
\RequirePackage{xparse}
\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{fix-cm}
\RequirePackage{environ}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{blox}
\RequirePackage{tcolorbox}
\RequirePackage{hyperref}
\RequirePackage{subcaption}

% Import custom math macros from hwcoursebase concept
\newcommand{\der}{\mathop{}\!\mathrm{d}}
\newcommand{\laplace}{\mathcal{L}}
\newcommand{\norm}[1]{\left\|#1\right\|}
\newcommand{\conj}[1]{\overline{#1}}
\newcommand{\arr}[1]{\xrightarrow{#1}}
\newcommand{\Arr}[1]{\Longrightarrow\,#1\,\Longrightarrow}
\newcommand{\inner}[2]{\left\langle #1, #2 \right\rangle}
\newcommand{\Real}{\mathbb{R}}
\newcommand{\Complex}{\mathbb{C}}

% Import math environments from hwcoursebase concept
\NewEnviron{mmath}{\par\vspace{0.5em}\begin{align*}\BODY\end{align*}\vspace{0.5em}}
\NewEnviron{mathnumbered}{\par\vspace{0.5em}\begin{align}\BODY\end{align}\vspace{0.5em}}

% Alignment shortcuts
\newcommand{\eq}{&=}
\newcommand{\gt}{&>}
\newcommand{\lt}{&<}
\newcommand{\llt}{&<<}
\newcommand{\ggt}{&>>}
\newcommand{\geqq}{&\geq}
\newcommand{\leqq}{&\leq}
\newcommand{\neqq}{&\neq}
\newcommand{\approxx}{&\approx}

% Code environments
\lstnewenvironment{python}[1][]{\lstset{language=Python, #1}}{}
\lstnewenvironment{matlab}[1][]{\lstset{language=Matlab, #1}}{}
\lstnewenvironment{terminal}[1][]{\lstset{language=bash, basicstyle=\ttfamily\footnotesize\color{black}, backgroundcolor=\color{white}, frame=single, framerule=1pt, rulecolor=\color{gray}, breaklines=true, breakatwhitespace=false, showstringspaces=false, tabsize=4, captionpos=b, numbers=none, xleftmargin=0pt, xrightmargin=0pt, #1}}{}

% Graphics helpers
\NewDocumentCommand{\graphic}{m o o}{\begin{center}\IfValueT{#2}{\textbf{#2}\\[0.5em]}\IfValueTF{#3}{\includegraphics[scale=#3]{#1}}{\includegraphics[width=0.8\textwidth]{#1}}\IfValueT{#2}{\\[0.5em]}\end{center}}
\NewDocumentCommand{\dualfigure}{m m o o m m}{\begin{figure}[htbp]\centering\begin{subfigure}[b]{\IfValueTF{#3}{#3}{0.45\textwidth}}\centering\includegraphics[width=\textwidth]{#1}\caption{#5}\end{subfigure}\hfill\begin{subfigure}[b]{\IfValueTF{#4}{#4}{0.45\textwidth}}\centering\includegraphics[width=\textwidth]{#2}\caption{#6}\end{subfigure}\end{figure}}

% Example and note
\NewDocumentEnvironment{example}{m}{\par\vspace{1em}\begin{tcolorbox}[colback=gray!5, colframe=black, boxrule=1pt, arc=2pt, left=6pt, right=6pt, top=6pt, bottom=6pt, title=\textbf{#1}, fonttitle=\bfseries]}{\end{tcolorbox}\par\vspace{1em}}
\newcommand{\note}[1]{\textcolor{red}{\textbf{#1}}}

% Diagram/block environment
\NewEnviron{diagram}{\par\vspace{0.5em}\begin{center}\begin{tikzpicture}\BODY\end{tikzpicture}\end{center}\vspace{0.5em}}

% Configure hyperref
\hypersetup{colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue, bookmarksnumbered=true, pdfstartview=FitH}

%% ============================================================================
%% HEADER COMMAND
%% ============================================================================

\newcommand{\courseheader}[4]{%
    \begin{center}
        {\fontsize{24pt}{28pt}\selectfont\textbf{#1: #2}}\\[0.5em]
        {\large\textbf{#3}}\\[0.3em]
        {\large\textbf{#4}}\\[1em]
    \end{center}
}

%% ============================================================================
%% COURSENOTES-SPECIFIC PROBLEM AND SOLUTION SYSTEM
%% ============================================================================

% Problem counter - resets with each chapter
\newcounter{cnproblem}[chapter]
\renewcommand{\thecnproblem}{\thechapter.\arabic{cnproblem}}

% Sub-problem counter with flexible styles
\newcounter{cnsubproblem}[cnproblem]
\newcommand{\@cnsubproblemstyle}{alph}  % Default: a, b, c

% Command to change sub-problem style mid-document
\newcommand{\setsubproblemstyle}[1]{%
    \renewcommand{\@cnsubproblemstyle}{#1}%
}

% Format sub-problem label based on current style
\renewcommand{\thecnsubproblem}{%
    \ifnum\pdfstrcmp{\@cnsubproblemstyle}{alph}=0
        (\alph{cnsubproblem})%
    \else\ifnum\pdfstrcmp{\@cnsubproblemstyle}{roman}=0
        (\roman{cnsubproblem})%
    \else\ifnum\pdfstrcmp{\@cnsubproblemstyle}{arabic}=0
        (\arabic{cnsubproblem})%
    \else
        (\alph{cnsubproblem})%
    \fi\fi\fi
}

% Problem command
\newcommand{\problem}[1]{%
    \refstepcounter{cnproblem}%
    \par\vspace{1em}%
    \noindent\textbf{Problem~\thecnproblem}\ifx\empty#1\empty\else\textbf{:} #1\fi%
    \par\vspace{0.5em}%
}

% Sub-problem command with optional custom label
\NewDocumentCommand{\subproblem}{o m}{%
    \refstepcounter{cnsubproblem}%
    \par\vspace{0.5em}%
    \noindent\textbf{\IfValueTF{#1}{#1}{\thecnsubproblem}}~#2%
    \par\vspace{0.25em}%
}

% Solution environment
\NewDocumentEnvironment{solution}{}{%
    \par\vspace{0.25em}%
    \noindent\textit{Solution:}~%
}{%
    \par\vspace{0.5em}%
}

%% ============================================================================
%% REFERENCE COMMANDS
%% ============================================================================

% Lecture reference command
\newcommand{\lectureref}[1]{%
    Lecture~#1%
}

% Textbook reference command
\NewDocumentCommand{\textbookref}{m}{%
    \textit{Textbook}~#1%
}

% Chapter reference wrapper
\newcommand{\chapref}[1]{%
    Chapter~\ref{#1}%
}

% Section reference wrapper
\newcommand{\secref}[1]{%
    Section~\ref{#1}%
}

%% ============================================================================
%% TABLE OF CONTENTS CONFIGURATION
%% ============================================================================

% Customize chapter and section entries in TOC
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

% Commands to generate front matter
\newcommand{\maketoc}{%
    \tableofcontents
    \clearpage
}

\newcommand{\makelof}{%
    \listoffigures
    \clearpage
}

\newcommand{\makelot}{%
    \listoftables
    \clearpage
}

% Combined command to generate all lists
\newcommand{\makealllists}{%
    \maketoc
    \makelof
    \makelot
}

%% ============================================================================
%% END OF CLASS FILE
%% ============================================================================
