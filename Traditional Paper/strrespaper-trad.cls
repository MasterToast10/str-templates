\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{strrespaper-trad}[2020/03/11 Traditional Paper Template for Science, Technology, Engineering, and Mathematics Research]
% Vash Ancheta (2020-MAR-11)

\LoadClass[12pt]{article}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage[letterpaper, margin=1in, left=1.5in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{xparse}
\RequirePackage{ifmtarg}
\RequirePackage{titlesec, titletoc, tocloft}
\RequirePackage[linktoc=all]{hyperref}

\hypersetup{
	colorlinks=true,
	linktoc=all,
	citecolor=black,
	filecolor=black,	
	linkcolor=black,
	urlcolor=black
}

\DeclareDocumentCommand{\resnames}{m o o}{
	\makeatletter
	#1{\IfValueT{#2}{\@ifmtarg{#2}{}{\IfValueT{#3}{\@ifmtarg{#3}{ and #2}{, #2 and #3}}}}}
	\makeatother
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\newcommand{\tptitle}{RESEARCH TITLE}
\newcommand{\dayofmonth}{13} % \date token is built-in
\newcommand{\resone}{Researcher Bigboy D. One}
\newcommand{\restwo}{Student A\~na B. Two}
\newcommand{\resthree}{Scholar N. Bayan}
\newcommand{\adviser}{Adviser C. Adviser}
\newcommand{\level}{3}

\newtoks\tptitle \newtoks\dayofmonth
\newtoks\resone \newtoks\restwo \newtoks\resthree
\newtoks\adviser
\newtoks\level

\pagestyle{fancy}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headheight}{15pt}

\newcommand{\contents}{
	\setcounter{tocdepth}{2}
	\cftsetindents{section}{0em}{7em}
	\cftsetindents{subsection}{3em}{0em}
	
	\renewcommand{\cfttoctitlefont}{\normalsize\bf}
	\renewcommand{\cftloftitlefont}{\normalsize\bf Figure \hfill\hspace{-1.15em}}
	\renewcommand{\cftlottitlefont}{\normalsize\bf ~~Table \hfill\hspace{-1.15em}}
	\renewcommand{\contentsname}{}
	\renewcommand{\listfigurename}{Title}
	\renewcommand{\listtablename}{Title}
	\renewcommand{\cftafterloftitle}{\hfill\bf Page \hspace{-1.15em}}
	\renewcommand{\cftafterlottitle}{\hfill\bf Page \hspace{-1.15em}}
	
	\renewcommand\cftsecaftersnum{:}	
	\begin{center}
		{\bf TABLE OF CONTENTS}
	\end{center}
	\tableofcontents
	\thispagestyle{fancy}
	\newpage
	
	\begin{center}
		\phantomsection
		\addcontentsline{toc}{section}{List of Figures}
		{\bf LIST OF FIGURES}
	\end{center}
	\listoffigures
	\thispagestyle{fancy}
	\newpage
	
	\begin{center}
		\phantomsection
		\addcontentsline{toc}{section}{List of Tables}
		{\bf LIST OF TABLES}
	\end{center}
	\listoftables
	\thispagestyle{fancy}
	\newpage
}

\newcommand{\listoflistings}{
    \renewcommand{\lstlistlistingname}{
        \normalsize\bf Listing \hfill \hspace{-1em} Title \hfill Page \hspace{-1em}
    }    

    \begin{center}
		\phantomsection
		\addcontentsline{toc}{section}{List of Listings}
		{\bf LIST OF LISTINGS}
	\end{center}
    \lstlistoflistings
    \thispagestyle{fancy}
    \newpage
}

\newcommand{\mainmatter}{\pagenumbering{arabic} \doublespace}

\newcommand{\termdef}[2]{
    \par \hangindent=1em \hangafter=1 \noindent  
    \textbf{#1}\hspace{2\wordsep}--\hspace{2\wordsep}#2
}

\newcommand{\sectionbreak}{\clearpage}

\newcommand{\initheaders}{
    \titleformat{\section}[display]{\bfseries\centering \singlespacing}{\thesection}{0pt}{\MakeUppercase}
	\titlespacing{\section}{0pt}{12pt}{1.5\baselineskip}

	\titleformat{\subsection}[display]{\bfseries \singlespacing}{}{-\baselineskip}{}
	\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
	
	\titleformat{\subsubsection}{\itshape \singlespacing}{}{1em}{}
	\titlespacing{\subsubsection}{0pt}{0pt}{6pt}

	\titleformat{\paragraph}[display]{\bfseries \singlespacing}{}{\baselineskip}{}
	\titlespacing{\paragraph}{0pt}{\baselineskip}{0pt}
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
		
		\MakeUppercase{\the\resone}\\
		\MakeUppercase{\the\restwo}\\
		\MakeUppercase{\the\resthree}\\
		
		\vspace*{10\baselineskip}\renewcommand{\listfigurename}{\normalsize\underline{Figure No.}\hfill
			\underline{Caption}\hfill
			\underline{Page}}
		
		\@date
	\end{center}
	\newpage \pagenumbering{roman}

	\initheaders
}

\newcommand{\makeapprovalsheet}{
	\begin{center}
		% \phantomsection
		% \addcontentsline{toc}{section}{APPROVAL SHEET}
		{\bf APPROVAL SHEET}
	\end{center}
	\par In \hfill fulfillment \hfill of \hfill the \hfill requirements \hfill in \hfill Science, \hfill Technology, \hfill Engineering \hfill and \\ Mathematics Research \the\level~(STR \the\level), this research entitled, "\@title" is submitted by \resnames{\the\resone}[\the\restwo][\the\resthree] on \the\dayofmonth~\@date
	
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
	\begin{center}
		% \phantomsection
		% \addcontentsline{toc}{section}{ACKNOWLEDGEMENT}
		{\bf ACKNOWLEDGEMENT}
	\end{center}
	\vspace*{-3 \baselineskip}
	\paragraph{}#1
	\newpage
}

\newcommand{\makeabstract}[1]{
	\addcontentsline{toc}{section}{ABSTRACT}	
	\section*{Abstract}
	\noindent{\bfseries \resnames{\the\resone}[\the\restwo][\the\resthree]}. Philippine Science High School --- Cordillera Administrative Region Campus, \underline{\the\dayofmonth \thickspace \@date}. "\@title"
	\vspace*{2\baselineskip}\\
	Adviser: {\bf \the\adviser}	
	\\
	#1
	
	\newpage
}

\newcommand{\definitionofterms}{
	\phantomsection
	\addcontentsline{toc}{section}{DEFINITION OF TERMS}
	\section*{Definition of Terms}
}

\newcommand{\literaturecited}{
	\phantomsection
	\addcontentsline{toc}{section}{LITERATURE CITED}
	\section*{Literature Cited}
	\printbibliography[heading=none]
}

\renewcommand{\thesection}{CHAPTER \Roman{section}}
\renewcommand{\thesubsection}{}

\renewcommand{\appendix}{
	\setcounter{section}{0}%
	\setcounter{subsection}{0}%
    \gdef\thesection{APPENDIX \@Alph\c@section}
    \gdef\sectionbreak{\clearpage}
		\titleformat{\section}[display]{\bfseries\centering \singlespacing}{\phantomsection\thesection}{0pt}{\MakeUppercase}
		\titlespacing{\section}{0pt}{12pt}{0pt}
}