\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{strrespaper-journ}[2020/03/13 Journal Article Template for Science, Technology, Engineering, and Mathematics Research]
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

\LoadClass[10pt]{article}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{microtype}
\RequirePackage[letterpaper, margin=1in, left=1.75cm, right=1.75cm]{geometry}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage{ragged2e}
\RequirePackage{changepage}
\RequirePackage{titlesec}

\RequirePackage{tabularx}
\renewcommand\tabularxcolumn[1]{>{\Centering}p{#1}}

\RequirePackage[normalem]{ulem}
\renewcommand\ULdepth{1.6pt}
\renewcommand\ULthickness{0.5pt}
\RequirePackage{pgffor}
\newcommand\ctuline[1]{%
	\begingroup%
	\uline{\phantom{\smash{#1}}}%
	\foreach \hshift in {0.0, 0.1, ..., 0.4}{%
		\foreach \upshift in {-0.4, -0.3, ..., 1.0}{%
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

\expandafter\def\expandafter\UrlBreaks\expandafter{\UrlBreaks%  save the current one
	\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
	\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
	\do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D%
	\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N%
	\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X%
	\do\Y\do\Z}

\RequirePackage[font=normalsize]{caption}

\captionsetup[table]{
	singlelinecheck=false,
	textfont=it,
	labelsep=newline
}
\captionsetup[figure]{
	textformat=period,
	labelfont=it,
	labelsep=period
}

\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}\renewcommand{\headrulewidth}{0pt}
\rfoot{\fontsize{12}{\baselineskip}\selectfont\thepage\fontsize{10}{\baselineskip}\selectfont}

\newcommand{\runningHead}[1]{
	\lhead{\MakeUppercase{#1}}
}

\setlength{\parskip}{0.5\baselineskip}

\author{}

\newcommand{\affiliation}{Philippine Science High School – Main Campus, Department of Science and Technology, Agham Road, Diliman, Quezon City, 1101, Philippines}
\newcommand{\email}{author@pshs.edu.ph}
\renewcommand{\abstract}{Abstract should BE written in \ctuline{one paragraph not to exceed 300 words}. It should summarize the background and scope of the work, the principal results, and note the implications of these results or main conclusions. it should concisely capture the basic content of the paper and be understandable without the text. References and acronyms should be avoided.}
\newcommand{\keywords}{list up to six key words that reflect the content of the paper arranged alphabetically and separated by semicolon.}

\newtoks\affiliation
\newtoks\email
\newtoks\abstract
\newtoks\keywords

\renewcommand{\maketitle}{
	\initheaders
	\twocolumn[{
		\centering
		\textbf{\Large\@title}\\[1.5\baselineskip]
		\printauthors\\[0.5\baselineskip]
		\the\affiliation\\[0.5\baselineskip]
		Corresponding Author Email: \href{mailto:\the\email}{\textcolor{blue}{\ctuline{\the\email}}}\\[1.5\baselineskip]
		\begin{adjustwidth}{0.55in}{0.55in}
			\section{Abstract}\vspace{0.5\baselineskip}
			\the\abstract\\
			\hspace*{2em}\textit{Keywords:} \doublespacing\the\keywords\\[\baselineskip]
		\end{adjustwidth}
	}]
}

\newcommand{\initheaders}{
	\titleformat{\section}[block]{\bfseries\centering}{}{0pt}{}
	\titlespacing{\section}{0pt}{0pt}{0pt}

	\titleformat{\subsection}[block]{\bfseries}{}{0pt}{}
	\titlespacing{\subsection}{0pt}{0pt}{0pt}

	\titleformat{\subsubsection}{\bfseries\itshape}{}{0pt}{}
	\titlespacing{\subsubsection}{0pt}{0pt}{0pt}

	\titleformat{\paragraph}[runin]{\bfseries}{}{0pt}{}[.]
	\titlespacing{\paragraph}{\parindent}{0pt}{\wordsep}

	\titleformat{\subparagraph}[runin]{\bfseries\itshape}{}{0pt}{}[.]
	\titlespacing{\subparagraph}{\parindent}{0pt}{\wordsep}
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
	\fontfamily{cmvtt}% cmvtt (Computer Modern) or lmvtt (Latin Modern)
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
	\ifnum\c@dummycounter < \numexpr\c@author@counter - 3\relax%
	,
	\else
	{\ifnum\c@dummycounter < \numexpr\c@author@counter - 2\relax%
	,\\
	\else
	{ and}%
	\fi}
	\fi
	\stepcounter{dummycounter}%
	}
	\the\author@toks%
	\endgroup
}