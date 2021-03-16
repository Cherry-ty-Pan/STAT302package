test_that("string input throws error", {
  expect_error(my_rf_cv("a string"))
})
test_that("output is numeric", {
  expect_is(my_rf_cv(5), "numeric")
})
