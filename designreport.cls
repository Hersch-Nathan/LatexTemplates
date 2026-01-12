%% designreport.cls
%% LaTeX class for Design Reports
%% Generic, course-agnostic class suitable for publishing
%% Loads reportbase.cls as base class, which provides:
%%   - Code environments (python, matlab, terminal, cpp, codeblock)
%%   - Figure commands (\figref, \graphic, \figure, \dualfigure)
%%   - Custom math macros (\der, \laplace, \norm, etc.)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{designreport}[2026/01/12 Design Report Class]

%% ============================================================================
%% CLASS OPTIONS
%% ============================================================================

% Initialize boolean flags for class options
\newif\if@draft\@draftfalse
\newif\if@final\@finaltrue
\newif\if@twocolumn\@twocolumnfalse
\newif\if@onecolumn\@onecolumntrue
\newif\if@linenumbers\@linenumbersfalse
\newif\if@watermark\@watermarkfalse
\newif\if@figabbrev\@figabbrevfalse

% Class option declarations
\DeclareOption{draft}{\@drafttrue\@finalfalse\@watermarktrue}
\DeclareOption{final}{\@finaltrue\@draftfalse\@watermarkfalse}
\DeclareOption{twocolumn}{\@twocolumntrue\@onecolumnfalse}
\DeclareOption{onecolumn}{\@onecolumntrue\@twocolumnfalse}
\DeclareOption{linenumbers}{\@linenumberstrue}
\DeclareOption{figabbrev}{\@figabbrevtrue}

% Pass unknown options to reportbase
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{reportbase}}

% Process options and load base class
\ProcessOptions\relax
\LoadClass[12pt]{reportbase}

%% ============================================================================
%% ADDITIONAL PACKAGES FOR DESIGN REPORTS
%% ============================================================================
%% These packages provide features unique to design reports and are not
%% included in reportbase.cls

\RequirePackage{tocloft}         % Customize TOC
\RequirePackage{titlesec}        % Section formatting
\RequirePackage{setspace}        % Line spacing
\RequirePackage{array}           % Array enhancements
\RequirePackage{booktabs}        % Professional tables
\RequirePackage{multirow}        % Multi-row cells
\RequirePackage{multicol}        % Multi-column layouts
\RequirePackage{longtable}       % Tables spanning pages
\RequirePackage{mathptmx}        % Times New Roman math
\RequirePackage[T1]{fontenc}     % Font encoding

% Optional packages based on class options
\if@linenumbers
    \RequirePackage{lineno}
    \linenumbers
\fi

\if@watermark
    \RequirePackage{draftwatermark}
    \SetWatermarkText{DRAFT}
    \SetWatermarkScale{1.5}
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
%% TITLE PAGE VARIABLES AND COMMANDS
%% ============================================================================
%% Features unique to design reports:
%%   - Team-based document structure (team name, members, advisors, sponsors)
%%   - Customizable document naming
%%   - Logo support
%%   - University/department/course information

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
%% Custom maketitle for design reports with team-based layout

