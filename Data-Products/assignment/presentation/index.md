---
title       : Bikes in SP Dataset
subtitle    : The beginning of a big study
author      : Ana Vitória Baraldi
job         : Economist
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Why?

Hey everyone! :)

I've starting collecting some data to study the habits changes that the implementation of new bike paths in São Paulo/Brazil will make in the bike usage. 
A lot of people complain that no one will use it, I wanna see if this is true.

---  

## Data
I collect 8 variables, let's take a look at it:

1. `d`: date, when the new data was collected
2. `st`, `eh`: it's the time part, `st` stands for start hour and `eh` for end hour
3. `c`: it's the climate, it can be: cloudy, clear sky, drizzling and raining
4. `l`: it's the location, which bike path I am collecting the data
5. `st`: checks if we are in a Daylight Saving Time
6. `t`: it's the temperature in Celsius
7. `b`: stands for bikes, it's the most important variable, how many bikes I've seen during the time interval

---

## Data
Let's look to the head of our data frame:

```
##            d       sh       eh         c       l  b st  t
## 1 2016-02-17 19:44:00 19:57:00 drizzling berrini 21  1 24
## 2 2016-02-18 08:59:00 09:20:00    cloudy berrini 32  1 23
## 3 2016-02-19 09:35:00 09:50:00 clear_sky berrini 41  1 25
## 4 2016-02-21 17:50:00 18:00:00 clear_sky berrini 11  0 25
## 5 2016-02-23 09:37:00 09:48:00 clear_sky berrini 19  0 24
```

After that, we need to create another variable `bikes_per_minute`. All the analysis is going to be done with it. It is calculated by the number of bikes divided by the difference in minutes between the `start hour` and the `end hour`. Here is the calculation for the first row:


```
## [1] 1.62
```

---

## ShinyApp

Our ShinyApp was made to input new data for our bikes in SP dataset.
It's just the beginning of the study. We are now collecting our data.
Hope to have nice results in the future!

Thanks :)


