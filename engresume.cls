\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{engresume}[2026/03/20 Engineering Resume]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

%% ============================================================================
%% PACKAGES
%% ============================================================================

\RequirePackage[T1]{fontenc}
\RequirePackage[margin=0.75in]{geometry}
\RequirePackage{xparse}
\RequirePackage{titlesec}
\RequirePackage{booktabs}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{xstring}
\RequirePackage{etoolbox}
\RequirePackage[backend=biber,style=ieee,sorting=none]{biblatex}

%% ============================================================================
%% ATS-SAFE GLOBAL FORMATTING
%% ============================================================================

\setlength{\parindent}{0pt}
\setlength{\parskip}{0.2em}

\setlist[itemize]{
  leftmargin=1.3em,
  itemsep=0.15em,
  topsep=0.2em,
  parsep=0pt,
  partopsep=0pt,
  label=\textbullet
}

\titleformat{\section}{\large\bfseries}{}{0pt}{\MakeUppercase}
\titlespacing*{\section}{0pt}{1.0em}{0.4em}
\titleformat*{\subsection}{\normalsize\bfseries}
\titlespacing*{\subsection}{0pt}{0.7em}{0.2em}

\newcommand{\@resumeseparator}{\enspace|\enspace}

%% ============================================================================
%% INTERNAL LINK DETECTION HELPERS
%% ============================================================================

\newcommand{\@normalizeurl}[1]{%
	\IfBeginWith{#1}{http://}{#1}{%
		\IfBeginWith{#1}{https://}{#1}{https://#1}%
	}%
}

\newcommand{\@contactfield}[1]{%
	\def\@trimmedvalue{#1}%
	\ifdefempty{\@trimmedvalue}{}{%
		\IfSubStr{\@trimmedvalue}{@}{%
			\href{mailto:\@trimmedvalue}{\@trimmedvalue}%
		}{%
			\IfBeginWith{\@trimmedvalue}{http://}{%
				\href{\@trimmedvalue}{\nolinkurl{\@trimmedvalue}}%
			}{%
				\IfBeginWith{\@trimmedvalue}{https://}{%
					\href{\@trimmedvalue}{\nolinkurl{\@trimmedvalue}}%
				}{%
					\IfBeginWith{\@trimmedvalue}{www.}{%
						\href{https://\@trimmedvalue}{\nolinkurl{\@trimmedvalue}}%
					}{%
						\@trimmedvalue%
					}%
				}%
			}%
		}%
	}%
}

\newcommand{\@appendcontact}[1]{%
	\def\@trimmedvalue{#1}%
	\ifdefempty{\@trimmedvalue}{}{%
		\ifx\@contactline\@empty
			\gdef\@contactline{\@contactfield{#1}}%
		\else
			\gappto\@contactline{\@resumeseparator\@contactfield{#1}}%
		\fi
	}%
}

%% ============================================================================
%% PUBLIC COMMANDS
%% ============================================================================

\NewDocumentCommand{\header}{o o o o o o o}{%
	\begingroup
	\def\@name{}%
	\def\@pronouns{}%
	\def\@contactline{}%

	\IfValueT{#1}{\edef\@name{#1}}%
	\IfValueT{#2}{\edef\@pronouns{#2}}%

	\IfValueT{#3}{\@appendcontact{#3}}%
	\IfValueT{#4}{\@appendcontact{#4}}%
	\IfValueT{#5}{\@appendcontact{#5}}%
	\IfValueT{#6}{\@appendcontact{#6}}%
	\IfValueT{#7}{\@appendcontact{#7}}%

	\begin{center}
		{\LARGE\bfseries \@name}
		\ifx\@pronouns\@empty\else\ \normalfont(\@pronouns)\fi
		\par
		\ifx\@contactline\@empty\else
			\small \parbox[t]{\linewidth}{\centering \@contactline}\par
		\fi
	\end{center}
	\endgroup
	\vspace{0.4em}
}

\NewDocumentCommand{\tagline}{m}{%
	\begin{center}
		\small #1
	\end{center}
	\vspace{0.4em}
}

\NewDocumentCommand{\school}{o o o o}{%
	\par\noindent
	\textbf{\IfValueTF{#1}{#1}{School Name}}%
	\IfValueT{#2}{\hfill #2}%
	\par
	\IfValueT{#3}{#3\par}%
	\IfValueT{#4}{GPA: #4\par}%
	\vspace{0.25em}
}

\NewDocumentCommand{\resumelist}{m m}{%
	\par\noindent
	\textbf{#1}: #2\par
	\vspace{0.15em}
}

\NewDocumentCommand{\experience}{o o o o}{%
	\par\noindent
	\textbf{\IfValueTF{#1}{#1}{Organization}}\IfValueT{#4}{\hfill #4}\par
	\IfValueT{#2}{\textit{#2}}\IfValueT{#3}{, #3}\par
}

\NewDocumentCommand{\resumecitation}{m}{%
	\par\noindent\fullcite{#1}\par
}

%% ============================================================================
%% END OF CLASS FILE
%% ============================================================================
