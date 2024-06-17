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
\ProvidesClass{jcls}[2024/06/17 v1.1.0 LaTeX class for JCLS]
\typeout{This is jcls.cls 2024-06-17 v1.1.0}

% Check for lualatex
\RequirePackage{iftex}
\RequireLuaTeX

\newif\iffinal\finalfalse
\newif\ifmetadata\metadatatrue
\newif\ifpreprint\preprintfalse
\DeclareOption{final}{\finaltrue}
\DeclareOption{nometadata}{\metadatafalse}
\DeclareOption{preprint}{\preprinttrue}
\ProcessOptions\relax
\LoadClass{article}

%\RequirePackage{silence}
%\WarningsOff*

\RequirePackage{calc}
\RequirePackage{setspace}
\setstretch{1.25}

\RequirePackage{enumitem}
\RequirePackage{etoolbox}             % maybe switch to expl3 
\RequirePackage{ifmtarg}
\RequirePackage{xkeyval}              % switch to expkv
\RequirePackage[all]{expkv}

% Force unicode (https://tex.stackexchange.com/a/663846/29873)
% find better expl3 solution 
\AtBeginDocument{%                  
	\ifx\Umathchar\undefined\else
		\def\encodingdefault{TU}%
		\fontencoding{TU}\selectfont
	\fi
}

\RequirePackage[
	main=english
]{babel}

\babelfont[*cyrillic]{rm}{Domitian}
\babelfont[greek]{rm}{FreeSerif}

\RequirePackage{csquotes}

\RequirePackage[
	style=ext-authoryear-comp,
	backend=biber,
	maxbibnames=99,
	maxcitenames=2,
	uniquelist=false,
]{biblatex}

\DeclareFieldFormat{origdate}{\mkbibbrackets{#1}}
\renewbibmacro*{cite:labeldate+extradate}{%
	\iffieldundef{origyear}
	{}
	{\printorigdate
		\setunit{\addspace}}%
	\iffieldundef{labelyear}
	{}
	{\printtext[bibhyperref]{\printlabeldateextra}}}

\DeclareCiteCommand{\citeorigyear}
{\boolfalse{citetracker}%
	\boolfalse{pagetracker}%
	\usebibmacro{prenote}}
{\printfield{origyear}}
{\multicitedelim}
{\usebibmacro{postnote}}

\renewbibmacro*{date+extradate}{%
	\iffieldundef{origyear}
	{}
	{\printorigdate
		\setunit{\addspace}}%
	\iffieldundef{labelyear}
	{}
	{\printtext[parens]{%
			\iflabeldateisdate
			{\printdateextra}
			{\printlabeldateextra}}}}

% patch \fullcite (https://tex.stackexchange.com/a/126245/29873) 
\DeclareCiteCommand{\fullcite}
{\defcounter{maxnames}{\blx@maxbibnames}\usebibmacro{prenote}}
{\usedriver{\DeclareNameAlias{sortname}{default}}{\thefield{entrytype}}}
{\multicitedelim}
{\usebibmacro{postnote}}

\DeclareCiteCommand{\footfullcite}[\mkbibfootnote]
{\defcounter{maxnames}{\blx@maxbibnames}\usebibmacro{prenote}}
{\usedriver{\DeclareNameAlias{sortname}{default}}{\thefield{entrytype}}}
{\multicitedelim}
{\usebibmacro{postnote}}

% patch language field (https://tex.stackexchange.com/a/141831/29873)
\DeclareSourcemap{
	\maps{
		\map{
			\step[fieldsource=language, fieldset=langid, origfieldval, final]
			\step[fieldset=language, null]
		}
	}
}

% remove p./pp.
\DefineBibliographyStrings{english}{%
	page={},
	pages={},
}

% remove doi + url labels
\DeclareFieldFormat{url}{%
	\ifhyperref
	{\href{#1}{\nolinkurl{#1}}}
	{\nolinkurl{#1}}}

\DeclareFieldFormat{doi}{%
	\ifhyperref
	{\href{https://doi.org/#1}{\nolinkurl{#1}}}
	{\nolinkurl{#1}}}

\RequirePackage{datetime2}      % check if needed

% color
\RequirePackage[dvipsnames,svgnames]{xcolor}

\definecolor{jcls-red}      {RGB} {175, 29,  31}
\definecolor{jcls-gray}     {RGB} {90,  90,  90}
\definecolor{orcid-green}   {RGB} {166, 206, 57}
\definecolor{ror-green}     {RGB} {83, 186, 161}
\definecolor{oa-orange}     {RGB} {246, 130, 18}

\colorlet{primarycolor}     {jcls-red}
\colorlet{secundarycolor}   {jcls-gray}

\colorlet{graycolor}        {jcls-gray}
\colorlet{highlightcolor1}  {DarkOrange}
\colorlet{highlightcolor2}  {DarkBlue}
\colorlet{highlightcolor3}  {DarkGreen}
\colorlet{highlightcolor4}  {DarkMagenta}

\colorlet{filecolor}        {highlightcolor1}
\colorlet{linkcolor}        {highlightcolor2}
\colorlet{citecolor}        {highlightcolor3}
\colorlet{urlcolor}         {highlightcolor4}

\colorlet{backgroundcolor}  {graycolor!10}

% font
\RequirePackage{mathtools}
\RequirePackage{unicode-math}
\RequirePackage{ccicons}
\RequirePackage{academicons}
\RequirePackage{parskip}
\RequirePackage{ragged2e}

\directlua{luaotfload.add_fallback
	("fallbacks",
	{
			"Domitian:mode=harf;",
			"NotoColorEmoji:mode=harf;",
			"STIX Two Math:mode=harf;",
			"freeserif:mode=harf;",
		}
	)}
\defaultfontfeatures{RawFeature={fallback=fallbacks}, Scale=MatchLowercase, Ligatures=TeX,Scale=1}

\RequirePackage[osf]{pagella-otf}
\RequirePackage[medium]{FiraSans}
\RequirePackage[medium, scaled=0.85]{FiraMono}

\RequirePackage{microtype}
\RequirePackage{lua-widow-control}
\RequirePackage{upquote}
\RequirePackage{xurl}
\RequirePackage[numbered]{bookmark}

% layout
\RequirePackage{geometry}
\geometry{
	paper=a4paper,
	top=25mm,
	bottom=25mm,
	right=17mm,
	left=60mm,
	footskip=10mm,
	marginparsep=3mm,
	marginparwidth=40mm,
	reversemarginpar=true,
	% showframe,
}


% graphics
\RequirePackage{graphicx}
\graphicspath{ {./figures/} }

\RequirePackage[Export]{adjustbox}

% captions and notes
\RequirePackage[
	justification=RaggedRight,
	singlelinecheck=off,
	labelfont=bf,
	font={small,sf}
]{caption}

\RequirePackage{subcaption}
\RequirePackage{sidenotes}
\DeclareCaptionStyle{base}         {justification=RaggedRight, singlelinecheck=off, labelfont=bf, font={small,sf}}
\DeclareCaptionStyle{sidecaption}  {justification=RaggedRight, singlelinecheck=off, labelfont=bf, font={small,sf}}
\DeclareCaptionStyle{marginfigure} {justification=RaggedRight, singlelinecheck=off, labelfont=bf, font={small,sf}}
\DeclareCaptionStyle{margintable}  {justification=RaggedRight, singlelinecheck=off, labelfont=bf, font={small,sf}}
\DeclareCaptionStyle{widefigure}   {justification=RaggedRight, singlelinecheck=off, labelfont=bf, font={small,sf}}
\DeclareCaptionStyle{widetable}    {justification=RaggedRight, singlelinecheck=off, labelfont=bf, font={small,sf}}
\DeclareCaptionStyle{jcls}         {justification=RaggedRight, singlelinecheck=off, labelfont=bf, font={small,sf}}

\captionsetup[table]  {style=jcls}
\captionsetup[figure] {style=jcls}

% tables
\RequirePackage{booktabs}

\RequirePackage{longtable}
\setlength\LTleft{0pt}
\setlength\LTright{\fill}

\RequirePackage{tabularx}
\RequirePackage{makecell}

% orcid
\NewDocumentCommand \orcidlink { m }
{%
	\texorpdfstring
	{\href{https://orcid.org/#1}{\textcolor{orcid-green}{\raisebox{-.3ex}{\aiOrcid}}}}
	{https://orcid.org/#1}%
}

% ror
\NewDocumentCommand \rorlink { m }
{%
	\texorpdfstring
	{\href{https://ror.org/#1}{\textcolor{ror-green}{\raisebox{-.3ex}{\aiROR}}}}
	{https://ror.org/#1}%
}

% code
\RequirePackage{listings}
\RequirePackage[verbatim]{lstfiracode}

\RequirePackage[right]{lineno}
\RenewDocumentCommand \linenumberfont { }
{%
	\ttfamily\small\color{primarycolor}%
}

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
	tabsize=2,
}

\RequirePackage{selnolig}
\RequirePackage{marginnote}
\RenewDocumentCommand \marginfont { }
{ \sffamily\footnotesize }
\RenewDocumentCommand \raggedleftmarginnote { } { }

\RequirePackage{marginfix}
\RequirePackage{changepage}
\RequirePackage{ifthen}
\newlength{\overhang}
\setlength{\overhang}{\marginparwidth+\marginparsep}


\NewDocumentEnvironment { table* } { O{htb} +b }
{%
	\ifthenelse{\boolean{@twoside}}
	{%
		\begin{table}[#1]
			\begin{adjustwidth*}{-.5\overhang}{}
				\captionsetup{style=jcls, margin={.5\overhang, 0pt}}
				#2
			\end{adjustwidth*}
		\end{table}
	}{%
		\begin{table}[#1]
			\begin{adjustwidth}{-.5\overhang}{}
				\captionsetup{style=jcls, margin={.5\overhang, 0pt}}
				#2
			\end{adjustwidth}
		\end{table}
	}
}{}

\NewDocumentEnvironment { figure* } { O{htb} +b }
{%
	\ifthenelse{\boolean{@twoside}}
	{%
		\begin{figure}[#1]
			\begin{adjustwidth*}{-.5\overhang}{}
				\captionsetup{style=jcls, margin={.5\overhang, 0pt}}
				#2
			\end{adjustwidth*}
		\end{figure}
	}{%
		\begin{figure}[#1]
			\begin{adjustwidth}{-.5\overhang}{}
				\captionsetup{style=jcls, margin={.5\overhang, 0pt}}
				#2
			\end{adjustwidth}
		\end{figure}
	}
}{}

\NewDocumentEnvironment { fullwidthtable } { O{htb} +b }
{%
	\ifthenelse{\boolean{@twoside}}
	{%
		\begin{table}[#1]
			\begin{adjustwidth*}{-\overhang}{}
				\captionsetup{style=jcls, margin={\overhang, 0pt}}
				#2
			\end{adjustwidth*}
		\end{table}
	}{
		\begin{table}[#1]
			\begin{adjustwidth}{-\overhang}{}
				\captionsetup{style=jcls, margin={\overhang, 0pt}}
				#2
			\end{adjustwidth}
		\end{table}
	}
}{}

\NewDocumentEnvironment{ fullwidthfigure } { O{htb} +b }
{%
	\ifthenelse{\boolean{@twoside}}
	{%
		\begin{figure}[#1]
			\begin{adjustwidth*}{-\overhang}{}
				\captionsetup{style=jcls, margin={\overhang, 0pt}}
				#2
			\end{adjustwidth*}
		\end{figure}
	}{%
		\begin{figure}[#1]
			\begin{adjustwidth}{-\overhang}{}
				\captionsetup{style=jcls, margin={\overhang, 0pt}}
				#2
			\end{adjustwidth}
		\end{figure}
	}
}{}

\NewDocumentEnvironment { fullwidth } { +b }
{%
	\ifthenelse{\boolean{@twoside}}
	{%
		\begin{adjustwidth*}{-\overhang}{}
			\captionsetup{style=jcls, margin={\overhang, 0pt}}
			#1
		\end{adjustwidth*}
	}{%
		\begin{adjustwidth}{-\overhang}{}
			\captionsetup{style=jcls, margin={\overhang, 0pt}}
			#1
		\end{adjustwidth}
	}
}{}

\RequirePackage{pdflscape}

\RequirePackage{tcolorbox}
\newtcolorbox{titlebox}{
	colback=white,
	arc=0pt,
	outer arc=0pt,
	colframe=white,
	left=3mm, right=0mm, top=0mm, bottom=0mm,
}

\newtcolorbox{abstractbox}{
	colback=secundarycolor!10,
	arc=0pt,
	outer arc=0pt,
	colframe=secundarycolor!10,
	left=3mm, right=3mm, top=2mm, bottom=2mm,
}

\RequirePackage[
	ragged,
	bottom,
	norule,
	multiple,
]{footmisc}

\RenewDocumentCommand \footnotemargin {   } {0em}
\RenewDocumentCommand \thefootnote    {   } {\arabic{footnote}}
\RenewDocumentCommand \@makefntext    { m } {\noindent{\@thefnmark}. #1}
\interfootnotelinepenalty=10000


\NewDocumentCommand \setfield   { mm   } {\csgdef{@#1}{#2}}
\NewDocumentCommand \getfield   { m    } {\ifcsvoid{@#1}{}{\csuse{@#1}}}
\NewDocumentCommand \printfield { mO{} } {\ifcsvoid{@#1}{}{\csuse{@#1}\unskip#2}}

% % https://tex.stackexchange.com/a/44950/29873
%
% \ExplSyntaxOn
% \NewDocumentCommand{\setproperty}{ O{standard} m m }
% {
% 	\cs_if_exist:cF { g_citr_#1_prop } { \prop_new:c { g_citr_#1_prop } }
% 	\prop_gput:cnn { g_citr_#1_prop } { #2 } { #3 }
% }
% \NewDocumentCommand{\getproperty}{ O{standard} m }
% {
% 	\cs_if_exist:cTF { g_citr_#1_prop }
% 	{
% 		\prop_get:cnN { g_citr_#1_prop } { #2 } \l_citr_value_tl
% 		\quark_if_no_value:NTF \l_citr_value_tl
% 		{
% 			Inexistent~property~#2
% 		}
% 		{
% 			\tl_use:N \l_citr_value_tl
% 		}
% 	}
% 	{
% 		Inexistent~family~#1
% 	}
% }
% \prop_new:N \g_citr_standard_prop
% \tl_new:N \l_citr_value_tl
% \ExplSyntaxOff


\NewDocumentCommand \keywords     { m }     {\setfield{keywords}{#1}}
\NewDocumentCommand \datereceived { m }     {\setfield{datereceived}{#1}}
\NewDocumentCommand \dateaccepted { m }     {\setfield{dateaccepted}{#1}}

\let\date\relax
\NewDocumentCommand \datepublished { m }
{
	\setfield{datepublished}{#1}%
	\setfield{date}{#1}
	% \date{#1}
}

\NewDocumentCommand \doi {m}
{
	\ifblank{#1}
	{}
	{\setfield{doi}{\href{https://doi.org/#1}{#1}}}
}

\NewDocumentCommand \subtitle    { m } {\setfield{subtitle}{#1}}
\NewDocumentCommand \shorttitle  { m } {\setfield{shorttitle}{#1}}
\NewDocumentCommand \howtocite   { m } {\setfield{howtocite}{#1}}
\NewDocumentCommand \articletype { m }
{
	\ifblank{#1}
	{\setfield{articletype}{SUBMITTED}}
	{\setfield{articletype}{#1}}
}

\NewDocumentCommand \volume      { m } {\setfield{volume}{#1}}
\NewDocumentCommand \issuetitle  { m } {\setfield{issuetitle}{#1}}
\NewDocumentCommand \issueyear   { m } {\setfield{issueyear}{#1}}
\NewDocumentCommand \issuenumber { m } {\setfield{issuenumber}{#1}}
\NewDocumentCommand \issuenote   { m } {\setfield{issuenote}{#1}}
\NewDocumentCommand \reviewers   { m } {\setfield{reviewers}{#1}}

\NewDocumentCommand \dataavailability     { m } {\setfield{dataavailability}{#1}}
\NewDocumentCommand \softwareavailability { m } {\setfield{softwareavailability}{#1}}

\NewDocumentCommand \license { m } {\setfield{license}{#1}}

\NewDocumentCommand \sideinfos { }
{
	\marginpar{\setlength{\baselineskip}{12pt}\vspace*{1\baselineskip}}
}

\NewDocumentCommand \sideinfo { m+mmm }
{
	\gappto\sideinfos{\marginpar{\RaggedRight\sffamily\footnotesize\textbf{#1} #3 #2 \vspace{#4}}}
}

\NewDocumentCommand \sideinfofield { m+mO{\newline}O{1ex} }
{
\ifcsvoid{@#2}{}{\sideinfo{#1}{\csuse{@#2}}{#3}{#4}}
}

% authors, affiliations, and article
\newcounter{authors}
\newcounter{affiliations}
\newcounter{counter}

\ekvdefinekeys{jcls/author}
{
	store orcid           = \author@orcid
	,store surname         = \author@surname
	,store given-names     = \author@givennames
	,store email           = \author@email
	,store affiliation     = \author@affiliation
	,store equal-contrib   = \author@equalcontrib
	,store cor-id          = \author@corid
	,store contribution    = \author@contribution
}

\RenewDocumentCommand \author { m }
{
	\begingroup
	\global\stepcounter{authors}%
	\ekvset{jcls/author}{#1}%
	\global\cslet{@orcid\theauthors}{\author@orcid}%
	\global\cslet{@surname\theauthors}{\author@surname}%
	\global\cslet{@givennames\theauthors}{\author@givennames}%
	\global\cslet{@email\theauthors}{\author@email}%
	\global\cslet{@affiliation\theauthors}{\author@affiliation}%
	\global\cslet{@contribution\theauthors}{\author@contribution}%
	\endgroup
}

\ekvdefinekeys{jcls/affiliation}
{
	store id = \aff@id
	,store group = \aff@group
	,store department = \aff@department
	,store organization = \aff@organization
	,store isni = \aff@isni
	,store ringgold = \aff@ringgold
	,store ror = \aff@ror
	,store pid = \aff@pid
	,store street-address = \aff@streetaddress
	,store city = \aff@city
	,store country = \aff@country
	,store country = \aff@countrycode
}

\NewDocumentCommand \affiliation { m }
{
	\begingroup
	\ekvset{jcls/affiliation}{#1}
	\global\cslet{@department\aff@id}{\aff@department}%
	\global\cslet{@organization\aff@id}{\aff@organization}%
	\global\cslet{@ror\aff@id}{\aff@ror}%
	\global\cslet{@streetaddress\aff@id}{\aff@streetaddress}%
	\global\cslet{@city\aff@id}{\aff@city}%
	\global\cslet{@country\aff@id}{\aff@country}%
	\endgroup
}


\ekvdefinekeys{jcls/article}
{
	long store title = \article@title
	,long store subtitle = \article@subtitle
	,store shorttitle = \article@shorttitle
	,store datereceived = \article@datereceived
	,store dateaccepted = \article@dateaccepted
	,store datepublished = \article@datepublished
	,store doi = \article@doi
	,store articletype = \article@articletype
	,initial articletype = {under review}
	,store volume = \article@volume
	,store issuetitle = \article@issuetitle
	,store issueyear = \article@issueyear
	,store issuenumber = \article@issuenumber
	,store issuenote = \article@issuenote
	,store reviewers = \article@reviewers
	,store license = \article@license
	,initial license = {\href{https://creativecommons.org/licenses/by/4.0/}{CC BY 4.0 \ccby}}
}

\NewDocumentCommand \article { m }
{
	% \begingroup
	\ekvset{jcls/article}{#1}
	\title{\expandafter\article@title}
	\subtitle{\expandafter\article@subtitle}
	\shorttitle{\expandafter\article@shorttitle}
	\datereceived{\expandafter\article@datereceived}
	\dateaccepted{\expandafter\article@dateaccepted}
	\datepublished{\expandafter\article@datepublished}
	\doi{\expandafter\article@doi}
	\articletype{\expandafter\article@articletype}
	\volume{\expandafter\article@volume}
	\issueyear{\expandafter\article@issueyear}
	\issuenumber{\expandafter\article@issuenumber}
	\issuenote{\expandafter\article@issuenote}
	\reviewers{\expandafter\article@reviewers}
	\license{\expandafter\article@license}
	% \endgroup
}

\NewDocumentCommand \printauthor { m }
{
	\ifcsvoid{@affiliation#1}
	{}
	{
		\ifcsvoid{@affilmarker\csuse{@affiliation#1}}
		{
			\stepcounter{affiliations}%
			\csxdef{@affilmarker\csuse{@affiliation#1}}{\theaffiliations}%
			\csxdef{@affilnum\theaffiliations}{\csuse{@affiliation#1}}%
		}
		{}
	}
	\printfield{givennames}[#1] \printfield{surname}[#1]%
	\unskip\textsuperscript{\csuse{@affilmarker\csuse{@affiliation#1}}}%
	\ifcsvoid{@orcid#1}
	{\unskip}
	{\unskip\,\orcidlink{\csuse{@orcid#1}}}
}

\NewDocumentCommand \printaffiliation { m }
{
	\item[\csuse{@affilmarker#1}.]
	\printfield{department}[#1][, ]%
	\printfield{organization}[#1]%
	\ifcsvoid{@ror#1}{\unskip,}{\unskip\,\rorlink{\csuse{@ror#1}},}
	\printfield{streetaddress}[#1][, ]%
	\printfield{city}[#1][, ]%
	\printfield{country}[#1][.]%
}

\NewDocumentCommand \printcontribution { m }
{
	\ifcsvoid{@contribution#1}
	{}
	{\textbf{\printfield{givennames}[#1] \printfield{surname}[#1]:} \printfield{contribution}[#1]}
}

\NewDocumentCommand \printauthors { }
{
	\setcounter{counter}{0}%
	\@whilenum\value{counter}<\value{authors}\do{%
		\stepcounter{counter}\printauthor{\thecounter}\par}
}

\NewDocumentCommand \printaffiliations { }
{
	\setcounter{counter}{0}%
	\ifnum\value{affiliations}>0
		\begin{enumerate}[left=\parindent,labelwidth=1em]
			\@whilenum\value{counter}<\value{affiliations}\do{%
				\stepcounter{counter}\printaffiliation{\csuse{@affilnum\thecounter}}\par}
		\end{enumerate}
	\fi
}
\NewDocumentCommand \printcontributions {}
{
	\section{Author Contributions}
	\setcounter{counter}{0}%
	\@whilenum\value{counter}<\value{authors}\do{%
		\stepcounter{counter}\printcontribution{\thecounter}\par}
}

\NewDocumentCommand \printacknowledgements {}
{
	\IfFileExists{acknowledgements.tex}
	{
		\section{Acknowledgements}
		\input{acknowledgements.tex}
	}
	{}
}

\NewDocumentCommand \printdataavailability {}
{
	\ifcsvoid{@dataavailability}
	{}
	{
		\section{Data Availability}\label{sec:dataavailability}
		\getfield{dataavailability}
	}
}

\NewDocumentCommand \printsoftwareavailability {}
{
	\ifcsvoid{@softwareavailability}{}
	{
		\section{Software Availability}\label{sec:softwareavailability}
		\getfield{softwareavailability}
	}
}

\NewDocumentCommand \printarticletype {} {\ifcsvoid{@doi}{\getfield{articletype}}{\getfield{doi}}}

\NewDocumentCommand \printappendix {}
{
	\IfFileExists{./appendix.tex}
	{
		\clearpage\appendix
		\input{./appendix.tex}
	}{}
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
	\fancyhead[R]{\sffamily \getfield{shorttitle}}
	\fancyfoot[L]{\sffamily \ifpreprint%
			CCLS\getfield{issueyear} Conference Preprints \else% 
			JCLS \getfield{volume} (\getfield{issuenumber}), \getfield{issueyear}, \printarticletype\fi}
	\fancyfoot[R]{\sffamily \thepage}
	\renewcommand{\headrulewidth}{0pt}% 
	\renewcommand{\footrulewidth}{0pt}%
}

\pagestyle{jcls}

% headings
\RequirePackage[
	small,
	sf,bf,
	raggedright,
	clearempty,
]{titlesec}

\titleformat{\section}{\Large\sffamily\bfseries}{\thesection.}{.5em}{}
\titleformat{\subsection}{\large\sffamily\bfseries}{\thesubsection}{.5em}{}
\titleformat{\subsubsection}{\normalsize\sffamily\bfseries}{\thesubsubsection}{.5em}{}



% title and sidebar
\def\@maketitle{% 
	%
	% title
	%
	\newpage
	\null
	\vspace*{-\topskip}
	\begin{titlebox}
		\raggedright%
		\setstretch{1.0}%
		\normalsize\sffamily%
		{\getfield{articletype}%
			\marginnote{\includegraphics[width=\linewidth]{./logos/jcls_logo_text.pdf}}%
			\marginnote{\textcolor{oa-orange}{\normalsize\sffamily\bfseries OPEN \adjustbox{height=2\baselineskip, raise=-.5\baselineskip}{\aiOpenAccess} ACCESS}}[6\baselineskip]%
			\par}
		{\LARGE\bfseries \getfield{title} \par}
		{\Large \getfield{subtitle} \par}
		\vspace{1\baselineskip}
		\ifmetadata
		{\normalsize\printauthors}
		\vspace{1\baselineskip}
		{\footnotesize\printaffiliations}
		\fi
		%  \vspace{1\baselineskip}
	\end{titlebox}
	%
	%
	% Sidebar
	\ifmetadata
		\sideinfofield{Citation}{howtocite}%
		\sideinfofield{Date published}{datepublished}[][0ex]%
		\sideinfofield{Date accepted}{dateaccepted}[][0ex]%
		\sideinfofield{Date received}{datereceived}[]%
		\sideinfofield{Keywords}{keywords}%
		\sideinfofield{License}{license}%
		\ifpreprint\else\sideinfofield{Reviewers}{reviewers}\fi%
		\sideinfofield{Note}{issuenote}%   
	\fi
}





% Abstract
\RenewDocumentEnvironment {abstract} { +b }
{%
	\sideinfos\begin{abstractbox}\sffamily\normalsize\textbf{\abstractname.}
		#1
	\end{abstractbox}
}{}

\RequirePackage{hyperref}
\hypersetup{
	colorlinks=true,
	filecolor=filecolor,
	linkcolor=linkcolor,
	urlcolor=urlcolor,
	citecolor=citecolor,
}

\IfFileExists{./metadata/self.bib}
{\addbibresource{./metadata/self.bib} \howtocite{\begin{refsection}\fullcite{self}\end{refsection}}}
{\ClassWarning{jcls}{./metadata/self.bib not found}\metadatafalse}

\IfFileExists{./metadata/authors.tex}
{\input{./metadata/authors.tex}}
{\ClassWarning{jcls}{./metadata/authors.tex not found}\metadatafalse}

\IfFileExists{./metadata/article.tex}
{\input{./metadata/article.tex}}
{\ClassWarning{jcls}{./metadata/article.tex not found}\metadatafalse}

\RequirePackage{tikz}

\NewDocumentCommand \printwatermark {}
{
	\AddToHook{shipout/foreground}
	{
		\begin{tikzpicture}[remember picture,overlay]
			\node[primarycolor,rotate=90,scale=2,opacity=1] at ([xshift=2em]current page.west) {\sffamily\getfield{articletype}};
		\end{tikzpicture}
	}
}

\iffinal\else
	% \RequirePackage[All]{lua-typo}
	\AddToHook{env/abstract/after}{\linenumbers\printwatermark}
\fi

\AtEndEnvironment{document}{
	\printdataavailability
	\printsoftwareavailability
	\printacknowledgements
	\printcontributions
	\printbibliography
	\printappendix
}
