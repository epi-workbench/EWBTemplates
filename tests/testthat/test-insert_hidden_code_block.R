# ===========================================================================
# Unit tests for the hidden_code_block_template() function.
# ===========================================================================

expected_block <- paste(
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

test_that("hidden_code_block_template() returns expected text", {
  expect_equal(hidden_code_block_template(), expected_block)
})
