test_that("string input throws error", {
  expect_error(my_rf_cv("a string"))
})
