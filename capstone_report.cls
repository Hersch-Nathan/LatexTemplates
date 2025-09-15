%% capstone_report.cls
%% LaTeX class for Capstone Biweekly Individual Progress Reports
%% Generic, course-agnostic class suitable for publishing

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{capstone_report}[2025/09/12 v1.0 Capstone Progress Report Class]

%% ============================================================================
%% CLASS OPTIONS
%% ============================================================================

% Initialize boolean flags for class options
\newif\if@weekly\@weeklyfalse
\newif\if@uppercase\@uppercasefalse
\newif\if@figabbrev\@figabbrevfalse

% Class option declarations
\DeclareOption{weekly}{\@weeklytrue}
\DeclareOption{biweekly}{\@weeklyfalse}
\DeclareOption{uppercase}{\@uppercasetrue}
\DeclareOption{titlecase}{\@uppercasefalse}
\DeclareOption{figabbrev}{\@figabbrevtrue}

% Pass unknown options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Process options and load base class
\ProcessOptions\relax
\LoadClass[11pt]{article}

%% ============================================================================
%% REQUIRED PACKAGES
%% ============================================================================

% Core packages
\RequirePackage[margin=1in]{geometry}  % 1-inch margins
\RequirePackage{xparse}                % Modern command definitions
\RequirePackage{environ}              % Environment creation
\RequirePackage{graphicx}             % Image inclusion
\RequirePackage{xcolor}               % Colors
\RequirePackage{listings}             % Code listings
\RequirePackage{iftex}                % Engine detection
\RequirePackage{lastpage}             % For page X of Y
\RequirePackage{fancyhdr}             % Headers and footers

% Font setup with standard readable font
\RequirePackage[T1]{fontenc}

% Set up hyperlinks
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=blue,
    citecolor=black
}

%% ============================================================================
%% INTERNAL STORAGE
%% ============================================================================

% Store metadata for the report
\newcommand{\@reportnumber}{}
\newcommand{\@studentname}{}
\newcommand{\@teamname}{}
\newcommand{\@teamnumber}{}
\newcommand{\@periodstart}{}
\newcommand{\@periodend}{}
\newcommand{\@courseline}{}

%% ============================================================================
%% USER COMMANDS
%% ============================================================================

