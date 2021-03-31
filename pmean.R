pmean<-function(directory,pollutant,id=1:332){
  setwd("/Users/alinanastasyak/Desktop/пари 5 2/R")
  sum_pollutant=0
  count_pollutant=0
  for (i in id){
    fl=paste0(directory,'/',i,'.csv')
    df<-read.csv(file=fl)
    sum_pollutant=sum_pollutant+colSums(df[pollutant],na.rm = TRUE)
    count_pollutant=count_pollutant+colSums(df[pollutant],na.rm = TRUE)/colMeans(df[pollutant],na.rm = TRUE)
  }
  return(sum_pollutant/count_pollutant)
}

complete<-function(directory,id){
  setwd("/Users/alinanastasyak/Desktop/пари 5 2/R")
  nobs<-c()
  j=1
  for (i in id){
    fl=paste0(directory,'/',i,'.csv')
    df<-read.csv(file=fl)
    sum_pollutant=0
    sum_pollutant=colSums(df[2],na.rm = TRUE)
    nobs[j]=colSums(df[2],na.rm = TRUE)/colMeans(df[2],na.rm = TRUE)
    j=j+1
  }
  return(data.frame(id,nobs))
}


corr = function(directory, threshold = 0) {
  setwd("/Users/alinanastasyak/Desktop/пари 5 2/R")
  corelations = numeric()
  for (i in 1:332){
    fl=paste0(directory,'/',i,'.csv')
    df<-na.omit(read.csv(file=fl))
    if (nrow(df) > threshold){
      corelations = c(corelations,cor(df['sulfate'], df['nitrate']))
    }
  }
  return(corelations)
}