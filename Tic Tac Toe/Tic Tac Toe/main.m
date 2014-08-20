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
        
        NSLog(@"Hello, World!");
        TicTacToeGame *myGame = [[TicTacToeGame alloc] init];
        [myGame displayBoard];
        
    }
    return 0;
}

