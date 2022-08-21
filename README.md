
<!-- README.md is generated from README.Rmd. Please edit that file -->

``` r
library(dplyr, warn.conflicts = FALSE)
library(ggplot2)
library(templates)
```

# templates

<!-- badges: start -->
<!-- badges: end -->

Brad Cannell’s templates and themes

## Installation

You can install templates from GitHub with:

``` r
devtools::install_github("brad-cannell/templates")
```

## Rmd templates

The templates package contains several Rmd document templates. They are
located in `inst/rmarkdown/templates`.

## Colors

The templates package contains several color palettes. The easiest way
to access them is from the `my_colors` data frame.

``` r
data(my_colors)
```

``` r
knitr::kable(my_colors)
```

| group       | subgroup  | hex      | description       |
|:------------|:----------|:---------|:------------------|
| bradcannell | Primary   | \#000000 | Black             |
| bradcannell | Primary   | \#FFFFFF | White             |
| uthealth    | Primary   | \#ae6042 | University Orange |
| uthealth    | Primary   | \#4e738a | University Blue   |
| uthealth    | Primary   | \#747578 | University Gray   |
| uthealth    | Secondary | \#002856 | Gulf Blue         |
| uthealth    | Secondary | \#f2b826 | Mustard Gold      |
| uthealth    | Secondary | \#587e6a | Dark Sage         |
| uthealth    | Secondary | \#7D708f | Dusty Lavender    |
| uthealth    | Neutral   | \#b0bfbc | Light Sage        |
| uthealth    | Neutral   | \#b6a999 | Sand              |
| florida     | Primary   | \#f24f00 | Core Orange       |
| florida     | Primary   | \#003896 | Core Blue         |
| florida     | Primary   | \#FA4616 | Screen Orange     |
| florida     | Primary   | \#0021A5 | Screen Blue       |
| florida     | Secondary | \#D32737 | Bottlebrush       |
| florida     | Secondary | \#F2A900 | Alachua           |
| florida     | Secondary | \#22884C | Gator             |
| florida     | Secondary | \#002657 | Dark Blue         |
| florida     | Secondary | \#6A2A60 | Perennial         |

Here’s a function to help create the color plots below.

``` r
color_plots <- function(.group) {
  df <- my_colors %>% 
    filter(group == .group) %>% 
    group_by(subgroup) %>% 
    mutate(x = row_number()) %>% 
    ungroup() %>% 
    mutate(hex = factor(hex, hex, hex))
  
  ggplot(df, aes(x = x, y = 1, fill = hex)) +
    geom_raster() +
    geom_text(aes(label = description), color = "white") +
    facet_wrap(vars(subgroup), ncol = 1) +
    scale_fill_manual("Hexidecimal code", values = as.character(df$hex)) +
    theme(
      # Remove background
      panel.background = element_rect(fill = "transparent"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.background  = element_rect(fill = "transparent"),
      
      # Remove x axis
      axis.title.x = element_blank(),
      axis.text.x  = element_blank(),
      axis.ticks.x = element_blank(),
      
      # Remove y axis
      axis.title.y = element_blank(),
      axis.text.y  = element_blank(),
      axis.ticks.y = element_blank(),
      
      # Facet labels
      strip.background = element_rect(color = "black", fill = "transparent")
    )
}

# For testing
color_plots("uthealth")
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

### Brad Cannell color palette

Currently, the bradcannell color palette only contains black and white.
There is no need to “show” it.

### UTHealth color palette

``` r
color_plots("uthealth")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

### Florida color palette

``` r
color_plots("florida")
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

## Images

The templates package contains several logos and images. They are
located in `man/figures`. Here is a sample.

### Brad Cannell

<img src="man/figures/bradcannell_logo/RGB/PNG/cannell_h.png" width="100%" /><img src="man/figures/bradcannell_logo/RGB/PNG/cannell_v.png" width="100%" />

## R4Epi

<img src="man/figures/r4epi_logo/r4epi_hex.png" width="100%" /><img src="man/figures/r4epi_logo/r4epi_hex_circle.png" width="100%" />

## Hex Stickers

<img src="man/figures/codebookr_hex/codebookr_hex.png" width="100%" /><img src="man/figures/freqtables_hex/freqtables_hex.png" width="100%" /><img src="man/figures/meantables_hex/meantables_hex.png" width="100%" /><img src="man/figures/tabler_hex/tabler_hex.png" width="100%" />

## UTHealth

<img src="man/figures/uthealth/uth_sph_horizontal_school_below_orange_gray.png" width="100%" /><img src="man/figures/uthealth/uth_sph_horizontal_school_right_orange_gray.png" width="100%" /><img src="man/figures/uthealth/uth_sph_standard_school_below_orange_gray.png" width="100%" /><img src="man/figures/uthealth/uth_sph_standard_school_right_orange_gray.png" width="100%" />
