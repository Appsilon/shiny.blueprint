library(shiny.blueprint)
library(shiny)

customComponents <- tagList(
  tags$style("
    .panel-stack {
      border: 1px solid lightgrey;
      width: 300px;
      height: 240px;
    }
    .panel {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
  "),
  tags$script(HTML("(() => {
    const React = jsmodule['react'];
    const Blueprint = jsmodule['@blueprintjs/core'];

    function createPanel(num) {
      return {
        title: `Panel ${num}`,
        renderPanel: Panel,
        props: { num },
      };
    }

    function Panel({ num, openPanel }) {
      const button = React.createElement(
        Blueprint.Button,
        {
          onClick: () => openPanel(createPanel(num + 1)),
          intent: Blueprint.Intent.PRIMARY,
        },
        'Open Panel'
      )
      return React.createElement('div', { className: 'panel' }, button);
    }

    window.createPanel = createPanel;
  })()"))
)

ui <- function(id) {
  tagList(
    customComponents,
    PanelStack2(
      className = "panel-stack",
      initialPanel = JS("createPanel(1)")
    ),
    PanelStack(
      panels = list(
        list(title = "Panel 1", content = div("Content 1")),
        list(title = "Panel 2", content = div("Content 2")),
        list(title = "Panel 3", content = div("Content 3")),
        list(title = "Panel 4", content = div("Content 4")),
        list(title = "Panel 5", content = div("Content 5"))
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
