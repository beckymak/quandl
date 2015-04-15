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


