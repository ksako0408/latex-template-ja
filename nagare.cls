%--------------------------------------------------------------------
%    LaTexクラスファイル
%        - 日本流体力学会「ながれ」テンプレート流用
%          https://www.nagare.or.jp/publication/nagare.html
%--------------------------------------------------------------------
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{classes/nagare}[2021/09/23]

%--------------------------------------------------------------------
%    原稿スタイルの設定
%        - 基本的には jarticle クラスファイルを使う
%        - 数式は左寄せ
%        - A4用紙で標題を独立したページにしない
%--------------------------------------------------------------------
\LoadClass[fleqn, notitlepage, a4j]{ujarticle}

\setlength\leftmargini{1zw}
\setlength\mathindent{1zw}
\setlength\parindent{1zw}
\setlength\headsep{5mm}
\setlength\headheight{5mm}

\setlength\topskip{0mm}
\setlength\footskip{8mm}
\setlength\topmargin{-14mm}

\setlength\textheight{254truemm}
\setlength\textwidth{170mm}
\setlength\oddsidemargin{-5.4mm}
\setlength\evensidemargin{-5.4mm}
\setlength\columnsep{5mm}
\setlength\parskip{0mm}

%--------------------------------------------------------------------
%    フォントサイズの定義
%        - 日本語フォントのサイズを pTeX のデフォルトよりやや大きく
%        - 18pt の文字サイズの定義
%        - 16pt の文字サイズの定義
%        - 14pt の文字サイズの定義
%        - \normalsize   の baselineskip を 15pt に変更
%        - \small        の baselineskip を 14pt に変更
%        - \footnotesize の baselineskip を 14pt に変更
%--------------------------------------------------------------------
\newcommand{\largexviii}{\@setfontsize\largexviii{18pt}{24}}
\newcommand{\largexvi}{\@setfontsize\largexvi{16pt}{24}}
\newcommand{\largexiv}{\@setfontsize\largexiv{14pt}{20}}
\newcommand{\largexii}{\@setfontsize\largexii{12pt}{20}}

\renewcommand{\normalsize}{\@setfontsize\normalsize{10pt}{15}}
\renewcommand{\small}{\@setfontsize\small{9pt}{14}}
\renewcommand{\footnotesize}{\@setfontsize\footnotesize{8pt}{14}}

%--------------------------------------------------------------------
%    原稿種別の設定
%        - クラスオプションで原稿種別を指定できるようにする.
%--------------------------------------------------------------------
\newif\if@ShowAbstract@     % アブストラクトやKeywordの表示の有無
\newif\if@ShowDate@         % 日付の表示の有無

\newcommand{\@papertype}{}
\newcommand{\@papertype@name}{}

