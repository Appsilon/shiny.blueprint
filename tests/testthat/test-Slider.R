describe("Slider", {
  it("should update from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() {
        Slider.shinyInput(
          "slider",
          value = 5,
          min = 0,
          max = 10,
          stepSize = 0.1,
          labelStepSize = 10
        )
      },
      \(session) updateSlider.shinyInput(session, "slider", value = 7)
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("slider", driver)

    # Act
    actions$update()

    # Assert
    expect_equal(actions$getValue(), 7)
  })
})
