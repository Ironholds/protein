context("Test entity metadata retrieval")

test_that("Structure information can be retrieved",{
  structures <- c("4hhb.A","4hhb")
  results <- get_structure_descriptions(structures)
  expect_that(names(results), equals(structures))
  expect_that(is.list(results), equals(TRUE))
})