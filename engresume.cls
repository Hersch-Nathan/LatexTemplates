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

\makeatletter

\newif\ifengresume@sectiondivider
\engresume@sectiondividertrue

\newif\ifengresume@firstsection
\engresume@firstsectiontrue

\newif\ifengresume@topdividerdrawn
\engresume@topdividerdrawnfalse

\newcommand{\@resumebasefontsize}{11pt}
\newcommand{\@resumebasebaselineskip}{13.2pt}
\newcommand{\@resumelinespacing}{1.00}

\newlength{\engresume@sectionrulethickness}
\setlength{\engresume@sectionrulethickness}{0.4pt}
\newlength{\engresume@sectionruleprespace}
\setlength{\engresume@sectionruleprespace}{0.25em}
\newlength{\engresume@sectionrulepostspace}
\setlength{\engresume@sectionrulepostspace}{0.15em}

\newcommand{\setresumelinespacing}[1]{%
	\renewcommand{\@resumelinespacing}{#1}%
	\renewcommand{\baselinestretch}{\@resumelinespacing}%
	\selectfont
}

\newcommand{\setresumefontfamily}[1]{%
	\renewcommand{\familydefault}{#1}%
	\normalfont
}

\newcommand{\setresumefontsize}[2]{%
	\renewcommand{\@resumebasefontsize}{#1}%
	\renewcommand{\@resumebasebaselineskip}{#2}%
	\fontsize{\@resumebasefontsize}{\@resumebasebaselineskip}\selectfont
}

\newcommand{\resumesectiondivideron}{\engresume@sectiondividertrue}
\newcommand{\resumesectiondivideroff}{\engresume@sectiondividerfalse}
\newcommand{\setresumesectiondividerthickness}[1]{\setlength{\engresume@sectionrulethickness}{#1}}

\AtBeginDocument{%
	\fontsize{\@resumebasefontsize}{\@resumebasebaselineskip}\selectfont
	\renewcommand{\baselinestretch}{\@resumelinespacing}
	\selectfont
}

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

\titleformat{\section}{\large\bfseries\raggedright}{}{0pt}{\MakeUppercase}
\titlespacing*{\section}{0pt}{0.45em}{0.2em}
\titleformat*{\subsection}{\normalsize\bfseries}
\titlespacing*{\subsection}{0pt}{0.4em}{0.15em}

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

\newcommand{\@appendsubfield}[1]{%
	\def\@trimmedvalue{#1}%
	\ifdefempty{\@trimmedvalue}{}{%
		\ifx\@subline\@empty
			\gdef\@subline{\@contactfield{#1}}%
		\else
			\gappto\@subline{\@resumeseparator\@contactfield{#1}}%
		\fi
	}%
}

\newcommand{\@resumeinsertsectiondivider}{%
	\ifengresume@sectiondivider
		\ifengresume@firstsection
			\global\engresume@firstsectionfalse
		\else
			\vspace{\engresume@sectionruleprespace}
			\noindent\rule{\linewidth}{\engresume@sectionrulethickness}\par
			\vspace{\engresume@sectionrulepostspace}
		\fi
	\fi
}

\newcommand{\@resumeinserttopdivider}{%
	\ifengresume@topdividerdrawn
	\else
		\global\engresume@topdividerdrawntrue
\vspace{0.05em}
		\noindent\rule{\linewidth}{\engresume@sectionrulethickness}\par
\vspace{0.1em}
	\fi
}

\pretocmd{\section}{\@resumeinserttopdivider}{}{}
\pretocmd{\section}{\@resumeinsertsectiondivider}{}{}

%% ============================================================================
%% PUBLIC COMMANDS
%% ============================================================================

\NewDocumentCommand{\header}{m}{%
\par\noindent\centering{\LARGE\bfseries #1\par}
\vspace{0.05em}
}

\NewDocumentCommand{\subheader}{m m m}{%
	\begingroup
	\def\@subline{}%
	\@appendsubfield{#1}%
	\@appendsubfield{#2}%
	\@appendsubfield{#3}%
	\par\noindent\small \@subline\par
	\vspace{0.05em}
	\endgroup
}

\NewDocumentCommand{\tagline}{m}{%
\par\noindent\centering\small #1\par
\vspace{0.1em}
}

\NewDocumentCommand{\school}{o o o o}{%
	\par\noindent
	\textbf{\IfValueTF{#1}{#1}{School Name}}%
	\IfValueT{#2}{\hfill #2}%
	\par
	\IfValueT{#3}{#3\IfValueT{#4}{\hfill GPA: #4}\par}%
	\IfNoValueT{#3}{\IfValueT{#4}{GPA: #4\par}}%
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

\makeatother

%% ============================================================================
%% END OF CLASS FILE
%% ============================================================================
