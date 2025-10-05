%% designreport.cls
%% LaTeX class for Design Reports
%% Generic, course-agnostic class suitable for publishing

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{designreport}[2025/10/03 v1.0 Design Report Class]

%% ============================================================================
%% CLASS OPTIONS
%% ============================================================================

% Initialize boolean flags for class options
\newif\if@draft\@draftfalse        % Draft mode flag (default: false)
\newif\if@final\@finaltrue         % Final mode flag (default: true)
\newif\if@twocolumn\@twocolumnfalse % Two-column layout flag (default: false)
\newif\if@onecolumn\@onecolumntrue  % One-column layout flag (default: true)
\newif\if@linenumbers\@linenumbersfalse % Line numbering flag (default: false)
\newif\if@watermark\@watermarkfalse % Watermark flag (default: false)
\newif\if@figabbrev\@figabbrevfalse % Figure abbreviation flag (default: false)

% Class option declarations
\DeclareOption{draft}{\@drafttrue\@finalfalse\@watermarktrue}      % Enable draft mode with watermark and overfull box highlighting
\DeclareOption{final}{\@finaltrue\@draftfalse\@watermarkfalse}     % Enable final mode (default, clean output)
\DeclareOption{twocolumn}{\@twocolumntrue\@onecolumnfalse}         % Use two-column layout for compact presentation
\DeclareOption{onecolumn}{\@onecolumntrue\@twocolumnfalse}         % Use single-column layout (default)
\DeclareOption{linenumbers}{\@linenumberstrue}                     % Add line numbers for reviewing and editing
\DeclareOption{figabbrev}{\@figabbrevtrue}                         % Abbreviate "Figure" to "Fig." in references

% Pass unknown options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Process options and load base class with 12pt default
\ProcessOptions\relax
\LoadClass[12pt]{article}

%% ============================================================================
%% REQUIRED PACKAGES
%% ============================================================================

% Core packages
\RequirePackage[margin=1in]{geometry}     % Sets 1-inch margins on all sides for professional document formatting
\RequirePackage{xparse}                   % Enables modern command definitions with flexible argument handling
\RequirePackage{environ}                  % Supports creation of custom environments with advanced processing capabilities
\RequirePackage{graphicx}                 % Allows image inclusion with scaling, rotation, and positioning options
\RequirePackage{xcolor}                   % Provides comprehensive color support for text, backgrounds, and graphics
\RequirePackage{amsmath}                  % Enables advanced mathematical environments and equation formatting
\RequirePackage{listings}                 % Formats code listings with syntax highlighting and customizable styling
\RequirePackage{iftex}                    % Detects the LaTeX engine (pdfLaTeX, XeLaTeX, LuaLaTeX) for conditional compilation
\RequirePackage{lastpage}                 % Adds page numbering functionality (e.g., "Page X of Y") by referencing the last page
\RequirePackage{fancyhdr}                 % Customizes headers and footers with flexible positioning and content control
\RequirePackage{caption}                  % Ensures consistent figure and table captions with customizable formatting

% Configure caption formatting - labels underneath for better readability
\captionsetup{
    position=bottom,        % Place captions below figures and tables
    labelsep=period,        % Use period after label (e.g., "Figure 1.")
    font=small,             % Use smaller font for captions
    justification=centering % Center-align captions
}
\RequirePackage{hyperref}                 % Adds hyperlinks, bookmarks, and PDF metadata for enhanced document navigation
\RequirePackage{tocloft}                  % Customizes the table of contents, list of figures, and list of tables formatting
\RequirePackage[backend=biber,style=ieee]{biblatex}  % Manages references using IEEE citation style with modern bibliography processing
\RequirePackage{titlesec}                 % Formats section titles with custom spacing, fonts, and numbering schemes
\RequirePackage{setspace}                 % Controls line spacing throughout the document (single, double, custom spacing)
\RequirePackage{array}                    % Enhances array and tabular environments with additional column types and formatting
\RequirePackage{booktabs}                 % Creates professional-quality tables with proper spacing and horizontal rules
\RequirePackage{multirow}                 % Supports multi-row table cells for complex table layouts and data presentation
\RequirePackage{multicol}                 % Enables multi-column layouts for text, lists, and other content elements

