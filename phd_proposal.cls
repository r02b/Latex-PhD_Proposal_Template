% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PhD Proposal Latex Template
%   By Noga H. Rotman
%
%   Cls file.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phd-proposal}[2020/07/01 PhD Proposal]

\RequirePackage[utf8]{inputenc} % allow utf-8 input
\RequirePackage[T1]{fontenc}    % use 8-bit T1 fonts
\RequirePackage{amsfonts,amsmath}       % blackboard math symbols
\RequirePackage{graphicx}

\RequirePackage{comment}
\RequirePackage{ifdraft}
\RequirePackage{array}

\ifdraft{\renewcommand{\includegraphics}{\relax}}{\relax}

%% Article options
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{sans}{
  \PassOptionsToPackage{\CurrentOption}{custom}
}

%% Setting the margins
\def\narrowmarginsize#1{\def\@narrowmarginsize{#1}}
\narrowmarginsize{1.7cm}

\def\marginsize#1{\def\@marginsize{#1}}
\marginsize{1.6in}

\DeclareOption{widemargins}{
    \marginsize{1.2in}
}

\def\newpageoption#1{\def\@newpageoption{#1}}
\DeclareOption{newpage}{
  \newpageoption{yes}
}


%% Front page width
\def\coverwidth#1{\def\@coverwidth{#1}}
\coverwidth{120mm}

%% For the table with the details of the proposal
\def\colwidth#1{\def\@colwidth{#1}}
\colwidth{30mm}

\def\col2width#1{\def\@col2width{#1}}
\col2width{50mm}

%% Custom package options
\DeclareOption{neverindent}{
  \PassOptionsToPackage{\CurrentOption}{custom}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{phd-proposal}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{10pt}

%% Process given options
\ProcessOptions\relax

%% Load base
\LoadClass[a4paper]{article}

%% Load additional packages and commands.
\RequirePackage{phd_proposal}
\RequirePackage[paper=a4paper,margin=\@marginsize]{geometry}

%% Actual code
\def\supervisor#1{\def\@supervisor{#1}}
\def\institution#1{\def\@institution{#1}}
\def\school#1{\def\@school{#1}}
\def\logo#1{\def\@logo{#1}}
\def\logowidth#1{\def\@logowidth{#1}}
\logowidth{0.1}


\setlength{\parskip}{0.5em}

\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

\renewcommand*{\maketitle}{%
    \ifdefined\@logo
            \begin{figure*}[t]
            \centering
            \includegraphics[width=\@logowidth\textwidth]{figures/logo.\@logo}%
            \end{figure*}
            % \newline
    \fi
    \begin{table*}%[H]
        \centering

        \begin{tabular}{P{\@coverwidth}}
        {\Large \@institution } \\
        \vskip 0.001mm%
        { \Large \@school } \\
        \\ \\
        \normalsize{\bf Proposal for Thesis Research in Partial Fulfillment of the Requirements for the Degree of Doctor of Philosophy}
        \end{tabular}
    \end{table*}

     \begin{center}%
    {\normalsize
      \lineskip .5em%
      \begin{tabular}{p{\@colwidth} p{\@col2width}}%
        Title:&\@title \\
        Submitted by:&\@author \\
        Supervisor:&\@supervisor \\
        Date:&\@date
      \end{tabular}\par}%
    \end{center}%
    \vskip 1em%
    \par
    \vskip 1.5em
}

\providecommand\abstractname{Abstract}
\def\abstract{}
\def\endabstract{}
\renewenvironment{abstract}{%
  \centering
    \textbf
  {\large \bfseries \abstractname}
  \list{}{\leftmargin\@narrowmarginsize \rightmargin\leftmargin}
  \item\relax
}{%
  \endlist \par\bigskip
}

\ifdefined\@newpageoption %
    \g@addto@macro\endabstract{\newpage}
\fi

\makeatletter

% \g@addto@macro\bibliographystyle{
%     \ifdefined\@removefigures %
%         \lipsum[1]
%         \excludecomment{figure} %
%         \let\endfigure\relax %
%     \fi
% }

\makeatother

\endinput