# =============================================================================
# Colors data
# This is the code to create a data frame with color themes that I want to
# reuse in the future.
# Created: 2022-08-20
# https://www.uth.edu/brand-standards/visual-identity/color
# https://brandcenter.ufl.edu/colors/
# =============================================================================

library(dplyr, warn.conflicts = FALSE)

my_colors <- tribble(
  ~group,        ~subgroup,   ~hex,      ~description,
  "bradcannell", "primary",   "#000000", "Black",
  "bradcannell", "primary",   "#FFFFFF", "White",

  "uthealth",    "primary",   "#ae6042", "University Orange",
  "uthealth",    "primary",   "#4e738a", "University Blue",
  "uthealth",    "primary",   "#747578", "University Gray",

  "uthealth",    "secondary", "#002856", "Gulf Blue",
  "uthealth",    "secondary", "#f2b826", "Mustard Gold",
  "uthealth",    "secondary", "#587e6a", "Dark Sage",
  "uthealth",    "secondary", "#7D708f", "Dusty Lavender",

  "uthealth",    "neutral",   "#b0bfbc", "Light Sage",
  "uthealth",    "neutral",   "#b6a999", "Sand",

  "florida",     "primary",   "#f24f00", "Core Orange",
  "florida",     "primary",   "#003896", "Core Blue",
  "florida",     "primary",   "#FA4616", "Screen Orange",
  "florida",     "primary",   "#0021A5", "Screen Blue",

  "florida",     "secondary",   "#D32737", "Bottlebrush",
  "florida",     "secondary",   "#F2A900", "Alachua",
  "florida",     "secondary",   "#22884C", "Gator",
  "florida",     "secondary",   "#002657", "Dark Blue",
  "florida",     "secondary",   "#6A2A60", "Perennial"
)

# Make subgroup a factor for plots
my_colors <- my_colors %>%
  mutate(subgroup = factor(
    subgroup,
    c("primary", "secondary", "neutral"),
    c("Primary", "Secondary", "Neutral")
  ))

# Add the simulated data to the data directory.
usethis::use_data(my_colors, overwrite = TRUE)
