%% playscript.cls
%% LaTeX class for Theatrical Playscripts
%% Minimal, clean implementation for professional playscript formatting

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{playscript}[2025/11/02 v1.0 Playscript Class]

%% ============================================================================
%% CLASS OPTIONS
%% ============================================================================

% Initialize boolean flags for class options
\newif\if@serif\@seriftrue          % Serif font flag (default: true)
\newif\if@draft\@draftfalse         % Draft mode flag (default: false)

% Font options
\DeclareOption{font=serif}{\@seriftrue}
\DeclareOption{font=sans}{\@seriffalse}

% Draft mode
\DeclareOption{draft}{\@drafttrue}

% Pass paper size and other options to article class
\DeclareOption{letter}{\PassOptionsToClass{letterpaper}{article}}
\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Process options and load base class with 12pt default
\ProcessOptions\relax
\LoadClass[12pt]{article}

%% ============================================================================
%% REQUIRED PACKAGES
%% ============================================================================

\RequirePackage[T1]{fontenc}              % Font encoding for better character support
\RequirePackage{xparse}                   % Modern command definitions with flexible arguments
\RequirePackage{setspace}                 % Line spacing control
\RequirePackage{parskip}                  % Paragraph spacing control
\RequirePackage{titlesec}                 % Custom section formatting for acts and scenes
\RequirePackage{textcase}                 % Case conversion utilities
\RequirePackage{iftex}                    % Engine detection

% Page layout - theatrical playscript margins
\RequirePackage[
    top=1in,
    bottom=1in,
    left=0.75in,     % Extra space for binding
    right=0.75in
]{geometry}

% Font selection based on class options
\if@serif
    % Use default Computer Modern Roman (serif)
\else
    \RequirePackage{helvet}
    \renewcommand{\familydefault}{\sfdefault}
\fi

% Draft mode - show overfull boxes
\if@draft
    \overfullrule=5pt
\fi

%% ============================================================================
%% BASIC LAYOUT SETTINGS
%% ============================================================================

% Single spacing for dialogue (as per playscript convention)
\singlespacing

