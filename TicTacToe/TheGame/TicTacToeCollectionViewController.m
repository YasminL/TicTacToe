//
//  TicTacToeCollectionViewController.m
//  TicTacToe
//
//  Created by Yasmin Lindholm on 2017-12-16.
//  Copyright © 2017 Yasmin Lindholm. All rights reserved.
//

#import "TicTacToeCollectionViewController.h"
#import "BoardCollectionViewCell.h"
#import "Player.h"
#import "Board.h"
#import "Game.h"

@interface TicTacToeCollectionViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentPlayerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *currentPlayerIcon;
@property (nonatomic) Player *currentPlayer;
@property (nonatomic) Board *board;
@property (nonatomic) Game *game;
@end

@implementation TicTacToeCollectionViewController
static NSString * const reuseIdentifier = @"Cell";
static NSString *footerViewIdentifier = @"footerView";
NSString *navigationBarTitle = @"TIC TAC TOE";
NSString *currentPlayerText = @"CURRENT PLAYER:";
NSString *winnerText = @"WE HAVE A WINNER!";
NSString *newGameText = @"NEW GAME";
NSString *crossIcon = @"crossIcon";
NSString *circleIcon = @"circleIcon";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNewGame];
    [self updateUI];
}

- (void)createNewGame {
    self.currentPlayer = [[Player alloc] initWithPlayerType:Cross icon:crossIcon];
    self.board = [Board new]; 
    self.game = [[Game alloc] initWithBoard:self.board withActiveGame:YES]; 
}

- (void)resetGame {
    self.currentPlayer = nil;
    self.board = nil;
    self.game = nil;
}

- (BOOL)hasWinner {
    return [self.game hasWinningCombination];
}

#pragma mark <UI>

- (void)updateUI {
    [self.navigationItem setTitle:navigationBarTitle];
    self.currentPlayerLabel.text = currentPlayerText;
    [self.currentPlayerLabel setTextColor:[UIColor blackColor]];
    self.currentPlayerIcon.image = [UIImage imageNamed:self.currentPlayer.icon];
}

- (void)updateUIWithWinner:(Player *)player {
    self.currentPlayerLabel.text = winnerText;
    [self.currentPlayerLabel setTextColor:[UIColor redColor]];
    self.currentPlayerIcon.image = [UIImage imageNamed:player.icon];
}

- (void)resetView {
    NSArray *visibleItems = [self.collectionView indexPathsForVisibleItems];
    for (NSIndexPath *indexPath in visibleItems) {
        BoardCollectionViewCell *cell = (BoardCollectionViewCell *) [self.collectionView cellForItemAtIndexPath:indexPath];
        [cell reset];
    }
}

#pragma mark <UICollectionViewDataSource>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionFooter) {
        BoardFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerViewIdentifier forIndexPath:indexPath];
        [footerView.playRestartButton setTitle:newGameText forState:UIControlStateNormal];
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
    if (self.game.isGameActive) {
        BoardCollectionViewCell *cell = (BoardCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell.crossCircleButton setImage:[UIImage imageNamed:self.currentPlayer.icon] forState:UIControlStateNormal];
        cell.crossCircleButton.hidden = NO;
        [self.game.gameCombinations replaceObjectAtIndex:indexPath.row withObject:self.currentPlayer];

        if ([self hasWinner]) {
            self.game.isGameActive = NO;
            [self updateUIWithWinner:self.currentPlayer];
        } else {
            [self toggleNextPlayer];
            self.currentPlayerIcon.image = [UIImage imageNamed:self.currentPlayer.icon];
        }
    }
}

- (void)toggleNextPlayer {
    switch (self.currentPlayer.type) {
        case Cross:
            self.currentPlayer = [[Player alloc] initWithPlayerType:Circle icon:circleIcon];
            break;
        case Circle:
            self.currentPlayer = [[Player alloc] initWithPlayerType:Cross icon:crossIcon];
            break;
        default:
            break;
    }
}

#pragma mark <BoardFooterCollectionReusableViewDelegate>

- (void)didTapNewGameButton {
    [self resetView];
    [self resetGame];
    [self createNewGame];
    [self updateUI];
}

@end
