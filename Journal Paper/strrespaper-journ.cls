\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{strrespaper-journ}[2020/03/13 Journal Article Template for Science, Technology, Engineering, and Mathematics Research]
% Copyright (C) 2020  Vash Ancheta

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

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
\RequirePackage{ragged2e}
\RequirePackage{changepage}
\RequirePackage{titlesec}

\RequirePackage{hyperref}

\hypersetup{
	colorlinks=true,
	linktoc=all,
	citecolor=black,
	filecolor=black,	
	linkcolor=black,
	urlcolor=black
}

\RequirePackage[font=normalsize]{caption}

\captionsetup[table]{
    textfont=it,
    labelsep=newline
}
\captionsetup[figure]{
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
\renewcommand{\abstract}{Abstract should BE written in \underline{one paragraph not to exceed 300 words}. It should summarize the background and scope of the work, the principal results, and note the implications of these results or main conclusions. it should concisely capture the basic content of the paper and be understandable without the text. References and acronyms should be avoided.}
\newcommand{\keywords}{list up to six key words that reflect the content of the paper arranged alphabetically and separated by semicolon.}

\newtoks\affiliation
\newtoks\email
\newtoks\abstract
\newtoks\keywords

\renewcommand{\maketitle}{
    \initheaders
    \twocolumn[{
        \centering
        \textbf{\Large\@title}\\\vspace{2\baselineskip}
        \printauthors\\\vspace{0.5\baselineskip}
        \the\affiliation\\\vspace{0.5\baselineskip}
        Corresponding Author Email: \href{mailto:\the\email}{\textcolor{blue}{\underline{\the\email}}}\\\vspace{2\baselineskip}
        \begin{adjustwidth}{0.55in}{0.55in}
            \section{Abstract}
            \vspace{0.35em}
            \the\abstract
        \end{adjustwidth}
        \textit{Keywords:} \the\keywords\vspace{2.5\baselineskip}
    }]
}

\newcommand{\initheaders}{
    \titleformat{\section}[block]{\bfseries\centering}{}{0pt}{}
    \titlespacing{\section}{0pt}{0pt}{0pt}
    
    \titleformat{\subsection}[block]{\bfseries}{}{0pt}{}
	\titlespacing{\subsection}{0pt}{0pt}{0pt}
}

\makeatletter

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

\makeatother