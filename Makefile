PAPER=paper

open := $(shell sh -c '[ `uname` = Darwin ] && echo open || echo xdg-open')

.PHONY: FORCE
cqp.pdf: FORCE
	./latexrun $(PAPER)

.PHONY: clean
clean:
	./latexrun --clean-all

.PHONY: view
view:
	$(open) $(PAPER).pdf

.PHONY: lint
lint:
	@./lint.sh

.PHONY: check
check:
	@echo "====== chktex ======="
	@(which chktex || (echo "chktex missing!" && exit 1)) && \
		chktex *.tex
	@echo ""
	@echo "====== lacheck ======="
	@(which lacheck || (echo "lacheck missing!" && exit 1)) && \
		lacheck *.tex

