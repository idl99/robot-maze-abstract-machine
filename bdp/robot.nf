Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(robot))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(robot))==(Machine(robot));
  Level(Machine(robot))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(robot)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(robot))==(maze)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(robot))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(robot))==(?);
  List_Includes(Machine(robot))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(robot))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(robot))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(robot))==(?);
  Context_List_Variables(Machine(robot))==(?);
  Abstract_List_Variables(Machine(robot))==(?);
  Local_List_Variables(Machine(robot))==(robotMovementHistory,currentYLocation,currentXLocation);
  List_Variables(Machine(robot))==(robotMovementHistory,currentYLocation,currentXLocation);
  External_List_Variables(Machine(robot))==(robotMovementHistory,currentYLocation,currentXLocation)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(robot))==(?);
  Abstract_List_VisibleVariables(Machine(robot))==(?);
  External_List_VisibleVariables(Machine(robot))==(?);
  Expanded_List_VisibleVariables(Machine(robot))==(?);
  List_VisibleVariables(Machine(robot))==(?);
  Internal_List_VisibleVariables(Machine(robot))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(robot))==(btrue);
  Gluing_List_Invariant(Machine(robot))==(btrue);
  Expanded_List_Invariant(Machine(robot))==(btrue);
  Abstract_List_Invariant(Machine(robot))==(btrue);
  Context_List_Invariant(Machine(robot))==(btrue);
  List_Invariant(Machine(robot))==(currentXLocation: mazeX & currentYLocation: mazeY & robotMovementHistory: seq(emptyMazeSquares))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(robot))==(btrue);
  Abstract_List_Assertions(Machine(robot))==(btrue);
  Context_List_Assertions(Machine(robot))==(btrue);
  List_Assertions(Machine(robot))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(robot))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(robot))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(robot))==(currentXLocation,currentYLocation,robotMovementHistory:=prj1(mazeX,mazeY)(entranceSquare),prj2(mazeX,mazeY)(entranceSquare),[entranceSquare]);
  Context_List_Initialisation(Machine(robot))==(skip);
  List_Initialisation(Machine(robot))==(currentXLocation:=prj1(mazeX,mazeY)(entranceSquare) || currentYLocation:=prj2(mazeX,mazeY)(entranceSquare) || robotMovementHistory:=[entranceSquare])
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(robot))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(robot),Machine(maze))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(robot))==(btrue);
  List_Constraints(Machine(robot))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(robot))==(moveNorth,moveSouth,moveEast,moveWest,teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute);
  List_Operations(Machine(robot))==(moveNorth,moveSouth,moveEast,moveWest,teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute)
