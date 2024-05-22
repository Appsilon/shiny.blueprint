describe("HTMLSelect", {
  it("should allow updating values from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() {
        HTMLSelect.shinyInput(
          inputId = "select",
          value = "dog",
          options = list(
            list(label = "Cat", value = "cat"),
            list(label = "Dog", value = "dog")
          )
        )
      },
      \(session) {
        updateHTMLSelect.shinyInput(
          session,
          inputId = "select",
          value = "cat"
        )
      }
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("select", driver)

    # Act
    actions$update()

    # Assert
    expect_equal(actions$getValue(), "cat")
  })
})
