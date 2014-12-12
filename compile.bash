#!/bin/bash
# Compile script for FLUKE

#Print FLUKE title
echo ""
echo "###################################################"
echo "#                                                 #"
echo "# FLUKE: Fields Layered Under Kohn-Sham Electrons #"
echo "#                                                 #"
echo "###################################################"
echo ""

### Compile FLUKE ###
echo "Compiling the FLUKE binary..."
cd src/
g++ -fopenmp -g -static -O3 FLUKE.cpp -o FLUKE -I/usr/include/eigen3/
cd ../
mv src/FLUKE .
echo ""

### Compile FLUKE manual ###
echo "Compiling the documentation..."
cd src/
#Overkill to make sure all of the numbering is correct
pdflatex manual > doclog.txt
#bibtex manual > doclog.txt
pdflatex manual > doclog.txt
pdflatex manual > doclog.txt
pdflatex manual > doclog.txt
pdflatex manual > doclog.txt
#bibtex manual > doclog.txt
pdflatex manual > doclog.txt
pdflatex manual > doclog.txt
pdflatex manual > doclog.txt
#Remove junk files
rm -f manual.aux manual.bbl manual.lof doclog.txt
rm -f manual.lot manual.out manual.toc manual.log
mv manual.pdf ../doc/FLUKE_manual.pdf
cd ../
echo ""

### Print code stats ###
echo "Number of FLUKE source code files:"
ls -al ./src/* | wc -l
echo "Total length of FLUKE (lines):"
cat ./src/* | wc -l
echo ""

### Finish ###
echo "Done."
echo ""
