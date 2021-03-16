test_that("non-data-frame input throws error", {
  expect_error(my_lm("a string", "throws errors"))
})
test_that("output is a list", {
  expect_is(my_lm(body_mass_g ~ bill_length_mm, data = my_penguins), "list")
})
