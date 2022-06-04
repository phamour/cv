# Makefile twentyseconds cv

files_tex = $(wildcard *.tex)
outdir = build
all: pdf
	@echo "Done!"
pdf: *.tex
	@echo "Building.... $^ into $(outdir)/"
	@$(foreach var,$(files_tex),xelatex -interaction=nonstopmode -output-directory='$(outdir)' '$(var)' 1>/dev/null || true)
clean:
	@rm -f $(outdir)/*.aux $(outdir)/*.dvi $(outdir)/*.log $(outdir)/*.out $(outdir)/*.pdf $(outdir)/*.bak
	@echo "Clean done.";
