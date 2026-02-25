% Classe LaTeX pour MIQ
% Alexandre Allonas
% alexandre.allonas@insa-strasbourg.fr
% 06 38 40 47 18
%
% Dernière MAJ: 16/02/2026


% Commandes spécifique .cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CLASS_INSA_MIQ}[16/02/2026 Classe LaTeX pour MIQ, V1.0]


% Classe modèle
\LoadClass[a4paper,12pt]{report} 


% Packages
\RequirePackage[french]{babel}
\RequirePackage[section]{placeins}
\RequirePackage[T1]{fontenc}
\RequirePackage{titlesec}
\RequirePackage[titles]{tocloft}
\RequirePackage{mathtools}
\RequirePackage{siunitx}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{wallpaper}
\RequirePackage{nomencl}
\RequirePackage{tikz}
\RequirePackage{pifont}
\RequirePackage{eso-pic}
\RequirePackage{transparent}
\RequirePackage{fancyhdr} 
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{tcolorbox}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{diagbox}
\RequirePackage{multirow}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[europeanresistors, straightvoltages, RPvoltages]{circuitikz}
\usetikzlibrary{babel}
\RequirePackage[left=2cm,right=2cm,top=2cm,bottom=3.5cm]{geometry}


% Commandes de définition
\newcommand{\cours}[1]{\renewcommand{\cours}{#1}}
\newcommand{\titre}[1]{\renewcommand{\titre}{#1}}
\newcommand{\Encadrants}[1]{\renewcommand{\Encadrants}{#1}}
\newcommand{\auteurs}[1]{\renewcommand{\auteurs}{#1}}
\newcommand{\auteursPP}[1]{\renewcommand{\auteursPP}{#1}}


% Image de fond
\newcommand{\imagefond}{
    \AddToShipoutPictureBG*{
        \begin{tikzpicture}[remember picture,overlay]
            \node[opacity=0.1] at (current page.center) {
                \includegraphics[scale=0.2]{Figures/Template/Sculpture_INSA.png}
            };
        \end{tikzpicture}
    }
}


% Entête et pied de page
\newcommand{\entete}{
    \makenomenclature
    \pagestyle{fancy}
    \fancyheadoffset{1cm}
    \setlength{\headheight}{1.5cm}
    \fancyfootoffset{1cm}
    \renewcommand{\footrulewidth}{0.4pt}
    \rhead{\nouppercase{\leftmark}}
    \rfoot{\thepage}
    \cfoot{ }
    \lfoot{\auteursPP}
    \fancypagestyle{plain}{%Pour initialiser entete et pied de page d'une page de chapitre
        \fancyhf{} % Efface la configuration précédentea
        \rfoot{\thepage} %Refait uniquement le pied de page (je veux pas mettre l'en-tête)
        \cfoot{ }
        \lfoot{\auteursPP} 
        \renewcommand{\headrulewidth}{0pt} % Pas de ligne d'en-tête
    }
}


% Page de Garde
\newcommand{\pagedegarde}{
\begin{titlepage}
    \imagefond
    \centering 
    \includegraphics[width=0.65\textwidth]{Figures/Template/Logo_INSA.png}\par\vspace{1.5cm} 
    {\scshape\LARGE \cours \par} 
    \vspace{1.5cm}
    \rule{\linewidth}{0.2 mm} \\[0.4 cm]
    {\huge\bfseries \titre \par} \
    \rule{\linewidth}{0.2 mm} \\[2.5 cm]
    \begin{minipage}[t]{0.45\textwidth}
        \raggedright
        \large
        \textbf{Auteurs:}\\
        \auteurs\\
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.45\textwidth}
        \raggedleft
        \large
        \textbf{Encadrants:}\\
        \Encadrants\\
    \end{minipage}\\    
    \vfill
    \includegraphics[width=6cm]{Figures/Template/logo_MIQ.png}\\[1cm]
    {\large \textbf{Mécatronique 5 - Semestre 9}}\\[0.3cm]
    {\large \today\par} %Affichage de la 
    \vspace{0.3cm}
    \LaTeX
\end{titlepage}
}


% Table des matères et figures
\newcommand{\tabledesmatieres}{ 
    \imagefond
    \tableofcontents
    \newpage
}
\newcommand{\tabledesfigures}{
    \imagefond
    \listoffigures
    \newpage
}


% mise en page chapitres
\titleformat{\chapter}[display]
{}{\hfill\rule{.7\textwidth}{3pt}}{0pt}
{\hspace*{.3\textwidth}\huge\bfseries}[\addvspace{-1pt}]

\titleformat{name=\chapter,numberless}[display]
{}{\hfill\rule{.7\textwidth}{3pt}}{0pt}
{\hspace*{.3\textwidth}\huge\bfseries}[\addvspace{-1pt}]
\setcounter{tocdepth}{2}


% Encadrés

\newtcolorbox{resumebox}{
    colback=blue!10,       % Couleur de fond bleu pâle
    colframe=blue!60!black,     % Couleur de la bordure (bleu moins foncé)
    title=Résumé,             % Titre de l'encadré
    fonttitle=\bfseries,      % Titre en gras
    coltitle=white,           % Couleur du texte du titre (blanc pour un bon contraste)
    arc=3mm,                  % Coins arrondis avec un rayon de 3mm
    boxrule=1pt,              % Épaisseur de la bordure
    left=1mm,                 % Marge à gauche
    right=1mm,                % Marge à droite
    top=1mm,                  % Marge en haut
    bottom=1mm                % Marge en bas
}

\newtcolorbox{attentionbox}{
    colback=red!10,           % Light red background
    colframe=red!60!black,    % Darker red for the border
    title=Attention,          % Title of the box
    fonttitle=\bfseries,      % Bold title font
    coltitle=white,           % White title text for contrast
    arc=3mm,                  % Rounded corners with 3mm radius
    boxrule=1pt,              % Border thickness
    left=1mm,                 % Left margin
    right=1mm,                % Right margin
    top=1mm,                  % Top margin
    bottom=1mm                % Bottom margin
}

\newtcolorbox{rappelbox}{
    colback=green!10,         % Dark green background
    colframe=green!30!black,  % Darker green for the border
    title=Rappel,             % Title of the box
    fonttitle=\bfseries,      % Bold title font
    coltitle=white,           % White title text for contrast
    arc=3mm,                  % Rounded corners with 3mm radius
    boxrule=1pt,              % Border thickness
    left=1mm,                 % Left margin
    right=1mm,                % Right margin
    top=1mm,                  % Top margin
    bottom=1mm                % Bottom margin
}
\definecolor{beige}{RGB}{245, 245, 220}
\newtcolorbox{simplebox}{
    colback=beige,      % Couleur de fond beige
    colframe=black,          % Couleur de la bordure
    boxrule=0.5pt,           % Épaisseur de la bordure
    arc=5pt,                 % Rayon des coins arrondis
    left=4pt,                % Marge à gauche dans l'encadré
    right=4pt,               % Marge à droite dans l'encadré
    top=4pt,                 % Marge en haut dans l'encadré
    bottom=4pt               % Marge en bas dans l'encadré
}
% Autres truc à dégager ultérieurement
\usepackage[french]{babel}
\addto\captionsfrench{\def\tablename{Tableau}}
\usepackage[utf8x]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{titlesec}
\usepackage[titles]{tocloft}
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{graphicx}
\usepackage{lmodern}
\usepackage{eso-pic,xcolor,graphicx}
\usepackage{blindtext}
\usepackage{wrapfig}
\usepackage{enumitem}
\usepackage{pifont}
\usepackage{changepage}
\usepackage{listings}
\usepackage{minted}
\usepackage{clipboard}
\usepackage{comment}
\usepackage{fancyhdr}
\usepackage{lipsum}
\usepackage[
  backend=biber,
  style=numeric,
  sorting=none,
  maxbibnames=99,
  maxcitenames=99
]{biblatex}
\newclipboard{myclipboard}
\usepackage[hidelinks]{hyperref}


