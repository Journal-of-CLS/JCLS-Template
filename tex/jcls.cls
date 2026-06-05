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
% Copyright (C) 2021-2026 Dominik Gerstorfer,
%               2026 Marei Peischl <jcls@peitex.de>
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
% The Current Maintainer of this work is Evelyn Gius <info@jcls.io>
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jcls}[2024/05/17 v1.0.6 LaTeX class for JCLS]
\typeout{This is jcls.cls 2024-05-17 v1.0.6}

% Check for lualatex
\RequirePackage{iftex}
\RequireLuaTeX

\newif\iffinal
\newif\ifmetadata
\newif\ifpreprint

\ExplSyntaxOn
\keys_define:nn {ptxcd/jcls} {
  final .choices:nn = {true,false}{\use:c {final \l_keys_choice_str}},
  final .default:n = true,
  final .initial:n = false,
  final .usage:n = load,
%
  metadata .choices:nn = {true,false}{\use:c {metadata\l_keys_choice_str}},
  metadata .default:n = true,
  metadata .initial:n = true,
  metadata .usage:n = load,
  nometadata .meta:n = {metadata=false},
%
  preprint .choices:nn = {true,false}{\use:c {preprint\l_keys_choice_str}},
  preprint .default:n = true,
  preprint .initial:n = false,
  preprint .usage:n = load,
%
  final / true  .code:n = \finaltrue, \l_keys_choice_str
  final / false .code:n = \finalfalse,
  final .default:n = true,
%
% dynamic paths to support more flexible build setups
  image-path .tl_gset:N = \g_ptxcd_graphics_path_tl,
  image-path .initial:n = ./figures/,
  metadata-path .tl_gset:N = \g_ptxcd_metadata_path_tl,
  metadata-path .initial:n = ./metadata/,
  flatten-paths .meta:n = {
      metadata-path=,
      image-path=
  },
}

\ExplSyntaxOff
\ProcessKeyOptions[ptxcd/jcls]
\LoadClass{article}

\RequirePackage{amsmath,amssymb}
\RequirePackage{setspace}
\setstretch{1.25}

\RequirePackage{enumitem}

\RequirePackage[main=english]{babel}
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

