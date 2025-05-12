#' Generate a Random Partial Clique Adjacency Matrix
#'
#' This function creates an adjacency matrix representing a graph on \code{n} nodes,
#' where a subset of nodes form a partial clique. The number of nodes in the clique is
#' determined by \code{clique_fraction}, and the density of edges among the clique
#' nodes is controlled by \code{clique_edge_density}.
#'
#' @param n A positive integer. Total number of nodes in the graph.
#' @param clique_fraction A numeric value between 0 and 1 inclusive. The fraction of nodes that should form a partial clique.
#' @param clique_edge_density A numeric value between 0 and 1 inclusive. The density of edges among nodes in the partial clique.
#' @param edge_density Single numeric value between 0 and 1, Total edge density use to generate whole matrix, default to 0.2 .
#' @return A list with the following elements:
#' \describe{
#'   \item{adj_mat}{n x n symmetric adjacency matrix with 0s and 1s, 1s on the diagonal, and no dimnames.}
#'   \item{clique_nodes}{An integer vector indicating which nodes were selected as part of the partial clique.}
#'   \item{instructions}{A message describing how the partial clique was constructed.}
#' }
#'
#' @export
generate_partial_clique <-
  function(n,
           clique_fraction,
           clique_edge_density,
           edge_density = 0.2) {
    # Check if n is a single positive integer
    if (!is.numeric(n) || n <= 0 || length(n) != 1) {
      stop("n must be a single positive integer.")
    }

    # Check if clique_fraction is numeric in [0, 1]
    if (!is.numeric(clique_fraction) ||
        clique_fraction < 0 || clique_fraction > 1) {
      stop("clique_fraction must be a single numeric value between 0 and 1.")
    }

    # Check if clique_edge_density is numeric in [0, 1]
    if (!is.numeric(clique_edge_density) ||
        clique_edge_density < 0 || clique_edge_density > 1) {
      stop("clique_edge_density must be a single numeric value between 0 and 1.")
    }
    if (!is.numeric(edge_density) ||
        edge_density < 0 || edge_density > 1) {
      stop("edge_density must be a single numeric value between 0 and 1.")
    }

    m = round(n * clique_fraction)
    instructions <- paste0(
      round(n * clique_fraction),
      " nodes should be part of a partial clique. ",
      "Specifically, this means if your partial clique has m=",
      m,
      " nodes, then a (fully connected) clique would have ",
      m * (m - 1) / 2,
      " (i.e., m choose 2) edges. A partial clique with edge density of ",
      clique_edge_density,
      " would instead have at least ",
      round(clique_edge_density * m * (m - 1) / 2),
      " edges among the m nodes."
    )

    # Implementation

    adj_mat <- matrix(0, n, n)
    adj_mat[upper.tri(adj_mat)] <- sample(
      x = c(0, 1),
      size = n * (n - 1) / 2,
      prob = c(1 - edge_density, edge_density),
      replace = TRUE
    )
    adj_mat <- adj_mat + t(adj_mat)
    diag(adj_mat) <- 1


    # Build a partial clique
    m <- round(n * clique_fraction)
    clique_nodes <- sample(1:n, m)


    # Number of edges required in the clique
    num_possible_clique_edges <- choose(m, 2)
    required_clique_edges <-
      round(clique_edge_density * num_possible_clique_edges)

    # Generate all pairs in the clique
    clique_pairs <- combn(clique_nodes, 2, simplify = FALSE)

    # Randomly choose which pairs to keep as edges
    selected_pairs <- sample(clique_pairs, required_clique_edges)

    for (pair in selected_pairs) {
      i <- pair[1]
      j <- pair[2]
      adj_mat[i, j] <- 1
      adj_mat[j, i] <- 1
    }


    return(
      list(
        adj_mat = adj_mat,
        clique_nodes = clique_nodes,
        instructions = instructions
      )
    )
  }
