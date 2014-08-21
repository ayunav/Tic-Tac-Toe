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

//- (BOOL)gameWon
//{
//    
//}

//private function used to check for win condition one row at a time
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
//- (BOOL)checkColumn:(int)number
//{
//    
//}

//- (void)playGame
//{
//
//    while (!self.gameWon) {
//        <#statements#>
//    }
//
//}

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
//    NSLog(@"Player entered: %d", row);
    return row;
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
//    NSLog(@"Player entered: %d", column);
    return column;
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