% remove p./pp. from pages
\DeclareFieldFormat{pages}{\mkcomprange{#1}}
\DeclareFieldFormat{postnote}{\mknormrange{#1}}

% remove doi + url labels
\DeclareFieldFormat{url}{\url{#1}}

\DeclareFieldFormat{doi}{%
  \ifhyperref
  {\href{https://doi.org/#1}{\nolinkurl{#1}}}
  {\nolinkurl{#1}}}

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
}

% graphics
\RequirePackage{graphicx}

\graphicspath{ {\UseName{g_ptxcd_graphics_path_tl}} }

% captions and notes
\RequirePackage[
  justification=RaggedRight,
  singlelinecheck=off,
  labelfont=bf,
  font={small,sf}
]{caption}

\RequirePackage{subcaption}
\DeclareCaptionStyle{jcls}{
  justification=RaggedRight,
  singlelinecheck=off,
  labelfont=bf,
  font={small,sf}
}

\captionsetup{style=jcls}

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

\newlength{\overhang}
\setlength{\overhang}{\dimexpr\marginparwidth+\marginparsep}
\RequirePackage{scrextend}% for addmargin

\NewDocumentEnvironment{jcls@adjustwidth}{O{-\overhang}}{
  \begin{addmargin*}[#1]{0pt}
    }{
  \end{addmargin*}
}

%TODO msg on redefinition ?
\DeclareDocumentEnvironment { table* } { O{htbp}}
{%
  \begin{table}
    \begin{jcls@adjustwidth}[-.5\overhang]
      }{
    \end{jcls@adjustwidth}
  \end{table}
}

%TODO msg on redefinition ?
\DeclareDocumentEnvironment { figure* } { O{htbp}}
{%
  \begin{figure}
    \begin{jcls@adjustwidth}[-.5\overhang]
      }{
    \end{jcls@adjustwidth}
  \end{figure}
}

\NewDocumentEnvironment { fullwidthtable } { O{htbp} }
{%
  \begin{table}[#1]
    \begin{jcls@adjustwidth}
      }{
    \end{jcls@adjustwidth}
  \end{table}
}

\NewDocumentEnvironment{ fullwidthfigure } { O{htbp} }
{%
  \begin{figure}
    \begin{jcls@adjustwidth}
      }{
    \end{jcls@adjustwidth}
  \end{figure}
}

\NewDocumentEnvironment { fullwidth } { }
{%
  \begin{jcls@adjustwidth}
    }{
  \end{jcls@adjustwidth}
}

\RequirePackage[
  ragged,
  bottom,
  norule,
  multiple,
]{footmisc}

\RenewDocumentCommand \footnotemargin { } {0em}
\RenewDocumentCommand \thefootnote { } {\arabic{footnote}}
\RenewDocumentCommand \@makefntext { m } {\noindent{\@thefnmark}. #1}
\interfootnotelinepenalty=10000

\NewDocumentCommand \setfield   { mO{}m }   {\csgdef{@#1#2}{#3}}
\NewDocumentCommand \getfield   { mO{} }    {\UseName{@#1#2}}
\NewDocumentCommand \printfield { mO{}O{} } {\ifcsvoid{@#1#2}{}{\csuse{@#1#2}\unskip#3}}


\NewDocumentCommand \sideinfos { }
{
  \marginpar{\setlength{\baselineskip}{12pt}\vspace*{1\baselineskip}}
}

\NewDocumentCommand \sideinfo { m+mmm }{%
  {\textbf{#1} #3 #2 \vspace{#4}}\par
}

\NewDocumentCommand \sideinfofield { m+mO{\newline}O{1ex} }
{
  \ifcsvoid{@#2}{}{\sideinfo{#1}{\csuse{@#2}}{#3}{#4}}
}

\ExplSyntaxOn

\cs_set:Nn \__ptxcd_print_name:n {#1\par}
\cs_set:Nn \__ptxcd_print_name_orcid:nn {#1\,\orcidlink{#2}\par}
\NewDocumentCommand \printNamesOrcid {mm}{
	\tl_if_blank:eF {\use:c {@#2}} {
		\sideinfo{#1}{
			\keyval_parse:nnv {\__ptxcd_print_name:n} {\__ptxcd_print_name_orcid:nn} {@#2}
		}{\newline}{1ex}
	}
}

% authors, affiliations, and article
\newcounter{authors}
\newcounter{affiliations}
\newcounter{counter}



\keys_define:nn { ptxcd / jcls / metadata } {
  unknown .code:n = \exp_args:No  \tl_show:n {\l_keys_key_tl = #1 -- unknown},
}

\DeclareDocumentCommand \JCLSSetup { O{metadata}m }{
  \keys_set:nn { ptxcd / jcls / #1 } { #2 }
}

\cs_new:Nn \__ptxcd_setup_keys:nnn {
  \__ptxcd_setup_keys:nnnn {#1} {#2} {#3} {}
}
\cs_new:Nn \__ptxcd_setup_keys:nnnn {
  \tl_set:Nn \l_tmpa_tl {#3}
  \tl_remove_all:Nn \l_tmpa_tl {-}

  \exp_args:Ne \keys_define:nn { ptxcd / jcls / metadata \tl_if_empty:nF {#1} {/ #1}
  } {
    #3 .tl_#2set:c = {#1@\l_tmpa_tl},
    #3 .initial:n = #4
  }

  \exp_args:Nc \ProvideDocumentCommand {\l_tmpa_tl} {m} {
    \JCLSSetup { #3 = {##1}}
  }
}

\keyval_parse:nnn {\__ptxcd_setup_keys:nnn {} {} } {\__ptxcd_setup_keys:nnnn { } {} } {
  title=,
  subtitle=,
  shorttitle=,
  datereceived=,
  dateaccepted=,
  datepublished=,
  articletype=under~review,
  volume=,
  issuetitle=,
  issueyear=,
  issuenumber=,
  issuenote=,
  license=\href{https://creativecommons.org/licenses/by/4.0/}{CC~BY~4.0~\ccby},
  howtocite,
  dataavailability,
  softwareavailability,
  keywords,
  reviewers,
  guest-editors
}

% special settings for doi + articletype as empty values are treated differently
\def\@doi{}
\keys_define:nn { ptxcd / jcls / metadata } {
  articletype .default:n = SUBMITTED,
  doi .code:n = \tl_if_blank:nTF {#1} {
    \setfield{doi}{}
  }{
    \setfield{doi}{\href{https://doi.org/#1}{#1}}
  },
  % 
  special-issuetitle .meta:n = {issuetitle={Special Issue “#1”}},
}
\msg_new:nnn {jcls} {duplicate-entry} {
  The~data~entry~(type~#1)~with~#2~has~been~created~before.\\
  It~will~be~overwritten!
}

\msg_new:nnn {jcls} {missing-entry} {
  The~data~entry~(type~#1)~with~#2~is~missing.
  It~will~be~ignored!
}

\keys_define:nn { ptxcd / jcls / metadata / add-affiliation  } {
  id .code:n = {
      \prop_if_exist:cTF {g_ptxcd_affiliation_ #1 _prop} {
        \msg_warning:nnnn {jcls} {duplicate-entry} {affiliation} {id=#1}
      } {
        \prop_new:c {g_ptxcd_affiliation_ #1 _prop}
      }
      \prop_gset_from_keyval:cn {g_ptxcd_affiliation_ #1 _prop} {
        department=\textcolor{jcls-red}{DEPARTMENT},
        organization=\textcolor{jcls-red}{ORG},
        %  isni=,
        %  ringgold=,
        %  ror=,
        %  pid=,
        %  street-address=,
        city=\textcolor{jcls-red}{CITY},
        country=\textcolor{jcls-red}{COUNTRY},
      }
      \def\aff@id{#1}
    }
}



\RenewDocumentCommand \author { m } {
  \stepcounter{authors}%
  \prop_new:c {g_ptxcd_author_\theauthors _prop}
  \prop_gset_from_keyval:cn {g_ptxcd_author_ \theauthors _prop} {
    #1
  }
  % compatibility
  \clist_map_inline:nn {orcid,surname,givennames,email,affiliation,contribution} {
    \cs_set:cpe {@##1\theauthors} {\prop_item:cn {g_ptxcd_author_ \theauthors _prop} {##1}}
  }
}

\NewDocumentCommand \affiliation { m }
{
  \keys_set_known:nn {ptxcd / jcls / metadata / add-affiliation  } {#1}
  \prop_gput_from_keyval:cn {g_ptxcd_affiliation_ \aff@id _prop} {
    #1
  }

  % compatibility
  \clist_map_inline:nn {department,organization,ror,streetaddress,city,country} {
    \cs_set:cpe {@##1\aff@id} {\prop_item:cn {g_ptxcd_affiliation_ \aff@id _prop} {##1}}
  }
}

\NewDocumentCommand \article { m }
{
  \JCLSSetup[metadata]{#1}%
}

\clist_new:N \l__ptxcd_affiliations_clist
\seq_new:N \g_ptxcd_affiliations_seq
\NewDocumentCommand \printauthor { m }{
  \clist_clear:N \l__ptxcd_affiliations_clist
  \printfield{givennames}[#1]\space\printfield{surname}[#1]%
  \clist_map_inline:cn {@affiliation#1} {%
    \prop_if_exist:cTF {g_ptxcd_affiliation_ ##1 _prop} {
      \prop_if_in:cnF {g_ptxcd_affiliation_ ##1 _prop} {marker} {
        \stepcounter{affiliations}%
        \prop_gput:cne {g_ptxcd_affiliation_ ##1 _prop} {marker} {\theaffiliations}
        \csxdef{@affilmarker##1}{\theaffiliations}%
        \seq_gput_right:Nn \g_ptxcd_affiliations_seq {##1}
      }
    } {
       \msg_warning:nnnn {jcls} {missing-entry} {affiliation} {id=#1}
    }
    \clist_put_right:Ne \l__ptxcd_affiliations_clist {
      \use:c {@affilmarker##1}
    }
  }
  \textsuperscript{\clist_use:Nn \l__ptxcd_affiliations_clist {,}}
  \ifcsvoid{@orcid#1}
  {}
  {\,\orcidlink{\csuse{@orcid#1}}}
}

\NewDocumentCommand \printaffiliation { m }
{
  \item[\csuse{@affilmarker#1}.]
  \printfield{department}[#1][,~]%
  \printfield{organization}[#1]%
  \ifcsvoid{@ror#1}{\unskip,}{\unskip\,\rorlink{\csuse{@ror#1}},}
  \printfield{streetaddress}[#1][,~]%
  \printfield{city}[#1][,~]%
  \printfield{country}[#1][.]%
}

\NewDocumentCommand \printcontribution { m }{%
  \ifcsvoid{@contribution#1}
  {}
  {\textbf{\printfield{givennames}[#1] \printfield{surname}[#1]:} \printfield{contribution}[#1]}%
}

\NewDocumentCommand \printauthors { }
{
  \setcounter{counter}{0}%
  \@whilenum\value{counter}<\value{authors}\do{%
    \stepcounter{counter}\printauthor{\thecounter}\par}
}

\NewDocumentCommand \printaffiliations { } {
  \seq_if_empty:NF \g_ptxcd_affiliations_seq {
    \begin{enumerate}[left=\parindent,labelwidth=1em]
       \seq_map_function:NN \g_ptxcd_affiliations_seq \printaffiliation
    \end{enumerate}
  }
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
  \fancyfoot[R]{\sffamily \thepage}
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

\fancypagestyle{jcls}{%
  \fancyhf{}% clear all header and footer fields
  \fancyhead[R]{\sffamily \getfield{shorttitle}}
  \fancyfoot[L]{\sffamily \ifpreprint%
      CCLS\getfield{issueyear} Conference Preprints \else%
      JCLS \getfield{volume} (\getfield{issuenumber}),~\getfield{issueyear},~\printarticletype\fi}
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
  \clearpage
  \null
  \vspace*{-\topskip}
  % column including logo + open access info
  \begingroup
  \setstretch{1.0}%
  \leavevmode\llap{%
    \begin{minipage}[t]{\marginparwidth}%
      \null\par\nointerlineskip
      \includegraphics[width=\linewidth]{jcls_logo_text.pdf}\par
      \vskip3\baselineskip
      \textcolor{oa-orange}{
        \normalsize\sffamily\bfseries OPEN \raisebox{-.5\baselineskip}{\resizebox{!}{2\baselineskip}{\aiOpenAccess}} ACCESS
      }
      \par
    \end{minipage}%
    \hskip\marginparsep
  }\hskip3mm
  %
  \begin{minipage}[t]{\dimexpr\linewidth-3mm}%
    \null\par\nointerlineskip
    \raggedright%
    \normalsize\sffamily%
    {\getfield{articletype}%
      \par}
    {\LARGE\bfseries \getfield{title} \par}
    {\Large \getfield{subtitle} \par}
    \vspace{1\baselineskip}
    \ifmetadata
    {\normalsize\printauthors}
    \vspace{1\baselineskip}
    {\footnotesize\printaffiliations}
    \fi
  \end{minipage}%
  \par
  \endgroup
  \ifmetadata
    \leavevmode
    \marginpar{
      \marginfont
      \setlength{\baselineskip}{12pt}
      \vskip\baselineskip%12pt
      \RaggedRight
      \setstretch{1.25}
      \sideinfofield{Citation}{howtocite}%
      \sideinfofield{Date published}{datepublished}[][0ex]%
      \sideinfofield{Date accepted}{dateaccepted}[][0ex]%
      \sideinfofield{Date received}{datereceived}[]%
      \sideinfofield{Keywords}{keywords}%
      \sideinfofield{License}{license}%
      \ifpreprint\else
        \printNamesOrcid{Reviewers}{reviewers}
        \printNamesOrcid{Guest~Editors}{guesteditors}
      \fi
      \sideinfofield{Note}{issuenote}%
    }
  \fi
  \ignorespaces
}

% Abstract
\RenewDocumentEnvironment{abstract}{+b}{}{%
  \par
  \setlength{\fboxsep}{2mm}%
  \noindent
  \colorbox{secundarycolor!10}{%
    \hskip1mm\parbox{\dimexpr\linewidth-6mm}{%
      \sffamily\normalsize
      \textbf{\abstractname.}\space
      #1%
    }%
    \hskip1mm}%
  \par
}

\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  filecolor=filecolor,
  linkcolor=linkcolor,
  urlcolor=urlcolor,
  citecolor=citecolor,
}

\ExplSyntaxOn

\IfFileExists{\g_ptxcd_metadata_path_tl self.bib}{
  \addbibresource{\g_ptxcd_metadata_path_tl self.bib}
  \howtocite{\begin{refsection}\fullcite{self}\end{refsection}}
}{
  \ClassWarningNoLine{jcls}{\g_ptxcd_metadata_path_tl\space self.bib~not~found.\iow_newline: Hiding~all~metadata}
  \metadatafalse
}

\IfFileExists{\g_ptxcd_metadata_path_tl authors.tex}{
  \ExplSyntaxOff
  \input{\g_ptxcd_metadata_path_tl authors.tex}
  \ExplSyntaxOn
}{
  \ClassWarningNoLine{jcls}{\g_ptxcd_metadata_path_tl\space self.bib~not~found.\iow_newline: Hiding~all~metadata}
  \metadatafalse
}

\IfFileExists{\g_ptxcd_metadata_path_tl article.tex}{
  \ExplSyntaxOff
  \input{ \g_ptxcd_metadata_path_tl article.tex}
  \ExplSyntaxOn
}{
  \ClassWarningNoLine{jcls}{\g_ptxcd_metadata_path_tl\space article.tex~not~found.\\Hiding all metadata}
  \metadatafalse
}

\box_new:N \g_ptxcd_watermark_box
\hbox_gset:Nn \g_ptxcd_watermark_box {{\color{primarycolor}
    \rotatebox[origin=c]{90}{
      \scalebox{2}{{\sffamily\getfield{articletype}}
      }
    }
  }
}

\NewDocumentCommand \printwatermark {}{
  \AddToHook {shipout/background} {
    \put(1em,-.5\paperheight){\box_use:N \g_ptxcd_watermark_box}
  }
}
\ExplSyntaxOff

%%% Additional packages which have been loaded automatically before the refactoring
\RequirePackage{pdflscape}
\RequirePackage{datetime2}

% tables
\RequirePackage{booktabs}

\RequirePackage{longtable}
\setlength\LTleft{0pt}
\setlength\LTright{\fill}

\RequirePackage{tabularx}
\RequirePackage{makecell}

\RequirePackage{marginnote}
\RenewDocumentCommand \marginfont { }
{ \sffamily\footnotesize }
\RenewDocumentCommand \raggedleftmarginnote { } { }

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
