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
        Player *player = [[Player alloc] initWithPlayerType:None icon:nil];
        self.gameCombinations = [[NSMutableArray alloc] init];
        [self.gameCombinations addObjectsFromArray:@[
                                                     player, player, player, player,
                                                     player, player, player, player,
                                                     player, player, player, player,
                                                     player, player, player, player,
                                                     ]
         ];
        
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
    Player *player;
    for (NSArray *combination in self.winningCombinations) {
        // check for the different kinds of combinations
        player = [self.gameCombinations objectAtIndex:0];
        if (player.type != None) {
            printf("");
        }
    }
    return false;
}
@end
