# UWBiost561
 
# How to install
This package is called `UWBiost561`. To install, run the following code (in R):

```R
library(devtools)
devtools::install_github("jic034/UWBiost561")
```

Upon completion, you can run the following code (in R):
```R
library(UWBiost561)
UWBiost561::run_example()
```

 
## Dependencies
This package have no dependencies. 
 
 
## Session info

```R
> devtools::session_info()
─ Session info ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 setting  value
 version  R version 4.4.2 (2024-10-31)
 os       macOS Sequoia 15.5
 system   aarch64, darwin20
 ui       RStudio
 language (EN)
 collate  en_US.UTF-8
 ctype    en_US.UTF-8
 tz       America/Los_Angeles
 date     2025-06-12
 rstudio  2023.06.1+524 Mountain Hydrangea (desktop)
 pandoc   3.1.1 @ /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/ (via rmarkdown)
 quarto   1.3.353 @ /Applications/RStudio.app/Contents/Resources/app/quarto/bin/quarto

─ Packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 package     * version date (UTC) lib source
 askpass       1.2.1   2024-10-04 [1] CRAN (R 4.4.1)
 cachem        1.1.0   2024-05-16 [1] CRAN (R 4.4.1)
 callr         3.7.6   2024-03-25 [1] CRAN (R 4.4.0)
 cli           3.6.4   2025-02-13 [1] CRAN (R 4.4.1)
 credentials   2.0.2   2024-10-04 [1] CRAN (R 4.4.1)
 desc          1.4.3   2023-12-10 [1] CRAN (R 4.4.1)
 devtools      2.4.5   2022-10-11 [1] CRAN (R 4.4.0)
 digest        0.6.37  2024-08-19 [1] CRAN (R 4.4.1)
 ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.4.1)
 evaluate      1.0.3   2025-01-10 [1] CRAN (R 4.4.1)
 fastmap       1.2.0   2024-05-15 [1] CRAN (R 4.4.1)
 fs            1.6.5   2024-10-30 [1] CRAN (R 4.4.1)
 gert          2.1.5   2025-03-25 [1] CRAN (R 4.4.1)
 glue          1.8.0   2024-09-30 [1] CRAN (R 4.4.1)
 htmltools     0.5.8.1 2024-04-04 [1] CRAN (R 4.4.1)
 htmlwidgets   1.6.4   2023-12-06 [1] CRAN (R 4.4.0)
 httpuv        1.6.15  2024-03-26 [1] CRAN (R 4.4.0)
 knitr         1.49    2024-11-08 [1] CRAN (R 4.4.1)
 later         1.4.1   2024-11-27 [1] CRAN (R 4.4.1)
 lifecycle     1.0.4   2023-11-07 [1] CRAN (R 4.4.1)
 magrittr      2.0.3   2022-03-30 [1] CRAN (R 4.4.1)
 memoise       2.0.1   2021-11-26 [1] CRAN (R 4.4.0)
 mime          0.12    2021-09-28 [1] CRAN (R 4.4.1)
 miniUI        0.1.1.1 2018-05-18 [1] CRAN (R 4.4.0)
 openssl       2.3.2   2025-02-03 [1] CRAN (R 4.4.1)
 pillar        1.10.1  2025-01-07 [1] CRAN (R 4.4.1)
 pkgbuild      1.4.7   2025-03-24 [1] CRAN (R 4.4.1)
 pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.4.1)
 pkgdown       2.1.1   2024-09-17 [1] CRAN (R 4.4.1)
 pkgload       1.4.0   2024-06-28 [1] CRAN (R 4.4.0)
 processx      3.8.6   2025-02-21 [1] CRAN (R 4.4.1)
 profvis       0.4.0   2024-09-20 [1] CRAN (R 4.4.1)
 promises      1.3.2   2024-11-28 [1] CRAN (R 4.4.1)
 ps            1.9.0   2025-02-18 [1] CRAN (R 4.4.1)
 purrr         1.0.4   2025-02-05 [1] CRAN (R 4.4.1)
 R6            2.6.1   2025-02-15 [1] CRAN (R 4.4.1)
 Rcpp          1.0.14  2025-01-12 [1] CRAN (R 4.4.1)
 remotes       2.5.0   2024-03-17 [1] CRAN (R 4.4.1)
 rlang         1.1.5   2025-01-17 [1] CRAN (R 4.4.1)
 rmarkdown     2.29    2024-11-04 [1] CRAN (R 4.4.1)
 rprojroot     2.0.4   2023-11-05 [1] CRAN (R 4.4.1)
 rstudioapi    0.17.1  2024-10-22 [1] CRAN (R 4.4.1)
 sessioninfo   1.2.3   2025-02-05 [1] CRAN (R 4.4.1)
 shiny         1.10.0  2024-12-14 [1] CRAN (R 4.4.1)
 sys           3.4.3   2024-10-04 [1] CRAN (R 4.4.1)
 tibble        3.2.1   2023-03-20 [1] CRAN (R 4.4.0)
 urlchecker    1.0.1   2021-11-30 [1] CRAN (R 4.4.1)
 usethis       3.1.0   2024-11-26 [1] CRAN (R 4.4.1)
 vctrs         0.6.5   2023-12-01 [1] CRAN (R 4.4.0)
 whisker       0.4.1   2022-12-05 [1] CRAN (R 4.4.1)
 withr         3.0.2   2024-10-28 [1] CRAN (R 4.4.1)
 xfun          0.50    2025-01-07 [1] CRAN (R 4.4.1)
 xtable        1.8-4   2019-04-21 [1] CRAN (R 4.4.1)
 yaml          2.3.10  2024-07-26 [1] CRAN (R 4.4.1)

 [1] /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/library
```
