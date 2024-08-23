# pandoc - make pdf from md

pandoc markdown-file.md -o pdf-filename.pdf -V geometry:margin=1in

## install packages for pandoc to create pdf's
sudo apt install \
  pandoc \
  texlive-latex-base \
  texlive-fonts-recommended \
  texlive-extra-utils \
  texlive-latex-extra \
  texlive-xetex
