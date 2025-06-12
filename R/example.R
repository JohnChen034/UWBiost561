#' run an example
#'
#'
#' @return a result of compute_maximal_partial_clique
#' @export
run_example <- function(){
  set.seed(0)
  adj_mat <- UWBiost561::generate_partial_clique(
    n = 10,
    clique_fraction = 0.5,
    clique_edge_density = 0.9
  )$adj_mat


  res <- UWBiost561::compute_maximal_partial_clique(
    adj_mat = adj_mat,
    alpha = 0.9
  )
  res
  list(
    adj_mat=adj_mat,
    res = res
  )
}
