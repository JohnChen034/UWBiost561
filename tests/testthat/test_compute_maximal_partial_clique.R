# 1. Output correctness: should recover known partial clique
test_that("correct clique is found for simple input", {
  set.seed(42)
  sim <- generate_partial_clique(n = 10, clique_fraction = 0.5, clique_edge_density = 0.9)
  result <- compute_maximal_partial_clique(sim$adj_mat, alpha = 0.9)
  expect_gte(length(result$clique_idx), length(sim$clique_nodes) - 1)
  expect_gte(result$edge_density, 0.9)
})

# 2. Input validation: alpha out of range
test_that("alpha below 0.5 triggers error", {
  sim <- generate_partial_clique(n = 10, clique_fraction = 0.5, clique_edge_density = 0.9)
  expect_error(compute_maximal_partial_clique(sim$adj_mat, alpha = 0.4))
})

# 3. Structural validation: output is a list with correct fields
test_that("output structure is valid", {
  sim <- generate_partial_clique(n = 15, clique_fraction = 0.4, clique_edge_density = 0.8)
  result <- compute_maximal_partial_clique(sim$adj_mat, alpha = 0.8)
  expect_true(is.list(result))
  expect_named(result, c("clique_idx", "edge_density"))
})

# 4. Empty graph returns 1-node clique
test_that("empty graph returns 1-node clique", {
  adj <- diag(5)
  result <- compute_maximal_partial_clique(adj, alpha = 0.9)
  expect_equal(length(result$clique_idx), 1)
})

# 5. Efficient for large matrix, regardless of correctness
test_that("compute_maximal_partial_clique() runs under time limit", {
  sim <- generate_partial_clique(n = 30, clique_fraction = 0.4, clique_edge_density = 0.85)
  t <- system.time({
    result <- compute_maximal_partial_clique(sim$adj_mat, alpha = 0.85)
  })
  expect_lte(t[["elapsed"]], 30)
})
