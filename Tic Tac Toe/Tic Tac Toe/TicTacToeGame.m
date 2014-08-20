//
//  TicTacToeGame.m
//  Tic Tac Toe
//
//  Created by DANNY WU on 8/20/14.
//
//

#import "TicTacToeGame.h"

@interface TicTacToeGame ()
{
    BOOL gameBoard[3][3];
}
@end

@implementation TicTacToeGame

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                gameBoard[i][j] = NO;
            }
        }
    }
    
    return self;
}

@end
