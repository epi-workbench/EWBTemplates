# 1️⃣  Start from a tiny Rocker image with a fixed R version
FROM rocker/r-ver:4.4.0         

# 2️⃣  Install Linux libraries your R packages need
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
      libcurl4-openssl-dev libssl-dev libxml2-dev && \
    rm -rf /var/lib/apt/lists/*

# 3️⃣  Pre-install devtools + testthat so tests run instantly
RUN R -q -e "install.packages(c('devtools','testthat'), repos='https://cloud.r-project.org')"

# 4️⃣  (Optional) install your package’s suggests/deps here
# RUN R -q -e "devtools::install_deps(dependencies = TRUE)"
