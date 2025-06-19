# ===========================================================================
# Unit tests for the hidden_code_block_template() function.
# ===========================================================================

expected_block <- paste(
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

test_that("hidden_code_block_template() returns expected text", {
  expect_equal(hidden_code_block_template(), expected_block)
})
