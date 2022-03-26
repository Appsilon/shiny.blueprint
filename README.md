<a href = "https://appsilon.com/careers/" target="_blank"><img src="http://d2v95fjda94ghc.cloudfront.net/hiring.png" alt="We are hiring!"/></a>

# shiny.blueprint

We believe that a great UI plays a huge role in the success of application projects. shiny.blueprint gives your apps:
- beautiful, professional look
- rich set of components easily usable in Shiny
- fast speed of development that Shiny is famous for.

As Blueprint.js is built in React, shiny.blueprint is based on another package called [shiny.react](https://github.com/Appsilon/shiny.react), which allows for using React libraries in Shiny.

**Note:** This package strives to be as easy to use as possible, while providing most of Blueprint.js possibilities. That said, Blueprint.js is more flexible and low level than Bootstrap, and there is additional complexity coming from using React in Shiny. You should expect using shiny.blueprint to be somewhat more complex than vanilla Shiny or shiny.semantic (at some point you will likely want to browse the original Blueprint.js documentation), but you get more power, flexibility and better UI in return.

## Getting started

### Installation

To install the packages, run:
```R
remotes::install_github("Appsilon/shiny.react")
remotes::install_github("Appsilon/shiny.blueprint")
```

### Quick start

Here's how to make a very basis Blueprint Shiny app:

```r
library(shiny)
library(shiny.react)
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

`shiny.blueprint` aims to provides all components from Palantirs's Blueprint.js library.
Browse the [official docs](https://blueprintjs.com/)
or start typing `shiny.blueprint::` in RStudio to see all available controls.

All components ~are~ will be documented, so if you run `?shiny.blueprint::MyComponentName`, hopefully you'll see documentation for this component in RStudio, along with examples. When in doubt, open Blueprint.js docs for details.

