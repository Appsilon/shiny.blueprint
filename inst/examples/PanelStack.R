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
    PanelStack(
      className = "panel-stack",
      initialPanel = JS("createPanel(1)")
    ),
    PanelStack.shinyWrapper(
      panels = list(
        list(id = "panel1", title = "Panel 1", content = div(
          class = "panel",
          Button(text = "Open 2", onClick = openPanel("panel2")),
          Button(text = "Open 4", onClick = openPanel("panel4"))
        )),
        list(id = "panel2", title = "Panel 2", content = div(
          class = "panel",
          Button(text = "Open 3", onClick = openPanel("panel3")),
          Button(text = "Close", onClick = closePanel())
        )),
        list(id = "panel3", title = "Panel 3", content = div(
          class = "panel",
          Button(text = "Open 4", onClick = openPanel("panel4")),
          Button(text = "Close", onClick = closePanel())
        )),
        list(id = "panel4", title = "Panel 4", content = div(
          class = "panel",
          Button(text = "Close", onClick = closePanel())
        ))
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) shinyApp(ui("app"), function(input, output) server("app"))
