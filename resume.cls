\ProvidesClass{resume}
\NeedsTeXFormat{LaTeX2e}

\LoadClass{article}
\pagestyle{empty}
\usepackage[vmargin=0.5in, hmargin=0.5in]{geometry}

\usepackage{fontawesome5}

\usepackage{fontspec}
\setmainfont{Lora}[Scale = 0.8]
\setsansfont{Raleway}[BoldFont = *-Medium]
\newfontfamily{\ralewaythin}{Raleway Light}

\usepackage{xcolor}
\usepackage[document]{ragged2e}
\usepackage[none]{hyphenat}
\usepackage{tikz}
\usepackage{titlesec}
\usepackage{parskip}
\usepackage{navigator}
\usepackage{hyperref}
\hypersetup{hidelinks}

\titleformat{\section}
            {\sffamily\large\scshape\bfseries}
            {}
            {0em}
            {\scalebox{1.3}[1]}
\titlespacing{\section}
            {0em}
            {5ex}
            {1ex}
\titleformat{\subsection}{}{}{0em}{\scshape\bfseries\textsf}
\titlespacing{\subsection}{0em}{2ex}{0em}


\usepackage[en-US]{datetime2}
\DTMnewdatestyle{monthtoyear}{
    \renewcommand{\DTMdisplaydate}[4]{\number##1}
    \renewcommand{\DTMDisplaydate}{\DTMdisplaydate}
    }


\newcommand{\resumename}{Ryan Nelson}
\newcommand{\contactemail}{nelsonr@arizona.edu}
\newcommand{\contactphone}{\oldstylenums{520$\cdot$405$\cdot$6821}}
\newcommand{\contactaddress}{\oldstylenums{3630 E 3rd St Tucson, AZ 85716}}
\newcommand{\github}{nelson-ryan}

\newcommand{\namecontactheader}{
    \begin{minipage}{.5\textwidth}
        \huge\scshape{\scalebox{1.8}[1]{\textsf{\resumename}}}
    \end{minipage}
    \hfill
    \begin{minipage}{.40\textwidth}
        \footnotesize
        \urllink{mailto:\contactemail}{
            \scalebox{.8}\faEnvelope \space \textsf\contactemail
        }
        \hfill
        \urllink{https://www.github.com/\github}{\faGithub \space \textsf{\github}}
        \\
        \scalebox{.8}\faPhone \space \textsf\contactphone
        \hfill
        \urllink{https://www.linkedin.com/in/ryan-nelson-b3245750}{
            \faLinkedin \space \textsf{ryan-nelson-b3245750}
        }
    \end{minipage}
    \vspace{1ex} \hrule \vspace{1ex}
}


\newenvironment{experienceitem}[8]{
    \vspace{1ex}
    \begin{minipage}[t]{0.195\textwidth}
        \vspace{-\topskip}
        {\footnotesize\textsf{
            \DTMdisplaydate{#2}{#3}{#4}{}--\DTMdisplaydate{#5}{#6}{#7}{}}
        }
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.8\textwidth}
        \vspace{-\topskip}
        {\scshape\textsf{#1}}\\
        \setlength{\parskip}{0.7em}
        \setlength{\baselineskip}{3ex}
        {#8}
    \end{minipage}
    }

\definecolor{grey}{HTML}{505050}