% 1. Metadata command
\NewDocumentCommand{\progressreport}{m m m m m m o}{%
    \renewcommand{\@reportnumber}{#1}%
    \renewcommand{\@studentname}{#2}%
    \renewcommand{\@teamname}{#3}%
    \renewcommand{\@teamnumber}{#4}%
    \renewcommand{\@periodstart}{#5}%
    \renewcommand{\@periodend}{#6}%
    \IfValueT{#7}{\renewcommand{\@courseline}{#7}}%
    % Set PDF metadata
    \hypersetup{
        pdftitle={Progress Report \@reportnumber - \@studentname},
        pdfauthor={\@studentname},
        pdfsubject={Capstone Progress Report}
    }%
}

% 2. Header rendering command
\NewDocumentCommand{\makeheader}{}{%
    \begin{center}
        % Report title (12pt, bold)
        {\fontsize{12pt}{14pt}\selectfont\bfseries
         \if@weekly Weekly \else Biweekly \fi
         Individual Progress Report \ifnum\@reportnumber<10 0\fi\@reportnumber}\\[0.5em]
        
        % Student/team line (11pt, normal)
        {\fontsize{11pt}{13pt}\selectfont
         \@studentname
         \ifx\@teamname\empty\else\ -- \@teamname\fi
         \ifx\@teamnumber\empty\else\ -- \@teamnumber\fi}\\[0.5em]
        
        % Optional course line
        \ifx\@courseline\empty\else\@courseline\\[0.5em]\fi
        
        % Reporting period
        Reporting Period: \@periodstart\ -- \@periodend
    \end{center}
    % Reduced spacing between header and first section
    \vspace{0.3em}
}

% 3. Section heading commands
\NewDocumentCommand{\@sectionheading}{m}{%
    \if@uppercase
        \section*{\MakeUppercase{#1}}
    \else
        \section*{#1}
    \fi
}

% 4. Required section commands
\NewDocumentCommand{\reportIntroduction}{}{%
    \@sectionheading{Introduction}
}

\NewDocumentCommand{\reportProjectDescription}{}{%
    \@sectionheading{Project Description}
}

\NewDocumentCommand{\reportProgressSummary}{}{%
    \@sectionheading{Progress Summary}
}

\NewDocumentCommand{\reportMyPlan}{}{%
    \subsection*{My Plan for the Reporting Time Frame}
}

\NewDocumentCommand{\reportWorkAccomplished}{}{%
    \subsection*{Work Accomplished for the Reporting Time Frame}
}

\NewDocumentCommand{\reportProblems}{}{%
    \@sectionheading{Problems Encountered During the Reporting Time Frame}
}

\NewDocumentCommand{\reportPlans}{}{%
    \@sectionheading{Plans for the Following Period}
}

\NewDocumentCommand{\reportReqChanges}{}{%
    \@sectionheading{Changes to the Requirements}
}

\NewDocumentCommand{\reportAssessment}{}{%
    \@sectionheading{Overall Assessment of Team Project}
}

\NewDocumentCommand{\reportInstructorIssues}{}{%
    \@sectionheading{Issues My Instructors Need to Know About My Team}
}

% 5. Run-in subheading helper
\NewDocumentCommand{\subhead}{m}{%
    \textbf{#1}~
}

% 6. Figure support
\NewDocumentCommand{\figref}{m}{%
    \if@figabbrev Fig.~#1\else Figure~#1\fi
}

% Graphic inclusion command with automatic centering, optional title, and optional scale
\NewDocumentCommand{\reportgraphic}{m o o}{%
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

\NewDocumentCommand{\reportfigure}{O{0.6\textwidth} m m}{%
    \begin{figure}[htbp]
        \centering
        \includegraphics[width=#1]{#2}
        \caption{#3}
    \end{figure}
}

% 7. Appendix command
\NewDocumentCommand{\reportappendix}{m}{%
    \newpage
    \section*{Appendix: #1}
    \addcontentsline{toc}{section}{Appendix: #1}
}

% 8. Code environment wrappers

% Python code environment
\lstnewenvironment{reportpython}[1][]{%
    \lstset{
        language=Python,
        basicstyle=\ttfamily\footnotesize,
        keywordstyle=\color{blue},
        commentstyle=\color{green!50!black},
        stringstyle=\color{purple},
        identifierstyle=\color{black},
        numberstyle=\tiny\color{gray},
        emphstyle=\color{orange},
        showstringspaces=false,
        breaklines=true,
        frame=single,
        captionpos=b,
        #1
    }%
}{}

% MATLAB code environment
\lstnewenvironment{reportmatlab}[1][]{%
    \lstset{
        language=Matlab,
        basicstyle=\ttfamily\footnotesize,
        keywordstyle=\color{blue},
        commentstyle=\color{green!50!black},
        stringstyle=\color{magenta},
        emphstyle=\color{red},
        showstringspaces=false,
        breaklines=true,
        frame=single,
        captionpos=b,
        #1
    }%
}{}

% Terminal output environment
\lstnewenvironment{reportterminal}[1][]{%
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
        keywordstyle=\color{blue},
        commentstyle=\color{green!50!black},
        stringstyle=\color{purple},
        #1
    }%
}{}

% C/C++ code environment
\lstnewenvironment{reportcpp}[1][]{%
    \lstset{
        language=C++,
        basicstyle=\ttfamily\footnotesize,
        keywordstyle=\color{blue},
        commentstyle=\color{green!50!black},
        stringstyle=\color{purple},
        morecomment=[s]{/*}{*/},
        showstringspaces=false,
        breaklines=true,
        frame=single,
        captionpos=b,
        #1
    }%
}{}

%% ============================================================================
%% DOCUMENT FORMATTING
%% ============================================================================

% Paragraph formatting
\setlength{\parindent}{0.25in}                   % First-line indent
\setlength{\parskip}{1ex plus 0.3ex minus 0.1ex}  % Reduced space between paragraphs
\linespread{1.0}                                 % Single-spaced within paragraphs

% Reduce spacing in sections
\RequirePackage{titlesec}
\titlespacing*{\section}{0pt}{1.5ex}{1ex}
\titlespacing*{\subsection}{0pt}{1.2ex}{0.8ex}

% Reduce spacing between bullet points
\RequirePackage{enumitem}
\setlist{nosep,     % Remove extra vertical spacing
         topsep=0.3ex,    % Minimal space at top
         parsep=0pt,      % No paragraph spacing between items
         itemsep=0.1ex}   % Minimal spacing between items

% Set up page headers/footers
\pagestyle{fancy}
\fancyhf{}  % Clear all headers and footers

% Increase header height to avoid warnings
\setlength{\headheight}{14pt}

% Header: Report title and period
\fancyhead[L]{%
    \if@weekly Weekly \else Biweekly \fi
    Progress Report \ifnum\@reportnumber<10 0\fi\@reportnumber
}
\fancyhead[R]{\@periodstart\ -- \@periodend}

% Footer: Page numbering
\fancyfoot[C]{Page \thepage\ of \pageref{LastPage}}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

%% ============================================================================
%% END OF DOCUMENT
%% ============================================================================

% No page limit warning as requested

% End of class file