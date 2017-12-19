//
//  BoardFooterCollectionReusableView.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-16.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "BoardFooterCollectionReusableView.h"

@implementation BoardFooterCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self applyStyle];
}

- (void)applyStyle {
    [self.playRestartButton setTintColor:[UIColor whiteColor]];
}

- (IBAction)didTapButton:(id)sender {
    [self.delegate didTapNewGameButton];
}

@end
