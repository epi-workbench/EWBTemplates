#' Insert Code Block Hints into a Quarto Lesson
#'
#' @description This add-in inserts the standard code block hint template
#'   used for Epi-Workbench lessons at the current cursor location in RStudio.
#'
#' @return Invisibly returns the code block hint text as a single character string.
#' @export
#'
#' @examples
#' if (interactive()) insert_hints()
insert_hints <- function() {
  block <- hints_template()
  if (rstudioapi::isAvailable()) {
    rstudioapi::insertText(text = block)
  }
  invisible(block)
}

#' @rdname insert_hints
#' @export
hints_template <- function() {
  paste(
    "<!-- HINT:",
    "[POINTS=33]",
    "Hints provide supportive nudges that guide learners toward the solution without giving away the answer.",
    "",
    "[TITLE=Here is a Title, POINTS=33]",
    "- Hint titles should be brief and written in title case.",
    "",
    "[TITLE=Solution, POINTS=100]",
    "- The final hint will be the solution. It should remove the remainder of the points.",
    '- x <- "hint"',
    "-->",
    sep = "\n"
  )
}
