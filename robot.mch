/* robot
* Author: Ihan Lelwala (2016030 / W1673607)
* Creation date: 24/11/2020
*
* This machine defines the abstract specification for the Robot.
* The Robot moves through empty squares of a maze. It can move to an empty square in one of 4 directions: North, South, East, or West.
* In addition, it can also teleport to any empty square of the maze.
*/
MACHINE
    robot
    
SEES
    maze
    
SETS
    MESSAGES = {OPERATION_SUCCESSFUL, ERROR_AttemptToMoveToInternalWall, ERROR_AttemptToMoveOutOfMaze, YES, NO};
    VISITED_SQUARE = {VISITED, NOT_VISITED}
    
DEFINITIONS
    isEmptyMazeSquare(x, y) == (x |-> y : emptyMazeSquares);
    isOutOfBounds(x, y) == (x |-> y /: mazeStructure);

    /* ANIMATION_FUNCTION is the function that can be used to get ProB to draw a canvas to graphically animate the robot's movement through the maze
    * Reference: ProB's example of Queens on a chess board at <PROB_INSTALLATION_DIRECTORY>/Examples/GraphicalAnimation/NQueens.mch
    * ProB expects this function to be a definition of a set where each element is like row |-> column |-> animation_image_to_be_displayed
    */
    ANIMATION_FUNCTION == ( {row, column, image | row: mazeY & column: mazeX &
            
            
            (IF ({column |-> 6 - row} <: internalMazeWalls) // The reason why we have 6-r is because
                                                            // ProB draws the diagram from Top to Bottom unlike the
                                                            // coordinate system given in the spec where it goes from Bottom to Top
                THEN
                    // Internal wall square image
                    image = 1
                ELSE
                    IF (column = currentXLocation & row = (6 - currentYLocation)) // If this the column and row the robot is currently occupying
                                                                                  // (same as entry square at the beginning of the animation)
                    THEN
                        // Robot image
                        image = 2
                    ELSE
                        // Empty maze square image
                        image = 0
                    END
                END)});
    
    // Images for the ProB graphical animation
    ANIMATION_IMG0 == "images/empty_square.png";
    ANIMATION_IMG1 == "images/wall.png";
    ANIMATION_IMG2 == "images/robot.png";
    
VARIABLES
    currentXLocation, currentYLocation, robotMovementHistory
    
INVARIANT
    currentXLocation : mazeX &
    currentYLocation : mazeY &
    robotMovementHistory : seq(emptyMazeSquares)
    
INITIALISATION
    currentXLocation := prj1(mazeX, mazeY)(entranceSquare) ||
    currentYLocation := prj2(mazeX, mazeY)(entranceSquare) ||
    robotMovementHistory := [entranceSquare]
    
