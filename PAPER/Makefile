os := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
ifeq ($(os),Darwin)
	open = open
else
	open = xdg-open
endif

.PHONY: all
all: paper.pdf

%.pdf:
	latexmk -output-directory=out -pdf $*.tex

.PHONY: clean
clean:
	rm -rf out

.PHONY: view
view:
	$(open) out/paper.pdf

.PHONY: check
check:
	@./lint.sh

