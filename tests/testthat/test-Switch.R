describe("Switch", {
  it("should update from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() {
        Switch.shinyInput(
          inputId = "switch",
          value = FALSE,
          label = "Switch"
        )
      },
      \(session) {
        updateSwitch.shinyInput(
          session,
          inputId = "switch",
          value = TRUE
        )
      }
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("switch", driver)

    # Act
    actions$update()

    # Assert
    expect_true(actions$getValue())
  })
})
