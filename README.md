# shiny.blueprint <a href="https://appsilon.github.io/shiny.blueprint/"><img src="man/figures/shiny-blueprint.png" alt="shiny.blueprint logo" style="float: right; height: 140px;"></a>

> _Palantir's Blueprint for Shiny Apps_

<!-- badges: start -->
[![CRAN](https://www.r-pkg.org/badges/version/shiny.blueprint)](https://cran.r-project.org/package=shiny.blueprint)
[![CI](https://github.com/Appsilon/shiny.blueprint/actions/workflows/ci.yml/badge.svg)](https://github.com/Appsilon/shiny.blueprint/actions/workflows/ci.yml)
[![downloads monthly](https://cranlogs.r-pkg.org/badges/shiny.blueprint)](https://CRAN.R-project.org/package=shiny.blueprint)
[![downloads total](https://cranlogs.r-pkg.org/badges/grand-total/shiny.blueprint)](https://CRAN.R-project.org/package=shiny.blueprint)
[![License: LGPL-3.0](https://img.shields.io/badge/License-LGPL--3.0-blue.svg)](https://opensource.org/license/lgpl-3-0)
<!-- badges: end -->

## Why `shiny.blueprint`?

We believe that a great UI plays a huge role in the success of application projects. shiny.blueprint gives your apps:

- a beautiful, professional look;
- a rich set of components easily usable in Shiny;
- fast speed of development that Shiny is famous for.

To see `shiny.blueprint` in action check out
the [Blueprint Showcase](https://connect.appsilon.com/shiny-blueprint-showcase/) app
with all the available components and R usage examples.

## Installation

Stable version:
```r
install.packages("shiny.blueprint", dependencies = TRUE)
```

Development version:
```r
remotes::install_github("Appsilon/shiny.blueprint", dependencies = TRUE)
```

With `dependencies = TRUE` the suggested packages (required to run some examples)
will be installed in addition to mandatory dependencies.

## Quick start

Here's how to create a basic `shiny.blueprint` app:

```r
library(shiny)
library(shiny.blueprint)

shinyApp(
  ui = tagList(
    Switch.shinyInput(
      inputId = "animate",
      value = TRUE,
      label = "Animate"
    ),
    reactOutput("progress")
  ),
  server = function(input, output) {
    output$progress <- renderReact({
      ProgressBar(animate = input$animate)
    })
  }
)
```

The majority of Blueprint components are available in `shiny.blueprint`.
Start typing `shiny.blueprint::` in RStudio to see all available components.
Visit the [Blueprint docs](https://blueprintjs.com/docs/)
to see what arguments (props) can be passed to the components.

## Examples

All components have usage examples in R.
Type `?shiny.blueprint::ComponentName` to see the code
or `shiny.blueprint::runExample("ExampleName")` to launch it.
Run this function without arguments to see a list of all available examples.

A showcase application with all components
can be launched with `shiny.blueprint::runExample("showcase")`
or by visiting [this link](https://connect.appsilon.com/shiny-blueprint-showcase/).

## Appsilon

<img src="https://avatars0.githubusercontent.com/u/6096772" align="right" alt="" width="6%" />

Appsilon is a **Posit (formerly RStudio) Full Service Certified Partner**.<br/>
Learn more at [appsilon.com](https://www.appsilon.com/).

Get in touch [opensource@appsilon.com](mailto:opensource@appsilon.com)

Explore the [Rhinoverse](https://rhinoverse.dev) - a family of R packages built around [Rhino](https://appsilon.github.io/rhino/)!

<a href = "https://www.appsilon.com/careers" target="_blank"><img src="https://raw.githubusercontent.com/Appsilon/website-cdn/gh-pages/WeAreHiring1.png" alt="We are hiring!"/></a>
