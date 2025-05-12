context("Testing generate_partial_clique")

test_that("generate_partial_clique works", {
  set.seed(10)
  res <- generate_partial_clique(n = 10,
                                 clique_fraction = 0.5,
                                 clique_edge_density = 0.9)

  expect_true(is.list(res))
  expect_true(is.matrix(res$adj_mat))
  expect_true(all(dim(res$adj_mat) == c(10,10)))
})

test_that("generate_partial_clique() returns correct dimensions", {
  set.seed(1)
  sim <- generate_partial_clique(n = 10, clique_fraction = 0.5, clique_edge_density = 0.8)
  expect_true(is.matrix(sim$adj_mat))
  expect_equal(dim(sim$adj_mat), c(10, 10))
})

test_that("generate_partial_clique() returns valid clique size", {
  set.seed(1)
  sim <- generate_partial_clique(n = 20, clique_fraction = 0.3, clique_edge_density = 0.9)
  expect_gte(length(sim$clique_nodes), 5)
  expect_true(all(sim$adj_mat[cbind(sim$clique_nodes, sim$clique_nodes)] == 1))  # Diagonal
})
