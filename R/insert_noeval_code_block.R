#' Insert an No Evaluation Code Block into a Quarto Lesson
#'
#' @description This add-in inserts the standard "noeval" code block template
#'   used for Epi-Workbench lessons at the current cursor location in RStudio.
#'
#' @return Invisibly returns the code block text as a single character string.
#' @export
#'
#' @examples
#' if (interactive()) insert_noeval_code_block()
insert_noeval_code_block <- function() {
  block <- noeval_code_block_template()
  if (rstudioapi::isAvailable()) {
    rstudioapi::insertText(text = block)
  }
  invisible(block)
}

#' @rdname insert_noeval_code_block
#' @export
noeval_code_block_template <- function() {
  paste(
    "```{r, type=noeval}",
    "",
    "```",
    sep = "\n"
  )
}
