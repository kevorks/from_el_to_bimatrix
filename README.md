# from_el_to_bimatrix 

Function to convert an edgelist to its corresponding matrix for bipartite aka two-mode network data analysis.

``` r
library(tidyverse)
# create an edgelist
el <- tibble(mode1 = as.factor(sample(LETTERS, 20, replace = TRUE)),
             mode2 = as.factor(sample(letters, 20, replace = TRUE)))
head(el)
#> # A tibble: 6 x 2
#>   mode1 mode2
#>   <fct> <fct>
#> 1 U     c    
#> 2 K     w    
#> 3 D     x    
#> 4 N     r    
#> 5 D     r    
#> 6 X     q

# this means we will expect 12 rows 
length(table(el$mode1))
#> [1] 12

# and 13 columns in the matrix
length(table(el$mode2))
#> [1] 13

mat <- from_el_to_bimatrix(el, "mode1", "mode2")

# check out...
dim(mat)
#> [1] 12 13
mat
#>   a c f h j m q r t u v w x
#> A 1 0 0 0 0 1 0 0 0 0 0 0 0
#> D 0 0 0 0 0 0 0 2 0 1 0 0 1
#> H 0 0 1 0 0 0 0 0 0 0 0 0 0
#> J 0 0 0 1 0 0 0 0 0 0 0 0 0
#> K 0 1 0 0 0 0 0 0 0 0 0 1 0
#> L 0 0 0 0 0 0 0 0 0 0 0 0 1
#> M 0 0 0 0 0 0 0 0 0 0 1 0 0
#> N 0 0 0 1 0 0 0 1 1 0 0 0 0
#> R 0 0 0 0 1 0 0 0 0 0 0 0 0
#> U 0 1 0 0 0 0 0 0 0 0 0 0 0
#> V 0 0 0 0 0 0 0 0 1 0 0 0 0
#> X 0 1 0 0 0 0 1 0 0 0 0 0 0
```
