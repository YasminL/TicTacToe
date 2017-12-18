//
//  BoardFooterCollectionReusableView.h
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-16.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BoardFooterCollectionReusableView;
@protocol BoardFooterCollectionReusableViewDelegate <NSObject>
    - (void)didTapNewGameButton;
@end

@interface BoardFooterCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIButton *playRestartButton;
@property (weak, nonatomic) id <BoardFooterCollectionReusableViewDelegate> delegate;

@end
