# LaTeX makefile for documentation
# Note: run it twice to ensure LastPage works
.PHONY: %.pdf
%.pdf: %.tex
	@echo " LATEX $<"
	@pdflatex -shell-escape -interaction=batchmode $< > /dev/null || \
		(echo && echo "Error:" && echo && cat $*.log | grep -A 10 ^! && exit 1)
	@pdflatex -shell-escape -interaction=batchmode $< > /dev/null
	@echo "  MOVE $@"
	@mv $@ ~/Downloads

# Clean rule to remove intermediates 
# produced by LaTeX and relevant libraries
clean:
	@echo " CLEAN documentation"
	@rm -f *.pdf*
	@rm -f *.log
	@rm -f *.out
	@rm -f *.aux
	@rm -f *.pyg
	@rm -rf _minted-*