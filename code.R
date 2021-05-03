library(Matrix)
from_el_to_bimatrix <- function(el, mode1, mode2){
  
  if (is_tibble(el)) {
    el <- as.data.frame(el)
  }
  
  bimatrix <- spMatrix(nrow = length(unique(el[,mode1])),
                       ncol = length(unique(el[,mode2])),
                       i = as.numeric(factor(el[,mode1])),
                       j = as.numeric(factor(el[,mode2])),
                       x = rep(1, length(as.numeric(el[,mode1]))))
  
  rownames(bimatrix) <- levels(factor(el[,mode1]))
  colnames(bimatrix) <- levels(factor(el[,mode2]))
  bimatrix <- as.matrix(bimatrix)
  return(bimatrix)
}
