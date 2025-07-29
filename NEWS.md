# EWBTemplates 0.0.9007

- Update the `insert_hidden_code_block()` function.

  - Remove the CST from the "no modification"" hidden code block template that checks for unmodified partial code scaffolding (`____`). This CST was unnecessary because no modification code blocks contain the complete solution by definition.
  
  - Remove example incorrect simulated learner responses from the "no modification" hidden code block template. Since any deviation from the provided code should already trigger the CST, explicit checks for specific incorrect responses are unnecessary. The template only needs to verify that the correct code passes.
  
  - Replace all references to "student" with "learner".
  
  - we prefer **"learner"** over **"student"** or **"member"**:
  
    - The term "learner" is inclusive and reflects the diverse audience of Epi-Workbench, which includes health professionals and the general public.
    - Unlike "student," it does not imply a formal school setting, grading, or enrollment.
    - Unlike "member," it conveys an active process of gaining knowledge rather than a passive association with a group.

# EWBTemplates 0.0.9006

- Update the `insert_hidden_code_block()` function.

  - Fix typos in the hidden code block for loading packages template. The previous simulated student submissions didn't apply to loading packages.
  
  - Add code for detaching packages during interactive testing to the hidden code block for loading packages template.

# EWBTemplates 0.0.9005

- Added `convert_knitr_images()` function to convert R code blocks using `knitr::include_graphics()` into standard markdown image syntax (e.g., `![filename](link)`) for easier portability and readability in Quarto and markdown documents.

# EWBTemplates 0.0.9004

- The `insert_hints()` function now has the ability to insert multiple different hint templates via the `templates` argument.

- Made the `insert_hints()` Addin interactive using `shiny::miniUI` and `rstudioapi::dialogViewer()`, allowing users to select a hint template from a dropdown menu within RStudio.

- Updated `insert_hidden_code_block()` RStudio Addin to interactively insert templated CST code blocks into Quarto lessons. Includes support for "default", "no_mod", and "load_package" templates.

# EWBTemplates 0.0.9003

- Update the example hint syntax.

- Update the code scaffolding inside of hidden code blocks.
  
  - Change "Tests" to "Code Submission Tests (CSTs)".
  
  - Add an example CST to check that `____` was replaced with something.
  
- Add the the 'Insert Addins' @family to:

  - insert_hidden_code_block.R
  
  - insert_hints.R
  
  - insert_initial_code_block.R
  
  - insert_lesson_yaml_header.R
  
  - insert_noeval_code_block.R
  
  - insert_solution_code_block.R
  
  - insert_test_code_block.R
  
- Add links to GitHub Wiki documentation to:

  - insert_hidden_code_block.R
  
  - insert_hints.R
  
  - insert_initial_code_block.R
  
  - insert_lesson_yaml_header.R
  
  - insert_noeval_code_block.R
  
  - insert_solution_code_block.R
  
  - insert_test_code_block.R

# EWBTemplates 0.0.9002

- Update the code scaffolding inside of hidden code blocks.

# EWBTemplates 0.0.9001

- Add RStudio add-ins for inserting YAML headers to EWB lesson files.

- Add RStudio add-ins for inserting solution, hidden, test, and noeval code blocks to EWB lesson files.

- Add RStudio add-ins for inserting code block hints to EWB lesson files.

- Update the Quarto coding lesson template used by `new_quarto_lesson_coding()`.

- Add the Quarto Course Overview template used by `new_quarto_course_overview()`

# EWBTemplates 0.0.9000

- This is the first committed version of the EWBTemplates package.

- This is a development version of the package and subject to major changes.

- This version of the the EWBTemplates package will not be made available on
CRAN.

- This version contains:

  - A table of EWB brand standard colors.

  - A collection of EWB brand standard logos.

  - A template for creating EWB coding lessons.

  - A convenience function, `color_plots()`, for visualizing color palettes
  like the EWB brand standard color palette created in the `EWBTemplates`
  package.
