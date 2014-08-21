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
    TicTacToeCell *gameBoard[3][3];
}
@end

@implementation TicTacToeGame

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

- (void)displayBoard
{
    NSString *grid = [[NSString alloc] init];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            grid = [grid stringByAppendingFormat:@"%@", [gameBoard[i][j] value]];
//            grid = [grid stringByAppendingString:@" | "];
        }
        grid = [grid stringByAppendingString:@"\n"];
    }
    
    NSLog(@"\n%@", grid);
}

//returns YES if game is won
- (BOOL)gameWon
{
    BOOL gameWon = NO;
    for (int i = 0; i < 3; i++) {
        gameWon = (gameWon || [self checkRow:1] || [self checkColumn:1]);
    }
    return gameWon;
}

//private function used to check for win condition one row at a time
//returns YES if game is won from matching rows
- (BOOL)checkRow:(int)number
{
    
    //an empty space in the row means it that row doesn't meet win condition
    if (!gameBoard[number][0].isOccupied) {
        return NO;
    }
    else {
        if (gameBoard[number][0].value != gameBoard[number][1].value || gameBoard[number][1].value != gameBoard[number][2].value) {
            return NO;
        }
    }

    return YES;
}

//private function used to check for win condition one column at a time
//returns YES if game is won from matching column
- (BOOL)checkColumn:(int)number
{
    if (!gameBoard[0][number].isOccupied) {
        return NO;
    }
    else {
        if (gameBoard[0][number].value != gameBoard[1][number].value || gameBoard[1][number].value != gameBoard[2][number].value) {
            return NO;
        }
    }
    
    return YES;
}

- (void)playGame
{
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

}

- (void)setCellValueForRow:(int)row forColumn:(int)column forPlayerNumber:(int)playerNumber
{
    [gameBoard[row][column] setCellValue:playerNumber];
}

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

- (NSString *)convertPlayerNumberToSymbol:(int)playerNumber
{
    if (playerNumber == 1) {
        return @"X";
    }
    else {
        return @"O";
    }
}

@end
