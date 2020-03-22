\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{strrespaper-trad}[2020/03/13 Traditional Paper Template for Science, Technology, Engineering, and Mathematics Research]
% Copyright (C) 2020  Vash Ancheta. All rights reserved.

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

% As copyright holder, I make no restriction on the output produced with
% the templates and only wish to apply the license to the modified versions
% of the TeX template files. You are free to modify the sample files and
% publish the generated output (e.g. PDF files) without providing a copy of the source, 
% however, should you publish a modified version of the source files, you must abide 
% by the terms of the GNU General Public License as published by the Free Software Foundation,
% either version 3 of the License, or (at your option) any later version.

% I do not claim ownership of the sample image used, as it is credited
% to Bernard Hermant on Unsplash linked here:
% https://unsplash.com/@bernardhermant
% You may view the original photo here:
% https://unsplash.com/photos/IhcSHrZXFs4

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.

% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>

% For any concerns regarding this software, please email me at vashpatrickancheta@gmail.com

\LoadClass[12pt]{article}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{microtype}
\RequirePackage[letterpaper, margin=1in, left=1.5in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{titlesec, titletoc, tocloft}

\RequirePackage{hyperref}

\hypersetup{
	colorlinks=true,
	linktoc=all,
	citecolor=black,
	filecolor=black,	
	linkcolor=black,
	urlcolor=black
}

\expandafter\def\expandafter\UrlBreaks\expandafter{\UrlBreaks%  save the current one
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
  \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
  \do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D%
  \do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N%
  \do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X%
  \do\Y\do\Z}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\newcommand{\tptitle}{RESEARCH TITLE}
\newcommand{\dayofmonth}{13} % \date token is built-in
\author{}
\newcommand{\adviser}{Adviser C. Adviser}
\newcommand{\level}{3}

\newtoks\tptitle \newtoks\dayofmonth
\newtoks\adviser
\newtoks\level

\pagestyle{fancy}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headheight}{15pt}

\newcommand{\contents}{
	\contentsheaders

	\setcounter{tocdepth}{2}
	\cftsetindents{section}{0em}{7em}
	\cftsetindents{subsection}{2em}{0em}
	
	\newlength{\contentsadjust}
	\setlength{\contentsadjust}{-0.95em}
	
	\renewcommand{\cfttoctitlefont}{\normalsize\bf}
	\renewcommand{\cftloftitlefont}{\normalsize\bf ~Figure \hfill\hspace{\contentsadjust}}
	\renewcommand{\cftlottitlefont}{\normalsize\bf ~~Table \hfill\hspace{\contentsadjust}}
	\renewcommand{\contentsname}{}
	\renewcommand{\listfigurename}{Title}
	\renewcommand{\listtablename}{Title}
	\renewcommand{\cftafterloftitle}{\hfill\bf Page \hspace{\contentsadjust}}
	\renewcommand{\cftafterlottitle}{\hfill\bf Page \hspace{\contentsadjust}}
	
	\renewcommand\cftsecaftersnum{:}	
	\section*{Table of Contents}
	\vspace{-\baselineskip}\tableofcontents
	\thispagestyle{fancy}
	\newpage
	
	\phantomsection
	\addcontentsline{toc}{section}{List of Figures}
	\section*{List of Figures}
	\listoffigures
	\thispagestyle{fancy}
	\newpage
	
	\phantomsection
	\addcontentsline{toc}{section}{List of Tables}
	\section*{List of Tables}
	\listoftables
	\thispagestyle{fancy}
	\newpage
}

\newcommand{\listoflistings}{
    \renewcommand{\lstlistlistingname}{
        \normalsize\bf ~Listing \hfill \hspace{\contentsadjust} Title \hfill Page \hspace{\contentsadjust}
    }    

    \phantomsection
	\addcontentsline{toc}{section}{List of Listings}
	\section*{List of Listings}
    \lstlistoflistings
    \thispagestyle{fancy}
    \newpage
}

\newcommand{\frontmatter}{\pagenumbering{roman} \frontheaders}

\newcommand{\mainmatter}{\pagenumbering{arabic} \doublespace \initheaders}

\renewcommand{\appendix}{
	\setcounter{section}{0}%
	\setcounter{subsection}{0}%
    \gdef\thesection{APPENDIX \@Alph\c@section}
	\gdef\sectionbreak{\clearpage}
	\appendixheaders
}

\newcommand{\sectionbreak}{\clearpage}

\renewcommand{\thesection}{CHAPTER \Roman{section}}
\renewcommand{\thesubsection}{}

\newcommand{\frontheaders}{
	\titleformat{\section}[display]{\bfseries\centering \singlespacing}{\thesection}{0pt}{\MakeUppercase}
	\titlespacing*{\section}{0pt}{0pt}{0.5\baselineskip}
}

\newcommand{\contentsheaders}{
	\titlespacing*{\section}{0pt}{0pt}{0pt}
}

