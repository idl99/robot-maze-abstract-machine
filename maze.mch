/* maze
* Author: Ihan Lelwala (2016030 / W1673607)
* Creation date: 23/11/2020
*/
MACHINE
    maze
    
CONSTANTS
    mazeX, mazeY, mazeStructure, internalMazeWalls, emptyMazeSquares, entranceSquare, exitSquare
    
PROPERTIES
    mazeX = 1..7 &
    mazeY = 1..5 &
    mazeStructure = mazeX * mazeY &
    
    internalMazeWalls <: mazeStructure &
    internalMazeWalls = {1|->3, 2|->1, 2|->3, 2|->5, 3|->3, 4|->2, 4|->3, 4|->4, 6|->1, 6|->2, 6|->4, 7|->4} &
    
    emptyMazeSquares <: mazeStructure &
    emptyMazeSquares /\ internalMazeWalls = {} &
    emptyMazeSquares \/ internalMazeWalls = mazeStructure &
    
    entranceSquare : emptyMazeSquares & 
    entranceSquare = 1|->1 &
    
    exitSquare : emptyMazeSquares & 
    exitSquare = 1|->5
    
END
