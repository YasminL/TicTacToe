//
//  BoardCollectionViewCell.h
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-16.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *crossCircleButton;
- (void)reset; 
@end