% Font setup - Times New Roman
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}                 % Times fonts for text and math

% Optional packages based on options
\if@linenumbers
    \RequirePackage{lineno}
    \linenumbers
\fi

\if@watermark
    \RequirePackage{draftwatermark}
    \SetWatermarkText{DRAFT}
    \SetWatermarkScale{3}
    \SetWatermarkColor{gray!30}
\fi

% Highlight overfull boxes in draft mode
\if@draft
    \overfullrule=5pt
\fi

%% ============================================================================
%% FONT AND SPACING SETUP
%% ============================================================================

% Set font sizes according to requirements
% 12pt Times New Roman for headings (bold)
% 11pt Times New Roman for text
% 1.5 spacing between paragraphs, single spacing between lines

\renewcommand{\normalsize}{\fontsize{11pt}{11pt}\selectfont}
\renewcommand{\large}{\fontsize{12pt}{12pt}\selectfont}
\renewcommand{\Large}{\fontsize{14pt}{14pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{16pt}{16pt}\selectfont}

% Set paragraph spacing
\setlength{\parskip}{1.5ex plus 0.5ex minus 0.2ex}
\setlength{\parindent}{0pt}

% Format section headings
\titleformat{\section}
    {\large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}
    {\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}
    {\normalsize\bfseries}{\thesubsubsection}{1em}{}

%% ============================================================================
%% TITLE PAGE VARIABLES
%% ============================================================================

% Define variables for title page content
\newcommand{\@documentname}{Design Report}
\newcommand{\@teamname}{Team Name}
\newcommand{\@teamlogo}{}
\newcommand{\@university}{University Name}
\newcommand{\@department}{Department Name}
\newcommand{\@course}{Course Name}
\newcommand{\@teammembers}{}
\newcommand{\@classadvisors}{}
\newcommand{\@sponsors}{}
\newcommand{\@reportdate}{\today}

% Boolean flags for optional elements
\newif\if@haslogo\@haslogofalse
\newif\if@hasmembers\@hasmembersfalse
\newif\if@hasadvisors\@hasadvisorsfalse
\newif\if@hassponsor\@hassponsorfalse

% Commands to set title page information
\newcommand{\documentname}[1]{\renewcommand{\@documentname}{#1}}
\newcommand{\teamname}[1]{\renewcommand{\@teamname}{#1}}
\newcommand{\teamlogo}[1]{\renewcommand{\@teamlogo}{#1}\@haslogotrue}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\teammembers}[1]{\renewcommand{\@teammembers}{#1}\@hasmemberstrue}
\newcommand{\classadvisors}[1]{\renewcommand{\@classadvisors}{#1}\@hasadvisorstrue}
\newcommand{\sponsors}[1]{\renewcommand{\@sponsors}{#1}\@hassponsortrue}
\newcommand{\reportdate}[1]{\renewcommand{\@reportdate}{#1}}

% Legacy compatibility commands
\newcommand{\reportTitle}[1]{\title{#1}}
\newcommand{\reportAuthor}[1]{\author{#1}}
\newcommand{\reportDate}[1]{\date{#1}}
\newcommand{\reportCourse}[1]{\course{#1}}

%% ============================================================================
%% TITLE PAGE CREATION
%% ============================================================================

\renewcommand{\maketitle}{%
    \begin{titlepage}
        \centering
        \vspace*{1cm}
        
        % Document Name
        {\LARGE\bfseries \@documentname \par}
        \vspace{1cm}
        
        % Team Name
        {\Large\bfseries \@teamname \par}
        \vspace{1cm}
        
        % Team Logo (if provided)
        \if@haslogo
            \includegraphics[width=0.3\textwidth]{\@teamlogo}
            \vspace{1cm}
        \fi
        
        % University and Department
        {\large \@university \par}
        {\large \@department \par}
        \vspace{0.5cm}
        
        % Course
        {\large \@course \par}
        \vspace{1.5cm}
        
        % Team Members
        \if@hasmembers
            {\large\bfseries Team Members \par}
            \vspace{0.5cm}
            \begin{multicols}{2}
                \@teammembers
            \end{multicols}
            \vspace{1cm}
        \fi
        
        % Class Advisors
        \if@hasadvisors
            {\large\bfseries Class Advisors \par}
            \vspace{0.5cm}
            \begin{multicols}{2}
                \@classadvisors
            \end{multicols}
            \vspace{1cm}
        \fi
        
        % Sponsors
        \if@hassponsor
            {\large\bfseries Sponsors \par}
            \vspace{0.5cm}
            \begin{multicols}{2}
                \@sponsors
            \end{multicols}
            \vspace{1cm}
        \fi
        
        \vfill
        
        % Date
        {\large \@reportdate \par}
        
    \end{titlepage}
    \clearpage
}

%% ============================================================================
%% HEADERS AND FOOTERS
%% ============================================================================

\pagestyle{fancy}
\fancyhf{} % Clear all header and footer fields


% Remove team info from header, only in footer
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{\thepage}

% Footer setup (for all pages except first)
\fancyfoot[L]{\@teamname}
\fancyfoot[C]{\@course}
\fancyfoot[R]{\thepage}

% Special formatting for first page
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% Set header and footer rule widths
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

%% ============================================================================
%% TABLE OF CONTENTS AND LISTS
%% ============================================================================

% Create command to generate all front matter
\newcommand{\makefrontmatter}{%
    % Table of Contents
    \clearpage
    \tableofcontents
    \clearpage
    
    % List of Tables
    \listoftables
    \clearpage
    
    % List of Figures
    \listoffigures
    \clearpage
}

%% ============================================================================
%% CODE ENVIRONMENTS
%% ============================================================================

% Define colors for syntax highlighting
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

% Python Code Environment
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
        title=Code,
        #1
    }%
}{}

% MATLAB Code Environment
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
        title=Code,
        #1
    }%
}{}

% Terminal Output Environment
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
        title=Code,
        #1
    }%
}{}

% General code block environment
\lstnewenvironment{codeblock}[1][]{%
    \lstset{basicstyle=\ttfamily,frame=single,captionpos=b,title=Code,#1}%
}{}

%% ============================================================================
%% FIGURE COMMANDS AND ENVIRONMENTS
%% ============================================================================

% Figure reference command
\NewDocumentCommand{\figref}{m}{%
    \if@figabbrev Fig.~#1\else Figure~#1\fi
}

% Graphic inclusion command (figures folder enforced)
\NewDocumentCommand{\reportgraphic}{m o o}{%
    \begin{center}%
        \IfValueT{#2}{\textbf{#2}\\[0.5em]}%
        \IfValueTF{#3}{%
            \includegraphics[scale=#3]{figures/#1}%
        }{%
            \includegraphics[width=0.8\textwidth]{figures/#1}%
        }%
        \IfValueT{#2}{\\[0.5em]}%
    \end{center}%
}

% Figure environment with caption (figures folder enforced)
\NewDocumentCommand{\reportfigure}{O{0.6\textwidth} m m}{%
    \begin{figure}[htbp]
        \centering
        \includegraphics[width=#1]{figures/#2}
        \caption{#3}
    \end{figure}
}

% Helper command for inserting figures (legacy compatibility, figures folder enforced)
\newcommand{\insertFigure}[3]{%
    \begin{figure}[ht]
        \centering
        \includegraphics[width=#1]{figures/#2}
        \caption{#3}
    \end{figure}
}

%% ============================================================================
%% PREDEFINED SECTIONS REMOVED
%% ============================================================================
%% Predefined sections have been moved to docs/examples.md for better modularity.
%% Users can add these commands to their document preamble as needed.
%% This approach allows for greater customization and prevents cluttering the class file.

%% ============================================================================
%% TABLE FORMATTING OPTIONS
%% ============================================================================

% Define default table colors
\definecolor{tableheader}{RGB}{70,130,180}      % Steel blue for headers
\definecolor{tablealt}{RGB}{245,245,245}        % Light gray for alternating rows

% Commands to set custom table colors
\newcommand{\settableheadercolor}[1]{\colorlet{tableheader}{#1}}
\newcommand{\settablealtcolor}[1]{\colorlet{tablealt}{#1}}

% Table formatting commands
\newcommand{\tablepadding}{%
    \renewcommand{\arraystretch}{1.5}%
    \setlength{\tabcolsep}{8pt}%
}

% Colored table environment with header and alternating rows
\newenvironment{reporttable}[1][]{%
    \tablepadding%
    \rowcolors{2}{tablealt}{white}%
    \begin{tabular}{#1}%
}{%
    \end{tabular}%
}

% Professional table environment using booktabs
\newenvironment{professionaltable}[1][]{%
    \tablepadding%
    \begin{tabular}{#1}%
}{%
    \end{tabular}%
}

%% ============================================================================
%% SPECIALIZED ENVIRONMENTS
%% ============================================================================

% Engineering Requirements environment - Table format
% Usage: \begin{engineeringreq}{ER Number}{Rationale}{MR(s)}{Verification}...\end{engineeringreq}
\newenvironment{engineeringreq}[4]{%
    \par\vspace{1em}
    \noindent
    \begin{tabular}{|p{0.15\textwidth}|p{0.25\textwidth}|p{0.15\textwidth}|p{0.35\textwidth}|}
    \hline
    \textbf{ER Number} & \textbf{Rationale} & \textbf{MR(s)} & \textbf{Verification} \\
    \hline
    #1 & #2 & #3 & #4 \\
    \hline
    \end{tabular}
    \par\vspace{1em}
}{%
}

% Sub-project environment
\newenvironment{subproject}[2]{%
    \par\vspace{1em}
    \noindent\textbf{Sub-project: #1}
    \par\vspace{0.5em}
    \noindent\textbf{Lead:} #2
    \par\vspace{0.5em}
    \noindent\textbf{Deliverables:}
    \begin{itemize}
}{%
    \end{itemize}
    \par\vspace{1em}
}

% Appendices with lettered sections
\renewcommand{\appendix}{%
    \par\newpage
    \setcounter{section}{0}% Reset section counter
    \renewcommand{\thesection}{\Alph{section}}% Lettered sections
    \renewcommand{\thesubsection}{\thesection.\arabic{subsection}}% Subsections as A.1, A.2, etc.
    \renewcommand{\section}{\clearpage\secdef\@appendix\@sappendix}% Clear page before each appendix
}

% Internal commands for appendix formatting
\newcommand{\@appendix}[2][default]{\refstepcounter{section}\addcontentsline{toc}{section}{Appendix~\thesection: #1}\sectionmark{#1}\noindent\textbf{Appendix~\thesection: #1}\par\vspace{1em}#2}
\newcommand{\@sappendix}[1]{\@appendix[default]{#1}}

%% ============================================================================
%% HELPER COMMANDS
%% ============================================================================

% Team member entry helper
\newcommand{\teammember}[2]{%
    #1 \\ \texttt{#2} \\[0.5em]
}

% Advisor entry helper
\newcommand{\advisor}[2]{%
    #1 \\ \texttt{#2} \\[0.5em]
}

% Sponsor entry helper
\newcommand{\sponsor}[2]{%
    #1 \\ \texttt{#2} \\[0.5em]
}

% Appendix helper (label as A, B, ...)
\newcommand{\makeappendix}{%
    \clearpage
    \appendix
    \renewcommand{\thesection}{\Alph{section}}%
    \section*{Appendix}
    \addcontentsline{toc}{section}{Appendix}
}

%% ============================================================================
%% HYPERLINK SETUP
%% ============================================================================

% Configure hyperref for clickable table of contents
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,      
    urlcolor=cyan,
    pdftitle={Design Report},
    pdfpagemode=FullScreen,
    bookmarks=true,
    bookmarksopen=true,
    bookmarksnumbered=true
}

%% ============================================================================
%% END OF CLASS FILE
%% ============================================================================