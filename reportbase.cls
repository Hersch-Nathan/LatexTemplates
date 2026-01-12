%% reportbase.cls
%% Shared base class for design and capstone reports
%% Provides code listing environments, figure commands, and shared utilities

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reportbase}[2026/01/12 Report Base Class]

% Pass options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load article as base
\LoadClass[12pt]{article}

%% ============================================================================
%% REQUIRED PACKAGES
%% ============================================================================

\RequirePackage[margin=1in]{geometry}     % 1-inch margins
\RequirePackage{xparse}                   % Modern command definitions
\RequirePackage{environ}                  % Environment creation
\RequirePackage{graphicx}                 % Graphics inclusion
\RequirePackage{xcolor}                   % Colors
\RequirePackage{listings}                 % Code listings
\RequirePackage{iftex}                    % Engine detection
\RequirePackage{lastpage}                 % Page numbering
\RequirePackage{fancyhdr}                 % Headers and footers
\RequirePackage{hyperref}                 % Hyperlinks
\RequirePackage{caption}                  % Caption formatting

%% ============================================================================
%% CUSTOM MATH MACROS (inherited from hwcoursebase concept)
%% ============================================================================

% Differential operator (upright d)
\newcommand{\der}{\mathop{}\!\mathrm{d}}

% Laplace transform (script L)
\newcommand{\laplace}{\mathcal{L}}

% Norm operator
\newcommand{\norm}[1]{\left\|#1\right\|}

% Complex conjugate
\newcommand{\conj}[1]{\overline{#1}}

% Annotated arrow
\newcommand{\arr}[1]{\xrightarrow{#1}}

% Long annotated arrow
\newcommand{\Arr}[1]{\Longrightarrow\,#1\,\Longrightarrow}

% Inner product
\newcommand{\inner}[2]{\left\langle #1, #2 \right\rangle}

% Real numbers
\newcommand{\Real}{\mathbb{R}}

% Complex numbers
\newcommand{\Complex}{\mathbb{C}}

%% ============================================================================
%% CODE LISTING ENVIRONMENTS
%% ============================================================================

% Define colors for syntax highlighting
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

% Python code environment
\lstnewenvironment{python}[1][]{%
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
\lstnewenvironment{matlab}[1][]{%
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
\lstnewenvironment{terminal}[1][]{%
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
\lstnewenvironment{cpp}[1][]{%
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

% Generic code block environment
\lstnewenvironment{codeblock}[1][]{%
	\lstset{basicstyle=\ttfamily,frame=single,captionpos=b,#1}%
}{}

%% ============================================================================
%% FIGURE COMMANDS AND ENVIRONMENTS
%% ============================================================================

% Figure reference command (with optional abbreviation)
% Usage: \figref{1} for "Figure 1" or "Fig. 1" (controlled by class option)
\NewDocumentCommand{\figref}{m}{%
	Figure~#1%
}

% Graphic inclusion with optional title and scale
% Usage: \graphic{filename} or \graphic{filename}[title] or \graphic{filename}[title][scale=0.5]
\NewDocumentCommand{\graphic}{m o o}{%
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

% Note: \figure environment is provided by article class
% Users should use the standard LaTeX figure environment or \insertfigure command below
% Custom figure insertion command (alternative if needed)
\NewDocumentCommand{\insertfigure}{O{0.6\textwidth} m m m}{%
	\begin{figure}[htbp]
		\centering
		\includegraphics[width=#1]{#2}
		\caption{#3}
		\label{#4}
	\end{figure}
}

% Side-by-side figure pair with captions
% Usage: \dualfigure[width]{file1}{caption1}{label1}{file2}{caption2}{label2}
\NewDocumentCommand{\dualfigure}{O{0.45\textwidth} m m m m m m}{%
	\begin{figure}[htbp]
		\centering
		\begin{minipage}{#1}
			\centering
			\includegraphics[width=\textwidth]{#2}
			\caption{#3}
			\label{#4}
		\end{minipage}\hfill
		\begin{minipage}{#1}
			\centering
			\includegraphics[width=\textwidth]{#5}
			\caption{#6}
			\label{#7}
		\end{minipage}
	\end{figure}
}

%% ============================================================================
%% HELPER COMMANDS
%% ============================================================================

% Note/highlight command
% Usage: \note{Important text}
\newcommand{\note}[1]{%
	\textcolor{red}{\textbf{#1}}%
}

%% ============================================================================
%% END OF CLASS FILE
%% ============================================================================
