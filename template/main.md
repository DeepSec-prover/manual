---
pagetitle: "notes"
header-includes:
   - \usepackage[english]{babel}
   - \usepackage[T1]{fontenc}
   - \usepackage{a4wide}
   - \usepackage[tt=false]{libertine}
   - \usepackage{textcomp}
   - \usepackage{graphicx}
   - \setkeys{Gin}{width=\textwidth}
   - \usepackage{amsmath}
   - \usepackage{amssymb}
   - \usepackage{amsthm}
   - \usepackage[libertine]{newtxmath}
   - \usepackage{hyperref}
   - \usepackage{authblk}
   - \usepackage{cleveref}
   - \usepackage{paralist}
   - \usepackage{xspace}
   - \usepackage{color}
   - \usepackage{thm-restate}
   - \usepackage{thmtools}
   - \usepackage{rotating}
   - \usepackage{bussproofs}
   - \usepackage{enumitem}
   - \usepackage{stmaryrd}
   - \usepackage[ruled,vlined]{algorithm2e}
   - \usepackage[backend=biber,style=alphabetic,citestyle=authoryear]{biblatex}
   - \addbibresource{biblio.bib}
   - \newcommand{\version}{2.0.0}
   - \declaretheorem{theorem}
   - \declaretheorem{lemma}
   - \declaretheorem{definition}
   - \declaretheorem{corollary}
   - \declaretheorem{proposition}
   - \declaretheorem{property}
   - \declaretheoremstyle[spaceabove=6pt, spacebelow=6pt,  headfont=\itshape, notefont=\mdseries, notebraces={(}{)},bodyfont=\normalfont, postheadspace=1em,  qed=$\blacktriangleright$]{examplestyle}
   - \declaretheorem[style=examplestyle]{remark}
   - \declaretheorem[style=examplestyle]{example}
   - \crefname{equation}{clause}{clauses}
   - \Crefname{equation}{Clause}{Clauses}
   - \input{template/macro-command}
   - \usepackage{todonotes}
   - \title{DeepSec:\\\\User manual}
   - \author[1]{Vincent Cheval}
   - \author[1]{Steve Kremer}
   - \author[1]{Itsaka Rakotonirina}
   - \affil[2]{Inria Nancy, LORIA, Universit\'e de Lorraine, France}
   - \definecolor{titlepagebgcolor}{cmyk}{1,.10,0,0}
   - \definecolor{titlepagetextcolor}{cmyk}{0,0,0.0745,0}
fontsize: 11pt
---


\input{template/content}

<!-- dirty hack: an empty code block so that pandoc generates in main.tex the header definitions needed to display the code blocks of template/content.tex -->
```{.deepsec}
```