\newcommand{\initheaders}{
    \titleformat{\section}[display]{\bfseries\centering \singlespacing}{\thesection}{0pt}{\MakeUppercase}
	\titlespacing{\section}{0pt}{0pt}{0.5\baselineskip}

	\titleformat{\subsection}[display]{\bfseries \singlespacing}{}{-\baselineskip}{}
	\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0pt}
	
	\titleformat{\subsubsection}{\itshape \singlespacing}{}{0pt}{}
	\titlespacing{\subsubsection}{0.5em}{0pt}{6pt}

	\titleformat{\paragraph}[display]{\bfseries \singlespacing}{}{-\baselineskip}{}
	\titlespacing{\paragraph}{0pt}{0.5\baselineskip}{0pt}

	\titleformat{\subparagraph}{\itshape \singlespacing}{}{0pt}{}
	\titlespacing{\subparagraph}{0.5em}{0pt}{6pt}
}

\newcommand{\appendixheaders}{
	\titleformat{\section}[display]{\bfseries\centering \singlespacing}{\phantomsection\thesection}{0pt}{\MakeUppercase}
	\titlespacing{\section}{0pt}{12pt}{0pt}
}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\begin{center}
		\the\tptitle\\
		
		\vspace*{12\baselineskip}
		
		A research paper submitted to the\\
		Faculty of the Philippine Science High School-\\
		Cordillera Administrative Region Campus\\
		in fulfillment of the course requirements in\\
		Science, Technology, Engineering and Mathematics Research\\
		
		\vspace*{10\baselineskip}
		
		\tpauthors
		
		\vfill
		
		\@date
	\end{center}
	\newpage
}

\def\unnumsection{\@ifstar\@unnumsection\@@unnumsection}
\def\@unnumsection#1{
	\section*{#1}
}
\def\@@unnumsection#1{
	\clearpage\phantomsection
	\section*{#1}
	\addcontentsline{toc}{section}{#1}
}

\newcommand{\makeapprovalsheet}{
	\unnumsection*{APPROVAL SHEET}
	\hspace*{\parindent}In fulfillment of the requirements in Science, Technology, Engineering and Mathematics Research \the\level~(STR \the\level), this research entitled, "\@title" is submitted by\printauthors{} on \the\dayofmonth~\@date
	
	\vspace*{3\baselineskip}
	
	\begin{center}
		\MakeUppercase{\the\adviser}\\
		Research Adviser\\
		
		\vspace*{4\baselineskip}
		
		This research paper is hereby accepted by the Research Council.
		
		\vspace*{3\baselineskip}
		CONRADO C. ROTOR, Jr., Ph.D.\\
		Chair\\
		
		\vspace*{3\baselineskip}
		MELBA C. PATACSIL\\
		Co-chair\\
		
		\vspace*{4\baselineskip}
		\begin{multicols}{2}
			\begin{center}
				JAY JAY F. MANUEL\\
				Member\\
				
				\vspace*{3\baselineskip}
				
				RICARIDO M. SATURAY, JR.\\
				Member\\
				
				\columnbreak
				
				MARITES P. RIVERA\\
				Member\\
				
				\vspace*{3\baselineskip}
				
				FREDA M. WONG\\
				Member\\
			\end{center}
		\end{multicols}
		\newpage
	\end{center}
}

\newcommand{\makeacknowledgement}[1]{
	\unnumsection*{ACKNOWLEDGEMENT}
	#1
	\newpage
}

\newcommand{\makeabstract}[1]{
	\unnumsection{ABSTRACT}
	{\bfseries\printauthors}. Philippine Science High School --- Cordillera Administrative Region Campus, \underline{\the\dayofmonth \thickspace \@date}. "\@title"
	\vspace*{2\baselineskip}\\
	Adviser: {\bf \the\adviser}	
	\\
	#1
	
	\newpage
}

\newcommand{\termdef}[2]{
    \par \hangindent=1em \hangafter=1 \noindent  
    \textbf{#1}\hspace{2\wordsep}--\hspace{2\wordsep}#2
}

\newcommand{\literaturecited}{
	\unnumsection{LITERATURE CITED}
	\printbibliography[heading=none]
}

% Hyphenation within TypeWriter Fonts
\RequirePackage{letltxmacro}
\LetLtxMacro\origttfamily\ttfamily
\DeclareRobustCommand*{\ttfamily}{%
  \origttfamily
  \hyphenchar\font=`\-\relax
  \fontdimen3\font=.25em\relax
  \fontdimen4\font=.167em\relax
  \fontdimen7\font=.167em\relax
}

\DeclareRobustCommand\vttfamily{%
  \not@math@alphabet\vttfamily\relax
  \fontfamily{lmvtt}% cmvtt (Computer Modern) or lmvtt (Latin Modern)
  \selectfont
}
\DeclareTextFontCommand{\textvtt}{\vttfamily}

\newtoks\author@toks\newcounter{author@counter}%
\setcounter{author@counter}{0}%
\newcommand{\addAuthor}[1]{%
	\ifnum\theauthor@counter>0\author@toks=\expandafter{\the\author@toks\@elt\relax #1}%
	\else\author@toks=\expandafter{\the\author@toks\@author{#1}}%
	\fi\stepcounter{author@counter}%
}

\newcounter{dummycounter}
\newcommand{\printauthors}{%
	\begingroup
	\setcounter{dummycounter}{0}%
	\def\@elt##1{%
	\ifnum\c@dummycounter < \numexpr\c@author@counter - 2\relax%
	, 
	\else
	{ and }%
	\fi
	\stepcounter{dummycounter}%
	}
	\the\author@toks%
	\endgroup
}

\newcommand{\tpauthors}{%
	\begingroup
	\def\@elt##1{\\}%
	\MakeUppercase{\the\author@toks}%
	\endgroup
}