OPERATIONS
    
    // Operation to move the robot one square upwards
    message <-- moveNorth =
    BEGIN
        IF
            isEmptyMazeSquare(currentXLocation, currentYLocation + 1)
        THEN
            currentYLocation :=  currentYLocation + 1 ||
            robotMovementHistory := robotMovementHistory <- (currentXLocation |-> currentYLocation + 1) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds(currentXLocation, currentYLocation + 1)
            THEN
                message:= ERROR_AttemptToMoveOutOfMaze
            ELSE                
                message := ERROR_AttemptToMoveToInternalWall
            END                
        END
    END;
    
    // Operation to move the robot one square downwards
    message <-- moveSouth =
    BEGIN
        IF
            isEmptyMazeSquare(currentXLocation, currentYLocation - 1)
        THEN
            currentYLocation :=  currentYLocation - 1 ||
            robotMovementHistory := robotMovementHistory <- (currentXLocation |-> currentYLocation - 1) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds(currentXLocation, currentYLocation - 1)
            THEN
                message:= ERROR_AttemptToMoveOutOfMaze
            ELSE                
                message := ERROR_AttemptToMoveToInternalWall
            END                
        END
    END;
    
    // Operation to move the robot one square to the right
    message <-- moveEast =
    BEGIN
        IF
            isEmptyMazeSquare(currentXLocation + 1, currentYLocation)
        THEN
            currentXLocation :=  currentXLocation + 1 ||
            robotMovementHistory := robotMovementHistory <- (currentXLocation + 1 |-> currentYLocation) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds(currentXLocation + 1, currentYLocation)
            THEN
                message:= ERROR_AttemptToMoveOutOfMaze
            ELSE                
                message := ERROR_AttemptToMoveToInternalWall
            END
        END
    END;
    
    // Operation to move the robot one square to the left
    message <-- moveWest =
    BEGIN
        IF
            isEmptyMazeSquare(currentXLocation - 1, currentYLocation)
        THEN
            currentXLocation :=  currentXLocation - 1 ||
            robotMovementHistory := robotMovementHistory <- (currentXLocation - 1 |-> currentYLocation) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds(currentXLocation - 1, currentYLocation)
            THEN
                message:= ERROR_AttemptToMoveOutOfMaze
            ELSE                
                message := ERROR_AttemptToMoveToInternalWall
            END
        END
    END;
    
    // Operation to teleport the robot to any empty square within the maze
    // NOTE: the spec DOES NOT explicitly (clearly) mention that the robot cannot teleport to the exit square
    // Therefore as per the spec the robot may teleport to exit square and also entry square at any point
    message <-- teleport(newXPosition, newYPosition) =
    PRE
        message : MESSAGES &
        
        // Spec says this operation "inputs a SQUARE that the Robot attempts to teleport to" and since it says "SQUARE" 
        // i am interpreting that as a precondition that the input should be a coordinate pair for a SQUARE WITHIN THE BOUNDS OF THE MAZE
        // and not a coordinate that corresponds to outer SPACE outside the bounds of the maze.
        // The spec doesnt even define any coordinates for the space outside the maze.
        newXPosition : mazeX & // that is why i am precondition x position input on the range mazeX here instead of a predefined number set like NAT1
        newYPosition : mazeY   // same reason here
        
    THEN
        IF
            isEmptyMazeSquare(newXPosition, newYPosition)
        THEN
            currentXLocation := newXPosition ||
            currentYLocation := newYPosition ||
            robotMovementHistory := robotMovementHistory <- (newXPosition |-> newYPosition) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds(newXPosition, newYPosition)
            THEN
                message:= ERROR_AttemptToMoveOutOfMaze
            ELSE                
                message := ERROR_AttemptToMoveToInternalWall
            END
        END
    END;
    
    // Operation to get the current location of the robot
    robotLocation <-- getPosition = 
    BEGIN
        robotLocation := currentXLocation |-> currentYLocation 
    END;
    
    exitFound <-- foundExit = 
    BEGIN
        IF(currentXLocation |-> currentYLocation = exitSquare)
        THEN
            exitFound := YES
        ELSE
            exitFound := NO
        END
    END;
    
    // Operation to inquire whether the robot has visited a certain square 
    visitedSquare <-- hasVisitedSquare(xPosition, yPosition) =
    PRE
        visitedSquare : VISITED_SQUARE &
        xPosition : mazeX & 
        yPosition : mazeY
    THEN
        // We only need the unique set of robot's movements irrespective of the order (or sequence)
        // so we need to convert the sequence of the robot's movements back to a set.
        // That is why i am taking the range of the sequence to get the set of all unique robot movements (coordinate pairs).
        IF({xPosition |-> yPosition} <: ran(front(robotMovementHistory)))
        THEN
            visitedSquare := VISITED
        ELSE
            visitedSquare := NOT_VISITED
        END
    END;
    
    // Operation to inquire the path taken (i.e. sequence of squares visited) by the robot
    routeTaken <-- robotsRoute =
    BEGIN
        routeTaken := robotMovementHistory
    END
    
END
