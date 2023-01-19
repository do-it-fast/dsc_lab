
df = data.frame(x= c(1.2,3.2,3.3,4.8,2.4,7.9,7.1,8.4,9.3,9.0,7.8,6.5,6.9,9.9), y= c(0,0,0,0,0,0,1,1,1,1,1,1,1,1))
# model <- glm(y ~ x,data=df, family=binomial(link="logit"))
library(ggplot2)

ggplot(df, aes(x=x, y=y))+geom_point()+ stat_smooth(method='glm', method.args=list(family=binomial),se=FALSE)
