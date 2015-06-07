context("Test file metadata retrieval")

test_that("PDB current lists can be retrieved",{
  results <- list_pdbs("current")
  expect_true(is.character(results))
  expect_true(length(results) > 0)
})

test_that("PDB obsolete lists can be retrieved",{
  results <- list_pdbs("obsolete")
  expect_true(is.character(results))
  expect_true(length(results) > 0)
})

test_that("PDB unreleased lists can be retrieved",{
  results <- list_pdbs("unreleased")
  expect_true(is.character(results))
  expect_true(length(results) > 0)
})

test_that("PDB file descriptions can be retrieved",{
  files <- c("116L","100D","14PS")
  results <- get_pdb_description(files)
  expect_that(names(results), equals(files))
  expect_that(is.list(results), equals(TRUE))
})