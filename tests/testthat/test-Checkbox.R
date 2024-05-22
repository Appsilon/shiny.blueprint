describe("Checkbox", {
  it("should allow updating values from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() Checkbox.shinyInput("checkbox", value = FALSE),
      \(session) updateCheckbox.shinyInput(session, "checkbox", value = TRUE)
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("checkbox", driver)

    # Act
    actions$update()

    # Assert
    expect_true(actions$getValue())
  })
})
