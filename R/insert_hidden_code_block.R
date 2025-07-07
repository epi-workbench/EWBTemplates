#' Insert an Hidden Code Block into a Quarto Lesson
#'
#' @description This add-in inserts the standard "hidden" code block template
#'   used for Epi-Workbench lessons at the current cursor location in RStudio.
#'
#' @return Invisibly returns the code block text as a single character string.
#'
#' @family Insert Addins
#'
#' @references For more information on hidden code blocks see: https://github.com/epi-workbench/EWBTemplates/wiki/Code-Blocks
#'
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
    "# -----------------------------------------------------------------------------",
    "",
    "# Setup the simulated student environment",
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
    "# Code Submission Tests (CSTs)",
    "# -----------------------------------------------------------------------------",
    "",
    "# 1 - Check that `____` was replaced with something",
    'test_that("Did you replace the blanks in the code block?", {',
    '  if (grepl("____", student_code, fixed = TRUE)) {',
    '    fail("It looks like your submission still contains `____`. Please replace `____` to complete the code.")',
    '  } else {',
    '    succeed()',
    '  }',
    '})',
    "",
    '# 2 - Check ...',
    'test_that("Description that will be meaningful to learners...", {',
    '  if (condition 1) {',
    '    fail("Meaningful failure message")',
    '  } else {',
    '    succeed()',
    '  }',
    '})',
    "```",
    sep = "\n"
  )
}
