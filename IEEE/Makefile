PAPER=paper

os := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
ifeq ($(os),Darwin)
	open = open
else
	open = xdg-open
endif

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

