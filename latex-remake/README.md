# Latex remake for submission

To compile:

```
pdflatex bmc_article.tex && bibtex bmc_article.aux && pdflatex bmc_article.tex && pdflatex bmc_article.tex
```

To compile diff for reviewers:

```
latexdiff bmc_article.pre_review.tex bmc_article.tex > bmc_article.diff.tex
pdflatex bmc_article.diff.tex && pdflatex bmc_article.diff.tex && pdflatex bmc_article.diff.tex && pdflatex bmc_article.diff.tex
```
