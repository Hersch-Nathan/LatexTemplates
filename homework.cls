\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{homework}[2026-01-12 Homework Class]

% Class options for problem numbering modes
\newif\if@partnumbering
\@partnumberingfalse
\DeclareOption{partnumbering}{\@partnumberingtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{hwcoursebase}}
\ProcessOptions\relax

% Load shared base class
\LoadClass{hwcoursebase}

%% ============================================================================
%% HOMEWORK-SPECIFIC PROBLEM NUMBERING
%% ============================================================================

% Header command for homework
\newcommand{\hwheader}[4]{%
	\begin{center}
		{\fontsize{20pt}{24pt}\selectfont\textbf{#1~HW~#2}}\\[0.5em]
		\textbf{#4} \quad \textbf{#3}\\[1em]
	\end{center}
}

% Part counter (for partnumbering mode)
\newcounter{hwpart}

% Part command (for partnumbering mode only)
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

% Problem counter
\newcounter{hwproblem}
\newcounter{hwsubproblem}[hwproblem]

% Adjust problem counter format based on partnumbering mode
\if@partnumbering
	\renewcommand{\thehwproblem}{\thehwpart.\arabic{hwproblem}}
	\renewcommand{\thehwsubproblem}{\Alph{hwsubproblem}}
\fi

% Problem command
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

% Subproblem command
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

%% ============================================================================
%% APPENDIX COMMAND
%% ============================================================================

\newcounter{hwappendix}

% Appendix command
\newcommand{\hwappendix}[1][\empty]{%
	\newpage%
	\refstepcounter{hwappendix}%
	\begin{center}
		{\fontsize{20pt}{24pt}\selectfont\textbf{Appendix~\Alph{hwappendix}}}%
		\ifx\empty#1\empty\else{: #1}\fi\\[1em]
	\end{center}
}

%% ============================================================================
%% END OF CLASS FILE
%% ============================================================================