END
&
THEORY ListInputX IS
  List_Input(Machine(robot),moveNorth)==(?);
  List_Input(Machine(robot),moveSouth)==(?);
  List_Input(Machine(robot),moveEast)==(?);
  List_Input(Machine(robot),moveWest)==(?);
  List_Input(Machine(robot),teleport)==(newXPosition,newYPosition);
  List_Input(Machine(robot),getPosition)==(?);
  List_Input(Machine(robot),foundExit)==(?);
  List_Input(Machine(robot),hasVisitedSquare)==(xPosition,yPosition);
  List_Input(Machine(robot),robotsRoute)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(robot),moveNorth)==(message);
  List_Output(Machine(robot),moveSouth)==(message);
  List_Output(Machine(robot),moveEast)==(message);
  List_Output(Machine(robot),moveWest)==(message);
  List_Output(Machine(robot),teleport)==(message);
  List_Output(Machine(robot),getPosition)==(robotLocation);
  List_Output(Machine(robot),foundExit)==(exitFound);
  List_Output(Machine(robot),hasVisitedSquare)==(visitedSquare);
  List_Output(Machine(robot),robotsRoute)==(routeTaken)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(robot),moveNorth)==(message <-- moveNorth);
  List_Header(Machine(robot),moveSouth)==(message <-- moveSouth);
  List_Header(Machine(robot),moveEast)==(message <-- moveEast);
  List_Header(Machine(robot),moveWest)==(message <-- moveWest);
  List_Header(Machine(robot),teleport)==(message <-- teleport(newXPosition,newYPosition));
  List_Header(Machine(robot),getPosition)==(robotLocation <-- getPosition);
  List_Header(Machine(robot),foundExit)==(exitFound <-- foundExit);
  List_Header(Machine(robot),hasVisitedSquare)==(visitedSquare <-- hasVisitedSquare(xPosition,yPosition));
  List_Header(Machine(robot),robotsRoute)==(routeTaken <-- robotsRoute)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(robot),moveNorth)==(btrue);
  List_Precondition(Machine(robot),moveSouth)==(btrue);
  List_Precondition(Machine(robot),moveEast)==(btrue);
  List_Precondition(Machine(robot),moveWest)==(btrue);
  List_Precondition(Machine(robot),teleport)==(message: MESSAGES & newXPosition: mazeX & newYPosition: mazeY);
  List_Precondition(Machine(robot),getPosition)==(btrue);
  List_Precondition(Machine(robot),foundExit)==(btrue);
  List_Precondition(Machine(robot),hasVisitedSquare)==(visitedSquare: VISITED_SQUARE & xPosition: mazeX & yPosition: mazeY);
  List_Precondition(Machine(robot),robotsRoute)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(robot),robotsRoute)==(btrue | routeTaken:=robotMovementHistory);
  Expanded_List_Substitution(Machine(robot),hasVisitedSquare)==(visitedSquare: VISITED_SQUARE & xPosition: mazeX & yPosition: mazeY | {xPosition|->yPosition} <: ran(front(robotMovementHistory)) ==> visitedSquare:=VISITED [] not({xPosition|->yPosition} <: ran(front(robotMovementHistory))) ==> visitedSquare:=NOT_VISITED);
  Expanded_List_Substitution(Machine(robot),foundExit)==(btrue | currentXLocation|->currentYLocation = exitSquare ==> exitFound:=YES [] not(currentXLocation|->currentYLocation = exitSquare) ==> exitFound:=NO);
  Expanded_List_Substitution(Machine(robot),getPosition)==(btrue | robotLocation:=currentXLocation|->currentYLocation);
  Expanded_List_Substitution(Machine(robot),teleport)==(message: MESSAGES & newXPosition: mazeX & newYPosition: mazeY | newXPosition|->newYPosition: emptyMazeSquares ==> currentXLocation,currentYLocation,robotMovementHistory,message:=newXPosition,newYPosition,robotMovementHistory<-(newXPosition|->newYPosition),OPERATION_SUCCESSFUL [] not(newXPosition|->newYPosition: emptyMazeSquares) ==> (newXPosition|->newYPosition/:mazeStructure ==> message:=ERROR_AttemptToMoveOutOfMaze [] not(newXPosition|->newYPosition/:mazeStructure) ==> message:=ERROR_AttemptToMoveToInternalWall));
  Expanded_List_Substitution(Machine(robot),moveWest)==(btrue | currentXLocation-1|->currentYLocation: emptyMazeSquares ==> currentXLocation,robotMovementHistory,message:=currentXLocation-1,robotMovementHistory<-(currentXLocation-1|->currentYLocation),OPERATION_SUCCESSFUL [] not(currentXLocation-1|->currentYLocation: emptyMazeSquares) ==> (currentXLocation-1|->currentYLocation/:mazeStructure ==> message:=ERROR_AttemptToMoveOutOfMaze [] not(currentXLocation-1|->currentYLocation/:mazeStructure) ==> message:=ERROR_AttemptToMoveToInternalWall));
  Expanded_List_Substitution(Machine(robot),moveEast)==(btrue | currentXLocation+1|->currentYLocation: emptyMazeSquares ==> currentXLocation,robotMovementHistory,message:=currentXLocation+1,robotMovementHistory<-(currentXLocation+1|->currentYLocation),OPERATION_SUCCESSFUL [] not(currentXLocation+1|->currentYLocation: emptyMazeSquares) ==> (currentXLocation+1|->currentYLocation/:mazeStructure ==> message:=ERROR_AttemptToMoveOutOfMaze [] not(currentXLocation+1|->currentYLocation/:mazeStructure) ==> message:=ERROR_AttemptToMoveToInternalWall));
  Expanded_List_Substitution(Machine(robot),moveSouth)==(btrue | currentXLocation|->currentYLocation-1: emptyMazeSquares ==> currentYLocation,robotMovementHistory,message:=currentYLocation-1,robotMovementHistory<-(currentXLocation|->currentYLocation-1),OPERATION_SUCCESSFUL [] not(currentXLocation|->currentYLocation-1: emptyMazeSquares) ==> (currentXLocation|->currentYLocation-1/:mazeStructure ==> message:=ERROR_AttemptToMoveOutOfMaze [] not(currentXLocation|->currentYLocation-1/:mazeStructure) ==> message:=ERROR_AttemptToMoveToInternalWall));
  Expanded_List_Substitution(Machine(robot),moveNorth)==(btrue | currentXLocation|->currentYLocation+1: emptyMazeSquares ==> currentYLocation,robotMovementHistory,message:=currentYLocation+1,robotMovementHistory<-(currentXLocation|->currentYLocation+1),OPERATION_SUCCESSFUL [] not(currentXLocation|->currentYLocation+1: emptyMazeSquares) ==> (currentXLocation|->currentYLocation+1/:mazeStructure ==> message:=ERROR_AttemptToMoveOutOfMaze [] not(currentXLocation|->currentYLocation+1/:mazeStructure) ==> message:=ERROR_AttemptToMoveToInternalWall));
  List_Substitution(Machine(robot),moveNorth)==(IF currentXLocation|->currentYLocation+1: emptyMazeSquares THEN currentYLocation:=currentYLocation+1 || robotMovementHistory:=robotMovementHistory<-(currentXLocation|->currentYLocation+1) || message:=OPERATION_SUCCESSFUL ELSE IF currentXLocation|->currentYLocation+1/:mazeStructure THEN message:=ERROR_AttemptToMoveOutOfMaze ELSE message:=ERROR_AttemptToMoveToInternalWall END END);
  List_Substitution(Machine(robot),moveSouth)==(IF currentXLocation|->currentYLocation-1: emptyMazeSquares THEN currentYLocation:=currentYLocation-1 || robotMovementHistory:=robotMovementHistory<-(currentXLocation|->currentYLocation-1) || message:=OPERATION_SUCCESSFUL ELSE IF currentXLocation|->currentYLocation-1/:mazeStructure THEN message:=ERROR_AttemptToMoveOutOfMaze ELSE message:=ERROR_AttemptToMoveToInternalWall END END);
  List_Substitution(Machine(robot),moveEast)==(IF currentXLocation+1|->currentYLocation: emptyMazeSquares THEN currentXLocation:=currentXLocation+1 || robotMovementHistory:=robotMovementHistory<-(currentXLocation+1|->currentYLocation) || message:=OPERATION_SUCCESSFUL ELSE IF currentXLocation+1|->currentYLocation/:mazeStructure THEN message:=ERROR_AttemptToMoveOutOfMaze ELSE message:=ERROR_AttemptToMoveToInternalWall END END);
  List_Substitution(Machine(robot),moveWest)==(IF currentXLocation-1|->currentYLocation: emptyMazeSquares THEN currentXLocation:=currentXLocation-1 || robotMovementHistory:=robotMovementHistory<-(currentXLocation-1|->currentYLocation) || message:=OPERATION_SUCCESSFUL ELSE IF currentXLocation-1|->currentYLocation/:mazeStructure THEN message:=ERROR_AttemptToMoveOutOfMaze ELSE message:=ERROR_AttemptToMoveToInternalWall END END);
  List_Substitution(Machine(robot),teleport)==(IF newXPosition|->newYPosition: emptyMazeSquares THEN currentXLocation:=newXPosition || currentYLocation:=newYPosition || robotMovementHistory:=robotMovementHistory<-(newXPosition|->newYPosition) || message:=OPERATION_SUCCESSFUL ELSE IF newXPosition|->newYPosition/:mazeStructure THEN message:=ERROR_AttemptToMoveOutOfMaze ELSE message:=ERROR_AttemptToMoveToInternalWall END END);
  List_Substitution(Machine(robot),getPosition)==(robotLocation:=currentXLocation|->currentYLocation);
  List_Substitution(Machine(robot),foundExit)==(IF currentXLocation|->currentYLocation = exitSquare THEN exitFound:=YES ELSE exitFound:=NO END);
  List_Substitution(Machine(robot),hasVisitedSquare)==(IF {xPosition|->yPosition} <: ran(front(robotMovementHistory)) THEN visitedSquare:=VISITED ELSE visitedSquare:=NOT_VISITED END);
  List_Substitution(Machine(robot),robotsRoute)==(routeTaken:=robotMovementHistory)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(robot))==(?);
  Inherited_List_Constants(Machine(robot))==(?);
  List_Constants(Machine(robot))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(robot),MESSAGES)==({OPERATION_SUCCESSFUL,ERROR_AttemptToMoveToInternalWall,ERROR_AttemptToMoveOutOfMaze,YES,NO});
  Context_List_Enumerated(Machine(robot))==(?);
  Context_List_Defered(Machine(robot))==(?);
  Context_List_Sets(Machine(robot))==(?);
  List_Valuable_Sets(Machine(robot))==(?);
  Inherited_List_Enumerated(Machine(robot))==(?);
  Inherited_List_Defered(Machine(robot))==(?);
  Inherited_List_Sets(Machine(robot))==(?);
  List_Enumerated(Machine(robot))==(MESSAGES,VISITED_SQUARE);
  List_Defered(Machine(robot))==(?);
  List_Sets(Machine(robot))==(MESSAGES,VISITED_SQUARE);
  Set_Definition(Machine(robot),VISITED_SQUARE)==({VISITED,NOT_VISITED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(robot))==(?);
  Expanded_List_HiddenConstants(Machine(robot))==(?);
  List_HiddenConstants(Machine(robot))==(?);
  External_List_HiddenConstants(Machine(robot))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(robot))==(btrue);
  Context_List_Properties(Machine(robot))==(mazeX = 1..7 & mazeY = 1..5 & mazeStructure = mazeX*mazeY & internalMazeWalls <: mazeStructure & internalMazeWalls = {1|->3,2|->1,2|->3,2|->5,3|->3,4|->2,4|->3,4|->4,6|->1,6|->2,6|->4,7|->4} & emptyMazeSquares <: mazeStructure & emptyMazeSquares/\internalMazeWalls = {} & emptyMazeSquares\/internalMazeWalls = mazeStructure & entranceSquare: emptyMazeSquares & entranceSquare = 1|->1 & exitSquare: emptyMazeSquares & exitSquare = 1|->5);
  Inherited_List_Properties(Machine(robot))==(btrue);
  List_Properties(Machine(robot))==(MESSAGES: FIN(INTEGER) & not(MESSAGES = {}) & VISITED_SQUARE: FIN(INTEGER) & not(VISITED_SQUARE = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(robot),Machine(maze))==(?);
  Seen_Context_List_Enumerated(Machine(robot))==(?);
  Seen_Context_List_Invariant(Machine(robot))==(btrue);
  Seen_Context_List_Assertions(Machine(robot))==(btrue);
  Seen_Context_List_Properties(Machine(robot))==(btrue);
  Seen_List_Constraints(Machine(robot))==(btrue);
  Seen_List_Operations(Machine(robot),Machine(maze))==(?);
  Seen_Expanded_List_Invariant(Machine(robot),Machine(maze))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(robot),moveNorth)==(?);
  List_ANY_Var(Machine(robot),moveSouth)==(?);
  List_ANY_Var(Machine(robot),moveEast)==(?);
  List_ANY_Var(Machine(robot),moveWest)==(?);
  List_ANY_Var(Machine(robot),teleport)==(?);
  List_ANY_Var(Machine(robot),getPosition)==(?);
  List_ANY_Var(Machine(robot),foundExit)==(?);
  List_ANY_Var(Machine(robot),hasVisitedSquare)==(?);
  List_ANY_Var(Machine(robot),robotsRoute)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(robot)) == (MESSAGES,VISITED_SQUARE,OPERATION_SUCCESSFUL,ERROR_AttemptToMoveToInternalWall,ERROR_AttemptToMoveOutOfMaze,YES,NO,VISITED,NOT_VISITED | ? | robotMovementHistory,currentYLocation,currentXLocation | ? | moveNorth,moveSouth,moveEast,moveWest,teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute | ? | seen(Machine(maze)) | ? | robot);
  List_Of_HiddenCst_Ids(Machine(robot)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(robot)) == (?);
  List_Of_VisibleVar_Ids(Machine(robot)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(robot)) == (?: ?);
  List_Of_Ids(Machine(maze)) == (mazeX,mazeY,mazeStructure,internalMazeWalls,emptyMazeSquares,entranceSquare,exitSquare | ? | ? | ? | ? | ? | ? | ? | maze);
  List_Of_HiddenCst_Ids(Machine(maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(maze)) == (mazeX,mazeY,mazeStructure,internalMazeWalls,emptyMazeSquares,entranceSquare,exitSquare);
  List_Of_VisibleVar_Ids(Machine(maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(maze)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(robot)) == (Type(MESSAGES) == Cst(SetOf(etype(MESSAGES,0,4)));Type(VISITED_SQUARE) == Cst(SetOf(etype(VISITED_SQUARE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(robot)) == (Type(OPERATION_SUCCESSFUL) == Cst(etype(MESSAGES,0,4));Type(ERROR_AttemptToMoveToInternalWall) == Cst(etype(MESSAGES,0,4));Type(ERROR_AttemptToMoveOutOfMaze) == Cst(etype(MESSAGES,0,4));Type(YES) == Cst(etype(MESSAGES,0,4));Type(NO) == Cst(etype(MESSAGES,0,4));Type(VISITED) == Cst(etype(VISITED_SQUARE,0,1));Type(NOT_VISITED) == Cst(etype(VISITED_SQUARE,0,1)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(robot)) == (Type(robotMovementHistory) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(currentYLocation) == Mvl(btype(INTEGER,?,?));Type(currentXLocation) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(robot)) == (Type(robotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(hasVisitedSquare) == Cst(etype(VISITED_SQUARE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(foundExit) == Cst(etype(MESSAGES,?,?),No_type);Type(getPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(teleport) == Cst(etype(MESSAGES,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(moveWest) == Cst(etype(MESSAGES,?,?),No_type);Type(moveEast) == Cst(etype(MESSAGES,?,?),No_type);Type(moveSouth) == Cst(etype(MESSAGES,?,?),No_type);Type(moveNorth) == Cst(etype(MESSAGES,?,?),No_type));
  Observers(Machine(robot)) == (Type(robotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(hasVisitedSquare) == Cst(etype(VISITED_SQUARE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(foundExit) == Cst(etype(MESSAGES,?,?),No_type);Type(getPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
