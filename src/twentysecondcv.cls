%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Twenty Seconds Curriculum Vitae in LaTex
% ****************************************
% 
% License: MIT
%
% For further information please visit:
% https://github.com/yipengh/cv/blob/master/LICENSE
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%
% CLASS %
%%%%%%%%%
\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%
% PACKAGES %
%%%%%%%%%%%%
\RequirePackage[quiet]{fontspec}
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={},
    colorlinks=false,           % no lik border color
    allbordercolors=white       % white border color for all
}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax

\ifxetex
  \usepackage{letltxmacro}
  \setlength{\XeTeXLinkMargin}{1pt}
  \LetLtxMacro\SavedIncludeGraphics\includegraphics
  \def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
    \IncludeGraphicsAux{#1}%
  }%
  \newcommand*{\IncludeGraphicsAux}[2]{%
    \XeTeXLinkBox{%
      \SavedIncludeGraphics#1{#2}%
    }%
  }%
\fi

%%%%%%%%%%
% colors %
%%%%%%%%%%
\definecolor{white}{RGB}{255,255,255} 
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{cerulean}{HTML}{007BA7}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{maindarkgray}{HTML}{B3B3B3}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%%%%%%%%
%	MISC CONFIGURATIONS %
%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation

%%%%%%%%%
% FONTS %
%%%%%%%%%
\newfontfamily\headingfont[Path = fonts/]{segoeuib.ttf}

%%%%%%%%%%%%%%%%%%%%%%%
%	SIDEBAR DEFINITIONS %
%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvweixin}[1]{\renewcommand{\cvweixin}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{
	\renewcommand{\skills}{
    \begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.25);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.25);
				\node [above right] at (0,\i+0.25) {\x};
    }
    \end{tikzpicture}
  }
}

%%%%%%%%%%%%%%%%%%
% SIDEBAR LAYOUT %
%%%%%%%%%%%%%%%%%%

\newcommand{\makeprofile}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(0.5, 0.2)

  	\vspace{2mm}
  	\begin{center}
  	\tikz\node[circle,draw,
           text=white,
           path picture={
               \node at (path picture bounding box.center){
                   \includegraphics[scale=0.25]{img/avatar4.png}
               };
           }]{~~~~~~~~~~~~~~~~~~~~~~~~};
    \end{center}

    %------------------------------------------------

    \vspace{1mm}
    \begin{center}
    {\Huge\color{pblue}\cvname}

    %------------------------------------------------
    
    {\Large\color{black!80}\cvjobtitle}
    \end{center}

    %------------------------------------------------
    
    \vspace{1mm}
    \renewcommand{\arraystretch}{1.2}
    \begin{tabular}{p{1cm} @{\hskip 0.2cm}p{5cm}}
      \ifthenelse{\equal{\cvdate}{}}{}{
            生日：
            &
            \cvdate \\
      }
      \ifthenelse{\equal{\cvnumberphone}{}}{}{
            手机：
            &
            \cvnumberphone \\
      }
      \ifthenelse{\equal{\cvmail}{}}{}{
            电邮：
            &
            \href{mailto:\cvmail}{\cvmail} \\
      }
      \ifthenelse{\equal{\cvlinkedin}{}}{}{
            领英：
            &
            \href{\cvlinkedin}{\hspace{1mm}/huangyipeng} \\
      }
      \ifthenelse{\equal{\cvweixin}{}}{}{
            微信：
            & \cvweixin \\
      }
      \end{tabular}

    %------------------------------------------------
        \vspace{-0.2cm}
        \profilesection{职业技能}{3cm}
        
        \skills
        
        PHP \textbullet{} Java \textbullet{} C/C++ \textbullet{} PL/SQL \\
        Python \textbullet{} Node.js \textbullet{} Bash \\
        GraphQL \textbullet{} JSON \textbullet{} YAML \textbullet{} XML \\
        Maven \textbullet{} Gradle \textbullet{} Webpack \textbullet{} Gulp.js \\
        Linux \textbullet{} Git \textbullet{} Docker \textbullet{} DevOps \textbullet{} FinOps \\
        GitLab-ci \textbullet{} Jenkins \textbullet{} Jira \\
        移动应用开发 \textbullet{} 测试 \textbullet{} 运维 \textbullet{} 云计算 \\
        线性规划 \textbullet{} 启发式算法 \textbullet{} 元启发式算法 \\
        
    %------------------------------------------------
    \vspace{-0.2cm}
    \profilesection{语言能力}{3cm} 
    \begin{figure}
      \renewcommand{\arraystretch}{0.8}
      $\vcenter{\hbox{\includegraphics[scale=0.25]{img/english.png}}}$ $\vcenter{\hbox{英语流利（BULATS C1）}}$ \\
      $\vcenter{\hbox{\includegraphics[scale=0.25]{img/french.png}}}$ $\vcenter{\hbox{法语流利（DALF C1）}}$ \\
		\end{figure}
		
		%------------------------------------------------
    \vspace{-0.2cm}
    \profilesection{个人评价}{3cm}
    \vspace{-0.5cm}
    \begin{section}
    ~责任心强 \textbullet{} 专注 \textbullet{} 热爱钻研 \textbullet{} 自主 \\
    ~期待挑战 \textbullet{} 沟通积极 \textbullet{} 追求创新 
    \end{section}

  \end{textblock}
}

%%%%%%%%%%%%%%%%%%%%%
% Section Color box %
%%%%%%%%%%%%%%%%%%%%%
% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\def\@sectioncolor#1#2{%
  {%
		\color{pblue} #1#2%
    }%
}


\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
		\LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\Large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% List twenty environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{twenty}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\newcommand{\twentyitem}[5]{%
	\parbox[t]{0.16\textwidth}{#1} & \parbox[t]{0.83\textwidth}{%
		\textbf{#2} @ #3 \\ 
        \ifblank{#4}{}{#4 \\}
		#5\vspace{\parsep}%
	}\\
	\vspace{1mm}
}

% New environment for fluid long list filling parent hspace
\newenvironment{twentyfluid}{}{}

\newcommand{\twentyitemfluid}[5]{%
  \underline{#1 : \textbf{#2} @ #3} \\
  \ifblank{#4}{}{#4 \\}
    #5\vspace{\parsep}%
}

\usepackage{tcolorbox}
\newtcbox{\klabel}[1][mainblue]{
  on line,
  arc=4pt,
  colback=#1!10!white,
  colframe=#1!50!black,
  before upper={\rule[-3pt]{0pt}{10pt}},
  boxrule=1pt,
  boxsep=0pt,
  left=4pt,
  right=4pt,
  top=2pt,
  bottom=2pt
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Small twenty List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}
