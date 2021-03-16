test_that("non-data-frame input throws error", {
  expect_error(my_rf_cv("a string"))
  expect_error(my_rf_cv(2))
})
