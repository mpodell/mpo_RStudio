FROM rocker/tidyverse
MAINTAINER Mike O'Dell (modell@rethink-analytics.com)

# install R package dependencies
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    ## clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
    

## Install packages from CRAN
RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    xml2 \
    rvest \
    testthat \
    Rcpp \
    googleAuthR \
    googleCloudStorageR \
    googleComputeEngineR \
    bigrquery \
    jsonlite \
    future \
    listenv \
    magrittr \
    lubridate \
    ngram \
    igraph \
    foreach \
    ## install Github packages
    && Rscript -e "devtools::install_github("mpodell/rdiscourse", auth_token = "f9cf11d60f99e7d2f9e8bdd06d0a74cb7ea827b9")" \
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds


