# Exercise 5-18
### Problem ###
# Consider a set of movies M1, M2, M3. There is a set of customers each one of which indicates the two movies they would like to see this weekend.
# Movies are shown on Saturday evening and Sunday evening .Multiple movies may be screened at the same time.
#
# You must decide which movies should be televies on Saturday and which on Sunday, so that every customer gets to see the two movies they desire. Is there a schedule
# so that every customer gets to see the two movies they desire? Is there a shcedule where each movies is shown at most once? Design an efficient algorhtm to 
# find such a schedule if it exists.
### End ###
# 
# This problem can be broken down into a graph where vertices are movies and edges are links between two movies that someone wants 
# to watch. To find an appropriate schedule it is key to note the fact that there are only two showing times. This lends itself to 
# a bipartite solution where if we can successfully two-color the graph then there exists a schedule which satisfies our original 
# requirement
#
#  Because this is a standard bipartite solution I'll skip the implementation
