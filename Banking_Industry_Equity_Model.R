## BUA 633 Term paper - Banking ##
## Shalini Chhetri ##

# Load the necessary packages
library("dplyr")
library("ggplot2")
library("tidyverse")
library("readxl")
library("moments")
library("tidyr")
library("broom")
library("YRmisc")
library("robust")
library("gam")
library("quantmod")
library("robustbase")

# Importing the two datasets
#spData - contains financial data of companies
spdata <- read_excel("spData.xlsx")
#spInfo - contains the sector and industry of companies
spinfo <- read_excel("spInfo.xlsx")

# Check the type/class of data and convert to dataframe
#spdata
data.class(spdata)
spdata<-as.data.frame(spdata)
data.class(spdata)
#spinfo
data.class(spinfo)
spinfo<-as.data.frame(spinfo)
data.class(spinfo)

# Merging the two datasets using common variable "tkr"
names(spdata)
names(spinfo)
spdf<-merge(spdata,spinfo,by="tkr")
dim(spdf)
names(spdf)

# Replace mm/dd/yyyy date format with yyyy
spdf$date
spdf$date<-as.numeric(substring(spdf$date,7,10)) # modify date to only keep year
names(spdf)
names(spdf)[2]<-"year"  # rename "date" to "year"
names(spdf)

#Filter the data for the latest year for cross-section analysis
csdf<-spdf[spdf$year==2022,]
csdf$mv<-csdf$cso*csdf$price ## multiply common stock outstanding with price to obtain market value
names(csdf)

## Filter for Banking industry as the industry to analyze and create a new data
myIndustry<-"Banks";  myIndustry
idf<-csdf[csdf$industry == myIndustry,
          c("tkr","price","eps","bvps","cr","dta","mv")]
dim(idf)

## Histogram of the variables
par(mfrow=c(2,3))
hist(idf$price,main="Fig. 1 - Hist. of Price", xlab = "price")
hist(idf$eps,main="Fig. 2 - Hist. of EPS", xlab = "Earnings per share")
hist(idf$bvps,main="Fig. 3 - Hist. of BVPS", xlab = "Book value per share")
hist(idf$cr,main="Fig. 4 - Hist. of CR", xlab = "Current ratio")
hist(idf$dta,main="Fig. 5 - Hist. of DTA", xlab = "Debt to asset ratio")

## Generate Scatterplots of each variable against price
par(mfcol=c(2,2))
scatter.smooth(idf$eps,idf$price, main = " Fig. 6 - Price vs EPS",
               xlab = "eps", ylab = "price")
scatter.smooth(idf$bvps,idf$price, main = "Fig. 7 - Price vs BVPS",
               xlab = "bvps", ylab = "price")
scatter.smooth(idf$cr,idf$price, main = "Fig. 8 - Price vs CR",
               xlab = "cr", ylab = "price")
scatter.smooth(idf$dta,idf$price, main = "Fig. 9 - Price vs DTA",
               xlab = "dta", ylab = "price")

## Alternate method to put scatterplots together
# Function of 3 vectors for plot
plotTkr<-function(x,y,z,xxlab,yylab,myTitle){
  scatter.smooth(x,y,type="n",xlab=xxlab,ylab=yylab,main=myTitle)
  text(x,y,z,cex=.6)  }
plotTkr
# Scatterplots
par(mfrow=c(2,2))
plotTkr(idf$eps,idf$price,idf$tkr,"eps","price","Fig. 6 - Price vs EPS")
plotTkr(idf$bvps,idf$price,idf$tkr,"bvps","price","Fig. 7 - Price v BVPS")
plotTkr(idf$cr,idf$price,idf$tkr,"cr","price","Fig. 8 - Price v CR")
plotTkr(idf$dta,idf$price,idf$tkr,"dta","price","Fig. 9 - Price v DTA")

## Summary of data
names(idf)
idf<-na.omit(idf)
ds.summ(idf[,c("price","eps","bvps","cr","dta")],2)
# Table of summary statistics
summary(idf[,c("price","eps","bvps","cr","dta")])
# Table of correlation
round(cor(idf[,c("price","eps","bvps","cr","dta")]),3)

## Regression Models
#Robust model
fit<-lmRob(price ~ eps+bvps+cr+dta,na.action=na.omit,data=idf)
cor(idf$price,predict(fit,idf))^2
summary(fit)

## Residual Plots
# Histogram
par(mfrow=c(2,2))
hist(fit$residuals, main = "Fig. 10 - Histogram of Residuals", xlab = "Residuals")
#Scatter
plotTkr(fit$fitted.values,idf$price,idf$tkr,"predicted price","actual price","Fig. 11 Price vs Fitted values")



