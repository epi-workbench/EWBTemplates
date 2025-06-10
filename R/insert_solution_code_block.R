#' Insert an Solution Code Block into a Quarto Lesson
#'
#' @description This add-in inserts the standard "solution" code block template
#'   used for Epi-Workbench lessons at the current cursor location in RStudio.
#'
#' @return Invisibly returns the code block text as a single character string.
#' @export
#'
#' @examples
#' if (interactive()) insert_solution_code_block()
insert_solution_code_block <- function() {
  block <- solution_code_block_template()
  if (rstudioapi::isAvailable()) {
    rstudioapi::insertText(text = block)
  }
  invisible(block)
}

#' @rdname insert_solution_code_block
#' @export
solution_code_block_template <- function() {
  paste(
    "```{r, type=solution}",
    "",
    "```",
    sep = "\n"
  )
}
