DOCS = VItamin.pdf

FIGS = ./corner_testcase0.png \
       ./hist-kl.png \
       ./inv_losses_log.png \
       ./network_setup.png \
       ./latest_pp_plot.png

TABLES = 

BIBLIO = ./references.bib

BYPROD = *.aux *.log *.out *.dvi *.bbl *.blg

default: git-tag $(DOCS) $(FIGS)

.PHONY : git-tag

git-tag:
	./git-tag.sh

VItamin.pdf: VItamin.tex $(FIGS) $(TABLES) $(BIBLIO)
	pdflatex $(@:.pdf=) && bibtex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=)

clean:
	rm -f $(DOCS) $(BYPROD)
