\NeedsTeXFormat{LaTeX2e}[2022-06-01]%
\ProvidesClass{buaa-midterm}[2026/11/05 BUAA CS midterm report template]%
\LoadClass[UTF8,scheme=plain,fontset=none,zihao=-4]{ctexart}%
\RequirePackage{iftex}%
\RequireXeTeX%
\RequirePackage{geometry}%
\RequirePackage{eso-pic}%
\RequirePackage{keyval}%
\RequirePackage[hidelinks,bookmarksnumbered]{hyperref}%

\geometry{%
  paperwidth=595.32bp,%
  paperheight=841.92bp,%
  left=89.90bp,%
  right=89.78bp,%
  top=105.20bp,%
  bottom=110.00bp,%
  headheight=0bp,%
  headsep=0bp,%
  footskip=0bp%
}%

\IfFontExistsTF{Times New Roman}{%
  \setmainfont{Times New Roman}%
}{%
  \setmainfont{TeX Gyre Termes}%
}%
\IfFontExistsTF{SimSun}{%
  \setCJKmainfont[BoldFont=SimSun,BoldFeatures={FakeBold=2.857143}]{SimSun}%
  \newfontfamily\buaa@symbolfont{SimSun}%
}{%
  \setCJKmainfont[BoldFont=FandolSong-Bold]{FandolSong-Regular}%
  \newfontfamily\buaa@symbolfont{FandolSong-Regular}%
}%
\IfFontExistsTF{SimHei}{%
  \setCJKfamilyfont{buaahei}[BoldFont=SimHei,BoldFeatures={FakeBold=2.857143}]{SimHei}%
  \newfontfamily\buaa@heifont[BoldFont=SimHei,BoldFeatures={FakeBold=2.857143}]{SimHei}%
}{%
  \setCJKfamilyfont{buaahei}[BoldFont=FandolHei-Bold]{FandolHei-Regular}%
  \newfontfamily\buaa@heifont[BoldFont=FandolHei-Bold]{FandolHei-Regular}%
}%
\IfFontExistsTF{KaiTi}{%
  \setCJKfamilyfont{buaakai}[BoldFont=KaiTi,BoldFeatures={FakeBold=2.857143}]{KaiTi}%
}{%
  \setCJKfamilyfont{buaakai}[AutoFakeBold=2.857143]{FandolKai-Regular}%
}%

\xeCJKEditPunctStyle{CCT}{fixed-punct-ratio=0.85}%
\xeCJKsetup{%
  PunctStyle=CCT,%
  CJKecglue={\hskip 3bp plus 0.5bp minus 0.5bp}%
}%
\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{23.04bp}}%
\normalsize%
\setlength\parindent{24bp}%
\setlength\parskip{0bp}%
\setlength\topskip{12.06bp}%
\setlength\emergencystretch{12bp}%
\setcounter{secnumdepth}{2}%
\setcounter{tocdepth}{2}%
\pagestyle{empty}%
\raggedbottom%

\ctexset{%
  section={%
    name={},%
    number=\arabic{section},%
    format={\buaa@heifont\CJKfamily{buaahei}\mdseries\fontsize{15bp}{23.04bp}\selectfont\raggedright},%
    aftername=\hspace{13.74bp},%
    beforeskip=26.64bp,%
    afterskip=18.24bp,%
    afterindent=true,%
    fixskip=false%
  },%
  subsection={%
    name={},%
    number=\arabic{section}.\arabic{subsection},%
    format={\rmfamily\CJKfamily{buaahei}\bfseries\fontsize{14.04bp}{23.04bp}\selectfont\raggedright},%
    aftername=\hspace{3.45bp},%
    beforeskip=9.60bp,%
    afterskip=21bp,%
    afterindent=true,%
    fixskip=false%
  },%
  subsubsection={%
    format={\rmfamily\CJKfamily{buaahei}\bfseries\fontsize{12bp}{23.04bp}\selectfont\raggedright},%
    beforeskip=14bp,%
    afterskip=10bp,%
    afterindent=true%
  }%
}%
\AddToHook{cmd/section/before}{\@nobreakfalse}%
\AddToHook{cmd/subsection/before}{\@nobreakfalse}%

