## Base plot
library(Quandl)

sdate = "1990-01-01"
edate = "2015-03-31"
hsi = Quandl("YAHOO/INDEX_HSI", type = "zoo", start_date = sdate, end_date = edate)

sp = Quandl("YAHOO/INDEX_GSPC", type = "zoo", start_date = sdate, end_date = edate)

data = merge(hsi,sp)
head(data)

par(mfrow=c(2,1))
plot(data$Close.hsi, type="l", main="HSI")
plot(data$Close.sp, type="l", main="S&P")


#---
## quantmod chartSeries
library(Quandl)
library(quantmod)

sdate = "2014-01-01"
edate = "2015-03-31"

hsi = Quandl("YAHOO/INDEX_HSI", type = "xts", start_date = sdate, end_date = edate)
sp = Quandl("YAHOO/INDEX_GSPC", type = "xts", start_date = sdate, end_date = edate)
sci = Quandl("YAHOO/INDEX_SSEC", type = "xts", start_date = sdate, end_date = edate)
chartSeries(hsi)
chartSeries(sp)
chartSeries(sci)

#---
## quantmode loop assignment
library(Quandl)
library(quantmod)

sdate = "2014-01-01"
edate = "2015-03-31"

index = c("HSI", "GSPC", "SSEC")
qcode = paste("YAHOO/INDEX_",index,sep="")
data = list()
for(i in 1:length(index)){
    data[[i]] = Quandl(qcode[i], type = "xts", start_date = sdate, end_date = edate)
}
# data = lapply(qcode, Quandl, type = "xts", start_date = sdate, end_date = edate) #not tested
lapply(data, chartSeries) # all volume on one 
