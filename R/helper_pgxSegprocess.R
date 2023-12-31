extract.bin.feature <- function(data,genome='hg38', overlap = 1000){
    data(list=c(paste0(genome,'_bins')))
    bins <- get(paste0(genome,'_bins'))
    exclude.sexchr <- !c('X','Y') %in% unique(data[,2])
    if (all(exclude.sexchr)){
      bins <- bins[!bins[,2] %in% c('X','Y'),]
    }
    
    
    total_dup <- list()
    total_del <- list()
    
    
    for (sample_idx in seq_len(length(unique(data[,1])))){
        ind.data <- data[data[,1] %in% unique(data[,1])[sample_idx],]
        ind_dup <- rep(0,dim(bins)[1])
        ind_del<- rep(0,dim(bins)[1])
        for (j in seq_len(dim(ind.data)[1])){
            ind.seg.start <- ind.data[j,3]
            ind.seg.end <- ind.data[j,4]
            sel.bin <- which(bins$chromosome == ind.data[j,2] & bins[,4] > ind.seg.start & bins[,3] < ind.seg.end)
            overlap.dist <- sapply(sel.bin,function(x){min(bins[x,4],ind.seg.end)-max(bins[x,3],ind.seg.start)})
            sel.bin <- sel.bin[overlap.dist >= overlap]
            if (length(sel.bin) == 0){next}
            ind_dup[sel.bin] <- ind_dup[sel.bin] + as.numeric(ind.data[j,6] == 'DUP')
            ind_del[sel.bin] <- ind_del[sel.bin] + as.numeric(ind.data[j,6] == 'DEL')
        }
        ind_dup[ind_dup > 1] <- 1
        ind_del[ind_del > 1] <- 1
        total_dup[[sample_idx]] <- ind_dup
        total_del[[sample_idx]] <- ind_del
    }
    total_dup <- do.call(rbind,total_dup)
    total_del <- do.call(rbind,total_del)
    
    rownames(total_dup) <- unique(data[,1])
    rownames(total_del) <- unique(data[,1])
    
    feature.list <- list()
    feature.list[['dup']] <- total_dup
    feature.list[['del']] <- total_del
    feature.list[['bin']] <- bins
    return(feature.list)
}



