# Corresponding to v0.5.9.4 tag on BitBucket
# https://bitbucket.org/liulab/mageck/commits/tag/v0.5.9.4
FROM davidliwei/mageck:dee56d103bc0081491d3d7d89652add1d4efde8f

# Install R for MAGeCK PDF report generation (skipped otherwise)
RUN apt-get update && apt-get install --no-install-recommends -y \
	r-base \
	r-cran-knitr \
	r-cran-xtable \
	texinfo \
	texlive \
	texlive-latex-extra \
	&& rm -rf /var/lib/apt/lists/*

LABEL maintainer="Bruno Grande <bruno.grande@sagebase.org>"
LABEL base_image="davidliwei/mageck:dee56d103bc0081491d3d7d89652add1d4efde8f"
LABEL about.summary="Docker image for the MAGeCK bioinformatics tool"
LABEL about.license="SPDX:MIT"
