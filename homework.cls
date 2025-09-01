\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{homework}[2025-09-01]

% Load base class
\LoadClass{article}

% Required packages
\RequirePackage{amsmath}
\RequirePackage{listings}
\RequirePackage{xparse}
\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{fix-cm}
\RequirePackage{environ}
\RequirePackage{xcolor}


% 1. Header command
\newcommand{\hwheader}[4]{%
	\begin{center}
		{\fontsize{20pt}{24pt}\selectfont\textbf{#1~HW~#2}}\\[0.5em]
		\textbf{#4} \quad \textbf{#3}\\[1em]
	\end{center}
}

% 2. Homework problem command
\newcounter{hwproblem}
\newcounter{hwsubproblem}[hwproblem]
\newcommand{\problem}[2][\empty]{%
	\refstepcounter{hwproblem}%
	\par\vspace{1em}
	\noindent\textbf{Problem~\ifx\empty#1\empty\thehwproblem\else#1\fi}\ifx\empty#2\empty\else: #2\fi
	\par\vspace{1em}
}

% 3. Homework sub-problem command
\newcommand{\subproblem}[1][\empty]{%
	\refstepcounter{hwsubproblem}%
	\par\vspace{0.5em}
	\noindent\textbf{(\ifx\empty#1\empty\alph{hwsubproblem}\else#1\fi)}
	\par\vspace{0.25em}
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

% Shorthand for aligned equals
\newcommand{\eq}{&=}


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

% Appendix counter and command
\newcounter{hwappendix}
\newcommand{\hwappendix}[2][\empty]{%
	\newpage%
	\refstepcounter{hwappendix}%
	\begin{center}
		{\fontsize{20pt}{24pt}\selectfont\textbf{Appendix~\ifx\empty#1\empty\Alph{hwappendix}\else#1\fi}}\\[0.5em]
		\ifx\empty#2\empty\else\textbf{#2}\\[1em]\fi
	\end{center}
}

