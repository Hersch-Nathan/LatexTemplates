%% hwcoursebase.cls
%% Shared base class for homework and coursenotes
%% Provides common math environments, code listings, graphics helpers, and custom operators

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hwcoursebase}[2026/01/12 Homework/CourseNotes Base Class]

% Pass options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load article as base
\LoadClass{article}

%% ============================================================================
%% REQUIRED PACKAGES
%% ============================================================================

\RequirePackage{amsmath}           % Advanced math environments
\RequirePackage{amssymb}           % Math symbols (for \mathbb, \mathcal, etc.)
\RequirePackage{listings}          % Code listings with syntax highlighting
\RequirePackage{xparse}            % Advanced command definitions
\RequirePackage[margin=0.5in]{geometry}  % Compact margins
\RequirePackage{fix-cm}            % Fix computer modern font sizes
\RequirePackage{environ}           % Environment creation
\RequirePackage{xcolor}            % Color support
\RequirePackage{graphicx}          % Graphics inclusion
\RequirePackage{tikz}              % Drawing package
\RequirePackage{blox}              % Block diagram package
\RequirePackage{tcolorbox}         % Colored boxes for examples

%% ============================================================================
%% CUSTOM MATH MACROS
%% ============================================================================
%% These macros provide convenience wrappers and custom definitions for
%% mathematical notation. They avoid duplicating amsmath/amssymb functionality.

% Differential operator (upright d)
% Usage: \der x for dx, or in equations: \der q / \der t for dq/dt
\newcommand{\der}{\mathop{}\!\mathrm{d}}

% Laplace transform (script L)
% Usage: \laplace\{f(t)\}
\newcommand{\laplace}{\mathcal{L}}

% Norm operator: ||v||
% Usage: \norm{v} or \norm*{v} for \left\|...\right\|
\newcommand{\norm}[1]{\left\|#1\right\|}

% Complex conjugate (overline)
% Usage: \conj{z}
\newcommand{\conj}[1]{\overline{#1}}

% Annotated arrow (rightarrow variant)
% Usage: \arr{label} or \arr*{label}
\newcommand{\arr}[1]{\xrightarrow{#1}}

% Long annotated arrow
% Usage: \Arr{label}
\newcommand{\Arr}[1]{\Longrightarrow\,#1\,\Longrightarrow}

% Inner product ⟨u, v⟩
% Usage: \inner{u}{v}
\newcommand{\inner}[2]{\left\langle #1, #2 \right\rangle}

% Real numbers (blackboard bold R)
% Usage: \Real or \Real^n
\newcommand{\Real}{\mathbb{R}}

% Complex numbers (blackboard bold C)
% Usage: \Complex or \Complex^n
\newcommand{\Complex}{\mathbb{C}}

%% ============================================================================
%% MATH ENVIRONMENTS
%% ============================================================================

% Unnumbered aligned math environment
% Usage: \begin{mmath} x &= 1 \\ y &= 2 \end{mmath}
\NewEnviron{mmath}{%
	\par\vspace{0.5em}%
	\begin{align*}%
	\BODY%
	\end{align*}%
	\vspace{0.5em}%
}

% Numbered aligned math environment
% Usage: \begin{mathnumbered} x &= 1 \\ y &= 2 \end{mathnumbered}
\NewEnviron{mathnumbered}{%
	\par\vspace{0.5em}%
	\begin{align}%
	\BODY%
	\end{align}%
	\vspace{0.5em}%
}

%% ============================================================================
%% ALIGNMENT OPERATOR SHORTCUTS
%% ============================================================================
%% These are for use inside align* or align environments to align on operators
%% Example: \begin{mmath} x \eq 5 \\ y \gt 3 \end{mmath}

\newcommand{\eq}{&=}      % equals sign aligned
\newcommand{\gt}{&>}      % greater than aligned
\newcommand{\lt}{&<}      % less than aligned
\newcommand{\llt}{&<<}    % much less than aligned
\newcommand{\ggt}{&>>}    % much greater than aligned
\newcommand{\geqq}{&\geq} % greater than or equal aligned
\newcommand{\leqq}{&\leq} % less than or equal aligned
\newcommand{\neqq}{&\neq} % not equal aligned
\newcommand{\approxx}{&\approx} % approximately equal aligned

%% ============================================================================
%% CODE LISTING ENVIRONMENTS
%% ============================================================================

% Python code environment
% Usage: \begin{python} ... \end{python}
\lstnewenvironment{python}[1][]{%
	\lstset{language=Python, #1}%
}{}

% MATLAB code environment
% Usage: \begin{matlab} ... \end{matlab}
\lstnewenvironment{matlab}[1][]{%
	\lstset{language=Matlab, #1}%
}{}

% Terminal/bash output environment
% Usage: \begin{terminal} ... \end{terminal}
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

%% ============================================================================
%% BLOCK DIAGRAM ENVIRONMENT
%% ============================================================================

% Centered block diagram (TikZ/blox wrapper)
% Usage: \begin{diagram} \block{...} ... \end{diagram}
\NewEnviron{diagram}{%
	\begin{center}
	\begin{tikzpicture}
	\BODY
	\end{tikzpicture}
	\end{center}
}

%% ============================================================================
%% EXAMPLE AND NOTE ENVIRONMENTS
%% ============================================================================

% Example environment with colored box
% Usage: \begin{example} ... \end{example}
\NewEnviron{example}{%
	\par\vspace{0.5em}%
	\begin{tcolorbox}[colback=blue!5, colframe=blue!50!black, title=Example]%
	\BODY%
	\end{tcolorbox}%
	\vspace{0.5em}%
}

% Note/highlight command
% Usage: \note{Important text}
\newcommand{\note}[1]{%
	\textcolor{red}{\textbf{#1}}%
}

%% ============================================================================
%% GRAPHICS HELPERS
%% ============================================================================

% Generic graphic inclusion with optional title and scale
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

% Dual figure environment (side-by-side)
% Usage: \dualfigure{file1}{caption1}{file2}{caption2}
\NewDocumentCommand{\dualfigure}{m m m m}{%
	\begin{figure}[htbp]
		\centering
		\begin{minipage}{0.45\textwidth}
			\centering
			\includegraphics[width=\textwidth]{#1}
			\caption{#2}
		\end{minipage}\hfill
		\begin{minipage}{0.45\textwidth}
			\centering
			\includegraphics[width=\textwidth]{#3}
			\caption{#4}
		\end{minipage}
	\end{figure}
}

%% ============================================================================
%% END OF CLASS FILE
%% ============================================================================
