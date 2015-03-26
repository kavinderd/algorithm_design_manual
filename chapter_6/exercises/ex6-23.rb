# Exercise 6-23
### Problem ###
# Arbitrage is the use of discrepancies in currency-exchange rates to make a profit. 
# For example, there may be a small window of time during which 1 U.S. dollar buys 0.75 British pounds, 
# 1 British pound buys 2 Australian dollars, and 1 Australian dollar buys 0.70 U.S. dollars. 
# At such a time, a smart trader can trade one U.S. dollar and end up with 0.75×2×0.7=1.05 U.S. dollars---a profit of 5%. 
# Suppose that there are n currencies c1,...,cn and an n×n table R of exchange rates, such that one unit of currency ci buys R[i,j] units of currency cj.
# Devise and analyze an algorithm to determine the maximum value of R[c1,ci1]⋅R[ci1,ci2]⋯R[cik−1,cik]⋅R[cik,c1] Hint: think all-pairs shortest path. 
### End ###
#
# Run Floyd-Warshall's algorithm and keep track of the greatest weights as you go along for each path between any two currencies.
#
# Will impelment later

