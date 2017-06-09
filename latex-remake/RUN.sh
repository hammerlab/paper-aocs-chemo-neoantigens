#!/bin/bash

pdflatex bmc_article.tex && bibtex bmc_article.aux && pdflatex bmc_article.tex && pdflatex bmc_article.tex

latexdiff bmc_article.pre_review.tex bmc_article.tex > bmc_article.diff.tex
pdflatex bmc_article.diff.tex && pdflatex bmc_article.diff.tex && pdflatex bmc_article.diff.tex && pdflatex bmc_article.diff.tex

pdflatex supplement.tex 
