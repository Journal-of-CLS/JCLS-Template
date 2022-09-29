%
%                               ,--,              
%          ,---._             ,---.'|              
%       .-- -.' \   ,----..  |   | :   .--.--.    
%       |    |   : /   /   \ :   : |  /  /    '.  
%       :    ;   ||   :     :|   ' : |  :  /`. /  
%       :        |.   |  ;. /;   ; ' ;  |  |--`   
%       |    :   :.   ; /--` '   | |_|  :  ;_     
%       :         ;   | ;    |   | :.'\  \    `.  
%       |    ;   ||   : |    '   :    ;`----.   \ 
%   ___ l         .   | '___ |   |  ./ __ \  \  | 
%  /    /\    J   :'   ; : .'|;   : ;  /  /`--'  / 
% /  ../  `..-    ,'   | '/  :|   ,/  '--'.     /  
% \    \         ; |   :    / '---'     `--'---'   
%  \    \      ,'   \   \ .'                       
%   "---....--'      `---`                         
%                   
%                                 Journal of 
%                                 Computational
%                                 Literary Studies
%                                
%                                 https://jcls.io
%
%
% This is file jcls.cls
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Dominik Gerstorfer.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jcls}[2022/09/28 v0.5.3 LaTeX class for JCLS]
\typeout{This is jcls.cls 2022-09-28 v0.5.3}

\LoadClass{article}

%\RequirePackage{silence}
%\WarningsOff*

\RequirePackage{amsmath,amssymb}
\RequirePackage{setspace}
\setstretch{1.25}

\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{xkeyval}

\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage[style=authoryear-icomp,backend=biber,maxbibnames=99,maxcitenames=2,uniquelist=false]{biblatex}
\RequirePackage{datetime2}

% color
\RequirePackage[dvipsnames,svgnames]{xcolor}

\definecolor{jcls-red}      {RGB} {175, 29,  31}
\definecolor{jcls-gray}     {RGB} {90,  90,  90}
\definecolor{orcid-green}   {RGB} {166, 206, 57}

\colorlet{primarycolor}     {jcls-red}
\colorlet{secundarycolor}   {jcls-gray}

\colorlet{graycolor}        {jcls-gray}
\colorlet{highlightcolor1}  {DarkOrange}
\colorlet{highlightcolor2}  {DodgerBlue}
\colorlet{highlightcolor3}  {DarkGreen}
\colorlet{highlightcolor4}  {DarkMagenta}

\colorlet{filecolor}        {highlightcolor1}
\colorlet{linkcolor}        {highlightcolor2}
\colorlet{citecolor}        {highlightcolor3}
\colorlet{urlcolor}         {highlightcolor4}

\colorlet{backgroundcolor}  {graycolor!10}

% font
\RequirePackage{ccicons}
\RequirePackage{academicons}
\RequirePackage{parskip}
\RequirePackage{unicode-math}
\defaultfontfeatures{Scale=MatchLowercase}
\defaultfontfeatures[\rmfamily]{Ligatures=TeX,Scale=1}

\setmainfont{texgyrepagella}[
	Extension = .otf,
	UprightFont = *-regular,
	BoldFont = *-bold,
	ItalicFont = *-italic,
	BoldItalicFont = *-bolditalic]

\setmathfont{texgyrepagella-math}[
	Extension = .otf,]

\setsansfont{FiraSans}[
	Extension = .otf,
	UprightFont = *-Regular,
	BoldFont = *-Bold,
	ItalicFont = *-Italic,
	BoldItalicFont = *-BoldItalic]

\setmonofont{FiraCode}[
	Extension = .ttf,
	Path = ./fonts/firacode/,
	Contextuals = Alternate,
	UprightFont = *-Regular,
	BoldFont = *-Bold,]

\newfontfamily{\ubuntu}{Ubuntu}[
	Extension = .ttf,
	Path = ./fonts/ubuntu/,
	UprightFont = *-R,
	BoldFont = *-B,
	ItalicFont = *-RI,
	BoldItalicFont = *-BI]

\newfontfamily{\ubuntumono}{UbuntuMono}[
	Extension = .ttf,
	Path = ./fonts/ubuntu/,
	UprightFont = *-R,
	BoldFont = *-B,
	ItalicFont = *-RI,
	BoldItalicFont = *-BI]


\RequirePackage{microtype}
\RequirePackage{upquote}
\RequirePackage{xurl}
\RequirePackage{bookmark}

% layout
\RequirePackage{geometry}
\geometry{
	paper=a4paper,
	top=30mm,
	right=17mm,
	left=60mm,
	footskip=17mm,
	marginparsep=3mm,
	marginparwidth=40mm,
	reversemarginpar=true
}


% graphics
\RequirePackage{graphicx}
\graphicspath{{./figures/}}
\RequirePackage[Export]{adjustbox}
\RequirePackage{sidenotes}

% tables
\RequirePackage{booktabs}
\RequirePackage{longtable}
\setlength\LTleft{0pt}
\setlength\LTright{\fill}

% orcid
\DeclareRobustCommand\orcidlink[1]{\texorpdfstring{%
		\href{https://orcid.org/#1}{\textcolor{orcid-green}{\aiOrcid}}}{}}
% code
\RequirePackage{listings}
\RequirePackage[verbatim]{lstfiracode}

\RequirePackage[right]{lineno}
\renewcommand{\linenumberfont}{\ttfamily\small\color{primarycolor}}

\lstset{
	style=FiraCodeStyle,
	basicstyle=\ttfamily,
	commentstyle=\itshape\color{graycolor},
	keywordstyle=\bfseries\color{highlightcolor2},
	numberstyle=\ttfamily\small\color{graycolor},
	stringstyle=\color{highlightcolor3},
	breakatwhitespace=false,
	breaklines=true,
	captionpos=b,
	keepspaces=true,
	numbers=left,
	numbersep=1em,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2
}

\RequirePackage{selnolig}
\RequirePackage{marginfix}
\RequirePackage{marginnote}
\renewcommand*{\marginfont}{\sffamily\footnotesize}
\renewcommand*{\raggedleftmarginnote}{}
\RequirePackage{changepage}
\RequirePackage{ifthen}
\newlength{\overhang}
\setlength{\overhang}{\marginparwidth}
\addtolength{\overhang}{\marginparsep}
\newenvironment{fullwidth}
{\setlength\LTleft{-\overhang}
	\ifthenelse{\boolean{@twoside}}
	{\begin{adjustwidth*}{-\overhang}{}}
	{\begin{adjustwidth}{-\overhang}{}}}
			{\ifthenelse{\boolean{@twoside}}
			{\end{adjustwidth*}}
			{\end{adjustwidth}}}

\RequirePackage{pdflscape}
\RequirePackage{tcolorbox}
\newtcolorbox{titlebox}{colback=white,arc=0pt,outer arc=0pt,colframe=white}
\newtcolorbox{abstractbox}{colback=secundarycolor!10,arc=0pt,outer arc=0pt,colframe=secundarycolor!10}
\RequirePackage[ragged,bottom,norule,multiple]{footmisc}
\renewcommand{\footnotemargin}{0em}
\renewcommand*{\thefootnote}{\arabic{footnote}}
\renewcommand*\@makefntext[1]%
{\noindent{\@thefnmark}. #1}

\RequirePackage[
	%format=hang,
	justification=raggedright,
	singlelinecheck=off,
	labelfont=bf,
	font={normalfont,sf}]{caption}

\NewDocumentCommand\setfield{mO{}m}%
{\csdef{@#1#2}{#3}}
\NewDocumentCommand\getfield{mO{}}%
{\ifcsvoid{@#1#2}{}{\csuse{@#1#2}}}
\NewDocumentCommand\printfield{mO{}O{}}{%
\ifcsvoid{@#1#2}{}{\csuse{@#1#2}\unskip#3}%
}

\NewDocumentCommand\keywords{m}%
{\setfield{keywords}{#1}}
\NewDocumentCommand\datereceived{m}%
{\setfield{datereceived}{#1}}
\NewDocumentCommand\dateaccepted{m}%
{\setfield{dateaccepted}{#1}}
\let\date\relax
\NewDocumentCommand\datepublished{m}%
{
	\setfield{datepublished}{#1}%
	\setfield{date}{#1}
}
\NewDocumentCommand\doi{m}%
{\@ifmtarg{#1}
	{}
	{\setfield{doi}{\href{https://doi.org/#1}{doi.org/#1}}}
}
\NewDocumentCommand\shorttitle{m}%
{\setfield{shorttitle}{#1}}
\NewDocumentCommand\howtocite{m}%
{\setfield{howtocite}{#1}}
\NewDocumentCommand\subtitle{m}%
{\setfield{subtitle}{#1}}
\NewDocumentCommand\articletype{m}%
{\@ifmtarg{#1}
	{\setfield{articletype}{SUBMITTED
		}}
	{\setfield{articletype}{#1}}
}
\NewDocumentCommand\issuetitle{m}%
{\setfield{issuetitle}{#1}}
\NewDocumentCommand\issuenumber{m}%
{\setfield{issuenumber}{#1}}
\NewDocumentCommand\issuenote{m}%
{\setfield{issuenote}{#1}}
\NewDocumentCommand\reviewer{m}%
{\setfield{reviewer}{#1}}
\NewDocumentCommand\dataavailability{m}%
{\setfield{dataavailability}{#1}}
\NewDocumentCommand\softwareavailability{m}%
{\setfield{softwareavailability}{#1}}
\NewDocumentCommand\license{m}%
{\setfield{license}{#1}}

\NewDocumentCommand\sideinfos{}{}
\NewDocumentCommand\sideinfo{mmO{\newline}}{%
	\gappto\sideinfos{%
		\marginpar{\raggedright\sffamily\footnotesize\textbf{#1} #3 #2 \vspace{1.5ex}}%
	}
}

\NewDocumentCommand\sideinfofield{mm}{
	\ifcsvoid{@#2}
	{}
	{\sideinfo{#1}{\csuse{@#2}}}
}

% authors and affiliations
\newcounter{authors}
\newcounter{affiliations}
\newcounter{counter}

\define@key{author}{orcid}{\csdef{author@orcid}{#1}}
\define@key{author}{surname}{\csdef{author@surname}{#1}}
\define@key{author}{given-names}{\csdef{author@givennames}{#1}}
\define@key{author}{email}{\csdef{author@email}{#1}}
\define@key{author}{affiliation}{\csdef{author@affiliation}{#1}}
\define@key{author}{equal-contrib}{\csdef{author@equalcontrib}{#1}}
\define@key{author}{cor-id}{\csdef{author@corid}{#1}}
\define@key{author}{contribution}{\csdef{author@contribution}{#1}}
\presetkeys{author}{ % Set default values 
	email=,
	affiliation=,
	contribution=,
}{}

\define@key{affiliation}{id}{\csdef{aff@id}{#1}}
\define@key{affiliation}{group}{\csdef{aff@group}{#1}}
\define@key{affiliation}{department}{\csdef{aff@department}{#1}}
\define@key{affiliation}{organization}{\csdef{aff@organization}{#1}}
\define@key{affiliation}{isni}{\csdef{aff@isni}{#1}}
\define@key{affiliation}{ringgold}{\csdef{aff@ringgold}{#1}}
\define@key{affiliation}{ror}{\csdef{aff@ror}{#1}}
\define@key{affiliation}{pid}{\csdef{aff@pid}{#1}}
\define@key{affiliation}{street-address}{\csdef{aff@streetaddress}{#1}}
\define@key{affiliation}{city}{\csdef{aff@city}{#1}}
\define@key{affiliation}{country}{\csdef{aff@county}{#1}}
\define@key{affiliation}{country-code}{\csdef{aff@countrycode}{#1}}
\presetkeys{affiliation}{ % Set default values 
	organization=,
	street-address=,
	country=,
	country-code=,
}{}

\RenewDocumentCommand\author{m}{%
	\begingroup
	\global\stepcounter{authors}%
	\setkeys{author}{#1}%
	\global\csedef{@orcid\theauthors}{\expandafter\author@orcid}%
	\global\csedef{@surname\theauthors}{\expandafter\author@surname}%
	\global\csedef{@givennames\theauthors}{\expandafter\author@givennames}%
	\global\csedef{@email\theauthors}{\expandafter\author@email}%
	\global\csedef{@affiliation\theauthors}{\expandafter\author@affiliation}%
	\global\csedef{@contribution\theauthors}{\expandafter\author@contribution}%
	\endgroup
}

\NewDocumentCommand\affiliation{m}{%
	\begingroup
	\setkeys{affiliation}{#1}
	\global\csedef{@department\aff@id}{\expandafter\aff@department}%
	\global\csedef{@organization\aff@id}{\expandafter\aff@organization}%
	\global\csedef{@streetaddress\aff@id}{\expandafter\aff@streetaddress}%
	\global\csedef{@city\aff@id}{\expandafter\aff@city}%
	\endgroup
}

\NewDocumentCommand\printauthor{m}{%
	\printfield{givennames}[#1] \printfield{surname}[#1]
	\ifcsvoid{@orcid#1}
	{\unskip}
	{\unskip\,\orcidlink{\csuse{@orcid#1}}}
	\ifcsvoid{@affiliation#1}
	{}
	{\ifcsvoid{@affilmarker\csuse{@affiliation#1}}
		{\stepcounter{affiliations}%
			\csedef{@affilmarker\csuse{@affiliation#1}}{\theaffiliations}%
			\csedef{@affilnum\theaffiliations}{\csuse{@affiliation#1}}}
		{}}%
	\unskip\,\textsuperscript{\csuse{@affilmarker\csuse{@affiliation#1}}}%
}

\NewDocumentCommand\printaffiliation{m}{%
	\printfield{affilmarker}[#1][.\;]%
	\printfield{department}[#1][, ]%
	\printfield{organization}[#1][, ]%
	\printfield{streetaddress}[#1][, ]%
	\printfield{city}[#1][.]%
}

\NewDocumentCommand\printcontribution{m}{%
	\ifcsvoid{@contribution#1}
	{}
	{\textbf{\printfield{givennames}[#1] \printfield{surname}[#1]:} \printfield{contribution}[#1]}
}

\NewDocumentCommand\printauthors{}{%
	\setcounter{counter}{0}
	\@whilenum\value{counter}<\value{authors}\do
	{\stepcounter{counter}\printauthor{\thecounter}\par}
}

\NewDocumentCommand\printaffiliations{}{%
	\setcounter{counter}{0}
	\@whilenum\value{counter}<\value{affiliations}\do
	{\stepcounter{counter}\printaffiliation{\csuse{@affilnum\thecounter}}\par}
}

\NewDocumentCommand\printcontributions{}{%
	\section{Author contributions}
	\setcounter{counter}{0}
	\@whilenum\value{counter}<\value{authors}\do
	{\stepcounter{counter}\printcontribution{\thecounter}\par}
}

\NewDocumentCommand\printacknowledgements{}{%
	\IfFileExists{acknowledgements.tex}
	{\section{Acknowledgements}
		\input{acknowledgements.tex}}
	{}
}

\NewDocumentCommand\printdataavailability{}{%
	\ifcsvoid{@dataavailability}
	{}
	{\section{Data availability}
		\csuse{@dataavailability}}
}

\NewDocumentCommand\printsoftwareavailability{}{%
	\ifcsvoid{@softwareavailability}
	{}
	{\section{Software availability}
		\csuse{@softwareavailability}}
}

\NewDocumentCommand\printarticletype{}{%
	\ifcsvoid{@doi}
	{\getfield{articletype}}
	{\getfield{doi}}
}

% headers and footers
\RequirePackage{fancyhdr}

\fancypagestyle{plain}{% used for the first page
	\fancyhf{}% clear all header and footer fields 
	\fancyhead[L]{}
	\fancyfoot[L]{}
	\fancyfoot[R]{\sffamily \thepage}
	\renewcommand{\headrulewidth}{0pt}% 
	\renewcommand{\footrulewidth}{0pt}%
}

\fancypagestyle{jcls}{% 
	\fancyhf{}% clear all header and footer fields 
	\fancyhead[L]{}
	\fancyhead[R]{\sffamily\printfield{shorttitle}}
	\fancyfoot[L]{\sffamily JCLS,\printfield{issuenumber}[, ] \the\year, \printarticletype}
	\fancyfoot[R]{\sffamily \thepage}
	\renewcommand{\headrulewidth}{0pt}% 
	\renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{jcls}

% headings
\RequirePackage[small,sf,bf,raggedright,clearempty]{titlesec}
\titleformat{\section}
{\Large\sffamily\bfseries}
{\thesection.}{0.5em}{}
\titleformat{\subsection}
{\large\sffamily\bfseries}
{\thesubsection.}{0.5em}{}
\titleformat{\subsubsection}
{\large\sffamily\bfseries}
{\thesubsubsection.}{0.5em}{}

% title and sidebar
\def\@maketitle{% 
	%
	% title
	%
	\begin{titlebox}
		\begin{flushleft}%
			\setstretch{1.0}%
			\normalsize\sffamily%
			{\getfield{articletype}\marginnote{\includegraphics[width=\linewidth]{./logos/jcls_logo_text.pdf}} \par}
			% \vspace{\baselineskip}
			{\LARGE\bfseries \getfield{title} \par}
			{\Large \getfield{subtitle} \par}
			{\vspace{1.5\baselineskip}%
				\normalsize\printauthors
				\vspace{\baselineskip}%
				{\footnotesize\printaffiliations}
				\vspace{\baselineskip}}
		\end{flushleft}%
	\end{titlebox}
	%
	% sidebar
	%
	\marginpar{% OpenAccess Logo
		\vspace{2ex}
		\adjustbox{width=2em}{\textcolor{white}{\aiOpenAccess}}%
		\vspace{2ex}
	}
	\sideinfofield{Citation}{howtocite}
	\sideinfofield{Date published}{datepublished}[]
	\sideinfofield{Date accepted}{dateaccepted}[]
	\sideinfofield{Date received}{datereceived}[]
	\sideinfofield{Keywords}{keywords}
	\sideinfofield{License}{license}
	\sideinfofield{Reviewer}{reviewer}
	\sideinfofield{Note}{issuenote}
	\sideinfos%
}

% abstract
\renewenvironment{abstract}
{\begin{abstractbox}
		\sffamily\textbf{\abstractname.}}
		{\end{abstractbox}}

\RequirePackage{hyperref}
\hypersetup{
	colorlinks=true,
	filecolor=filecolor,
	linkcolor=linkcolor,
	urlcolor=urlcolor,
	citecolor=citecolor}

\IfFileExists{./metadata/self.bib}
{\addbibresource{./metadata/self.bib} \howtocite{\fullcite{self}}}
{}

\IfFileExists{./metadata/authors.tex}
{\input{./metadata/authors.tex}}
{}

\IfFileExists{./metadata/article.tex}
{\input{./metadata/article.tex}}
{}

\RequirePackage[contents={},scale=5,color=blue!50]{background}

\NewDocumentCommand\printwatermark{}{
	\AddToHook{shipout/background}{%
		\ifthenelse{\value{page}>1}%
		{\backgroundsetup{contents={\normalfont\sffamily\getfield{articletype}}}}
	{}
	\BgMaterial
}
}

\ifcsvoid{@doi}
{\AddToHook{env/abstract/after}{\linenumbers\printwatermark}}
{}

\AddToHook{enddocument}{
	\printdataavailability
	\printsoftwareavailability
	\printacknowledgements
	\printcontributions
	\printbibliography
}