\renewcommand{\maketitle}{%
    \begin{titlepage}
        \centering
        
        % Document Name - larger font, closer to top
        {\huge\bfseries \@documentname \par}
        \vspace{0.2cm}
        
        % Team Name
        {\LARGE\bfseries \@teamname \par}
        \vspace{0.2cm}
        
        % Team Logo (if provided)
        \if@haslogo
            \includegraphics[width=0.3\textwidth]{\@teamlogo}
            \vspace{0.2cm}
        \fi
        
        % University and Department
        {\large \@university \par}
        {\large \@department \par}
        \vspace{0.2cm}
        
        % Course
        {\large \@course \par}
        \vspace{0.2cm}
        
        % Team Members
        \if@hasmembers
            {\Large\bfseries Team Members \par}
            \vspace{0.2cm}
            \begin{multicols}{2}
                \@teammembers
            \end{multicols}
            \vspace{0.5cm}
        \fi
        
        % Class Advisors
        \if@hasadvisors
            {\Large\bfseries Class Advisors \par}
            \vspace{0.2cm}
            \begin{multicols}{2}
                \@classadvisors
            \end{multicols}
            \vspace{0.3cm}
        \fi
        
        % Sponsors
        \if@hassponsor
            {\Large\bfseries Sponsors \par}
            \vspace{0.2cm}
            \begin{multicols}{2}
                \@sponsors
            \end{multicols}
            \vspace{0.3cm}
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
%% Custom header/footer setup for design reports

\pagestyle{fancy}
\fancyhf{} % Clear all header and footer fields

% Header setup
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{\thepage}

% Footer setup (displays team name and course)
\fancyfoot[L]{\@teamname}
\fancyfoot[C]{\@course}
\fancyfoot[R]{\thepage}

% Special formatting for first page (no header/footer)
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
%% Front matter generation for design reports

\newcommand{\makefrontmatter}{%
    % Title Page
    \maketitle

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
%% FIGURE REFERENCE OVERRIDE
%% ============================================================================
%% Override reportbase's \figref to support figabbrev option

\renewcommand{\figref}[1]{%
    \if@figabbrev Fig.~#1\else Figure~#1\fi
}

%% ============================================================================
%% OVERRIDE BASE FIGURE COMMANDS (enforce figures/ folder)
%% ============================================================================
%% These override the base reportbase.cls versions to enforce the figures/ subfolder

% Override \graphic to use figures/ folder
\renewcommand{\graphic}[3][]{%
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

% Override \dualfigure to use figures/ folder
\renewcommand{\dualfigure}[4]{%
    \begin{figure}[htbp]
        \centering
        \begin{minipage}{0.45\textwidth}
            \centering
            \includegraphics[width=\textwidth]{figures/#1}
            \caption{#2}
        \end{minipage}\hfill
        \begin{minipage}{0.45\textwidth}
            \centering
            \includegraphics[width=\textwidth]{figures/#3}
            \caption{#4}
        \end{minipage}
    \end{figure}
}

% Add \figure environment with caption (enforces figures/)
\NewDocumentCommand{\figure}{O{0.6\textwidth} m m m}{%
    \begin{figure}[htbp]
        \centering
        \includegraphics[width=#1]{figures/#2}
        \caption{#3}
        \label{#4}
    \end{figure}
}

% Legacy compatibility: insertFigure with figures/ folder
\newcommand{\insertFigure}[3]{%
    \begin{figure}[ht]
        \centering
        \includegraphics[width=#1]{figures/#2}
        \caption{#3}
    \end{figure}
}

%% ============================================================================
%% TABLE FORMATTING OPTIONS
%% ============================================================================
%% Design report-specific table styling features

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
%% Design report-specific environments for organizing content

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
%% TEAM ENTRY HELPERS
%% ============================================================================
%% Commands for formatting team member, advisor, and sponsor entries

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
%% Configure hyperref for interactive PDFs

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
%% 
%% Summary of inherited features from reportbase.cls:
%%   - Code environments: python, matlab, terminal, cpp, codeblock
%%   - Figure commands: \figref (overridden), \graphic, \figure, \dualfigure
%%   - Math macros: \der, \laplace, \norm, \conj, \arr, \Arr, \inner, \Real, \Complex
%%   - Geometry: 1-inch margins
%%   - Packages: graphicx, xcolor, listings, xparse, environ, hyperref, caption
%%
%% Design report-specific features (not in reportbase):
%%   - Draft/final mode with watermarking
%%   - Team-based title page with multiple sections
%%   - Custom header/footer with team name and course
%%   - Table formatting with colors and padding
%%   - Sub-project environment
%%   - Appendix lettering system
%%   - Figure abbreviation toggle (figabbrev option)
%%   - Team member/advisor/sponsor entry helpers