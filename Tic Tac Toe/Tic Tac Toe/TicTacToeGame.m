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

@end
