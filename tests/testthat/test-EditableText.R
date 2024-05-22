describe("EditableText", {
  it("should allow updating values from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() EditableText.shinyInput("text", "Text"),
      \(session) updateEditableText.shinyInput(session, "text", value = "New text")
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("text", driver)

    # Act
    actions$update()

    # Assert
    expect_equal(actions$getValue(), "New text")
  })
})
