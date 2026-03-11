# Minimal smoke test for R container
message("R version: ", R.version.string)

# Ensure renv works
if (!requireNamespace("renv", quietly = TRUE)) {
  stop("renv not installed")
}

# Optional: install a tiny plotting stack in project env if not present
pkgs <- c("ggplot2")
missing <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing) > 0) {
  message("Installing missing packages: ", paste(missing, collapse = ", "))
  install.packages(missing, repos = "https://cloud.r-project.org")
}

library(ggplot2)

df <- data.frame(x = 1:10, y = (1:10)^2)
p <- ggplot(df, aes(x, y)) + geom_point() + ggtitle("Smoke test plot")

dir.create("results", showWarnings = FALSE)
ggsave("results/smoke_plot.png", p, width = 6, height = 4, dpi = 150)

message("R smoke test completed; wrote results/smoke_plot.png")

