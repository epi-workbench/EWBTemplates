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
    "# Setup",
    "# Optionally, reset the environment.",
    "rm(list = ls(envir = student_env), envir = student_env)",
    "",
    "# Create a new environment to evaluate the student's code",
    "student_env <- new.env()",
    "",
    "# Simulate the learner's submission",
    "# (Replace the empty string with actual code from student input)",
    'correct     <- "" # Change this to test incorrect submissions',
    "",
    "# Set the active submission here (change only this line to switch test cases)",
    "test_code <- correct",
    "",
    "# Evaluate the code in the isolated environment",
    "eval(parse(text = correct), envir = student_env)",
    "",
    "# Tests",
    "# 1 - Confirm ...",
    "",
    "```",
    sep = "\n"
  )
}