\newcommand{\setpapertype}[2]{%
    \renewcommand{\@papertype}{#2}
    \renewcommand{\@papertype@name}{#1}
    \specialize@maketitle 
    \setpapertype@hook
}

\newcommand{\specialize@maketitle}{%
    \@ShowAbstract@false
    \@ShowDate@false
    \ifnum\@papertype=1 \@ShowAbstract@false\fi
    \ifnum\@papertype=1 \@ShowDate@true\fi
    \ifnum\@papertype=2 \@ShowAbstract@true\fi
    \ifnum\@papertype=3 \@ShowAbstract@true\fi
}

\newcommand{\setpapertype@hook}{}

\DeclareOption{技ノート}{\setpapertype{技ノート}{1}}
\DeclareOption{技メモ}{\setpapertype{技メモ}{2}}
\DeclareOption{研究報告}{\setpapertype{研究報告}{3}}
\ExecuteOptions{研究報告}
\ProcessOptions\relax

%--------------------------------------------------------------------
%    使用するパッケージ
%--------------------------------------------------------------------
% \usepackage{caption} % キャプションとサブキャプションのパッケージ
% \usepackage{subcaption}
% \usepackage{here} % 好きな位置にfigなどを置くためのパッケージ
\usepackage{bm} % ベクトルを大文字で書くためのパッケージ
\usepackage{enumerate} % 高機能番号付き箇条書きのパッケージ
\usepackage{paralist} % インラインリストのパッケージ
\usepackage[dvipdfmx]{graphicx} % 画像の挿入、テキストや図の操作のためのパッケージ
% \usepackage{amssymb, amsmath} % 高度な数式記述用パッケージ
% \usepackage{mathtools} % 高度な数式記述用パッケージ
% \usepackage[T1]{fontenc} % 欧文フォントを標準以外に
\usepackage{minted} % ソースコード表示の用パッケージ
\usepackage{siunitx} % SI単位記法に準拠した形式で単位を書くためのパッケージ
\usepackage{subfiles} % 大規模な文章を分割して記述して、統合するためのパッケージ
% \usepackage{indentfirst} % 最初の段落でインデントするためのパッケージ
\usepackage{framed} % 囲み付き文章を出すためのパッケージ
% \usepackage{type1cm} % 文字の大きさを自由に変えるためのパッケージ
\usepackage[backend=biber, style=ieee]{biblatex} % biblatexを使用するためのパッケージ
\addbibresource{references.bib}
% \usepackage[dvipdfmx]{hyperref} % ハイパーリンクをつけるためのパッケージ
% \usepackage{pxjahyper} % しおりを日本語化するためのパッケージ
% \usepackage{tabularx} % 表の幅を指定するためのパッケージ
% \usepackage{cite}
% \usepackage[subrefformat=parens]{subcaption}
% \captionsetup{compatibility=false}
\usepackage{times} % 英字フォントを Times に変更

\def\p{\noexpand\p\noexpand} %----- 便宜上導入するプロテクトコマンドの定義
\def\hz#1{\p\hspace{#1zw}}   %----- 便宜上導入する空白コマンドの定義

%--------------------------------------------------------------------
%    脚注の設定
%--------------------------------------------------------------------
\renewcommand{\thefootnote}{注\kern0pt\arabic{footnote}\kern0pt ）}
\renewcommand{\footnoterule}{%
    \kern-3\p@
    \hrule width 1.0\columnwidth
    \kern 2.6\p@
}
\setlength\footnotesep{10pt}

%--------------------------------------------------------------------
%    付録の設定
%--------------------------------------------------------------------
\renewcommand{\appendixname}{付録}
\renewcommand{\appendix}{%
    \par
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \renewcommand{\thesection}{\appendixname\@arabic\c@section}
    \renewcommand{\section}{%
        \@startsection{section}{1}{\z@}
        {1zh \@plus.5zh \@minus.2zh}{1zh \@plus.3zh}
        {\reset@font\small\bfseries}
    }
    \renewcommand{\subsection}{%
        \@startsection{subsection}{2}{\z@}
        {1zh \@plus.5zh \@minus.2zh}{1sp}
        {\reset@font\small\bfseries}
    }
    \renewcommand{\subsubsection}{%
        \@startsection{subsubsection}{3}{\z@}
        {1zh \@plus.5zh \@minus.2zh}{1sp}
        {\reset@font\small\bfseries}
    }
}

%--------------------------------------------------------------------
%    図表のキャプションの設定
%        - キャプションが長い場合はインデントして折り返す
%--------------------------------------------------------------------
\renewcommand{\fnum@figure}{\figurename\thefigure}
\renewcommand{\fnum@table}{\tablename\thetable}

\renewcommand{\@makecaption}[2]{%
    \small\sbox\@tempboxa{\textrm{#1}\hz{1.0}#2}
    \ifdim \wd\@tempboxa >\hsize
        \@tempdima=\hsize
        \sbox\@tempboxa{\textrm{#1}}%
            \advance\@tempdima by -\wd\@tempboxa
        \advance\@tempdima by -1.0zw
        \hbox{\box\@tempboxa\hz{1.0}%
            \parbox[t]{\@tempdima}{#2\par\mbox{}}}\relax\par
    \else
      \global \@minipagefalse
      \hbox to\hsize{\hfil\box\@tempboxa\hfil}
    \fi
    \vskip\belowcaptionskip
}

%--------------------------------------------------------------------
%    節や小節の形態の設定
%--------------------------------------------------------------------
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
    {1zh \@plus.5zh \@minus.2zh}{1zh \@plus.3zh}
    {\reset@font\normalsize\bfseries}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
    {1zh \@plus.5zh \@minus.2zh}{1sp}
    {\reset@font\normalsize\bfseries}}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
    {1zh \@plus.5zh \@minus.2zh}{1sp}
    {\reset@font\normalsize\bfseries}}

%--------------------------------------------------------------------
%    maketitleコマンドの再設定
%        - 正直謎
%--------------------------------------------------------------------
\renewcommand{\maketitle}{%
    {%
        \renewcommand{\thefootnote}{}
        \maketitle@hook
        \@maketitle
    }

    \setcounter{footnote}{0}
    \global\let\maketitle\relax
    \global\let\jtitle\relax
    \global\let\jaffil\relax
    \global\let\jauthor\relax 
    \global\let\year\relax
    \global\let\date\relax
    \global\let\doc\relax
    \global\let\abst\relax
    \global\let\keywords\relax
    \global\let\headertitle\relax
    \global\let\headerauthor\relax

    \global\let\@jtitle\@empty
    \global\let\@jaffil\@empty
    \global\let\@jauthor\@empty
    \global\let\@abst\@empty
    \global\let\@keywords\@empty
    \global\let\@date\@empty
    \global\let\@doc\@empty
}
\newcommand{\maketitle@hook}{}

%--------------------------------------------------------------------
%    タイトルページに必要なコマンドおよび変数の定義
%        - 詳細は不明
%--------------------------------------------------------------------
\def\jtitle#1{\def\@jtitle{#1}}\jtitle{}
\def\jaffil#1{\def\@jaffil{#1}}\jaffil{}
\def\abst#1{\def\@abst{#1}}\abst{}
\def\keywords#1{\def\@keywords{#1}}\keywords{}
\def\headertitle#1{\def\@headertitle{#1}}\headertitle{}
\def\headerauthor#1{\def\@headerauthor{#1}}\headerauthor{}

\let\year@orig=\year
\def\year#1{\def\@year{#1}}\year{\number\year@orig}
\def\date#1{\def\@date{#1}}\date{\@year‾Month‾DD}

\def\doc#1{\def\@doc{#1}}\doc{Doc.\@year}
\def\@jauthorpar{}
\def\@jauthor{}

%--------------------------------------------------------------------
%    日本語著者行の組み立て
%        - なにがしたいかは分かるが、なぜそうなるかは分からない
%--------------------------------------------------------------------
\def\jauthor#1{%
    \edef\@jauthor{%
        \@jauthor
        \@jauthorpar{%
            {\p\normalsize \@jaffil}\p\qquad\p\largexii #1
        }
    }
    \def\@jauthorpar{\p\largexii\p\\}
}

%--------------------------------------------------------------------
%    \@maketitle本体
%--------------------------------------------------------------------
\def\@maketitle{
    \global\let\p\relax
    \if@ShowDate@
        \noindent{\textbf{〔{\@papertype@name：\@doc}〕}}
    \else
        \noindent{\textbf{〔{\@papertype@name：\@doc}〕\hfill\@date}}
    \fi
    \par\vspace{5mm}
    \@ifundefined{titlepagetop}{\relax}{\titlepagetop}
    \par{%
        \leftmargini=10mm
        \begin{quotation}

            \begin{center}\largexviii
                \@jtitle
            \end{center}
            \par\vspace{5mm}\par

            \if@ShowDate@
                \begin{flushright}\largexii
                    \@date
                \end{flushright}
            \fi

            \begin{flushright}
                \@jauthor
            \end{flushright}
            \par\vspace{5mm}\par

            \if@ShowAbstract@
                \par\vspace{-0.5zh}\par
                \setlength\parindent{1zw}
                \par\noindent\@abst\par
                \vspace{0.5zh}\par
                \noindent{(\kern0pt{\bf KEY WORDS}\kern0pt)}: \@keywords
            \fi
        \end{quotation}
    }
    \par\vskip 1zh
}


%--------------------------------------------------------------------
%----- 文献引用および引用文献リストの形態の変更 ---------------------
% \renewcommand{\citeleft}{\relax}
% \renewcommand{\citeright}{)}
% \def\@cite#1{\textsuperscript{\citeleft{#1}\citeright}}
% \def\@biblabel#1{\citeleft{#1}\citeright}
% \newcommand{\onlinecite}[1]{\citeleft{\citen{#1}}\citeright}
% \renewcommand{\refname}{引 用 文 献}
% \newcommand{\@refname}{\hfill\refname\hfill\hspace{0sp}}
% \renewenvironment{thebibliography}[1]%
% {\section*{\normalsize\@refname\@mkboth{\refname}{\refname}}%
%   \normalsize%
%    \list{\@biblabel{\@arabic\c@enumiv}}%
%         {\settowidth\labelwidth{\@biblabel{#1}}%
% 	\setlength{\baselineskip}{15pt}	
% 	\setlength{\parskip}{-10pt}
% 	\setlength{\parsep}{0pt}%	
% 	\setlength{\itemsep}{0pt}%
%          \leftmargin\labelwidth
%          \advance\leftmargin\labelsep
%          \@openbib@code
%          \usecounter{enumiv}%
%          \let\p@enumiv\@empty
%          \renewcommand\theenumiv{\@arabic\c@enumiv}}%
%    \sloppy
%    \clubpenalty4000
%    \@clubpenalty\clubpenalty
%    \widowpenalty4000%
%    \sfcode`\.\@m}\par


% \def\vol#1{\def\@vol{#1}}\vol{xx}
% \def\received#1{\def\@received{#1}}\received{DD‾Month‾\@year}
% \def\revised#1{\def\@revised{#1}}\revised{??‾??‾\@year}
% \def\accepted#1{\def\@accepted{#1}}\accepted{??‾??‾\@year}
% \def\pages#1#2{\def\@pages{#1--#2}
%     \ifodd#1\setcounter{page}{#1}
%     \else \@latex@warning{wrong page numbers (\@pages)}\fi
%     }\pages{1}{xx}

%--------------------------------------------------------------------
%    ヘッダスタイルの変更
%--------------------------------------------------------------------

% \thispagestyle{nagareheadings}
% \pagestyle{centerheadings}

% \renewcommand{\leftmark}{\@headertitle}
% \renewcommand{\rightmark}{\@headerauthor}
%
% \def\ps@centerheadings{\let\ps@jpl@in\ps@plain%
%   \let\@oddfoot\@empty\let\@evenfoot\@empty
%   \def\@evenhead{\small{\it\thepage}\hfil\leftmark\hfil}%
%   \def\@oddhead{\small\hfil\rightmark\hfil{\it\thepage}}%
% }
% %
% \def\ps@nagareheadings{\let\ps@jpl@in\ps@plain%
%   \let\@oddfoot\@empty\let\@evenfoot\@empty
%   \def\@evenhead{\small{\it\thepage}\hfil\leftmark\hfil}%
%   \def\@oddhead{\small ながれ{\bf\@vol}（\@year）\@pages\hfil{\it\thepage}}%
%   \def\@oddfoot{\hfil{{\small \copyright} {\@year}日本流体力学会}}%
% }  
