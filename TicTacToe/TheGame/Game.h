//
//  Game.h
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-17.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"
#import "Player.h"

@interface Game : NSObject
@property (nonatomic) NSArray<NSArray *> *winningCombinations;
@property (nonatomic) NSMutableArray<Player *> *gameCombinations;
- (id)initWithBoard:(Board *)board;
- (BOOL)isThereAWinningCombination;
@end
