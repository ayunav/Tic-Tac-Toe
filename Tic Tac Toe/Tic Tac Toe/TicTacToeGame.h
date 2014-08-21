//
//  TicTacToeGame.h
//  Tic Tac Toe
//
//  Created by DANNY WU on 8/20/14.
//
//

#import <Foundation/Foundation.h>

@interface TicTacToeGame : NSObject

- (void)displayBoard;
- (void)playGame;
- (int)getRowforPlayerNumber:(int)playerNumber;
@end
