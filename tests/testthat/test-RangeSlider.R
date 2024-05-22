describe("RangeSlider", {
  it("should allow updating values from the server", {
    # Arrange
    driver <- serverUpdateApp(
      \() RangeSlider.shinyInput("slider", min = 0, max = 10, stepSize = 0.1, labelStepSize = 10),
      \(session) updateRangeSlider.shinyInput(session, "slider", value = c(3, 7))
    )
    on.exit(driver$stop())
    actions <- serverUpdateActions("slider", driver)

    # Act
    actions$update()

    # Assert
    expect_equal(actions$getValue(), c(3, 7))
  })
})
