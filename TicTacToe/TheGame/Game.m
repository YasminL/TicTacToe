//
//  Game.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-17.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "Game.h"

#import "Board.h"
#import "Player.h"

@implementation Game

- (id)initWithState:(GameState)state {
    if (self = [super init]) {
        self.state = state;
    }
    return self;
}
@end
