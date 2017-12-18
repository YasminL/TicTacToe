//
//  Player.h
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-17.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Cross,
    Circle
} PlayerType;

@interface Player : NSObject
@property (nonatomic, assign) PlayerType type;
@property (nonatomic, assign) NSString *icon;
- (id)initWithPlayerType:(PlayerType)type icon:(NSString *)icon;
@end
