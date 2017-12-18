//
//  BoardCollectionViewCell.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-16.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "BoardCollectionViewCell.h"

@implementation BoardCollectionViewCell

#pragma mark Life cycle
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self reset];
}

- (void)reset {
    [self.crossCircleButton setImage:nil forState:normal];
    self.crossCircleButton.hidden = YES;
}

@end
