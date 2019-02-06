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
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds


