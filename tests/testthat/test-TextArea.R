describe("TextArea", {
  it("should allow updating values from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() TextArea.shinyInput("textarea", growVertically = TRUE, large = TRUE, intent = "primary"),
      \(session) updateTextArea.shinyInput(session, "textarea", value = "Hello, world!")
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("textarea", driver)

    # Act
    actions$update()

    # Assert
    expect_equal(actions$getValue(), "Hello, world!")
  })
})
