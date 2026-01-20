\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{coursenotes}[2026-01-12 Course Notes Class]

% Load book class for chapter support
\LoadClass{book}

% Set compact margins
\RequirePackage[margin=0.5in]{geometry}

% Load shared base package (instead of trying to load hwcoursebase.cls)
\RequirePackage{hwcoursebase}

% Additional packages for coursenotes
\RequirePackage{hyperref}
\RequirePackage{subcaption}

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
}

\newcommand{\makelof}{%
    \listoffigures
}

\newcommand{\makelot}{%
    \listoftables
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