\def\buaa@title{}%
\def\buaa@major{}%
\def\buaa@direction{}%
\def\buaa@author{}%
\def\buaa@studentid{}%
\def\buaa@supervisor{}%
\def\buaa@year{}%
\def\buaa@month{}%
\def\buaa@day{}%
\def\buaa@school{北京航空航天大学计算机学院}%
\def\buaa@reportname{硕士学位论文中期检查报告}%
\newif\ifbuaa@templatemark%
\buaa@templatemarktrue%
\newif\ifbuaa@cover%
\buaa@coverfalse%

\define@key{buaa}{title}{\def\buaa@title{#1}}%
\define@key{buaa}{major}{\def\buaa@major{#1}}%
\define@key{buaa}{direction}{\def\buaa@direction{#1}}%
\define@key{buaa}{author}{\def\buaa@author{#1}}%
\define@key{buaa}{student-id}{\def\buaa@studentid{#1}}%
\define@key{buaa}{supervisor}{\def\buaa@supervisor{#1}}%
\define@key{buaa}{year}{\def\buaa@year{#1}}%
\define@key{buaa}{month}{\def\buaa@month{#1}}%
\define@key{buaa}{day}{\def\buaa@day{#1}}%
\define@key{buaa}{school}{\def\buaa@school{#1}}%
\define@key{buaa}{report-name}{\def\buaa@reportname{#1}}%
\define@key{buaa}{template-mark}[true]{\csname buaa@templatemark#1\endcsname}%
\newcommand\ReportSetup[1]{\setkeys{buaa}{#1}}%

\newcommand\buaa@put[3]{%
  \put(\LenToUnit{#1bp},\LenToUnit{-#2bp}){\makebox[0pt][l]{#3}}%
}%
\newcommand\buaa@center[3]{%
  \buaa@put{0}{#1}{\makebox[595.32bp][c]{\hspace*{#2bp}#3}}%
}%
\newcommand\buaa@rule[2]{%
  \buaa@put{88.46}{#1}{\rule{418.51bp}{#2bp}}%
}%
\newcommand\buaa@coverfield[3]{%
  \buaa@put{119.90}{#1}{%
    \CJKfamily{buaakai}\bfseries\fontsize{15bp}{23.04bp}\selectfont%
    \xeCJKsetup{PunctStyle=plain}%
    \makebox[60.12bp][s]{#2}：\normalfont\CJKfamily{buaakai}%
    \fontsize{15bp}{23.04bp}\selectfont%
    \parbox[b]{305bp}{\raggedright #3}%
  }%
}%

\AddToShipoutPictureFG{%
  \ifbuaa@cover\else%
    \AtPageUpperLeft{%
      \buaa@center{95.42}{0}{\CJKfamily{buaakai}\fontsize{9bp}{9bp}\selectfont\buaa@reportname}%
      \buaa@rule{101.06}{0.72}%
      \buaa@rule{745.56}{0.48}%
      \buaa@put{94.464}{759.36}{\CJKfamily{buaakai}\fontsize{9bp}{9bp}\selectfont\buaa@school}%
      \buaa@put{472.90}{759.36}{%
        \fontsize{9bp}{9bp}\selectfont%
        \makebox[9bp][c]{{\buaa@symbolfont ·}}\kern4.44bp%
        {\rmfamily\thepage}\kern4.50bp%
        \makebox[9bp][c]{{\buaa@symbolfont ·}}%
      }%
    }%
  \fi%
}%

\newcommand\MakeReportCover{%
  \clearpage%
  \buaa@covertrue%
  \thispagestyle{empty}%
  \hypersetup{pageanchor=false}%
  \hypersetup{pdftitle={\buaa@reportname},pdfauthor={\buaa@author}}%
  \AddToShipoutPictureFG*{%
    \AtPageUpperLeft{%
      \buaa@center{171.50}{-1.52}{\CJKfamily{buaakai}\bfseries\fontsize{18bp}{18bp}\selectfont\buaa@school}%
      \buaa@center{235.46}{0}{%
        \buaa@heifont\CJKfamily{buaahei}\bfseries\fontsize{26.04bp}{26.04bp}\selectfont%
        \xeCJKsetup{CJKecglue={\hskip0bp}}%
        \buaa@reportname%
        \ifbuaa@templatemark%
          {\fontsize{14.04bp}{14.04bp}\selectfont(模板)}%
        \fi%
      }%
      \buaa@coverfield{381.89}{论文题目}{\buaa@title}%
      \buaa@coverfield{409.87}{专\hfill 业}{\buaa@major}%
      \buaa@coverfield{437.95}{研究方向}{\buaa@direction}%
      \buaa@coverfield{465.91}{研\hfill 究\hfill 生}{\buaa@author}%
      \buaa@coverfield{493.87}{学\hfill 号}{\buaa@studentid}%
      \buaa@coverfield{521.95}{指导教师}{\buaa@supervisor}%
      \buaa@center{639.58}{31.92}{\buaa@heifont\CJKfamily{buaahei}\bfseries\fontsize{15.96bp}{15.96bp}\selectfont\buaa@school}%
      \buaa@center{671.50}{30.12}{%
        \buaa@heifont\CJKfamily{buaahei}\mdseries\fontsize{15bp}{15bp}\selectfont%
        \buaa@year 年\hspace{22.68bp}\buaa@month 月\hspace{15.02bp}\buaa@day 日%
      }%
    }%
  }%
  \null\clearpage%
  \buaa@coverfalse%
  \hypersetup{pageanchor=true}%
}%

\newcommand\buaa@tocline[5]{%
  \par\begingroup%
    \fontsize{10.56bp}{20.01bp}\selectfont%
    \parindent=0bp%
    #3%
    \def\numberline##1{\hb@xt@#2{##1\hfil}}%
    \noindent\hb@xt@\textwidth{%
      \hskip#1\relax%
      #4\nobreak\leaders\hbox{.}\hfill\nobreak%
      \hskip2.64bp\hbox{#5}\kern0.476bp%
    }\par%
  \endgroup%
}%
\renewcommand\l@section[2]{\buaa@tocline{0bp}{24bp}{\bfseries}{#1}{#2}}%
\renewcommand\l@subsection[2]{\buaa@tocline{12bp}{17.4bp}{\mdseries}{#1}{#2}}%

\renewcommand\tableofcontents{%
  \clearpage%
  \pagenumbering{roman}%
  \pdfbookmark[1]{目录}{report-contents}%
  \AddToShipoutPictureFG*{%
    \AtPageUpperLeft{%
      \buaa@center{159.26}{31.92}{%
        \buaa@heifont\CJKfamily{buaahei}\mdseries\fontsize{15.96bp}{15.96bp}\selectfont%
        目\hspace{48.02bp}录%
      }%
    }%
  }%
  \vspace*{71.88bp}%
  \begingroup%
    \fontsize{10.56bp}{20.04bp}\selectfont%
    \@starttoc{toc}%
  \endgroup%
  \clearpage%
}%

\newsavebox\buaa@titlebox%
\newsavebox\buaa@titlestrutbox%
\newlength\buaa@titleextra%
\newcommand\MakeReportTitle{%
  \clearpage%
  \pagenumbering{arabic}%
  \sbox\buaa@titlebox{%
    \bfseries\fontsize{21.96bp}{28bp}\selectfont%
    \parbox[t]{415.64bp}{\centering\ifx\buaa@title\@empty 论文题目\else\buaa@title\fi}%
  }%
  \sbox\buaa@titlestrutbox{\bfseries\fontsize{21.96bp}{28bp}\selectfont\strut}%
  \setlength\buaa@titleextra{\dimexpr\dp\buaa@titlebox-\dp\buaa@titlestrutbox\relax}%
  \ifdim\buaa@titleextra<0bp\setlength\buaa@titleextra{0bp}\fi%
  \AddToShipoutPictureFG*{%
    \AtPageUpperLeft{%
      \buaa@center{159.26}{43.92}{\usebox\buaa@titlebox}%
    }%
  }%
  \vspace*{\dimexpr60bp+\buaa@titleextra\relax}%
}%

\endinput%
