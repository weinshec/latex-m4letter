\ProvidesClass{m4letter}[2018/05/29 v1.0.0 m4ck style letter class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{scrlttr2}
}
\ProcessOptions\relax
\LoadClass{scrlttr2}

\KOMAoptions{addrfield=on}
\KOMAoptions{backaddress=off}
\KOMAoptions{enlargefirstpage=on}
\KOMAoptions{firstfoot=on}
\KOMAoptions{foldmarks=on}
\KOMAoptions{fromalign=right}
\KOMAoptions{fromemail=off}
\KOMAoptions{fromfax=off}
\KOMAoptions{fromphone=off}
\KOMAoptions{fromrule=afteraddress}
\KOMAoptions{fromurl=off}
\KOMAoptions{numericaldate=off}
\KOMAoptions{pagenumber=off}
\KOMAoptions{parskip=half}
\KOMAoptions{refline=narrow}
\KOMAoptions{subject=beforeopening}

%_______________________________________________________________________________
%                                                                       PACKAGES
\RequirePackage{xcolor}
\RequirePackage{xifthen}
\RequirePackage{fontspec}
\RequirePackage[default,opentype,light]{sourcesanspro}
\RequirePackage{scrlayer-scrpage}

%_______________________________________________________________________________
%                                                                         COLORS
% B/W colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{414141}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}

% Text colors
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}

% Highlights
\colorlet{highlights}{black}

%_______________________________________________________________________________
%                                                                          FONTS
\newcommand*{\headerfontlight}{\sourcesansprolight}
\newcommand*{\headerfont}{\sourcesanspro}
\newcommand*{\subjectfont}{\sourcesanspro}

\newfontfamily{\fa}[%
  Path      = fonts/,
  Extension = .otf,
]{FontAwesome}

\newcommand{\faPhone}{{\fa\char"F095}}
\newcommand{\faMobile}{{\fa\char"F10B}}
\newcommand{\faFax}{{\fa\char"F1AC}}
\newcommand{\faMail}{{\fa\char"F0E0}}
\newcommand{\faGlobe}{{\fa\char"F0AC}}
\newcommand{\faPaperclip}{{\fa\char"F0C6}}
\newcommand{\faShare}{{\fa\char"F064}}

%_______________________________________________________________________________
%                                                                         STYLES
\newcommand*{\headerstyle}[1]{{\fontsize{11pt}{1em}\headerfontlight #1}}
\newcommand*{\headericonstyle}[1]{{\fontsize{10pt}{1em}\color{gray} #1\ }}
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{16pt}{1em}\headerfontlight\color{graytext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{16pt}{1em}\headerfontlight\bfseries\color{text} #1}}

\setkomafont{subject}{\fontsize{14pt}{1em}\subjectfont}
\newcommand*{\subjectstyle}[1]{{\color{highlights}#1}}

\newcommand*{\iconstyle}[1]{{\fontsize{12pt}{1em}\color{gray} #1}}
\newcommand*{\dateplaceseparatorstyle}[1]{{\Large\color{highlights} #1}}

\newcommand*{\footerstyle}[1]{{\footnotesize\color{graytext}#1}}

\addtokomafont{fromrule}{\color{highlights}}
\addtokomafont{refname}{\color{highlights}}
\addtokomafont{pagefoot}{\normalfont}
%_______________________________________________________________________________
%                                                                         LAYOUT
\@setplength{fromrulethickness}{0.5pt}
\@setplength{sigbeforevskip}{3\baselineskip}

\pagestyle{scrheadings}
\clearscrheadfoot

%_______________________________________________________________________________
%                                                                CUSTOM COMMANDS
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\street}[1]{\def\@street{#1}}
\newcommand*{\city}[1]{\def\@city{#1}}
\newcommand*{\zipcode}[1]{\def\@zipcode{#1}}
\newcommand*{\phone}[1]{\KOMAoptions{fromphone=on}\def\@phone{#1}}
\newcommand*{\mobile}[1]{\KOMAoptions{fromphone=on}\def\@mobile{#1}}
\newcommand*{\fax}[1]{\KOMAoptions{fromfax=on}\def\@fax{#1}}
\newcommand*{\mail}[1]{\KOMAoptions{fromemail=on}\def\@mail{#1}}
\newcommand*{\homepage}[1]{\KOMAoptions{fromurl=on}\def\@homepage{#1}}
\newcommand*{\signature}[1]{\def\@signature{#1}}
\newcommand*{\place}[1]{\def\@place{#1}}
\newcommand*{\subject}[1]{\def\@subject{#1}}
\newcommand*{\bank}[3]{\def\@bank{#1}\def\@iban{#2}\def\@bic{#3}}

\setkomavar{fromname}{%
  \headerfirstnamestyle{\@firstname} \headerlastnamestyle{\@lastname}
}
\setkomavar{fromaddress}{%
  \headerstyle{\@street}\\ \headerstyle{\@zipcode} \headerstyle{\@city}
}
\setkomavar{fromphone}[]{%
  \ifthenelse{\isundefined{\@phone}}
    {}
    {\headericonstyle{\faPhone} \headerstyle{\@phone}}
  \ifthenelse{\isundefined{\@phone}\or\isundefined{\@mobile}}
    {}
    {\\}
  \ifthenelse{\isundefined{\@mobile}}
    {}
    {\headericonstyle{\faMobile} \headerstyle{\@mobile}}
}
\setkomavar{fromfax}[]{\headericonstyle{\faFax}\headerstyle{\@fax}}
\setkomavar{fromemail}[]{\headericonstyle{\faMail} \headerstyle{\@mail}}
\setkomavar{fromurl}[]{\headericonstyle{\faGlobe}\headerstyle{\@homepage}}

\setkomavar{signature}{%
  \ifthenelse{\isundefined{\@signature}}
    {\@firstname\ \@lastname}
    {\@signature}
}

\setkomavar{place}[]{%
  \ifthenelse{\isundefined{\@place}}
    {}
    {\@place}
}

\setkomavar{placeseparator}[]{%
  \ifthenelse{\isundefined{\@place}}
    {}
    {\dateplaceseparatorstyle{|}}
}

\newcommand*{\reflineitem}[3]{%
  \newkomavar*[#2]{#1}
  \setkomavar{#1}{#3}
}

\setkomavar{subject}{\subjectstyle{\@subject}}

\setkomavar{enclseparator}{\ }
\setkomavar*{enclseparator}{\iconstyle{\faPaperclip}}
\setkomavar{ccseparator}{\ }
\setkomavar*{ccseparator}{\iconstyle{\faShare}}

\setkomavar{firstfoot}{%
  \footerstyle{%
    \begin{minipage}[t]{0.33\textwidth}
      \begin{flushleft}
        \@firstname\ \@lastname\\
        \@street \\
        \@zipcode\ \@city
      \end{flushleft}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.33\textwidth}
      \begin{center}
        \ifthenelse{\isundefined{\@bank}}
          {}
          {\@bank\\}
        \ifthenelse{\isundefined{\@iban}}
          {}
          {\@iban\\}
        \ifthenelse{\isundefined{\@bic}}
          {}
          {BIC: \@bic\\}
      \end{center}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.33\textwidth}
      \begin{flushright}
        \@date\\[1em]
        \thepage\ / \letterlastpage
      \end{flushright}
    \end{minipage}
  }
}

\setlength{\textheight}{0.815\paperheight}
\KOMAoptions{footwidth=\useplength{firstfootwidth}}
\KOMAoptions{footheight=3em}
\rofoot*{%
  \footerstyle{%
    \begin{flushright}
      \thepage\ / \letterlastpage
    \end{flushright}
  }
}
