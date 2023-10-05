data= read.csv("weight-height.csv")
library(psych)
library(magrittr)
corPlot(data)
summary(data)
train <- data

wmodel <- lm(Weight ~ Height + Gender,data=train)
summary(wmodel)

g=readline(prompt="Enter the person's gender(Male/Female): ")
if ((g=="Male") || (g=="male")){
  g=0
}else{
  g=1
}
h=readline(prompt="Enter the height in inches: ")
h=as.integer(h)

test <- data.frame(
  Height = h,
  Gender = g
)
predweight <- predict(wmodel,test) %>% round(1)
test$Estimated_Weight <- predweight
print(test)

