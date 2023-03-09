# shiny.blueprint <a href="https://appsilon.github.io/shiny.blueprint/"><img src="man/figures/shiny-blueprint.png" alt="shiny.blueprint logo" style="float: right; height: 140px;"></a>

> _Palantir's Blueprint for Shiny Apps_

<!-- badges: start -->
[![CRAN](https://www.r-pkg.org/badges/version/shiny.blueprint)](https://cran.r-project.org/package=shiny.blueprint)
[![CI](https://github.com/Appsilon/shiny.blueprint/actions/workflows/ci.yml/badge.svg)](https://github.com/Appsilon/shiny.blueprint/actions/workflows/ci.yml)
[![downloads monthly](https://cranlogs.r-pkg.org/badges/shiny.blueprint)](https://CRAN.R-project.org/package=shiny.blueprint)
[![downloads total](https://cranlogs.r-pkg.org/badges/grand-total/shiny.blueprint)](https://CRAN.R-project.org/package=shiny.blueprint)
[![License: LGPL-3.0](https://img.shields.io/badge/License-LGPL--3.0-blue.svg)](https://opensource.org/license/lgpl-3-0/)
<!-- badges: end -->

## Why `shiny.blueprint`?

We believe that a great UI plays a huge role in the success of application projects. shiny.blueprint gives your apps:

- a beautiful, professional look;
- a rich set of components easily usable in Shiny;
- fast speed of development that Shiny is famous for.

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

---

Developed with :heart: at [Appsilon](https://appsilon.com).
Get in touch: <opensource@appsilon.com>.

Appsilon is a
[**Full Service Certified Posit Partner**](https://posit.co/certified-partners/).

<a href="https://appsilon.com/careers/">
  <img src="http://d2v95fjda94ghc.cloudfront.net/hiring.png" alt="We are hiring!">
</a>
