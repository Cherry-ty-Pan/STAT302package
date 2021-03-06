test_that("throws error if there's only one param", {
  expect_error(my_t.test(2))
})

test_that("output is a list", {
  expect_is(my_t.test(rnorm(100), 0, "greater"), "list")
})
test_that("output is a list", {
  expect_is(my_t.test(rnorm(100), 0, "less"), "list")
})
test_that("output is a list", {
  expect_is(my_t.test(rnorm(100), 0, "two.sided"), "list")
})
test_that("non-specified alternative throws error message", {
  expect_match(my_t.test(rnorm(100), 0, "lalala"), "Please specify alternative hypothesis")
})
