cmd="knitr::knit2pdf('/tests/ctex.Rnw', '/tests/ctex.tex', compiler = 'xelatex')"
cmd="rmarkdown::render('/tests/test.Rmd', output_format = 'pdf_document')"
cmd="rmarkdown::render('/tests/test.Rmd', output_format = 'html_document')"
docker run --rm -it \
  -v $(pwd)/tests:/tests \
  shrektan/rdocker4working:latest R -e "${cmd}"
