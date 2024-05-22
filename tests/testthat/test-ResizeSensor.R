describe("ResizeSensor", {
  it("should render its content", {
    # Arrange
    driver <- renderApp(
      \() {
        ResizeSensor.shinyInput(
          inputId = "resizeSensor",
          content = shiny::div("Hello world!")
        )
      }
    )
    on.exit(driver$stop())
    actions <- renderActions("resizeSensor", driver)

    # Act

    # Assert
    value <- actions$getValue()
    expect_type(value, "list")
    expect_setequal(c("x", "y", "width", "height", "top", "right", "bottom", "left"), names(value))
  })
})
