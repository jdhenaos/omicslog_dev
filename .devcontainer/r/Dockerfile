# Pin R version here (adjust as needed)
FROM rocker/r-ver:4.4.2

ENV DEBIAN_FRONTEND=noninteractive

# System deps commonly needed for Bioconductor + ggplot + compilation
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    ca-certificates \
    locales \
    build-essential \
    pkg-config \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libcairo2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libglpk-dev \
    && rm -rf /var/lib/apt/lists/*

# Locale (helps with some R packages / rendering)
RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Install renv in the system library (project will still use renv.lock)
RUN R -q -e "install.packages('renv', repos='https://cloud.r-project.org')"

# --- Quarto (pin version for reproducible rendering) ---
ENV QUARTO_VERSION=1.5.57
RUN wget -q "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" \
    && dpkg -i "quarto-${QUARTO_VERSION}-linux-amd64.deb" \
    && rm -f "quarto-${QUARTO_VERSION}-linux-amd64.deb"

# Optional: speed up / standardize renv cache location (persisted via volume)
ENV RENV_PATHS_CACHE=/opt/renv/cache

WORKDIR /workspaces/project

