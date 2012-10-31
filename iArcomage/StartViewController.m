//
//  StartViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "StartViewController.h"
#import "PlayerModel.h"
#import "ComputerModel.h"

@interface StartViewController ()

@end

@implementation StartViewController
{
    PlayerModel *player;
    ComputerModel *computer;
    BOOL gameOver;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)card1UseButtonPressed:(id)sender {
}

- (IBAction)card2UseButtonPressed:(id)sender {
}

- (IBAction)card3UseButtonPressed:(id)sender {
}

- (IBAction)card4UseButtonPressed:(id)sender {
}

- (IBAction)card5UseButtonPressed:(id)sender {
}

- (IBAction)card1DiscardButtonPressed:(id)sender {
}

- (IBAction)card2DiscardButtonPressed:(id)sender {
}

- (IBAction)card3DiscardButtonPressed:(id)sender {
}

- (IBAction)card4DiscardButtonPressed:(id)sender {
}

- (IBAction)card5DiscardButtonPressed:(id)sender {
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Main game cycle

- (IBAction)game:(id)sender {
    gameOver = NO;
    
    player = [[PlayerModel alloc] init];
    [self updatePlayerLabels];
    
    computer = [[ComputerModel alloc] init];
    [self updateComputerLabels];
    
    [self updateCard1];
    [self updateCard2];
    [self updateCard3];
    [self updateCard4];
    [self updateCard5];
    [self updateCurrentCard];
}


#pragma mark - Initialization


#pragma mark - UpdatingLabels

- (void)updatePlayerLabels
{
    self.playerQuarries.text = [NSString stringWithFormat:@"%d", player.quarries];
    self.playerMagics.text = [NSString stringWithFormat:@"%d", player.magics];
    self.playerDungeons.text = [NSString stringWithFormat:@"%d", player.dungeons];
    self.playerBricks.text = [NSString stringWithFormat:@"%d", player.bricks];
    self.playerGems.text = [NSString stringWithFormat:@"%d", player.gems];
    self.playerRecruits.text = [NSString stringWithFormat:@"%d", player.recruits];
    self.playerWall.text = [NSString stringWithFormat:@"%d", player.wall];
    self.playerTower.text = [NSString stringWithFormat:@"%d", player.tower];
}

- (void)updateComputerLabels
{
    self.computerQuarries.text = [NSString stringWithFormat:@"%d", computer.quarries];
    self.computerMagics.text = [NSString stringWithFormat:@"%d", computer.magics];
    self.computerDungeons.text = [NSString stringWithFormat:@"%d", computer.dungeons];
    self.computerBricks.text = [NSString stringWithFormat:@"%d", computer.bricks];
    self.computerGems.text = [NSString stringWithFormat:@"%d", computer.gems];
    self.computerRecruits.text = [NSString stringWithFormat:@"%d", computer.recruits];
    self.computerWall.text = [NSString stringWithFormat:@"%d", computer.wall];
    self.computerTower.text = [NSString stringWithFormat:@"%d", computer.tower];
}

- (void)updateCard1
{
    self.playersCard1Name.text = @"No card";
    self.playersCard1Description.text = @"No description";
    self.playersCard1Cost.text = @"No cost";
    self.card1UseButton.enabled = NO;
    self.card1UseButton.titleLabel.alpha = 0.2f;
    self.card1DiscardButton.enabled = NO;
    self.card1DiscardButton.titleLabel.alpha = 0.2f;
}

- (void)updateCard2
{
    self.playersCard2Name.text = @"No card";
    self.playersCard2Description.text = @"No description";
    self.playersCard2Cost.text = @"No cost";
    self.card2UseButton.enabled = NO;
    self.card2UseButton.titleLabel.alpha = 0.2f;
    self.card2DiscardButton.enabled = NO;
    self.card2DiscardButton.titleLabel.alpha = 0.2f;
}

- (void)updateCard3
{
    self.playersCard3Name.text = @"No card";
    self.playersCard3Description.text = @"No description";
    self.playersCard3Cost.text = @"No cost";
    self.card3UseButton.enabled = NO;
    self.card3UseButton.titleLabel.alpha = 0.2f;
    self.card3DiscardButton.enabled = NO;
    self.card3DiscardButton.titleLabel.alpha = 0.2f;
}

- (void)updateCard4
{
    self.playersCard4Name.text = @"No card";
    self.playersCard4Description.text = @"No description";
    self.playersCard4Cost.text = @"No cost";
    self.card4UseButton.enabled = NO;
    self.card4UseButton.titleLabel.alpha = 0.2f;
    self.card4DiscardButton.enabled = NO;
    self.card4DiscardButton.titleLabel.alpha = 0.2f;
}

- (void)updateCard5
{
    self.playersCard5Name.text = @"No card";
    self.playersCard5Description.text = @"No description";
    self.playersCard5Cost.text = @"No cost";
    self.card5UseButton.enabled = NO;
    self.card5UseButton.titleLabel.alpha = 0.2f;
    self.card5DiscardButton.enabled = NO;
    self.card5DiscardButton.titleLabel.alpha = 0.2f;
}

- (void)updateCurrentCard
{
    self.currentCardName.text = @"No card";
    self.currentCardDescription.text = @"No description";
    self.currentCardCost.text = @"No cost";
}

@end
