/* maze
* Author: Ihan Lelwala (2016030 / W1673607)
* Creation date: 23/11/2020
*
* This machine defines the abstract specification for the Maze.
* The Maze is the structure through which the Robot moves to get from a certain entry point to another exit point.
* The Maze is made up of squares. Each of these squares are represented by a coordinate pair,
* and each square can either be empty and allow the robot to occupy that square to move through the maze
* or it can be occupied by an internal wall and refrain the robot from occupying that square.
*/
MACHINE
    maze
    
CONSTANTS
    mazeX, mazeY, mazeStructure, internalMazeWalls, emptyMazeSquares, entranceSquare, exitSquare
    
PROPERTIES
    mazeX = 1..7 & // The maze has 7 columns
    mazeY = 1..5 & // and 5 rows
    
    // Cartesian product of X and Y dimensions make up the set of coordinate pairs, each corresponding to a square 
    // and this collection of coordinate pairs (or squares) corresponds to the grid structure
    mazeStructure = mazeX * mazeY &
    
    // Walls are put up in certain coordinate pairs of the grid to form a "maze"
    internalMazeWalls <: mazeStructure & 
    internalMazeWalls = {1|->3, 2|->1, 2|->3, 2|->5, 3|->3, 4|->2, 4|->3, 4|->4, 6|->1, 6|->2, 6|->4, 7|->4} &
    
    // Empty maze squares are the squares through which a robot can move through a maze
    emptyMazeSquares <: mazeStructure &
    
    // None of the squares are both empty and occupied by a wall
    emptyMazeSquares /\ internalMazeWalls = {} &
    
    // All squares should EITHER be EMPTY or OCCUPIED BY A WALL
    emptyMazeSquares \/ internalMazeWalls = mazeStructure &
    
    // The robot can enter the maze only through an empty maze square
    entranceSquare : emptyMazeSquares &
    
    // Explicitly define the entry point for any robot
    // Assumption is all robots will enter the maze through the same point
    // since the spec doesn't explicitly (clearly) mention that different robots can have different entry points
    entranceSquare = 1|->1 &

    // The robot can exit the maze only through an empty maze square
    exitSquare : emptyMazeSquares & 

    // Explicitly define the exit point for any robot
    // Same assumption taken as the entry point
    exitSquare = 1|->5
    
END
