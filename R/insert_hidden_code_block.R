#' Insert an Hidden Code Block into a Quarto Lesson
#'
#' @description This add-in inserts the standard "hidden" code block template
#'   used for Epi-Workbench lessons at the current cursor location in RStudio.
#'
#' @return Invisibly returns the code block text as a single character string.
#' @export
#'
#' @examples
#' if (interactive()) insert_hidden_code_block()
insert_hidden_code_block <- function() {
  block <- hidden_code_block_template()
  if (rstudioapi::isAvailable()) {
    rstudioapi::insertText(text = block)
  }
  invisible(block)
}

#' @rdname insert_hidden_code_block
#' @export
hidden_code_block_template <- function() {
  paste(
    "```{r, type=hide}",
    "# Hidden Block for Local Testing Only",
    "# -----------------------------------",
    "student_env <- new.env()",
    "rm(list = ls(envir = student_env), envir = student_env)",
    "",
    "# Simulated student submissions",
    "correct <- '[INSERT]'",
    "wrong_1 <- '[INSERT]'",
    "",
    "# Set the active submission",
    "student_code <- correct",
    "",
    "# Gracefully evaluate code (prevents early error from stopping tests)",
    "try(eval(parse(text = student_code), envir = student_env), silent = TRUE)",
    "",
    "# Tests",
    "# 1 - Check ...",
    "",
    "```",
    sep = "\n"
  )
}
