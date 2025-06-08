context("Simulation function")




test_that("implementation7's error should be taken care", {
  set.seed(10)
  library(UWBiost561)

  data <- generate_partial_clique(n = 15,
                                              clique_fraction = 0.9,
                                              clique_edge_density = 0.9)
  adj_mat <- data$adj_mat

  res <- compute_maximal_partial_clique_master_safe(adj_mat = adj_mat,
                                               alpha = 0.95,
                                               number = 7,
                                               time_limit = 30)
  expect_true(is.na(res$clique_idx))
  expect_true(is.na(res$edge_density))
  expect_equal(res$status, "error")
  expect_false(res$valid)

})

test_that("other implements should runs fine", {
  set.seed(10)
  library(UWBiost561)

  data <- generate_partial_clique(n = 15,
                                  clique_fraction = 0.9,
                                  clique_edge_density = 0.9)
  adj_mat <- data$adj_mat

  res <- compute_maximal_partial_clique_master_safe(adj_mat = adj_mat,
                                                    alpha = 0.95,
                                                    number = 14,
                                                    time_limit = 30)
  expect_true(is.vector(res$clique_idx))
  expect_false(is.na(res$edge_density))
  expect_equal(res$status, "completed")
  expect_true(res$valid)

})
