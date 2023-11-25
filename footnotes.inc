\renewcommand\footnoterule
{
	% Original implementation just with gray color
	\color{gray}
	\kern-3pt 
	\hrule width 2in 
	\kern 2.6pt
}

\renewcommand\thefootnote{\tiny\textcolor{gray}{\arabic{footnote}}}
\let\oldfootnote\footnote
\renewcommand{\footnote}[1]
{%
	\oldfootnote
	{
		\tiny
		\textcolor{gray}{\ #1}
	}%
}

\renewcommand{\footref}[1]{\textsuperscript{\ref{#1}}}

\newcommand{\wikilink}[2]{\href{https://de.wikipedia.org/wiki/#1}{#2}}

\newcommand{\citewiki}[2][]
{%
	\footnote
	{%
		\ifthenelse{\isempty{#1}}
		{%
			Quelle: \wikilink{#2}{Wikipedia:#2}
		}
		{%
			Quelle: \wikilink{#2}{Wikipedia:#1}
		}
	}
}

\newcommand{\citeurl}[2]
{%
	\footnote{Quelle: \href{#1}{#2}}
}