//
//  Board.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-16.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "Board.h"

@implementation Board
- (id)init {
    if (self = [super init]) {
        self.items = 16;
    }
    return self;
}
@end
