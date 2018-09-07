\NeedsTeXFormat{LaTeX2e}[1995/12/01] 
\ProvidesClass{generic} [2011/05/09 v0.01 Yannick Chevalier]


\newif\ifacmversion
\acmversionfalse
\newif\iflncsversion
\lncsversionfalse
\newif\ifplainversion
\plainversionfalse
\newif\ifeasychairversion
\easychairversionfalse


\newif\ifshortversion
\newif\ifconferencedefined
\newif\ifauthordefined

\global\def\two@column{}
% Conference type
\DeclareOption{acmconf}{\acmversiontrue\plainversionfalse}
\DeclareOption{lncs}{\lncsversiontrue\plainversionfalse}
\DeclareOption{easychair}{\easychairversiontrue\plainversionfalse}
\DeclareOption{plain}{\plainversiontrue}
% Version type
\DeclareOption{short}{\shortversiontrue} 
\DeclareOption{twocolumns}{\global\def\two@column{twocolumn}}
% Status of the document
\DeclareOption{draft}{\def\status{draft}}
\DeclareOption{submit}{\def\status{submit}}
% 
\DeclareOption{fullref}{\AtEndOfPackage{%
\global\let\myref\ref
\renewcommand{\ref}[1]{\myref{#1}, p.~\pageref{#1}}}}

\ExecuteOptions{plain}
\ProcessOptions

\RequirePackage{expl3}
\ExplSyntaxOn


%%% prelude
\cs_generate_variant:Nn \prop_put:Nnn {Nxx}
\cs_generate_variant:Nn \prop_gput:Nnn {Nxx}
\cs_generate_variant:Nn \prop_get:NnN {NxN}
\cs_generate_variant:Nn \prop_get_gdel:NnN {NxN}
\cs_generate_variant:Nn \prop_gdel:Nn {Nx}
\cs_generate_variant:Nn \prop_gget:NnN {NxN}
\cs_generate_variant:Nn \prop_if_in:NnT {NxT}
\cs_generate_variant:Nn \prop_if_in:NnTF {NxTF}

%%%% Emails facilities


%\global\def\p_email_login{no login}
%\def\p_email_domain{no domain}


\makeatother
\def\getlogin#1@#2@{\global\def\p_email_login{#1}}
\def\getdomain#1@#2@{\global\def\p_email_domain{#2}}
\def\parse_email#1{
{\getlogin #1@}
{\getdomain #1@}
}
\makeatletter



\cs_new:Npn \show_global_state {
\typeout{Institutes}
\typeout{Global}
\prop_display:N \g_institute_name_prop
\prop_display:N \g_institute_address_prop
\prop_display:N \g_institute_domain_prop
\prop_display:N \g_institute_emails_prop
\prop_display:N \g_institute_list_prop
\typeout{Parameters}
\tl_show:N \p_institute_name
\tl_show:N \p_institute_address
\tl_show:N \p_institute_domain
\tl_show:N \p_institute_emails
}

%%% Institutes

% logically local variables in macros 
\int_new:N \g_institute_number
\tl_new:N  \l_institute_count

% logically global variables (same value in several macros)
\int_set:Nn \g_institute_number {0}

\prop_new:N \g_author_name_prop
\prop_new:N \g_author_institution_prop
\prop_new:N \g_author_email_prop

% name format: _key_valueName_prop
\prop_new:N \g_institute_name_prop
\prop_new:N \g_institute_address_prop
\prop_new:N \g_institute_domain_prop
\prop_new:N \g_institute_emails_prop
\prop_new:N \g_institute_list_prop        % just to keep track of which institutes
                                          % have been considered. Prop_list
                                          % so that we can remove elements



% Variables employed as in/out parameters
\tl_new:N \p_institute_name
\tl_new:N \p_institute_address
\tl_new:N \p_institute_domain
\tl_new:N \p_institute_emails



\cs_new:Npn \NewInstitute #1#2#3 {
  % usage: \verb+\Institution{number}{name}{address}+
%  \typeout{BEGIN~new~institute}
%  \show_global_state
  \prop_gput:Nxx \g_institute_name_prop {#1}{#2}
  \prop_gput:Nxx \g_institute_address_prop {#1}{#3}
  \prop_gput:Nxx \g_institute_list_prop {#1} {#1}
%  \typeout{END~new~institute}
%  \show_global_state
}

\cs_new:Npn \get_institute_data #1 {
%  \typeout{BEGIN~get~institute~data}
%  \show_global_state
  \prop_gget:NxN \g_institute_name_prop    {#1} \p_institute_name
  \prop_gget:NxN \g_institute_address_prop {#1} \p_institute_address
%  \typeout{END~get~institute~data}
%  \show_global_state
}

\cs_new:Npn \get_emails_from_institute #1 {
%  \typeout{BEGIN~get~email~from~institute}
%  \show_global_state
  \prop_gget:NxN \g_institute_emails_prop  {#1} \p_institute_emails
  \prop_gget:NxN \g_institute_domain_prop  {#1} \p_institute_domain
%  \typeout{END~get~email~from~institute}
%  \show_global_state
}

\cs_new:Npn \add_email_to_institute #1#2 {
  % usage: \verb+\add_email_to_institute{email}{inst number}+
  % example: #1=ychevali@irit.fr #2=1
%  \typeout{BEGIN~add~email~to~institute}
%  \show_global_state
%  \typeout{email=#1}
  \parse_email{#1}
%  \tl_show:N \p_email_login  % should be ychevali
%  \tl_show:N \p_email_domain % should be irit.fr

  % First, if the domain for the emails of the institute is not set
  % yet, we set it using the domain of the email of the first author
  % in the institute.
  \prop_if_in:NnTF \g_institute_domain_prop #2 {%
    % Institute already encountered: we retrieve its list of emails,
    % and append the new one. The domain is not changed.
%    \typeout{after~time #2}
    \prop_gget:NxN \g_institute_emails_prop {#2} \p_institute_emails
    \tl_gput_right:Nx \p_institute_emails {,\p_email_login}
  } {% 
    % First time we encounter this institute
%    \typeout{first~time}
    \tl_gset:Nx \p_institute_domain {\p_email_domain}
    \prop_gput:Nxx \g_institute_domain_prop {#2} {\p_email_domain}
    \tl_gset:Nx \p_institute_emails {\p_email_login}
  } 
  \prop_gput:Nxx \g_institute_emails_prop {#2} \p_institute_emails
%  \typeout{END~add~email~to~institute}
%  \show_global_state
}



%%% Authors

% logically local variables in macros 
\int_new:N \g_author_number

% logically global variables (same value in several macros)
\int_set:Nn \g_author_number {0}
\prop_new:N \g_author_name_prop
\prop_new:N \g_author_institution_prop
\prop_new:N \g_author_email_prop

% Variables employed as in/out parameters
\tl_new:N \p_author_name
\tl_new:N \p_author_inst_number
\tl_new:N \p_author_inst
\tl_new:N \p_author_address
\tl_new:N \p_author_email

\cs_new:Npn \NewAuthor #1#2#3 {
  % usage: \verb+\NewAuthor{name}{institution number}{email}
  \expandafter\def\expandafter\author_number{\@firstofone{\int_to_arabic:n \g_author_number}}
  \prop_put:Nxx \g_author_name_prop \author_number {#1}
  \prop_put:Nxx \g_author_institution_prop \author_number {#2}
  \prop_put:Nxx \g_author_email_prop \author_number {#3}
  \add_email_to_institute{#3}{#2}
  \int_incr:N \g_author_number
}

\cs_new:Npn \get_author #1 {
  % usage: \verb+\get_author i+ sets all author related variables
  % to values corresponding to this author. The number is the order
  % of the author in the authors declarations.
  \prop_gget:NxN \g_author_name_prop #1 \p_author_name
  \prop_gget:NxN \g_author_institution_prop #1 \p_author_inst_number
  \prop_gget:NxN \g_author_email_prop #1 \p_author_email
}

%%% Managing Conferences

\tl_new:Nn \g_conference_long_name_tl  {No Conference Long Name Given}
\tl_new:Nn \g_conference_short_name_tl {No Conference Short Name Given}

\cs_new:Npn \Conference #1#2#3 {%
  \csname #1versiontrue\endcsname
  \conferencedefinedtrue
  \tl_gset:Nx \g_conference_long_name_tl {#3}
  \tl_gset:Nx \g_conference_short_name_tl {#2}
  \ProcessConference
}


\global\def\acm_process_conference {
  \ifacmversion
  \expandafter\ConferenceName{\g_conference_long_name_tl}
  \expandafter\ConferenceShortName{\g_conference_short_name_tl}
  \fi
}

\global\def\no_conference_process {
  \typeout{Conference name not processed.}
}

\ifacmversion
  \global\let\ProcessConference\acm_process_conference
\else
  \global\let\ProcessConference\no_conference_process
\fi
%%% Preparation of the title

\def\comma{,\xspace}
\int_new:N \l_author_counter
\tl_new:N \l_author_number
\tl_new:Nn \l_author_content {}
\tl_new:Nn \l_institute_content {}


%%%%%%%%%%%%%%%%%%% ACM %%%%%%%%%%%%%%%%%%%%%%%%%%%%

\cs_new:Npn \acm_register_author #1 {
  \get_author{#1}
  \get_institute_data{\p_author_inst_number}
  \tl_gput_right:Nx \l_author_content {%
    \noexpand\Author{\p_author_name}\noexpand\\ 
    \noexpand\Address{\p_institute_name\noexpand\\ \p_institute_address}\noexpand\\ 
    \noexpand\Email{\p_author_email} 
  }
}

\cs_new:Npn \acm_prepare_title {

  \tl_set:Nn \l_author_content {}
  \int_set:Nn \l_author_counter {0}
  \int_decr:N \g_author_number

  \intexpr_while_do:nn { \l_author_counter < \g_author_number } {
    \tl_set:Nx \l_author_number {\int_to_arabic:n \l_author_counter}
    \acm_register_author\l_author_number
    \tl_put_right:Nx \l_author_content {\noexpand\and }    
    \int_incr:N \l_author_counter
  }

  \tl_set:Nx \l_author_number {\int_to_arabic:n \l_author_counter}
  \acm_register_author\l_author_number
  
  \int_incr:N \g_author_number
  \author{\l_author_content}
}


%%%%%%%%%%%%%%%%% LNCS %%%%%%%%%%%%%%%%%%%%%%%%%%

\tl_new:N  \l_current_emails 

\cs_new:Npn \lncs_register_author #1{
  \get_author{#1} 
  \tl_gput_right:Nx \l_author_content {%
    \p_author_name\noexpand\inst{\p_author_inst_number}
  }
}

\cs_new:Npn \lncs_show_authors {
  \tl_set:Nn \l_author_content {}
  \int_set:Nn \l_author_counter {0}
  \int_decr:N \g_author_number

  \intexpr_while_do:nn { \l_author_counter < \g_author_number } {
    \tl_set:Nx \l_author_number {\int_to_arabic:n \l_author_counter}
    \lncs_register_author\l_author_number
    \tl_put_right:Nx \l_author_content {\noexpand\and }    
    \int_incr:N \l_author_counter
  }

  \tl_set:Nx \l_author_number {\int_to_arabic:n \l_author_counter}
  \lncs_register_author\l_author_number
  \int_incr:N \g_author_number
  \author{\l_author_content}
}

\newif\ifnotfirstinstitute

\cs_new:Npn \lncs_register_institute #1 {
  % takes the number of an author so that the institute are listed in
  % the order of the authors.
  \get_author{#1}
%  \prop_if_in:NnT \g_institute_address_prop \p_author_inst_number
%  { % 
    \prop_if_in:NxTF \g_institute_list_prop \p_author_inst_number {
      \ifnotfirstinstitute
      \tl_put_right:Nx \g_institute_content { \noexpand\and }    
      \fi
      \notfirstinstitutetrue
      \get_institute_data\p_author_inst_number 
      \get_emails_from_institute\p_author_inst_number
      \prop_gdel:Nx \g_institute_list_prop \p_author_inst_number
      \tl_gput_right:Nx \g_institute_content { 
        \p_institute_name\noexpand\\
        \p_institute_address\noexpand\\
        \noexpand\email{\ensuremath{\lbrace}\p_institute_emails\ensuremath{\rbrace}@\p_institute_domain}
      }
    }
%  }
}

\cs_new:Npn \lncs_show_institute {
  \tl_set:Nn \g_institute_content {}
  \int_set:Nn \l_author_counter {0}
  \int_decr:N \g_author_number
  \notfirstinstitutefalse

  \intexpr_while_do:nn { \l_author_counter < \g_author_number } {
    \tl_set:Nx \l_author_number {\int_to_arabic:n \l_author_counter}
    \lncs_register_institute\l_author_number
    \int_incr:N \l_author_counter
  }

  \tl_set:Nx \l_author_number {\int_to_arabic:n \l_author_counter}
  \lncs_register_institute\l_author_number
  \int_incr:N \g_author_number
  \institute{\g_institute_content}
}

\cs_new:Npn \lncs_prepare_title {
  \lncs_show_authors
  \lncs_show_institute
}

%%%%%%%%%%%

\cs_new:Npn \plain_show_author #1/#2/#3/{
  \typeout{author: #1}
  \typeout{institution: #2}
  \typeout{email: #3}    
  \AtBeginDocument{
    \author{#1}
  }
}

\cs_new:Npn \debug_show_author #1/#2/#3/{
  \typeout{author: #1}
  \typeout{institution: #2}
  \typeout{email: #3}    
}




\ifplainversion
\global\let\aux_show_author\plain_show_author
\fi

\cs_new:Npn \show_author #1{
  \expandafter\aux_show_author #1
}


% Loading the main class

\ifacmversion
\LoadClass[\status,box]{acmconf}
\global\let\PrepareTitle\acm_prepare_title 
\fi

\iflncsversion
\LoadClass[\two@column]{llncs}
\global\let\PrepareTitle\lncs_prepare_title 
\fi

\ifplainversion
\LoadClass[\two@column]{article}
\fi

\ifeasychairversion
\LoadClass{easychair}
\fi



\AtBeginDocument{\PrepareTitle}
\AtBeginDocument{\ProcessConference}


\ExplSyntaxOff


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

\newcommand{\engendre}[1]{\ensuremath{\left\langle #1 \right\rangle}}
\newcommand{\class}[1]{\ensuremath{\tilde #1}}
\newcommand{\past}[1]{\ensuremath{\varphi_{\mathrm{p}}(#1)}}
\newcommand{\preserve}[1]{\ensuremath{{\Sigma^{\mathconstante{sig}}_{#1}}}}
\newcommand{\rhparti}[2]{\fonctionindicee{Part}{#2}{#1}}
\newcommand{\parti}[1]{\fonction{Part}{#1}}
\newcommand{\head}[1]{\fonction{Sign}{#1}}
\newcommand{\fact}[1]{\emph{``#1''}}

