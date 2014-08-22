//
//  main.m
//  Tic Tac Toe
//
//  Created by DANNY WU on 8/19/14.
//
//

#import <Foundation/Foundation.h>
#import "TicTacToeGame.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TicTacToeGame *myTTTGame = [[TicTacToeGame alloc] init];
        [myTTTGame playGame];
    }
    return 0;
}

