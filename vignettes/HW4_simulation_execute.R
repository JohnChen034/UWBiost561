rm(list=ls())
set.seed(10)
library(UWBiost561)

imp_numbers <- 1:15
trials <- 3
alpha_vec <- c(0.5, 0.95)
n_vec <- c(15, 20, 25, 30)

level_trial_list <- lapply(alpha_vec, function(alpha) {
  lapply(n_vec, function(n) {
    message("alpha: ", alpha, "  n: ", n)

    trial_list <- lapply(seq_len(trials), function(trial) {
      message("  trial: ", trial)
      set.seed(trial)

      data    <- generate_partial_clique(
        n                   = n,
        clique_fraction     = 0.9,
        clique_edge_density = 0.9
      )
      adj_mat <- data$adj_mat

      result_list <- lapply(imp_numbers, function(imp_number) {
        set.seed(trial)
        cat("*")

        start_time <- Sys.time()
        res <- compute_maximal_partial_clique_master_safe(
          adj_mat    = adj_mat,
          alpha      = alpha,
          number     = imp_number,
          time_limit = 30
        )
        end_time <- Sys.time()
        res$runtime <- as.numeric(difftime(end_time, start_time, units = "secs"))
        res
      })
      names(result_list) <- paste0("impl", imp_numbers)
      cat("\n")
      result_list
    })
    names(trial_list) <- paste0("trial", seq_len(trials))
    message("====")
    trial_list
  })
})
names(level_trial_list) <- paste0("alpha:", alpha_vec)

for(i in seq_along(level_trial_list)) {
  names(level_trial_list[[i]]) <- paste0("n:", n_vec)
}

# it's always useful to save the date and R session info
date_of_run <- Sys.time()
session_info <- devtools::session_info()

save(level_trial_list,
     alpha_vec,
     n_vec,
     imp_numbers,
     trials,
     date_of_run, session_info,
     file = "~/simulation.RData")

