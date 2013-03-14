Vinyas Ramesh Kedigehalli
3498-8651-56


The program is written in Java. 

Commands to compile and run the code.
================================================================================
javac AStar.java
java AStar
================================================================================

Description
================================================================================
Movie Class: An Inner class that represent each of the data input movie. 
1. Stores the movie number, heuristic value, path cost, neighbors and flags. 
2. Neighbors are a Set of Movies in the built graph. Uses Java's LinkedHashSet. 
3. Have a constructor to initialize the required values.
4. Overrides toString() method of Object class to print the Movie in desired format.
5. Overrides equals() method of Object class to compare two movies in desired way.

--------------------------------------------------------------------------------
MyComparator: implements Comparator class to override the compare() method to 
compare based on heuristic for Greedy Search.  

MyComparator2: implements Comparator class to override the compare() method to 
compare based on the pathCost + heuristic for A* search. 
--------------------------------------------------------------------------------

buildGraph(): builds the graph of movies using the input array and sets the 
neighbors of each movie objects. Does it in O(MxN). 

--------------------------------------------------------------------------------

greedy(): Implements greedy search to find the traversal and path using only 
heuristic values. 
Uses LinkedList as a Queue to keep track of the elements. Each time before
computing which one to pop, the queue is sorted using MyComparator Object. 
Path is kept track using the "parent" varialbe of Movie class. 

--------------------------------------------------------------------------------
computeDS(): Computes the dissimilarity between two movies using the given input.
Asearch(): Implements A* search to find the traversal and path using both 
heuristic values and the pathcost to that movie from the root movie. 
Uses LinkedList as a Queue to keep track of the elements. Each time before 
computing which one to pop, the queue is sorted using MyComparator2 Object. 
Path is kept track using the "parent" element of Movie class.
--------------------------------------------------------------------------------
go(): A starter just to initiate the process. 

 
