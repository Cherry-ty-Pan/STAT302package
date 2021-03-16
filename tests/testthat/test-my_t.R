test_that("non-string input throws error", {
  expect_error(my_t.test(c(2,4,5), 3, 6))
  expect_error(my_t.test(2))
})
