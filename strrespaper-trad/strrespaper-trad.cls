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

\LoadClass[12pt, letterpaper]{article}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{microtype}
\RequirePackage[letterpaper, margin=1in, left=1.5in]{geometry}
\RequirePackage{xcolor}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage[overload]{textcase}
\RequirePackage{titlesec, tocloft}
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes}

\RequirePackage{glossaries}
\setupglossaries{
	shortcuts
}
\glsdisablehyper

\RequirePackage{xspace}
\xspaceaddexceptions{\csq@qclose@i}

\RequirePackage{xparse}
\DeclareDocumentCommand{\newscientificname}{o o m m m}{
	\IfNoValueTF{#1}{
		\newacronym[first=\emph{#5}]{#3}{\NoCaseChange{\emph{#4}}}{\NoCaseChange{\emph{#5}}}
	}{
		\IfNoValueTF{#2}{
			\newacronym[first=#1 (\emph{#5})]{#3}{\NoCaseChange{\emph{#4}}}{\NoCaseChange{\emph{#5}}}
		}{
			\newacronym[first=#1 (\emph{#5}), #2]{#3}{\NoCaseChange{\emph{#4}}}{\NoCaseChange{\emph{#5}}}
		}
		\expandafter\newcommand\csname #3common\endcsname{#1\xspace}
		\expandafter\newcommand\csname #3Common\endcsname{\MakeTextUppercase#1\xspace}
		\expandafter\newcommand\csname #3first\endcsname{#1 (\NoCaseChange{\emph{#5}})\xspace}
		\expandafter\newcommand\csname #3First\endcsname{\MakeTextUppercase#1 (\NoCaseChange{\emph{#5}})\xspace}
	}
	
	\expandafter\newcommand\csname #3\endcsname{\protect\NoCaseChange{\gls{\NoCaseChange{#3}}}\xspace}
	\expandafter\newcommand\csname #3short\endcsname{\protect\NoCaseChange{\emph{#4}}\xspace}
	\expandafter\newcommand\csname #3long\endcsname{\protect\NoCaseChange{\emph{#5}}\xspace}
}

\RequirePackage{letltxmacro}

\RequirePackage[normalem]{ulem}

\renewcommand\ULdepth{1.6pt}
\renewcommand\ULthickness{0.5pt}
\RequirePackage{pgffor}
\newcommand\ctuline[1]{%
  \begingroup%
  \uline{\phantom{\smash{#1}}}%
  \foreach \hshift in {0.0, 0.1, ..., 0.4}{%
    \foreach \upshift in {-0.4, -0.3, ..., 2.0}{%
      \llap{\color{white}\raisebox{\upshift0pt}[0pt]{#1}\hspace{\hshift0pt}}%
      \llap{\color{white}\raisebox{\upshift0pt}[0pt]{#1}\hspace{-\hshift0pt}}%
    }%
  }%
  \llap{#1}%
  \endgroup%
}

\RequirePackage{hyperref}

\hypersetup{
	colorlinks=true,
	linktoc=all,
	citecolor=black,
	filecolor=black,	
	linkcolor=black,
	urlcolor=black
}

\RequirePackage{bookmark}

\RequirePackage[font=normalsize]{caption}

\captionsetup{
	labelfont=it,
	labelsep=period,
	textformat=period
}
\captionsetup[table]{
	labelfont=default,
	textfont=it,
	textformat=simple
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

\RequirePackage{fancyhdr}

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
	\unnumchapter*{Table of Contents}
	\vspace{-\baselineskip}\tableofcontents
	\thispagestyle{fancy}
	
	\unnumchapter{List of Figures}
	\listoffigures
	\thispagestyle{fancy}
	
	\unnumchapter{List of Tables}
	\listoftables
	\thispagestyle{fancy}
}

\newcommand{\listoflistings}{
	\renewcommand{\lstlistlistingname}{
		\normalsize\bf ~Listing \hfill \hspace{\contentsadjust} Title \hfill Page \hspace{\contentsadjust}
	}

	\unnumchapter{List of Listings}
	\lstlistoflistings
	\thispagestyle{fancy}
	\newpage
}

\newcommand{\frontmatter}{\pagenumbering{roman} \frontheaders \renamesectochap}

\newcommand{\mainmatter}{\pagenumbering{arabic} \doublespace \initheaders}

\renewcommand{\appendix}{
	\setcounter{section}{0}%
	\setcounter{subsection}{0}%
	\renewcommand{\thesection}{Appendix \@Alph\c@section}
	\appendixheaders
	\clearpage\phantomsection
	\addcontentsline{toc}{section}{APPENDICES}
	\def\toclevel@section{2}
	\addtocontents{toc}{\begingroup\string\makeatletter\global\let\string\l@section\string\l@subsection\endgroup}
	\addtocontents{toc}{\protect\setlength{\cftsubsecnumwidth}{5.5em}}
	\addtocontents{toc}{\protect\def\protect\cftsubsecaftersnum{:}}
}

\newcommand{\renamesectochap}{
	\let\oldsection\section
	\let\oldsubsection\subsection
	\let\oldsubsubsection\subsubsection

	\let\chapter\oldsection
	\let\section\oldsubsection
	\let\subsection\oldsubsubsection
}

\newcommand{\sectionbreak}{\clearpage}

\renewcommand{\thesection}{CHAPTER \Roman{section}}
\renewcommand{\thesubsection}{}

\newcommand{\frontheaders}{
	\titleformat{\section}[block]{\bfseries\centering \singlespacing}{}{0pt}{\MakeTextUppercase}
	\titlespacing*{\section}{0pt}{0pt}{0.5\baselineskip}
}

\newcommand{\contentsheaders}{
	\titlespacing*{\section}{0pt}{0pt}{0pt}
}

\newcommand{\initheaders}{
	\titleformat{\section}[display]{\bfseries\centering \singlespacing}{\thesection}{0pt}{\MakeTextUppercase}
	\titlespacing{\section}{0pt}{0pt}{0.5\baselineskip}

	\titleformat{\subsection}[display]{\bfseries \singlespacing}{}{0pt}{}
	\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0pt}
	
	\titleformat{\subsubsection}{\itshape \singlespacing}{}{0pt}{}
	\titlespacing{\subsubsection}{0.5em}{0pt}{0pt}

	\titleformat{\paragraph}[runin]{\bfseries}{}{0pt}{}[.]
	\titlespacing{\paragraph}{\parindent}{0pt}{\wordsep}

	\titleformat{\subparagraph}[runin]{\bfseries\itshape}{}{0pt}{}[.]
	\titlespacing{\subparagraph}{\parindent}{0pt}{\wordsep}
}

\newcommand{\appendixheaders}{
	\titleformat{\section}[display]{\bfseries\centering \singlespacing}{\phantomsection\MakeTextUppercase{\thesection}}{0pt}{\MakeTextUppercase}
	\titlespacing{\section}{0pt}{12pt}{0pt}
}

\let\oldtitlepage\titlepage
\let\oldendtitlepage\endtitlepage
\def\titlepage{
	\oldtitlepage\pdfbookmark[1]{TITLE PAGE}{title}\center\MakeTextUppercase{\the\tptitle}\\
}
\def\endtitlepage{
	\tpauthors\vfill\@date\endcenter\oldendtitlepage
}
\renewcommand{\maketitle}{
	\begin{titlepage}
		\vspace*{12\baselineskip}
			
		A research paper submitted to the\\
		Faculty of the Philippine Science High School --\\
		Cordillera Administrative Region Campus\\
		in fulfillment of the course requirements in\\
		Science, Technology, Engineering and Mathematics Research\\
			
		\vspace*{10\baselineskip}
	\end{titlepage}
}

\def\unnumchapter{\@ifstar\@unnumchapter\@@unnumchapter}
\def\@unnumchapter#1{
	\sectionbreak
	\pdfbookmark[1]{#1}{#1}
	\chapter*{#1}
}
\def\@@unnumchapter#1{
	\sectionbreak
	\phantomsection
	\chapter*{#1}
	\addcontentsline{toc}{section}{#1}
}

\newcommand{\signatureline}[2]{
	\vspace*{3\baselineskip}
	\MakeTextUppercase{#1}\\#2\\
}
\newcommand{\makeapprovalsheet}[1]{
	\unnumchapter*{APPROVAL SHEET}
	\hspace*{\parindent}In fulfillment of the requirements in Science, Technology, Engineering and Mathematics Research \the\level~(STR \the\level), this research entitled, \enquote{\MakeTextUppercase{\@title}} is submitted by\printauthors{} on \the\dayofmonth~\@date
	
	\begin{center}
		\signatureline{\the\adviser}{Research Adviser}
		
		\vspace*{4\baselineskip}
		
		This research paper is hereby accepted by the Research Council.
		
		#1
	\end{center}
}

\newcommand{\makeacknowledgement}[1]{
	\unnumchapter*{ACKNOWLEDGEMENT}

	#1
}

\newcommand{\keywords}[1]{\par\indent\doublespacing\textit{Keywords}: #1}
\newcommand{\makeabstract}[1]{
	\unnumchapter{ABSTRACT}
	{\bfseries\printauthors}. Philippine Science High School -- Cordillera Administrative Region Campus, \ctuline{\the\dayofmonth \thickspace \@date}. \enquote{\MakeTextUppercase{\@title}} \\[2\baselineskip]
	Adviser: {\bf \the\adviser}	\\
	#1
}

\newcommand{\termdef}[2]{
	\def\extradef{\\\hphantom{\textbf{#1}}\hspace{-2\wordsep}--\hspace{3\wordsep}}
	\par \hangindent=1em \hangafter=1 \noindent  
	\textbf{#1}\hspace{2\wordsep}--\hspace{2\wordsep}#2
	\let\extradef\relax
}

\newcommand{\literaturecited}{
	\unnumchapter{LITERATURE CITED}
	\printbibliography[heading=none]
}

% Hyphenation within TypeWriter Fonts
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
	\MakeTextUppercase{\the\author@toks}%
	\endgroup
}