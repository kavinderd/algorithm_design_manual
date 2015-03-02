# Exercise 5-31
### Problem ###
# Which data structures are used in depth-first and breadth-first search?
### End ###
#
# A Bread first search uses a queue which follows a FIFO behavior which ensures that the next vertex is the first undiscovered one we've found.
#
# A Depth First Search uses a stack or can alternatively built using recursion. A stack is effective for a DFS because our aim is to go as deep as possible, it follows that when we encounter a new vertex it should be immediately be processed.
