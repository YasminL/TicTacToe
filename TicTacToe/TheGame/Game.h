//
//  Game.h
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-17.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Active,
    Inactive
} GameState;

@interface Game : NSObject
@property (nonatomic) GameState state;
- (id)initWithState:(GameState)state;
@end
