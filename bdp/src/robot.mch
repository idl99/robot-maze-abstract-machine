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
            ( currentXLocation |-> currentYLocation + 1 : emptyMazeSquares )
        THEN
            currentYLocation :=  currentYLocation + 1 ||
            robotMovementHistory := robotMovementHistory <- ( currentXLocation |-> currentYLocation + 1 ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                ( currentXLocation |-> currentYLocation + 1 /: mazeStructure )
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
            ( currentXLocation |-> currentYLocation - 1 : emptyMazeSquares )
        THEN
            currentYLocation :=  currentYLocation - 1 ||
            robotMovementHistory := robotMovementHistory <- ( currentXLocation |-> currentYLocation - 1 ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                ( currentXLocation |-> currentYLocation - 1 /: mazeStructure )
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
            ( currentXLocation + 1 |-> currentYLocation : emptyMazeSquares )
        THEN
            currentXLocation :=  currentXLocation + 1 ||
            robotMovementHistory := robotMovementHistory <- ( currentXLocation + 1 |-> currentYLocation ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                ( currentXLocation + 1 |-> currentYLocation /: mazeStructure )
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
            ( currentXLocation - 1 |-> currentYLocation : emptyMazeSquares )
        THEN
            currentXLocation :=  currentXLocation - 1 ||
            robotMovementHistory := robotMovementHistory <- ( currentXLocation - 1 |-> currentYLocation ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                ( currentXLocation - 1 |-> currentYLocation /: mazeStructure )
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
            ( newXPosition |-> newYPosition : emptyMazeSquares )
        THEN
            currentXLocation := newXPosition ||
            currentYLocation := newYPosition ||
            robotMovementHistory := robotMovementHistory <- ( newXPosition |-> newYPosition ) ||
            message := OPERATION_SUCCESSFUL
        ELSE
            IF
                ( newXPosition |-> newYPosition /: mazeStructure )
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
