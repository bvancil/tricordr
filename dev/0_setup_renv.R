if (!requireNamespace("remotes"))
  install.packages("remotes")

remotes::install_github("rstudio/renv")

renv::init()

renv::install()

renv::update()

renv::snapshot()
