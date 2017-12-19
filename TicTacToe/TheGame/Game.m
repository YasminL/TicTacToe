//
//  Game.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-17.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "Game.h"
#import "Board.h"

@interface Game ()
@property (nonatomic) Board *board;
@end

@implementation Game

- (id)initWithBoard:(Board *)board {
    if (self = [super init]) {
        self.board = board;
        self.isGameActive = YES;
        
        Player *player = [[Player alloc] initWithPlayerType:None icon:nil];
        self.gameCombinations = [[NSMutableArray alloc] initWithCapacity:16];
        for (int i=0;i < 16; i++) {
            [self.gameCombinations addObject:player];
        }

        self.winningCombinations = @[
                                     @[@0,@1,@2,@3], @[@4,@5,@6,@7], @[@8,@9,@10,@11], @[@12,@13,@14,@15], // Horizontal
                                     @[@0,@4,@8,@12], @[@1,@5,@9,@13], @[@2,@6,@10,@14], @[@3,@7,@11,@15], // Vertical
                                     @[@0,@5,@10,@15], @[@3,@6,@9,@12], // Diaginal
                                     @[@0,@3,@12,@15], // Corners
                                     ];
    }
    return self;
}

- (BOOL)isThereAWinningCombination {
    for (NSArray *combination in self.winningCombinations) {
        BOOL combinationHasPlayers = [self hasPlayersFor:combination];
        int firstIndex = (int)[(NSNumber *)[combination objectAtIndex:0] integerValue];
        int secondIndex = (int)[(NSNumber *)[combination objectAtIndex:1] integerValue];
        int thirdIndex = (int)[(NSNumber *)[combination objectAtIndex:2] integerValue];
        int fourthIndex = (int)[(NSNumber *)[combination objectAtIndex:3] integerValue];
        
        Player *playerInFirstIndex = [self.gameCombinations objectAtIndex:firstIndex];
        Player *playerInSecondIndex = [self.gameCombinations objectAtIndex:secondIndex];
        Player *playerInThirdIndex = [self.gameCombinations objectAtIndex:thirdIndex];
        Player *playerInFourthIndex = [self.gameCombinations objectAtIndex:fourthIndex];
        
        if (combinationHasPlayers
            && (playerInFirstIndex.type == playerInSecondIndex.type)
            && (playerInFirstIndex.type == playerInThirdIndex.type)
            && (playerInFirstIndex.type == playerInFourthIndex.type)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)hasPlayersFor:(NSArray *)combination {
    Player *player;
    int playerCount = 0;
    for (int number = 0; number < [combination count]; number ++) {
        player = [self.gameCombinations objectAtIndex:number];
        if (player.type != None) {
            playerCount++;
        }
    }
    return playerCount == [combination count];
}

@end
