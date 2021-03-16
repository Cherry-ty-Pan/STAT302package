test_that("non-data-frame input throws error", {
  expect_error(my_knn_cv("a string"))
  expect_error(my_knn_cv(2))
})
