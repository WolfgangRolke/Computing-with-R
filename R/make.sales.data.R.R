f <- function() {
  x<-rchisq(1231, 2)
  print(seq_along(x)[x==min(x)])
  print(seq_along(x)[x==max(x)])
  x<-sprintf("%.2f", 1e5*x)
  x<-gsub("\\.", ",", x)
  z<-strsplit(x, ",")
  for(i in 1:1231) 
    if(nchar(z[[i]][2])==1) x[i]<-paste0(x[i],"0")
  for(i in 1:1231) {
    if(nchar(x[i])>6)
      x[i] <- paste0(substring(x[i], 1, nchar(x[i])-6),
                     " ", 
                   substring(x[i], nchar(x[i])-5, nchar(x[i])))
    if(nchar(x[i])>10)
      x[i] <- paste0(substring(x[i], 1, nchar(x[i])-10),
                     " ", 
                     substring(x[i], nchar(x[i])-9, nchar(x[i])))
    x[i] <- paste0(paste0(rep(" ", 14-nchar(x[i])), collapse=""),
                 x[i])
  }
  write(x, "sales.txt", ncol=3)  
    

}