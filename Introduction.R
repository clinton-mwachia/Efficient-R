# Loading the required packages
library("microbenchmark") # for bench making
library("profvis") # profiling
library("ggplot2")

#Benchmarking is the process of testing the performance of specific operations repeatedly
#Profiling involves running many lines of code to find out where bottlenecks lie

## Bench Marking
#Benchmarking generally tests the execution time of one function against another
df = data.frame(v = 1:4, name = letters[1:4])
df
# three ways of doing things being tested
microbenchmark(df[3, 2], df[3, "name"], df$name[3])

## Profiling
# Profiling is about testing large chunks of code on what took longest
## excerise
x = 1:100

# Method 1: with a for loop (10 lines)
cs_for = function(x){
  for(i in x){
    if(i == 1){
      xc = x[i]
    } else {
      xc = c(xc, sum(x[1:i]))
    }
  }
  xc
}

# Method 2: with apply (3 lines)
cs_apply = function(x){
  sapply(x, function(x) sum(1:x))
}

microbenchmark(cs_for(x), cs_apply(x), cumsum(x), unit = 's', neval=1)
## solution to exercises
# browseVignettes(package="efficient")
