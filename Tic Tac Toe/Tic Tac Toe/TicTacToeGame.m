//
//  TicTacToeGame.m
//  Tic Tac Toe
//
//  Created by DANNY WU on 8/20/14.
//
//

#import "TicTacToeGame.h"
#import "TicTacToeCell.h"

@interface TicTacToeGame ()
{
        //tic tac toe will always be 3 x 3
    TicTacToeCell *gameBoard[3][3];
}
@end

@implementation TicTacToeGame

#pragma mark - Initializer
- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                
                    //initialize each cell
                TicTacToeCell *newCell = [[TicTacToeCell alloc]init];
                gameBoard[i][j] = newCell;
            }
        }
    }
    
    return self;
}


#pragma mark - General
    //starts a game of tic tac toe for 2 players
- (void)playGame
{
        //I alternate between player 1 and player 2, starting  with player 1
        //Player 1 will always be X, player 2 will always be O
    int playerNumber = 1;
    while (![self gameWon]) {
            //loop back from player 2 to player 1
        if (playerNumber == 3) {
            playerNumber = 1;
        }
        
        int row;
        row = [self getRowforPlayerNumber:playerNumber];
        
        int column;
        column = [self getColumnforPlayerNumber:playerNumber];
        
        if (gameBoard[row][column].isOccupied) {
            NSLog(@"Error, there is already an %@ placed there", gameBoard[row][column].value);
        }
        else {
            [self setCellValueForRow:row forColumn:column forPlayerNumber:playerNumber];
            playerNumber ++;
        }
        
        [self displayBoard];
    }
    NSLog(@"Game over!");
}


    //displays entire board, with "-" for available spaces
- (void)displayBoard
{
    NSString *grid = [[NSString alloc] init];
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            grid = [grid stringByAppendingFormat:@"%@", [gameBoard[i][j] value]];
            
        }
            //consolidates all rows with a new line in between
        grid = [grid stringByAppendingString:@"\n"];
    }
    
    NSLog(@"\n%@", grid);
}


#pragma mark - Win Condition
    //returns YES if game is won
- (BOOL)gameWon
{
    BOOL gameWon = NO;
    
    for (int i = 0; i < 3; i++) {
        gameWon = (gameWon || [self checkRow:i] || [self checkColumn:i] || [self checkDiagonal]);
    }

    return gameWon;
}


#pragma mark Checking lines
    //private helper function used to check for win condition one row at a time
    //returns YES if game is won from matching rows
- (BOOL)checkRow:(int)row
{
    
        //an empty space in the row means that the row doesn't meet win condition
    if (!gameBoard[row][0].isOccupied) {
        return NO;
    }
    else {
        if (gameBoard[row][0].value != gameBoard[row][1].value || gameBoard[row][1].value != gameBoard[row][2].value) {
            return NO;
        }
    }

    return YES;
}

    //private helper function used to check for win condition one column at a time
    //returns YES if game is won from matching column
- (BOOL)checkColumn:(int)column
{
    if (!gameBoard[0][column].isOccupied) {
        return NO;
    }
    else {
        if (gameBoard[0][column].value != gameBoard[1][column].value || gameBoard[1][column].value != gameBoard[2][column].value) {
            return NO;
        }
    }
    
    return YES;
}

    //private helper function used to check for win condition for diagonals
    //returns YES if game is won from matching diagonals
- (BOOL)checkDiagonal
{
    BOOL gameWon;
    
        //if center square isn't occupied, win condition by diagonal cannot be possible
    if (!gameBoard[1][1].isOccupied) {
        gameWon = NO;
    }
    else if (gameBoard[1][1].value == gameBoard[0][0].value && gameBoard[1][1].value == gameBoard[2][2].value) {
        gameWon = YES;
    }
    else if (gameBoard[1][1].value == gameBoard[0][2].value && gameBoard[1][1].value == gameBoard[2][0].value) {
        gameWon = YES;
    }
    return gameWon;
}

#pragma mark - User Input
    //gets row from user
- (int)getRowforPlayerNumber:(int)playerNumber
{
    char cString[1];
    NSLog(@"Player %d please enter row: ", playerNumber);
    scanf("%s", cString);

    NSString *userInput;
    userInput = [NSString stringWithFormat:@"%s", cString];
    
    int row;
    row = [userInput intValue];
    
        //returns row - 1 because humans start from 1;
    return row - 1;
}

    //gets column from user
- (int)getColumnforPlayerNumber:(int)playerNumber
{
    char cString[1];
    NSLog(@"Player %d please enter column: ", playerNumber);
    scanf("%s", cString);

    NSString *userInput;
    userInput = [NSString stringWithFormat:@"%s", cString];
    
    int column;
    column = [userInput intValue];
    
        //returns column - 1 because humans start from 1;
    return column - 1;
}

#pragma mark - Interact with Board
    //sets the cell at [row][column] to be the proper mark according to the player number
- (void)setCellValueForRow:(int)row forColumn:(int)column forPlayerNumber:(int)playerNumber
{
    [gameBoard[row][column] setCellValue:playerNumber];
}


@end
