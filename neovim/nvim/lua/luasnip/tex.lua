-- use vimtex to determine if we are in a math context
local function math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

return {
	-- New document generation snippet
	s(
		{ trig = "documentclass", snippetType = "snippet", desc = "First generation of a doc", wordTrig = false },
		fmta(
			[[
				\documentclass[a4paper,french]{<>}

				\usepackage[utf8]{inputenc}
				\usepackage[french]{babel}
				\usepackage[T1]{fontenc}
				\usepackage{titlesec}
				\usepackage{csquotes}

				% Figures
				\usepackage{graphicx}
				\graphicspath{{./img/}}

				\usepackage{amsmath}
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

				% \citeref to be used instead of \cref
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

				\crefname{table}{table}{tables}
				\Crefname{table}{Table}{Tables}


				% Extra
				\usepackage[left=3cm,right=3cm,top=2cm,bottom=2cm]{geometry}
				\usepackage{url}
				\usepackage{appendix}
				\usepackage{tablefootnote}
				\usepackage{tabularx}
				\usepackage{subcaption}
				\usepackage{booktabs}

				% regular chapters
				\titleformat{\chapter}[block]
					{\Huge\bfseries\scshape} % text format
					{} % no label
					{0pt} % space between number and title
					{} % title only
				\titlespacing*{\chapter}{0pt}{-20pt}{40pt} % left, above, beneath spaces

				% to be used only in annexes
				\newcommand{\anxchapter}[1]{%
						\titleformat{\chapter}[block]%
						{\normalfont\Huge\bfseries}%
						{Annexe \Alph{chapter} : }%
						{0pt}%
						{}%
						\titlespacing*{\chapter}{0pt}{-20pt}{20pt} % left, above, beneath spaces
						\chapter{#1}%
				}


				\addbibresource{references.bib}


				% Correction of a bug between amsmath and cleveref where labels wouldn't work anymore
				\makeatletter
				\AtBeginDocument
				 {
					 \def\ltx@label#1{\cref@label{#1}}%add braces
					 \def\label@in@display@noarg#1{\cref@old@label@in@display{#1}}%remove braces
					\def\label@in@mmeasure@noarg#1{%
						\begingroup%
							\measuring@false%
							\cref@old@label@in@display{#1}%remove braces for multiline
						\endgroup}%
				 } %
				\makeatother

				\begin{document}
          <>
				\end{document}

        ]],
			{ i(1, "documentclass"), i(2, "This is the end of the header and beginning of file.") }
		)
	),

	-- Title page snippet
	s(
		{ trig = "titlepage", snippetType = "snippet", dscr = "A good title page template" },
		fmta(
			[[
				\begin{titlepage}
					\vspace*{3cm}

					\centering
					{\Huge\bfseries\scshape \textbf{<>}\par}

					\vspace{1cm}

					\Large
					\textbf{<>}

					\vspace{\baselineskip}
					\textbf{\today}

					\vfill

					<>

					\vspace{1cm}

					\begin{figure}[htbp]
						\centering
						\includegraphics[width=\textwidth]{logo_em.jpg}
					\end{figure}

					\vspace{3cm}
				\end{titlepage}

				\pagenumbering{gobble}
				\setcounter{page}{0}
				\tableofcontents
				\cleardoublepage

				\newpage

				\pagenumbering{arabic}
				\setcounter{page}{1}

				\pagenumbering{roman}
				\setcounter{page}{1}

				\appendix

				\printbibliography[
					heading=bibintoc,
					title={Bibliographie}
				]
			]],
			{ i(1, "Document title"), i(2, "Authors"), i(3, "Departement") }
		)
	),

	-- Boilerplate snippets
	s(
		{ trig = "figure", snippetType = "autosnippet", dscr = "A basic figure environment" },
		fmta(
			[[
        \begin{figure}
        \centering
        \includegraphics[width=0.9\linewidth]{<>}
        \caption{
            \textbf{<>}
            <>
            }
        \label{fig:<>}
        \end{figure}

        ]],
			{ i(1, "filename"), i(2, "captionBold"), i(3, "captionText"), i(4, "figureLabel") }
		)
	),

	s(
		{ trig = "\\begin", snippetType = "autosnippet", dscr = "Begin and end an arbitrary environment" },
		fmta(
			[[
        \begin{<>}
          <>
        \end{<>}
        ]],
			{ i(1), i(2), rep(1) }
		)
	),

	-- Other snippets
	--postfixes for vectors, hats, etc. The match pattern is '\\' plus the default (so that hats get put on greek letters,e.g.)
	postfix({
		trig = "hat",
		match_pattern = [[[\\%w%.%_%-%"%']+$]],
		snippetType = "autosnippet",
		dscr = "postfix hat when in math mode",
	}, { l("\\hat{" .. l.POSTFIX_MATCH .. "}") }, { condition = math }),
	postfix({
		trig = "vec",
		match_pattern = [[[\\%w%.%_%-%"%']+$]],
		snippetType = "autosnippet",
		dscr = "postfix vec when in math mode",
	}, { l("\\vec{" .. l.POSTFIX_MATCH .. "}") }, { condition = math }),
}
