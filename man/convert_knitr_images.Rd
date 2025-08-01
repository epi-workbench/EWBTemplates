% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_knitr_images.R
\name{convert_knitr_images}
\alias{convert_knitr_images}
\title{Convert \code{knitr::include_graphics()} Code Blocks to Markdown Image Syntax}
\usage{
convert_knitr_images(input_file, output_file = NULL)
}
\arguments{
\item{input_file}{A character string specifying the path to the input markdown (\code{.md} or \code{.qmd}) file.}

\item{output_file}{Optional. A character string specifying the path to write the modified file.
If \code{NULL}, the modified lines are returned as a character vector instead of being written to disk.}
}
\value{
If \code{output_file} is \code{NULL}, returns a character vector containing the modified file content.
Otherwise, the function writes the modified content to the specified output file and returns nothing.
}
\description{
This function reads a markdown or Quarto file and searches for R code blocks
that use \code{knitr::include_graphics()} to render images. It replaces those code
blocks with standard markdown image syntax, e.g., \verb{![filename](link)}.
}
\examples{
\dontrun{
convert_knitr_images("example.qmd", "converted.qmd")
}

}
