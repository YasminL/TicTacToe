//
//  Board.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-16.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "Board.h"

@interface Board ()
@end

@implementation Board
- (id)initWithItems:(int)items {
    if (self = [super init]) {
        self.items = items;
    }
    return self;
}
@end
