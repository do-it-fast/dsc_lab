library(arules)
library(arulesViz)

df <- list(  
  c("apple", "beer", "rice", "meat"),
  c("apple", "beer", "rice"),
  c("apple", "beer"), 
  c("apple", "pear"),
  c("milk", "beer", "rice", "meat"), 
  c("milk", "beer", "rice"), 
  c("milk", "beer"),
  c("milk", "pear")
)
trans <- as(df,'transactions')
print(trans)
itemFrequencyPlot(trans,topN=10)

model <- apriori(trans, parameter = list(support=0.1,confidence=0.2))

plot(model, method='graph', measure='confidence')