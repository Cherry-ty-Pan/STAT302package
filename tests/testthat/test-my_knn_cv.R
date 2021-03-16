test_that("non-data-frame input throws error", {
  expect_error(my_knn_cv("a string should throw error"))
})

test_that("output should be a list", {
  expect_is(my_knn_cv(my_penguins[, 3:6], my_penguins$species, 5, 5),"list")
})
