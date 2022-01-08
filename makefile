install: check
	Rscript -e "devtools::install()"

check: docs
	Rscript -e "devtools::check()"

docs: document
	Rscript -e "source('docs/docify.R')"

document: 
	Rscript -e "devtools::document()"

test:
	Rscript -e "devtools::test()"
