#' A dataframe containing cytoband annotation details extracted from the hg19 gennome. 
#' It is used for CNV frequency visualization.  
#'
#' @source \url{http://hgdownload.cse.ucsc.edu/goldenpath/hg19/database/cytoBand.txt.gz}
#' @return cytoband of hg19 genome
#'
"hg19_cytoband"
#'
#' A dataframe containing cytoband annotation details extracted from the hg38 gennome.
#' It is used for CNV frequency visualization. 
#'
#' @source \url{http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/cytoBand.txt.gz}
#' @return cytoband of hg38 genome
#'
"hg38_cytoband"
#'
#' A dataframe containing location information for 1MB-size bins within the hg19 genome. 
#' This dataset is generated based on the accessed cytoband data and used for 
#' CNV frequency calculation from local pgxseg files.
#' @return genomic bin locations of hg19 genome
#'
"hg19_bins"
#'
#' A dataframe containing location information for 1MB-size bins within the hg38 genome. 
#' This dataset is generated based on the accessed cytoband data and used for 
#' CNV frequency calculation from local pgxseg files.
#' @return genomic bin locations of hg38 genome
#'
"hg38_bins"