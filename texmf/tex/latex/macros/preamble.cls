\NeedsTeXFormat{LaTeX2e}[1995/12/01] 
\ProvidesClass{generic} [2011/05/09 v0.01 Yannick Chevalier]

\newif\ifacmversion
\newif\ifllncsversion
\newif\ifplainversion
\newif\ifeasychairversion



\newif\ifshortversion
\newif\ifconferencedefined
\newif\ifauthordefined

\global\def\two@column{}

\DeclareOption{acmconf}{\acmversiontrue}
\DeclareOption{lncs}{\llncsversiontrue}
\DeclareOption{plain}{\plainversiontrue}
\DeclareOption{easychair}{\easychairversiontrue}

\DeclareOption{short}{\shortversiontrue} 
\DeclareOption{twocolumns}{\global\def\two@column{twocolumn}}

\DeclareOption{draft}{\def\status{draft}}
\DeclareOption{submit}{\def\status{submit}}


\ExecuteOptions{plain}
\ProcessOptions



\newcommand{\MyConf}[3]{%
\csname #1versiontrue\endcsname
\conferencedefinedtrue
\global\def\my@conference@long@name{#3}
\global\def\my@conference@short@name{#2}
}

\newcommand{\MyAuthor}[3]{%
\authordefinedtrue
\global\def\my@author@name{#1}
\global\def\my@author@institute{#2}
\global\def\my@author@email{#3}
}

% Loading the main class

\ifacmversion
\LoadClass[\status,box]{acmconf}
\fi

\ifllncsversion
\LoadClass[\two@column]{llncs}
\fi

\ifplainversion
\LoadClass[\two@column]{article}
\fi

\ifeasychairversion
\LoadClass{easychair}
\fi

\def\preparetitle#1{
\title{#1}
\ifacmversion
\ConferenceName{\my@conference@long@name}
\ConferenceShortName{\my@conference@short@name}
\author{%
\Author{\my@author@name}\\
\Address{\my@author@institute}\\
\Email{\my@author@email}\\
}
\else
\ifllncsversion
\author{\my@author@name}
\institute{\my@author@institute\\{}email:\url{\my@author@email}}
\else
\author{\my@author@name}
\fi
\fi}

\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{proof}
\RequirePackage{xspace}
\RequirePackage{comment}
\RequirePackage{enumerate}
\RequirePackage[utf8]{inputenc}
\RequirePackage{paralist}
\RequirePackage{url}
\RequirePackage{algorithm,algorithmic}
\RequirePackage{subfig}
\RequirePackage{empheq}
\bibliographystyle{plain}



\newcommand{\fullref}[1]{\ref{#1}, p.~\pageref{#1}}





\newcommand{\tq}{\,\vert\,}
\newcommand{\call}[1]{\ensuremath{\mathcal{#1}}}
\newenvironment{ilitz}{\begin{inparaenum}[\itshape a\upshape)]}{\end{inparaenum}}
\newenvironment{personal}{\underline{\bf Personal work:}\begin{itemize}\item[]}{\end{itemize}}









%\newcommand{\Cons}[2][]{\ensuremath{\operatorname{Const}_{\rm 1}(#2)}}
%\newcommand{\Dom}[2][]{\ensuremath{\operatorname{Dom}_{\rm #1}(#2)}}
%\newcommand{\domain}[2][]{\ensuremath{\operatorname{domain}_{\rm #1}(#2)}}
%\newcommand{\mgu}[2][]{\ensuremath{\operatorname{mgu}_{\rm #1}(#2)}}
%\newcommand{\Pos}[2][]{\ensuremath{\operatorname{Pos}_{\rm #1}(#2)}}
%\newcommand{\Res}[2][]{\ensuremath{\operatorname{Res}_{\rm #1}(#2)}}
%\newcommand{\Der}[2][]{\ensuremath{\operatorname{Der}_{\rm #1}(#2)}}
%\newcommand{\Sig}[2][]{\ensuremath{\operatorname{Sig}_{\rm #1}(#2)}}
%\newcommand{\Sub}[2][]{\ensuremath{\operatorname{Sub}_{\rm #1}(#2)}}
%\newcommand{\Supp}[2][]{\ensuremath{\operatorname{Supp}_{\rm #1}(#2)}}
%\newcommand{\Unif}[2][]{\ensuremath{\operatorname{Unif}_{\rm #1}(#2)}}
%\newcommand{\Var}[2][]{\ensuremath{\operatorname{Var}_{\rm #1}(#2)}}
%\newcommand{\Eval}[2][]{\ensuremath{\operatorname{Eval}_{\rm #1}(#2)}}
%\newcommand{\Image}[2][]{\ensuremath{\operatorname{Image}_{\rm #1}(#2)}}
%\newcommand{\Sol}[2][]{\ensuremath{\operatorname{Sol}_{\rm #1}(#2)}}
%\newcommand{\Factors}[2][]{\ensuremath{\operatorname{Factors}_{\rm #1}(#2)}}
%\newcommand{\atoms}[2][]{\ensuremath{\operatorname{atoms}_{\rm #1}(#2)}}
%\newcommand{\priv}[2][]{\ensuremath{\operatorname{priv}_{\rm #1}(#2)}}
%\newcommand{\nonces}[2][]{\ensuremath{\operatorname{nonces}_{\rm #1}(#2)}}
%\newcommand{\strand}[2][]{\ensuremath{\operatorname{strand}_{\rm #1}(#2)}}
%\newcommand{\pk}[2][]{\ensuremath{\operatorname{pk}_{\rm #1}(#2)}}
%\newcommand{\sk}[2][]{\ensuremath{\operatorname{sk}_{\rm #1}(#2)}}
%\newcommand{\enc}[2][]{\ensuremath{\operatorname{enc}_{\rm #1}(#2)}}
%\newcommand{\dec}[2][]{\ensuremath{\operatorname{dec}_{\rm #1}(#2)}}
%\newcommand{\sign}[2][]{\ensuremath{\operatorname{sign}_{\rm #1}(#2)}}
%\newcommand{\verif}[2][]{\ensuremath{\operatorname{verif}_{\rm #1}(#2)}}
\newcommand{\rinput}{\ensuremath{\operatorname{input}}}

%\newcommand{\implies}{\ensuremath{\Rightarrow}}
\newcommand{\atomordering}{{\prec_a}}
\newcommand{\termordering}{{\prec_t}}
\newcommand{\Nat}{\ensuremath{\text{\rm{}I\kern-0.20em{}N}}}
\newcommand{\Rat}{\ensuremath{\text{\sf{}l\rm{}\kern-0.42em{}Q}}}
\newcommand{\Real}{\ensuremath{\text{\rm{}I\kern-0.20em{}R}}}
\newcommand{\Clause}[3]{\ensuremath{#3\text{ }{\vdash}_{#2}\text{ }#1}}
\newcommand{\Context}[2]{\ensuremath{#1[#2]}}
\newcommand{\ConstrSys}[1]{\ensuremath{\mathcal{#1}}}
\newcommand{\tuple}[1]{\ensuremath{\left\langle #1 \right\rangle}}
\newcommand{\aci}[1]{\ensuremath{\cdot\left( #1 \right)}}
\newcommand*{\shortaci}[1]{\ensuremath{\cdot\left[#1\right]}}

\newcommand{\Constants}{\ensuremath{C}}
\newcommand{\Variables}{\ensuremath{\mathcal{X}}\xspace}
\newcommand{\atomes}{\ensuremath{\mathcal{A}}\xspace}
\newcommand{\sig}[1]{\ensuremath{\mathcal{T}(#1)}\xspace}
\newcommand{\gsig}[1]{\ensuremath{\mathcal{T}(#1)}\xspace}
\newcommand{\vsig}[1]{\sig{#1,\Variables}\xspace}
\newcommand{\set}[1]{\ensuremath{\lbrace #1 \rbrace}}
\newcommand{\condset}[2]{\set{#1 \,\vert{}\, #2}}
\newcommand{\ded}{\leadsto}
\newcommand{\prele}{\preceq}
\newcommand{\interpret}[2][\call{I}]{\ensuremath{[\kern-0.15em[#2]\kern-0.15em]_{#1}}}
\newcommand{\unif}{\ensuremath{\stackrel{?}{=}}}

\newcommand{\minic}{\ensuremath{c_{\text{min}}}}
\newcommand{\Nonces}{\ensuremath{C_{\text{new}}}}
\newcommand{\intrus}[3]{\ensuremath{(#1,#2,#3)}}
\newcommand{\defsd}[1]{\ensuremath{(\call V #1,\call S #1,\call K #1,\Invar #1,\Outvar #1)}}
\newcommand{\nintrus}[1]{\intrus{\call{F}_{#1}}{S_{#1}}{\call{E}_{#1}}}
\newcommand{\nded}[1]{\intrus{\call{F}#1}{\call{F}^p#1}{\call{E}#1}}
\newcommand{\combintrus}{\intrus{\call{F}_{1}\cup\call{F}_{2}}%
{\engendre{S_{1}}\cup{}\engendre{S_{2}}}%
{\call{E}_{1}\cup\call{E}_{2}}\xspace}
\newcommand{\engendre}[1]{\ensuremath{\left\langle #1 \right\rangle}}
\newcommand{\class}[1]{\ensuremath{\tilde #1}}
\newcommand{\past}[1]{\ensuremath{\varphi_{\mathrm{p}}(#1)}}
\newcommand{\Ind}{\mbox{\sc{Ind}}\xspace}
\newcommand{\Invar}{\mbox{\sc{In}}\xspace}
\newcommand{\Outvar}{\mbox{\sc{Out}}\xspace}
\newcommand{\xor}{\ensuremath{\oplus}}
\newcommand{\trace}[2]{\ensuremath{\text{\rm Tr}_{#2}(#1)}}
\newcommand{\open}[2]{\ensuremath{\text{\rm open}_{#2}(#1)}}
\newcommand{\emc}{\ensuremath{[\hspace*{0.5ex}]}\xspace} 
\newcommand{\rhnorm}[2]{\ensuremath{{(#1)\!\!\downarrow_{#2}}}}
\newcommand{\normi}[2]{\rhnorm{#1}{R_{#2}}}
\newcommand{\norm}[1]{\rhnorm{#1}{}}
\newcommand{\normo}[1]{\rhnorm{#1}{\call{O}}} 
\newcommand{\oraclenorm}[1]{\function{\call{O}_{norm}}{#1}}
\newcommand{\preserve}[1]{\ensuremath{{\Sigma^{\mathconstante{sig}}_{#1}}}}
\def\comp{\circ}
\newcommand{\DY}{\ensuremath{\mathcal{{DY}}}\xspace}

\newcommand{\rhparti}[2]{\fonctionindicee{Part}{#2}{#1}}
\newcommand{\parti}[1]{\fonction{Part}{#1}}
\newcommand{\head}[1]{\fonction{Sign}{#1}}

\newcommand{\Id}{\mathconstante{Id}}
\newcommand{\fact}[1]{\emph{``#1''}}
\newcommand\union\cup

\newcommand{\direct}{\fbox{$\Rightarrow$}\hspace*{1em}}
\newcommand{\converse}{\fbox{$\Leftarrow$}\hspace*{1em}}






\newcommand{\penc}[2]{\enc[p]{#1,#2}}
\newcommand{\pdec}[2]{\dec[p]{#1,#2}}
%
\newcommand{\senc}[2]{\enc[s]{#1,#2}}
\newcommand{\sdec}[2]{\dec[s]{#1,#2}}
%
\newcommand{\psig}[2]{\sign{#1,#2}}
\newcommand{\pverif}[3]{\verif{#1,#2,#3}}
\newcommand{\paire}[2]{\ensuremath{\left\langle #1,#2\right\rangle}}
\newcommand{\piun}[1]{\ensuremath{\pi_1(#1)}}
\newcommand{\pideux}[1]{\ensuremath{\pi_2(#1)}}
%

\newcommand{\msg}[2]{\ensuremath{\text{\rm msg}( #1,#2)}}
%\newcommand{\payload}[1]{\ensuremath{\text{\rm payload}(#1)}}
%\newcommand{\partner}[1]{\ensuremath{\text{\rm partner}(#1)}}
\newcommand{\symtest}[2]{\ensuremath{\mathrm{symtest}({#1},{#2})}}
%\newcommand{\pairtest}[1]{\ensuremath{\mathrm{pairtest}({#1})}}



\newcommand{\sfree}{\ensuremath{\text{\rm sf}}}
\newcommand{\sfreep}{\ensuremath{\text{\rm sf+}}}





\makeatother