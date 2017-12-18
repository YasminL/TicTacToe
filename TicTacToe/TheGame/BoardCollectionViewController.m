//
//  TicTacToeCollectionViewController.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-16.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "BoardCollectionViewController.h"
#import "BoardCollectionViewCell.h"
#import "Player.h"
#import "Board.h"
#import "Game.h"

@interface BoardCollectionViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentPlayerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *currentPlayerIcon;
@property (nonatomic) Player *currentPlayer;
@property (nonatomic) Board *board;
@property (nonatomic) Game *game;
@end

@implementation BoardCollectionViewController
static NSString * const reuseIdentifier = @"Cell";
NSString *navigationBarTitle = @"Tic Tac Toe";
NSString *currentPlayerText = @"Current Player:";
NSString *crossIcon = @"crossIcon";
NSString *circleIcon = @"circleIcon";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNewGame];
    [self setupUI];
}

- (void)createNewGame {
    self.currentPlayer = [[Player alloc] initWithPlayerType:Cross icon:crossIcon];
    self.board = [Board new]; 
    self.game = [[Game alloc] initWithBoard:self.board];
}

- (void)resetGame {
    self.currentPlayer = nil;
    self.board = nil;
    self.game = nil;
}

- (void)resetView {
    NSArray *visibleItems = [self.collectionView indexPathsForVisibleItems];
    for (NSIndexPath *indexPath in visibleItems) {
        BoardCollectionViewCell *cell = (BoardCollectionViewCell *) [self.collectionView cellForItemAtIndexPath:indexPath];
        [cell reset];
    }
}

- (void)updateUI {
    self.currentPlayerIcon.image = [UIImage imageNamed:self.currentPlayer.icon];
}

- (void)setupUI {
    [self.navigationItem setTitle:navigationBarTitle];
    self.currentPlayerLabel.text = currentPlayerText;
}

- (BOOL)checkForAWinner {
    return [self.game isThereAWinningCombination];
}

#pragma mark <UICollectionViewDataSource>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionFooter) {
        BoardFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView" forIndexPath:indexPath];
        [footerView.playRestartButton setTitle:@"NEW GAME" forState:UIControlStateNormal];
        footerView.delegate = self;
        reusableView = footerView;
    }
    
    return reusableView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.board.items;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BoardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    BoardCollectionViewCell *cell = (BoardCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.crossCircleButton setImage:[UIImage imageNamed:self.currentPlayer.icon] forState:UIControlStateNormal];
    cell.crossCircleButton.hidden = NO;
    [self.game.gameCombinations replaceObjectAtIndex:indexPath.row withObject:self.currentPlayer];
    [self toggleNextPlayer];
    self.currentPlayerIcon.image = [UIImage imageNamed:self.currentPlayer.icon];
    [self checkForAWinner];
}
- (void)toggleNextPlayer {
    switch (self.currentPlayer.type) {
        case Cross:
            self.currentPlayer.type = Circle;
            self.currentPlayer.icon = circleIcon;
            break;
        case Circle:
            self.currentPlayer.type = Cross;
            self.currentPlayer.icon = crossIcon;
            break;
        default:
            break;
    }
}

#pragma mark BoardFooterCollectionReusableViewDelegate

- (void)didTapNewGameButton {
    [self resetView];
    [self resetGame];
    [self createNewGame];
    [self updateUI];
}

@end
