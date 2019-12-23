\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{problemClass}[2019/10/18 ProblemSolution]
\LoadClass{article}
\RequirePackage{placeins}
\RequirePackage{environ}
\RequirePackage{xifthen}


% \solutiontrue and \solutionfalse control whether solutions are shown
\newif\ifsolution
\solutiontrue
%\solutionfalse


% Redefine these if you want to change the language
\newcommand{\problemlabel}{Problem}
\newcommand{\solutionlabel}{Solution}


% Set up counters for problems and subproblems
\newcounter{ProblemNum}
\newcounter{SubProblemNum}[ProblemNum]
\renewcommand{\theProblemNum}{\arabic{ProblemNum}}
\renewcommand{\theSubProblemNum}{\alph{SubProblemNum}}


% The problem environment is the base unit of content for this class.
\newcommand{\subsectiontitle}{}
\newenvironment{problem}[1]%
  {
  \stepcounter{ProblemNum}
  \renewcommand{\subsectiontitle}{\problemlabel \ \theProblemNum \ifthenelse{\isempty{#1}}{}{\ : #1}}
  \medskip \subsection*{\subsectiontitle}
  \FloatBarrier
  }
  {
  \FloatBarrier
  }


% The subproblem command divides a problem into parts a), b), c), ...
\newcommand*{\subproblem}{%
  \stepcounter{SubProblemNum}%
  {\bf \theSubProblemNum)\hspace{2pt}}
  }


% The solution environment should be used within the problem environment
\NewEnviron{solution}{
  \setcounter{SubProblemNum}{0}
  \ifsolution
    \FloatBarrier
    \subsubsection*{\solutionlabel}
    \BODY
  \fi}