//
//  TicTacToeCell.m
//  Tic Tac Toe
//
//  Created by DANNY WU on 8/20/14.
//
//

#import "TicTacToeCell.h"

@implementation TicTacToeCell

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.clearCell;
    }
    return self;
}

- (void)clearCell
{
    self.value = @"-";
    self.isOccupied = NO;
}

- (void)setCellValue:(int)forPlayerNumber
{
    if (forPlayerNumber == 1) {
        self.value = @"X";
    }
    else {
        self.value = @"O";
    }
    
    self.isOccupied = YES;
}

@end
