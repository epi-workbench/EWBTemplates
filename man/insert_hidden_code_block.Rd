% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/insert_hidden_code_block.R
\name{insert_hidden_code_block}
\alias{insert_hidden_code_block}
\alias{hidden_code_block_template}
\title{Insert an Hidden Code Block into a Quarto Lesson}
\usage{
insert_hidden_code_block()

hidden_code_block_template()
}
\value{
Invisibly returns the code block text as a single character string.
}
\description{
This add-in inserts the standard "hidden" code block template
used for Epi-Workbench lessons at the current cursor location in RStudio.
}
\examples{
if (interactive()) insert_hidden_code_block()
}
