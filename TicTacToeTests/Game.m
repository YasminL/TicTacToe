//
//  GameTests.m
//  TicTacToeTests
//
//  Created by Yasmin Lindholm on 2017-12-19.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Game.h"
#import "Board.h"
#import "Player.h"

@interface GameTests : XCTestCase
@end

@implementation GameTests
Board *board;
Game *game;
Player *crossPlayer1;
Player *crossPlayer2;
Player *crossPlayer3;
Player *crossPlayer4;
Player *circlePlayer;

- (void)setUp {
    board = [[Board alloc] init];
    game = [[Game alloc] initWithBoard:board];
    crossPlayer1 = [[Player alloc] initWithPlayerType:Cross icon:@"crossIcon"];
    crossPlayer2 = [[Player alloc] initWithPlayerType:Cross icon:@"crossIcon"];
    crossPlayer3 = [[Player alloc] initWithPlayerType:Cross icon:@"crossIcon"];
    crossPlayer4 = [[Player alloc] initWithPlayerType:Cross icon:@"crossIcon"];
    circlePlayer = [[Player alloc] initWithPlayerType:Circle icon:@"circleIcon"];
}

- (void)testHaveAWinningCombination_Horizontally {
    [game.gameCombinations replaceObjectAtIndex:0 withObject:crossPlayer1];
    [game.gameCombinations replaceObjectAtIndex:1 withObject:crossPlayer2];
    [game.gameCombinations replaceObjectAtIndex:2 withObject:crossPlayer3];
    [game.gameCombinations replaceObjectAtIndex:3 withObject:crossPlayer4];
    
    BOOL expected = YES;
    BOOL result = [game isThereAWinningCombination];
    XCTAssertEqual(expected, result);
}

- (void)testHaveAWinningCombination_Vertically {
    [game.gameCombinations replaceObjectAtIndex:0 withObject:crossPlayer1];
    [game.gameCombinations replaceObjectAtIndex:4 withObject:crossPlayer2];
    [game.gameCombinations replaceObjectAtIndex:8 withObject:crossPlayer3];
    [game.gameCombinations replaceObjectAtIndex:12 withObject:crossPlayer4];
    
    BOOL expected = YES;
    BOOL result = [game isThereAWinningCombination];
    XCTAssertEqual(expected, result);
}

- (void)testHaveAWinningCombination_Diagonal {
    [game.gameCombinations replaceObjectAtIndex:0 withObject:crossPlayer1];
    [game.gameCombinations replaceObjectAtIndex:5 withObject:crossPlayer2];
    [game.gameCombinations replaceObjectAtIndex:10 withObject:crossPlayer3];
    [game.gameCombinations replaceObjectAtIndex:15 withObject:crossPlayer4];
    
    BOOL expected = YES;
    BOOL result = [game isThereAWinningCombination];
    XCTAssertEqual(expected, result);
}

- (void)testHaveAWinningCombination_Corners {
    [game.gameCombinations replaceObjectAtIndex:0 withObject:crossPlayer1];
    [game.gameCombinations replaceObjectAtIndex:3 withObject:crossPlayer2];
    [game.gameCombinations replaceObjectAtIndex:12 withObject:crossPlayer3];
    [game.gameCombinations replaceObjectAtIndex:15 withObject:crossPlayer4];
    
    BOOL expected = YES;
    BOOL result = [game isThereAWinningCombination];
    XCTAssertEqual(expected, result);
}

- (void)testHaveAWinningCombination_Boxes {
    [game.gameCombinations replaceObjectAtIndex:0 withObject:crossPlayer1];
    [game.gameCombinations replaceObjectAtIndex:1 withObject:crossPlayer2];
    [game.gameCombinations replaceObjectAtIndex:4 withObject:crossPlayer3];
    [game.gameCombinations replaceObjectAtIndex:5 withObject:crossPlayer4];
    
    BOOL expected = YES;
    BOOL result = [game isThereAWinningCombination];
    XCTAssertEqual(expected, result);
}

- (void)testIsNotAWinningCombination {
    [game.gameCombinations replaceObjectAtIndex:0 withObject:circlePlayer];
    [game.gameCombinations replaceObjectAtIndex:1 withObject:crossPlayer2];
    [game.gameCombinations replaceObjectAtIndex:2 withObject:crossPlayer3];
    [game.gameCombinations replaceObjectAtIndex:3 withObject:crossPlayer4];
    
    BOOL expected = NO;
    BOOL result = [game isThereAWinningCombination];
    XCTAssertEqual(expected, result);
}
























@end

