describe("InputGroup", {
  it("should allow updating values from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() {
        InputGroup.shinyInput(
          inputId = "group",
          disabled = FALSE,
          large = FALSE,
          leftIcon = "home",
          placeholder = "Type something..."
        )
      },
      \(session) {
        updateInputGroup.shinyInput(
          session,
          inputId = "group",
          value = "cat"
        )
      }
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("group", driver)

    # Act
    actions$update()

    # Assert
    expect_equal(actions$getValue(), "cat")
  })
})
