# HI FRIENDS! 

#Load data as SPRdata:
SPRdata <- read.csv("SPR.txt", header = TRUE, sep = "\t", dec = ".")
#Get rid of cycle and date - IS THIS CORRECT, I DONT KNOW????
SPRdata <- subset(SPRdata, select = c("Response", "Enzyme", "EnzymeConc", "DetStock", "CaStock"))
#Factor the relevant variables:
SPRdata$Enzyme <- as.factor(SPRdata$Enzyme)
SPRdata$EnzymeConc <- as.factor(SPRdata$EnzymeConc)
SPRdata$DetStock <- as.factor(SPRdata$DetStock)
SPRdata$CaStock <- as.factor(SPRdata$CaStock)
#Inspect data:
str(SPRdata)
summary(SPRdata)
pairs(SPRdata, panel = panel.smooth, col = SPRdata$Enzyme)
