describe("RadioGroup", {
  it("should allow updating values from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() {
        RadioGroup.shinyInput(
          inputId = "radio",
          value = "dog",
          Radio(label = "Cat", value = "cat"),
          Radio(label = "Dog", value = "dog")
        )
      },
      \(session) {
        updateRadioGroup.shinyInput(
          session,
          inputId = "radio",
          value = "cat"
        )
      }
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("radio", driver)

    # Act
    actions$update()

    # Assert
    expect_equal(actions$getValue(), "cat")
  })
})
