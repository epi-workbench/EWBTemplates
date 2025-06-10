# ===========================================================================
# Unit tests for the hidden_code_block_template() function.
# ===========================================================================

expected_block <- paste(
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

test_that("hidden_code_block_template() returns expected text", {
  expect_equal(hidden_code_block_template(), expected_block)
})
