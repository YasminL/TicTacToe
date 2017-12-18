//
//  Player.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-17.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "Player.h"

@implementation Player
- (id)initWithPlayerType:(PlayerType)type icon:(NSString *)icon {
    if (self = [super init]) {
        self.type = type;
        self.icon = icon;
    }
    return self;
}
@end
