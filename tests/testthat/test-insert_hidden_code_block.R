# ===========================================================================
# Unit tests for the hidden_code_block_template() function.
# ===========================================================================


# =============================================================================
# Reusable Code Block Text Chunks
# Many of the code block templates below have large chunks of text in common.
# We will extract that text out into reusable chunks in this section to:
# 1. Make the templates below easier to read.
# 2. Make the templates below easier to maintain.
#
# These don't need to be documented in @description, because they aren't
# exposed to users and they aren't intended to be used on their own.
# =============================================================================

hidden_cb_begin <- paste(
  "```{r, type=hide}",
  "# Hidden Block for Local Testing Only",
  "# -----------------------------------------------------------------------------",
  "",
  sep = "\n"
)

setup_student_environment <- paste(
  "# Setup the simulated student environment",
  "student_env <- new.env()",
  "rm(list = ls(envir = student_env), envir = student_env)",
  "",
  sep = "\n"
)

set_active_submission <- paste(
  "# Set the active submission",
  "student_code <- correct",
  "",
  sep = "\n"
)

evaluate_student_submission <- paste(
  "# Gracefully evaluate code (prevents early error from stopping tests)",
  "try(eval(parse(text = student_code), envir = student_env), silent = TRUE)",
  "",
  sep = "\n"
)

hidden_cb_end <- "```"

start_csts <- paste(
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
  sep = "\n"
)

# =============================================================================
# Code Block Templates
# =============================================================================

# Default Template
# ---------------------------------------------------------------------------

expected_block <- paste(
  hidden_cb_begin,
  setup_student_environment,
  "# Simulated student submissions",
  "correct <- '[INSERT]'",
  "wrong_1 <- '[INSERT]'",
  "",
  set_active_submission,
  evaluate_student_submission,
  start_csts,
  '# 2 - Check ...',
  'test_that("Description that will be meaningful to learners...", {',
  '  if (condition 1) {',
  '    fail("Meaningful failure message")',
  '  } else {',
  '    succeed()',
  '  }',
  '})',
  hidden_cb_end,
  sep = "\n"
)

test_that("hidden_code_block_default() returns expected text", {
  expect_equal(hidden_code_block_default(), expected_block)
})

# Template for Code Blocks Intended to be Run Without Modification
# ---------------------------------------------------------------------------

expected_block <- paste(
  hidden_cb_begin,
  setup_student_environment,
  "# Simulated student submissions",
  "correct <- 'library(dplyr, warn.conflicts = FALSE)'",
  "correct_without_warn_conflicts <- 'library(dplyr)'",
  "correct_quoted_pkg <- 'library(\"dplyr\")'",
  "wrong_no_change <- 'library(____, warn.conflicts = FALSE)'",
  "wrong_missing_pkg <- 'library(ggplot2)'",
  "wrong_fn <- 'paste(dplyr)'",
  "wrong_require <- 'require(dplyr)' # Not best practice, but it works",
  "",
  set_active_submission,
  evaluate_student_submission,
  start_csts,
  '# 2 - Check to make sure the code is submitted without modification',
  '# Since the student is only expected to click submit and not modify the',
  '# scaffolded code, a single exact match test is sufficient.',
  'test_that("Submit `library(dplyr)` exactly", {',
  '  if (trimws(student_code) != "library(dplyr)") {',
  '    fail("This code block already contains the correct code. Please submit it without making any changes. \nIf you accidentally modified the code, click the reset button (\U0001F501) on the toolbar to restore the original version. \nWant to experiment or try something different? Open the interactive code console (</>) to explore safely without affecting your submission.")',
  '  } else {',
  '    succeed()',
  '  }',
  '})',
  hidden_cb_end,
  sep = "\n"
)

test_that("hidden_code_block_no_mod() returns expected text", {
  expect_equal(hidden_code_block_no_mod(), expected_block)
})

# Template for Code Blocks For Loading Packages
# ---------------------------------------------------------------------------

expected_block <- paste(
  hidden_cb_begin,
  setup_student_environment,
  "# Simulated student submissions",
  "correct <- 'library(dplyr, warn.conflicts = FALSE)'",
  "correct_without_warn_conflicts <- 'library(dplyr)'",
  "correct_quoted_pkg <- 'library(\"dplyr\")'",
  "wrong_no_change <- 'library(____, warn.conflicts = FALSE)'",
  "wrong_missing_pkg <- 'library(ggplot2)'",
  "wrong_fn <- 'paste(dplyr)'",
  "wrong_require <- 'require(dplyr)' # Not best practice, but it works",
  "",
  "# Code for detaching packages during interactive testing",
  "# detach(\"package:dplyr\", unload = TRUE)",
  "",
  set_active_submission,
  evaluate_student_submission,
  start_csts,
  "# 2 - Check that dplyr was loaded",
  "# Calling `library(dplyr)` loads the package into the namespace of the R session,",
  "# not into a specific environment like `student_env`. So checking `student_env`",
  "# directly for loaded packages won't work the way checking for an object would.",
  "# However, if the student correctly submits `library(dplyr)`, it will be loaded",
  "# into the session, and we can check for that using the CST below.",
  "test_that(\"Did you load `dplyr`?\", {",
  "  if (!(\"dplyr\" %in% tolower((.packages())))) {",
  "    fail(\"Did you correctly load the `dplyr` package using the `library()` function?\")",
  "  } else {",
  "    succeed()",
  "  }",
  "})",
  hidden_cb_end,
  sep = "\n"
)

test_that("hidden_code_block_load_package() returns expected text", {
  expect_equal(hidden_code_block_load_package(), expected_block)
})
