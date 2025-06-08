rm(list=ls())
load("~/simulation.RData")

library(ggplot2)
library(cowplot)

imp_numbers   <- 1:15
method_labels <- as.character(imp_numbers)

ggplot_list <- list()
idx <- 1

for(i in seq_along(alpha_vec)) {
  for(j in seq_along(n_vec)) {
    alpha      <- alpha_vec[i]
    n          <- n_vec[j]
    trial_list <- level_trial_list[[i]][[j]]

    # count wins
    trial_mat <- sapply(trial_list, function(res_list) {
      valid_vec <- vapply(res_list, `[[`, logical(1), "valid")
      sizes     <- vapply(res_list[valid_vec], function(x) length(x$clique_idx), integer(1))
      winners   <- names(sizes)[sizes == max(sizes)]
      setNames(names(res_list) %in% winners, names(res_list))
    })
    wins <- rowSums(trial_mat)

    # collect runtimes only for winners
    runtime_mat <- t(sapply(seq_along(trial_list), function(t) {
      res_list <- trial_list[[t]]
      runtimes <- vapply(res_list, `[[`, numeric(1), "runtime")
      runtimes[!trial_mat[,t]] <- NA
      runtimes
    }))
    colnames(runtime_mat) <- method_labels
    mean_rt <- colMeans(runtime_mat, na.rm = TRUE)

    df_wins <- data.frame(
      method      = method_labels,
      number_wins = wins,
      stringsAsFactors = FALSE
    )
    # order methods by descending wins
    df_wins$method <- factor(
      df_wins$method,
      levels = df_wins$method[order(-df_wins$number_wins)]
    )

    df_rt <- data.frame(
      method    = method_labels,
      mean_time = mean_rt,
      stringsAsFactors = FALSE
    )
    # only keep winners and order by descending runtime
    winners_rt <- df_wins$method[df_wins$number_wins > 0]
    df_rt <- df_rt[df_rt$method %in% winners_rt, ]
    df_rt$method <- factor(
      df_rt$method,
      levels = df_rt$method[order(-df_rt$mean_time)]
    )

    # plot wins
    p1 <- ggplot(df_wins, aes(x = method, y = number_wins)) +
      geom_col() +
      labs(
        title = paste("wins — α =", alpha, ", n =", n),
        x     = "Method",
        y     = "Number of wins"
      ) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

    # plot runtime
    p2 <- ggplot(df_rt, aes(x = method, y = mean_time)) +
      geom_col() +
      labs(
        title = "avg runtime (s) for winners",
        x     = "Method",
        y     = "Mean runtime (s)"
      ) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

    # stack the two
    ggplot_list[[idx]] <- plot_grid(p1, p2, ncol = 1, align = "v")
    idx <- idx + 1
  }
}

plot_all <- plot_grid(plotlist = ggplot_list, ncol = 2)

ggsave(
  "/Users/johnchen/Desktop/2025_Spring/BIOST 561/UWBiost561/vignettes/simulation_plot.png",
  plot_all, height = 20, width = 9, units = "in"
)
