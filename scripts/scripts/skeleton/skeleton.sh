#!/usr/bin/env bash

function usage ()
{
    echo "Erreur : $*"
	  echo "Usage : FilePath FileName FileExtension"
    exit
}

function latex ()
{
   echo '\documentclass[a4paper,french,draft]{report}


% This template is by default in draft mode. Erase the parameter in the document class to have images.
% It uses the report mode by default with custom chapters.
% It uses \citeref{[ref]} instead of \cref{[ref]} to correct a bug with babel and cleveref.


\usepackage[utf8]{inputenc}
\usepackage[french]{babel} 
\usepackage[T1]{fontenc}
\usepackage{titlesec}

% Figures
\usepackage{graphicx}
\graphicspath{{./img/}}

% Math
\usepackage{mathtools}
\usepackage{amsmath, amssymb}
\newtheorem{defi}{Définition}

% Algortihmes
\usepackage[vlined,lined,linesnumbered,boxed,french]{algorithm2e}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator{\myfunc}{myfunc}
\DeclareMathOperator*{\sign}{sign}
\DeclareMathOperator*{\imwh}{width}
\DeclareMathOperator*{\imht}{height}

% Refs
\usepackage[style=numeric,sorting=none,language=french]{biblatex}
\usepackage{hyperref}
\usepackage{cleveref}
\usepackage{xcolor}
\hypersetup{
  colorlinks=true,
  linkcolor=blue,
  urlcolor=blue,
	citecolor=blue} 


% Extra
\usepackage[left=3cm,right=3cm,top=2cm,bottom=2cm]{geometry}
\usepackage{url}
\usepackage{appendix}
\usepackage{tablefootnote}


% New regular chapter format
% \chapter{Title}
\titleformat{\chapter}[hang]
  {\Huge\bfseries\scshape} % text format
  {} % no label
  {0pt} % space between number and title
  {} % title only
\titlespacing*{\chapter}{0pt}{-20pt}{40pt} % left, above, beneath spaces

% New annexe chapter format
% \anxchapter{Title}
% -> Annexe A : Title
\newcommand{\anxchapter}[1]{%
    \titleformat{\chapter}[hang]%
    {\normalfont\Huge\bfseries}%
    {Annexe \Alph{chapter} : }%
    {0pt}%
    {}%
    \titlespacing*{\chapter}{0pt}{-20pt}{20pt} % left, above, beneath spaces
    \chapter{#1}%
}

% \citeref (resp. \Citeref) to be used instead of \cref (resp. \Cref)
% corrects a bug that happens when using babel french language and cleveref british language
\newcommand{\citeref}[1]{%
    \begin{otherlanguage}{british}%
    \cref{#1}%
    \end{otherlanguage}
}
\newcommand{\Citeref}[1]{%
    \begin{otherlanguage}{british}%
    \Cref{#1}%
    \end{otherlanguage}
}

% To be used in a tabular env if equations are willing to be labelissed
% \rowtag{row:label}{row_id}
% -> (row_id)
\newcommand{\rowtag}[2]{(#2)\phantomsection\label{#1}}
% \citerow{row:label}{row_id}
% -> (row_id)
\newcommand{\citerow}[2]{(\hyperref[#1]{#2})}


% Path to the reference docs
\addbibresource{references.bib}


% Correction of a bug between amsmath and cleveref where labels wouldnt work anymore
\makeatletter
\AtBeginDocument
 {
   \def\ltx@label#1{\cref@label{#1}}%add braces
   \def\label@in@display@noarg#1{\cref@old@label@in@display{#1}}%remove braces
  \def\label@in@mmeasure@noarg#1{%
    \begingroup%
      \measuring@false%
      \cref@old@label@in@display{#1}%remove braces for multline
    \endgroup}%  
 } %
\makeatother

\begin{document}



\printbibliography

\end{document}' > $1

}

function c ()
{
    echo "#include <stdlib.h>
#include <stdio.h>


int main( int argc, char *argv[] )
{
    return EXIT_SUCCESS;
}" > $1
}

function bash ()
{
    echo "#!/usr/bin/env bash
" > $1
}

function html ()
{
	echo '<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />

		<title>TITLE</title>

		<link href="style.css" type="text/css" rel="stylesheet" />

		<script src="scripts/script.js" type="text/javascript" defer></script>
	</head>
	<body>
	</body>
</html> ' > $1
}

function makeJustfile ()
{
echo '
default: pdf

pdf:
	latexmk

continuously:
	latexmk -pvc

clean:
	latexmk -c

deepClean:
	latexmk -C' > $1
}

function creation ()
{
    touch $1
    echo "Creation de $1"
}

if [ $# -lt 3 ]
then
    usage "Not enough arguments"
fi

if [ $3 = "tex" ]
then
	creation $1Justfile
	makeJustfile $1Justfile
	echo "Justfile skeleton complete"
	creation $1$2.$3
	latex $1$2.$3
	echo "Tex skeleton complete"
fi

if [ $3 = "c" ]
then
	creation $1$2.$3
	c $1$2.$3
	echo "C skeleton complete"
fi

if [ $3 = "sh" ]
then
	creation $1$2.$3
	bash $1$2.$3
	echo "sh skeleton complete"
fi

if [ $3 = "html" ]
then
	creation $1$2.$3
	html $1$2.$3
	echo "hmtl skeleton complete"
fi

