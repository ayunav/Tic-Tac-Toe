//
//  TicTacToeCell.h
//  Tic Tac Toe
//
//  Created by DANNY WU on 8/20/14.
//
//

#import <Foundation/Foundation.h>

@interface TicTacToeCell : NSObject

@property NSString *value;
@property (nonatomic) BOOL isOccupied;

- (void)clearCell;
- (void)setCellValue:(int)forPlayerNumber;

@end
