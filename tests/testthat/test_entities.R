context("Test entity metadata retrieval")

test_that("Structure information can be retrieved",{
  structures <- c("4hhb.A","4hhb")
  results <- get_structure_descriptions(structures)
  expect_that(names(results), equals(structures))
  expect_that(is.list(results), equals(TRUE))
})

test_that("Chemical information can be retrieved",{
  chems <- c("NAG")
  results <- get_chemical_descriptions(chems)
  expect_that(names(results), equals(chems))
  expect_that(is.list(results), equals(TRUE))
})