\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{homework}[2025-09-01]

% Class options
\newif\if@partnumbering
\@partnumberingfalse
\DeclareOption{partnumbering}{\@partnumberingtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load base class
\LoadClass{article}

% Required packages
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


% 1. Header command
\newcommand{\hwheader}[4]{%
	\begin{center}
		{\fontsize{20pt}{24pt}\selectfont\textbf{#1~HW~#2}}\\[0.5em]
		\textbf{#4} \quad \textbf{#3}\\[1em]
	\end{center}
}

% 1a. Part command (for partnumbering mode)
\newcounter{hwpart}
\newcommand{\hwpart}[1]{%
	\if@partnumbering
		\refstepcounter{hwpart}%
		\setcounter{hwproblem}{0}%
		\par\vspace{1.5em}
		\noindent{\large\textbf{Part~\thehwpart: #1}}
		\par\vspace{1em}
	\else
		\PackageWarning{homework}{\noexpand\hwpart command requires partnumbering option}
	\fi
}

% 2. Homework problem command
\newcounter{hwproblem}
\newcounter{hwsubproblem}[hwproblem]

\if@partnumbering
	\renewcommand{\thehwproblem}{\thehwpart.\arabic{hwproblem}}
	\renewcommand{\thehwsubproblem}{\Alph{hwsubproblem}}
\fi

\newcommand{\problem}[2][\empty]{%
	\refstepcounter{hwproblem}%
	\par\vspace{1em}
	\if@partnumbering
		\noindent\textbf{Problem~\thehwproblem}\ifx\empty#2\empty\else: #2\fi
	\else
		\noindent\textbf{Problem~\ifx\empty#1\empty\thehwproblem\else#1\fi}\ifx\empty#2\empty\else: #2\fi
	\fi
	\par\vspace{1em}
}

% 3. Homework sub-problem command
\newcommand{\subproblem}[2][\empty]{%
	\refstepcounter{hwsubproblem}%
	\par\vspace{0.5em}
	\if@partnumbering
		\noindent\textbf{\ifx\empty#1\empty\thehwsubproblem\else#1\fi.}\ifx\empty#2\empty\else~#2\fi
		\par\vspace{0.25em}
	\else
		\noindent\textbf{(\ifx\empty#1\empty\alph{hwsubproblem}\else#1\fi)}
		\par\vspace{0.25em}
	\fi
}

% 4. Custom math environment for homework solutions
% Left-justified math with equal sign alignment
\NewEnviron{hwmath}{%
	\par\vspace{0.5em}%
	\begin{align*}%
	\BODY%
	\end{align*}%
	\vspace{0.5em}%
}

% Shorthand for aligned equals and comparison operators
\newcommand{\eq}{&=}
\newcommand{\gt}{&>}
\newcommand{\lt}{&<}
\newcommand{\llt}{&<<}
\newcommand{\ggt}{&>>}
\renewcommand{\geqq}{&\geq}
\renewcommand{\leqq}{&\leq}
\newcommand{\neqq}{&\neq}
\newcommand{\approxx}{&\approx}


% Alternative numbered environment 
\NewEnviron{hwmathnumbered}{%
	\par\vspace{0.5em}%
	\begin{align}%
	\BODY%
	\end{align}%
	\vspace{0.5em}%
}

% Note command for highlighting important text in bold, red, and large font
\NewDocumentCommand{\note}{o}{%
	\IfValueTF{#1}{%
		{\Large\textbf{\textcolor{red}{#1}}}%
	}{%
		{\Large\textbf{\textcolor{red}{NOTE}}}%
	}%
}

% Example environment - creates a framed box with a header
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

% Graphic inclusion command with automatic centering, optional title, and optional scale
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

% MATLAB code environment with caption
\lstnewenvironment{hwmatlab}[1][]{%
	\lstset{language=Matlab, #1}%
}{}

% Python code environment with caption
\lstnewenvironment{hwpython}[1][]{%
	\lstset{language=Python, #1}%
}{}

% Terminal output environment with caption
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

% Block diagram environment for centered tikzpicture with blox support
\NewEnviron{hwblocks}[1][]{%
	\par\vspace{0.5em}%
	\begin{center}%
		\begin{tikzpicture}[#1]%
			\BODY%
		\end{tikzpicture}%
	\end{center}%
	\vspace{0.5em}%
}

% Appendix counter and command
\newcounter{hwappendix}
\newcommand{\hwappendix}[1][\empty]{%
	\newpage%
	\refstepcounter{hwappendix}%
	\begin{center}
		{\fontsize{20pt}{24pt}\selectfont\textbf{Appendix~\Alph{hwappendix}}}%
		\ifx\empty#1\empty\else{: #1}\fi\\[1em]
	\end{center}
}

