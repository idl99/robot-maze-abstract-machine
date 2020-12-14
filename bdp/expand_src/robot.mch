/* robot
* Author: Ihan Lelwala (2016030 / W1673607)
* Creation date: 24/11/2020
*/
MACHINE
    robot

SEES
    maze

SETS
    MESSAGES = { OPERATION_SUCCESSFUL , ERROR_AttemptToMoveToInternalWall , ERROR_AttemptToMoveOutOfMaze , YES , NO } ;
    VISITED_SQUARE = { VISITED , NOT_VISITED }

DEFINITIONS
    isEmptyMazeSquare ( x , y ) == ( x |-> y : emptyMazeSquares ) ;
    isOutOfBounds ( x , y ) == ( x |-> y /: mazeStructure ) ;




    ANIMATION_FUNCTION == ( { r , c , i | r : mazeY & c : mazeX & ( IF ( { c |-> 6 - r } <: internalMazeWalls )
                THEN
                    i = 1
                ELSE
                    IF ( c = currentXLocation & r = ( 6 - currentYLocation ) )
                    THEN
                        i = 2
                    ELSE
                        i = 0
                    END
                END ) } ) ;
    ANIMATION_IMG0 == "images/empty_square.png" ;
    ANIMATION_IMG1 == "images/wall.png" ;
    ANIMATION_IMG2 == "images/robot.png" ;

ABSTRACT_VARIABLES
    currentXLocation , currentYLocation , robotMovementHistory

INVARIANT
    currentXLocation : mazeX &
    currentYLocation : mazeY &
    robotMovementHistory : seq ( emptyMazeSquares )

INITIALISATION
    currentXLocation := prj1 ( mazeX , mazeY ) ( entranceSquare ) ||
    currentYLocation := prj2 ( mazeX , mazeY ) ( entranceSquare ) ||
    robotMovementHistory := [ entranceSquare ]

OPERATIONS
    message <-- moveNorth =
    BEGIN
        IF
            isEmptyMazeSquare ( currentXLocation , currentYLocation + 1 )
        THEN
            currentYLocation :=  currentYLocation + 1 ||
            robotMovementHistory := robotMovementHistory <- ( currentXLocation |-> currentYLocation + 1 ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds ( currentXLocation , currentYLocation + 1 )
            THEN
                message := ERROR_AttemptToMoveOutOfMaze
            ELSE
                message := ERROR_AttemptToMoveToInternalWall
            END
        END
    END ;

    message <-- moveSouth =
    BEGIN
        IF
            isEmptyMazeSquare ( currentXLocation , currentYLocation - 1 )
        THEN
            currentYLocation :=  currentYLocation - 1 ||
            robotMovementHistory := robotMovementHistory <- ( currentXLocation |-> currentYLocation - 1 ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds ( currentXLocation , currentYLocation - 1 )
            THEN
                message := ERROR_AttemptToMoveOutOfMaze
            ELSE
                message := ERROR_AttemptToMoveToInternalWall
            END
        END
    END ;

    message <-- moveEast =
    BEGIN
        IF
            isEmptyMazeSquare ( currentXLocation + 1 , currentYLocation )
        THEN
            currentXLocation :=  currentXLocation + 1 ||
            robotMovementHistory := robotMovementHistory <- ( currentXLocation + 1 |-> currentYLocation ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds ( currentXLocation + 1 , currentYLocation )
            THEN
                message := ERROR_AttemptToMoveOutOfMaze
            ELSE
                message := ERROR_AttemptToMoveToInternalWall
            END
        END
    END ;

    message <-- moveWest =
    BEGIN
        IF
            isEmptyMazeSquare ( currentXLocation - 1 , currentYLocation )
        THEN
            currentXLocation :=  currentXLocation - 1 ||
            robotMovementHistory := robotMovementHistory <- ( currentXLocation - 1 |-> currentYLocation ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds ( currentXLocation - 1 , currentYLocation )
            THEN
                message := ERROR_AttemptToMoveOutOfMaze
            ELSE
                message := ERROR_AttemptToMoveToInternalWall
            END
        END
    END ;

    message <-- teleport ( newXPosition , newYPosition ) =
    PRE
        message : MESSAGES &
        newXPosition : mazeX &
        newYPosition : mazeY
    THEN
        IF
            isEmptyMazeSquare ( newXPosition , newYPosition )
        THEN
            currentXLocation := newXPosition ||
            currentYLocation := newYPosition ||
            robotMovementHistory := robotMovementHistory <- ( newXPosition |-> newYPosition ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                isOutOfBounds ( newXPosition , newYPosition )
            THEN
                message := ERROR_AttemptToMoveOutOfMaze
            ELSE
                message := ERROR_AttemptToMoveToInternalWall
            END
        END
    END ;

    robotLocation <-- getPosition =
    BEGIN
        robotLocation := currentXLocation |-> currentYLocation
    END ;

    exitFound <-- foundExit =
    BEGIN
        IF ( currentXLocation |-> currentYLocation = exitSquare )
        THEN
            exitFound := YES
        ELSE
            exitFound := NO
        END
    END ;

    visitedSquare <-- hasVisitedSquare ( xPosition , yPosition ) =
    PRE
        visitedSquare : VISITED_SQUARE &
        xPosition : mazeX &
        yPosition : mazeY
    THEN
        IF ( { xPosition |-> yPosition } <: ran ( front ( robotMovementHistory ) ) )
        THEN
            visitedSquare := VISITED
        ELSE
            visitedSquare := NOT_VISITED
        END
    END ;

    routeTaken <-- robotsRoute =
    BEGIN
        routeTaken := robotMovementHistory
    END

END