% Remove paragraph indentation (playscripts don't use indentation)
\setlength{\parindent}{0pt}

% Set paragraph spacing
\setlength{\parskip}{0.5\baselineskip}

% Disable page numbers (traditional playscript format)
\pagestyle{empty}

%% ============================================================================
%% TITLE PAGE VARIABLES AND COMMANDS
%% ============================================================================

% Storage for title page information
\newcommand{\@subtitle}{}
\newcommand{\@translatedby}{}
\newcommand{\@performancenote}{}

% Boolean flags for optional elements
\newif\if@hassubtitle\@hassubtitlefalse
\newif\if@hastranslation\@hastranslationfalse
\newif\if@hasperformancenote\@hasperformancenotefalse

% Commands to set title page information
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}\@hassubtitletrue}
\newcommand{\translatedby}[1]{\renewcommand{\@translatedby}{#1}\@hastranslationtrue}
\newcommand{\performancenote}[1]{\renewcommand{\@performancenote}{#1}\@hasperformancenotetrue}

%% ============================================================================
%% TITLE PAGE GENERATION
%% ============================================================================

\renewcommand{\maketitle}{%
    \thispagestyle{empty}
    \vspace*{2in}
    \begin{center}
        % Title - large, bold, centered
        {\LARGE\bfseries\MakeUppercase{\@title}\par}
        \vspace{0.5em}
        
        % Subtitle (if provided)
        \if@hassubtitle
            {\large\@subtitle\par}
            \vspace{0.5em}
        \fi
        
        \vspace{2em}
        
        % Author - centered
        {\large by\par}
        \vspace{0.5em}
        {\large\MakeUppercase{\@author}\par}
        
        \vspace{3em}
        
        % Translation credit (if provided)
        \if@hastranslation
            {\normalsize\itshape\@translatedby\par}
        \fi
        
        \vfill
        
        % Performance note (if provided)
        \if@hasperformancenote
            {\normalsize\@performancenote\par}
        \fi
        
        \vspace{1in}
    \end{center}
    \clearpage
}

%% ============================================================================
%% CHARACTER LIST PAGE
%% ============================================================================

% Environment for character list
\newenvironment{characters}{%
    \clearpage
    \thispagestyle{empty}
    \vspace*{1.5in}
    \begin{center}
    {\Large\bfseries CHARACTERS\par}
    \vspace{1.5em}
    \begin{singlespace}
}{%
    \end{singlespace}
    \end{center}
    \vfill
    \clearpage
}

% Command to add a character to the list
\newcommand{\character}[1]{%
    \MakeUppercase{#1}\par
    \vspace{0.3em}
}

%% ============================================================================
%% ACT AND SCENE STRUCTURE
%% ============================================================================

% Counter for acts
\newcounter{act}

% Act command - creates act heading with page break
\newcommand{\act}[1]{%
    \clearpage
    \vspace*{1in}
    \begin{center}
        {\Large\bfseries ACT #1\par}
    \end{center}
    \vspace{2em}
}

% Scene command - creates centered scene location/description
% Normal text (no italics) for readability
\newcommand{\scene}[1]{%
    \vspace{1em}
    \begin{center}
        #1\par
    \end{center}
    \vspace{1em}
}

% Scene description environment - detailed scene setting
% Normal text (no italics) for readability
\newenvironment{scenedesc}{%
    \vspace{0.5em}
    \noindent
}{%
    \par
    \vspace{1em}
}

%% ============================================================================
%% CHARACTER NAMES AND DIALOGUE
%% ============================================================================

% Speaker/character name command - centered, all-caps
% After speaker name, use \dialogue{text} macro for the dialogue
\newcommand{\speaker}[1]{%
    \par
    \vspace{1em}
    \begin{center}
        \MakeUppercase{#1}
    \end{center}
    \vspace{0.3em}
}

% Dialogue macro - takes dialogue text as an argument
% Centers text in a 60% width column
\newcommand{\dialogue}[1]{%
    \begin{center}
    \begin{minipage}{0.6\textwidth}
    \setlength{\parindent}{0pt}
    #1
    \end{minipage}
    \end{center}
    \par
    \vspace{0.5em}
}

%% ============================================================================
%% PARENTHETICALS AND CHARACTER DIRECTIONS
%% ============================================================================

% Inline parenthetical command - brief character direction
% Normal text (no italics), additional indentation, stays within dialogue
\newcommand{\paren}[1]{%
    \par
    \vspace{0.2em}
    \hspace{2em}(#1)
    \par
    \vspace{0.2em}
}

% Parenthetical environment - for longer character directions
% Normal text (no italics), indented
\newenvironment{parenthetical}{%
    \par
    \vspace{0.2em}
    \setlength{\leftskip}{2em}
    \setlength{\rightskip}{2em}
    \noindent
}{%
    \par
    \vspace{0.2em}
}

%% ============================================================================
%% STAGE DIRECTIONS
%% ============================================================================

% Short stage direction command - centered
% Normal text (no italics) for readability
\newcommand{\stagedirection}[1]{%
    \par
    \vspace{0.5em}
    \begin{center}
        #1
    \end{center}
    \vspace{0.5em}
}

% Stage direction environment - for longer stage directions
% Left-justified block, normal text (no italics)
\newenvironment{stage}{%
    \par
    \vspace{0.5em}
    \noindent
}{%
    \par
    \vspace{0.5em}
}

%% ============================================================================
%% WIDOW AND ORPHAN CONTROL
%% ============================================================================

% Prevent single lines at the start/end of pages
\widowpenalty=10000
\clubpenalty=10000

% Discourage page breaks immediately after character names
\newcommand{\keepcharacter}{%
    \nopagebreak[4]
}

%% ============================================================================
%% OPTIONAL: DUAL DIALOGUE SUPPORT (BASIC IMPLEMENTATION)
%% ============================================================================

% Simple two-column dialogue for simultaneous speakers
% This is a basic implementation - can be enhanced if needed
\newenvironment{dualdialogue}{%
    \par
    \vspace{1em}
    \begin{minipage}[t]{0.45\textwidth}
}{%
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.45\textwidth}
    \end{minipage}
    \par
    \vspace{1em}
}

%% ============================================================================
%% HELPER COMMANDS
%% ============================================================================

% Emphasis within dialogue (already italic for stage directions)
\newcommand{\emphasis}[1]{\textit{#1}}

% Beat - pause in dialogue
\newcommand{\beat}{\paren{beat}}

% Continue indicator - when dialogue continues from previous page
\newcommand{\continuing}{%
    \begin{center}
        (CONT'D)
    \end{center}
    \vspace{0.3em}
}

%% ============================================================================
%% FORMATTING SHORTCUTS
%% ============================================================================

% Quick transition commands (FADE IN, CUT TO, etc.)
\newcommand{\fadein}{%
    \begin{flushleft}
        \textsc{Fade In:}
    \end{flushleft}
    \vspace{1em}
}

\newcommand{\fadeout}{%
    \vspace{1em}
    \begin{flushright}
        \textsc{Fade Out.}
    \end{flushright}
}

\newcommand{\curtain}{%
    \vspace{2em}
    \begin{center}
        \textsc{Curtain}
    \end{center}
    \vspace{2em}
}

%% ============================================================================
%% END OF CLASS FILE
%% ============================================================================
