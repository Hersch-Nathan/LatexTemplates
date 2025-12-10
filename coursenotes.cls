\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{coursenotes}[2025-12-10 Course Notes Class]

% Load base class - using book for chapter support
\LoadClass{book}

% Required packages
\RequirePackage{amsmath}          % Advanced math environments
\RequirePackage{amssymb}          % Math symbols
\RequirePackage{listings}         % Code listings
\RequirePackage{xparse}           % Advanced command definitions
\RequirePackage[margin=0.5in]{geometry}  % Compact margins like homework.cls
\RequirePackage{fix-cm}           % Fix computer modern font sizes
\RequirePackage{environ}          % Environment creation
\RequirePackage{xcolor}           % Color support
\RequirePackage{graphicx}         % Graphics inclusion
\RequirePackage{tikz}             % Drawing package
\RequirePackage{blox}             % Block diagram package
\RequirePackage{tcolorbox}        % Colored boxes for examples
\RequirePackage{hyperref}         % Hyperlinks and cross-references
\RequirePackage{subcaption}       % For side-by-side figures

% Configure hyperref for better PDF output
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    citecolor=blue,
    urlcolor=blue,
    bookmarksnumbered=true,
    pdfstartview=FitH
}

% =============================================================================
% HEADER COMMAND
% =============================================================================

\newcommand{\courseheader}[4]{%
    \begin{center}
        {\fontsize{24pt}{28pt}\selectfont\textbf{#1: #2}}\\[0.5em]
        {\large\textbf{#3}}\\[0.3em]
        {\large\textbf{#4}}\\[1em]
    \end{center}
}

% =============================================================================
% MATH ENVIRONMENTS (inherited from homework.cls)
% =============================================================================

% Custom math environment with left-justified equals alignment
\NewEnviron{hwmath}{%
    \par\vspace{0.5em}%
    \begin{align*}%
    \BODY%
    \end{align*}%
    \vspace{0.5em}%
}

% Numbered math environment
\NewEnviron{hwmathnumbered}{%
    \par\vspace{0.5em}%
    \begin{align}%
    \BODY%
    \end{align}%
    \vspace{0.5em}%
}

% Math alignment shortcuts
\newcommand{\eq}{&=}
\newcommand{\gt}{&>}
\newcommand{\lt}{&<}
\newcommand{\llt}{&<<}
\newcommand{\ggt}{&>>}
\renewcommand{\geqq}{&\geq}
\renewcommand{\leqq}{&\leq}
\newcommand{\neqq}{&\neq}
\newcommand{\approxx}{&\approx}

% =============================================================================
% CODE ENVIRONMENTS (inherited from homework.cls)
% =============================================================================

% MATLAB code environment
\lstnewenvironment{hwmatlab}[1][]{%
    \lstset{language=Matlab, #1}%
}{}

% Python code environment
\lstnewenvironment{hwpython}[1][]{%
    \lstset{language=Python, #1}%
}{}

% Terminal output environment
\lstnewenvironment{hwterminal}[1][]{%
    \lstset{
        language=bash,
        basicstyle=\ttfamily\footnotesize\color{black},
        backgroundcolor=\color{white},
        frame=single,
        framerule=1pt,
        rulecolor=\color{gray},
        breaklines=true,
        breakatwhitespace=false,
        showstringspaces=false,
        tabsize=4,
        captionpos=b,
        numbers=none,
        xleftmargin=0pt,
        xrightmargin=0pt,
        #1
    }%
}{}

% =============================================================================
% GRAPHICS AND EXAMPLES (inherited from homework.cls)
% =============================================================================

% Graphics inclusion with optional title and scale
\NewDocumentCommand{\hwgraphic}{m o o}{%
    \begin{center}%
        \IfValueT{#2}{\textbf{#2}\\[0.5em]}%
        \IfValueTF{#3}{%
            \includegraphics[scale=#3]{#1}%
        }{%
            \includegraphics[width=0.8\textwidth]{#1}%
        }%
        \IfValueT{#2}{\\[0.5em]}%
    \end{center}%
}

% Dual figure helper for side-by-side images
\NewDocumentCommand{\hwdualfigure}{m m o o m m}{%
    \begin{figure}[htbp]
        \centering
        \begin{subfigure}[b]{\IfValueTF{#3}{#3}{0.45\textwidth}}
            \centering
            \includegraphics[width=\textwidth]{#1}
            \caption{#5}
        \end{subfigure}
        \hfill
        \begin{subfigure}[b]{\IfValueTF{#4}{#4}{0.45\textwidth}}
            \centering
            \includegraphics[width=\textwidth]{#2}
            \caption{#6}
        \end{subfigure}
    \end{figure}
}

% Note command for highlighting
\NewDocumentCommand{\note}{o}{%
    \IfValueTF{#1}{%
        {\Large\textbf{\textcolor{red}{#1}}}%
    }{%
        {\Large\textbf{\textcolor{red}{NOTE}}}%
    }%
}

% Example environment with colored box
\NewDocumentEnvironment{example}{m}{%
    \par\vspace{1em}%
    \begin{tcolorbox}[
        colback=gray!5,
        colframe=black,
        boxrule=1pt,
        arc=2pt,
        left=6pt,
        right=6pt,
        top=6pt,
        bottom=6pt,
        title=\textbf{#1},
        fonttitle=\bfseries
    ]%
}{%
    \end{tcolorbox}%
    \par\vspace{1em}%
}

% =============================================================================
% BLOCK DIAGRAMS (inherited from homework.cls)
% =============================================================================

% Block diagram environment with centered tikzpicture
\NewEnviron{hwblocks}[1][]{%
    \par\vspace{0.5em}%
    \begin{center}%
        \begin{tikzpicture}[#1]%
            \BODY%
        \end{tikzpicture}%
    \end{center}%
    \vspace{0.5em}%
}

% =============================================================================
% PROBLEM AND SOLUTION SYSTEM
% =============================================================================

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

% Format sub-problem label based on current style (override default counter format)
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

% Solution environment - displays inline after problem parts
\NewDocumentEnvironment{solution}{}{%
    \par\vspace{0.25em}%
    \noindent\textit{Solution:}~%
}{%
    \par\vspace{0.5em}%
}

% =============================================================================
% REFERENCE COMMANDS
% =============================================================================

% Lecture reference command
\newcommand{\lectureref}[1]{%
    Lecture~#1%
}

% Textbook reference command with smart parsing
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

% =============================================================================
% TABLE OF CONTENTS CONFIGURATION
% =============================================================================

% Customize chapter and section entries in TOC
\setcounter{tocdepth}{2}  % Show chapters, sections, and subsections
\setcounter{secnumdepth}{3}  % Number up to subsubsections

% Commands to generate front matter
\newcommand{\maketoc}{%
    \tableofcontents
    \cleardoublepage
}

\newcommand{\makelof}{%
    \listoffigures
    \cleardoublepage
}

\newcommand{\makelot}{%
    \listoftables
    \cleardoublepage
}

% Combined command to generate all lists
\newcommand{\makealllists}{%
    \maketoc
    \makelof
    \makelot
}
