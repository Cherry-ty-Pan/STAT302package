test_that("non-data-frame input throws error", {
  expect_error(my_lm("a string"))
  expect_error(my_lm(2))
})
