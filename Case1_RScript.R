# HI FRIENDS! 

#################### START: INITIAL INSPECTION OF DATA ########################

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
#Inspecting "Hardness detergent" and "Enzyme concentration" with boxplots:
par(mfrow = c(1,2))
boxplot(Response ~ DetStock, SPRdata, ylab = "Response")
boxplot(Response ~ EnzymeConc, SPRdata, ylab = "Response")
###### Higher response values to be expected in the Det+ experiments and high enzyme concentrations
###### as they have higher means. An ANOVA test should be able to test wether the means are significantly
###### different from each other.

#################### END: INITIAL INSPECTION OF DATA ##########################


#################### START: FIRST ANALYSIS OF POINT 1 IN CASE #################
# How does hardness detergent influence the catalytic activity
# Perform one-way Anova:
lm1 <- lm(Response ~ DetStock, SPRdata)
anova(lm1)
# Check model assumptions
par(mfrow = c(1,2))
plot(lm1, col = SPRdata$DetStock, which = 1:2)
# Interpret lm1
summary(lm1)

#################### END: FIRST ANALYSIS OF POINT 1 IN CASE #################