# ===========================================================================
# Unit tests for the hints_template() function.
# ===========================================================================

expected_block <- paste(
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

test_that("hints_template() returns expected text", {
  expect_equal(hints_template(), expected_block)
})
