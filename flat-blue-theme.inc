\mode<presentation>

%Für [Seite]/[Anzahl-Seiten] in der unteren rechten ecke
\newcommand*\oldmacro{}%
\let\oldmacro\insertshorttitle%
\renewcommand*\insertshorttitle
{%
	% Use this to not count \pause as new frame. And also to make the package "appendixnumberbeamer" work.
	% \makebox[0.94\textwidth]{\oldmacro\hfill\insertframenumber\,/\,\inserttotalframenumber}

	% Use this to show the total number of PDF pages
	\makebox[0.94\textwidth]{\oldmacro\hfill\thepage\,/\,\insertpresentationendpage}
}
\makeatletter
\newcommand*{\currentname}{\TR@currentTitle}
\makeatother

\definecolor{light-light-gray}{gray}{0.85}
\definecolor{blue}{rgb}{0,0.55,0.8}
\definecolor{darker_blue}{rgb}{0,0.41,0.6}
\definecolor{light_blue}{rgb}{0.2,0.4,0.6}

%\usetheme[compress]{Berlin}
\usetheme[compress]{Dresden}
%\usetheme{Hamburg}
\setbeamerfont{headline}{size=\large}
\setbeamerfont*{section in head/foot}{size=\tiny}
\setbeamercovered{transparent}
\setbeamertemplate{bibliography item}[text]
\setbeamertemplate{itemize items}[square]
\setbeamertemplate{itemize subitem}[triangle]
\setbeamertemplate{section in toc}[square]
\setbeamertemplate{subsection in toc}[square]
\setbeamertemplate{caption}[numbered]
\setbeamercolor*{title}{use=structure,fg=white,bg=structure.fg}
\setbeamertemplate{title page}[default][colsep=-2bp]
\setbeamercolor{block title}{bg=darker_blue!100,fg=white}
\setbeamercolor{block body}{bg=light_blue!25,fg=black}

\usecolortheme[named=blue]{structure}

\newcommand{\n}{\hfill\\\vspace{0.25cm}}

% Reduce spacing between TOC elements
\makeatletter
	\newcommand{\condensedToc}[1][0.8em]{
		% Replace default 1.5em with the given value
		\patchcmd{\beamer@sectionintoc}{\vskip1.5em}{\vskip#1}{}{}
	}
\makeatother

\mode<all>
