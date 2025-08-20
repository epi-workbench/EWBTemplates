#' Return the "blanks replaced" CST template as a string
#'
#' @description Returns a testthat block that fails if any `____` remain in
#'   `learner_code`. This function does not interact with RStudio.
#'
#' @return A single character string containing the CST template.
#' @export
test_blanks_template <- function() {
  paste0(
    "# 1 - Check that all blanks `____` were replaced\n",
    "test_that(\"All blanks `____` were replaced\", {\n",
    "  if (grepl(\"____\", learner_code, fixed = TRUE)) {\n",
    "    fail(\"It looks like your submission still contains `____`. Please replace `____` to complete the code.\")\n",
    "  } else {\n",
    "    succeed()\n",
    "  }\n",
    "})\n"
  )
}

#' Insert the "blanks replaced" CST template at the cursor (RStudio addin)
#'
#' @description Inserts the output of [test_blanks_template()] into the active
#'   RStudio document at the current cursor position.
#'
#' @return Invisibly returns the inserted template string.
#' @importFrom rstudioapi isAvailable insertText
#' @export
insert_test_blanks <- function() {
  txt <- test_blanks_template()
  if (rstudioapi::isAvailable()) {
    rstudioapi::insertText(text = txt)
  }
  invisible(txt)
}
