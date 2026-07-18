required_packages <- c("coda", "rjags")

missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_packages) > 0) {
  install.packages(missing_packages, repos = "https://cloud.r-project.org")
} else {
  cat("Required R packages are already installed.\n")
}

cat(
  "Note: rjags also requires the JAGS system runtime: ",
  "https://mcmc-jags.sourceforge.io/\n",
  sep = ""
)
