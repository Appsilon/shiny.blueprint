describe("NumericInput", {
  it("should allow updating values from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() {
        NumericInput.shinyInput(
          inputId = "numeric",
          value = 1,
          label = "Numeric"
        )
      },
      \(session) {
        updateNumericInput.shinyInput(
          session,
          inputId = "numeric",
          value = 2
        )
      }
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("numeric", driver)

    # Act
    actions$update()

    # Assert
    expect_equal(actions$getValue(), 2)
  })
})
