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
#import "Card.h"

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
    gameOver = YES;
}

- (IBAction)card0UseButtonPressed:(id)sender {
    [player cardSelected:0];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard0];
}

- (IBAction)card1UseButtonPressed:(id)sender {
    [player cardSelected:1];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard1];
}

- (IBAction)card2UseButtonPressed:(id)sender {
    [player cardSelected:2];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard2];
}

- (IBAction)card3UseButtonPressed:(id)sender {
    [player cardSelected:3];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard3];
}

- (IBAction)card4UseButtonPressed:(id)sender {
    [player cardSelected:4];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard4];
}

- (IBAction)card0DiscardButtonPressed:(id)sender {
    [player cardDiscarded:0];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard0];
}

- (IBAction)card1DiscardButtonPressed:(id)sender {
    [player cardDiscarded:1];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard1];
}

- (IBAction)card2DiscardButtonPressed:(id)sender {
    [player cardDiscarded:2];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard2];
}

- (IBAction)card3DiscardButtonPressed:(id)sender {
    [player cardDiscarded:3];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard3];
}

- (IBAction)card4DiscardButtonPressed:(id)sender {
    [player cardDiscarded:4];
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCard4];
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Main game cycle

- (IBAction)game:(id)sender {
    if (gameOver) {    
        player = [[PlayerModel alloc] init];
        [self updatePlayerLabels];
    
        computer = [[ComputerModel alloc] init];
        [self updateComputerLabels];
    
        [self updateCard0];
        [self updateCard1];
        [self updateCard2];
        [self updateCard3];
        [self updateCard4];
        [self updateCurrentCard];
        gameOver = NO;
        self.startButton.titleLabel.textColor = [UIColor lightGrayColor];
        self.startButton.hidden = YES;
        self.startButton.enabled = NO;
    }
}


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

- (void)updateCard0
{
    [self configureCard:0
       withCardNameLabel:self.playersCard0Name
withCardDescriptionLabel:self.playersCard0Description
       withCardCostLabel:self.playersCard0Cost
           withUseButton:self.card0UseButton
       withDiscardButton:self.card0DiscardButton];

}

- (void)updateCard1
{
    [self configureCard:1
       withCardNameLabel:self.playersCard1Name
withCardDescriptionLabel:self.playersCard1Description
       withCardCostLabel:self.playersCard1Cost
           withUseButton:self.card1UseButton
       withDiscardButton:self.card1DiscardButton];

}

- (void)updateCard2
{
    [self configureCard:2
       withCardNameLabel:self.playersCard2Name
withCardDescriptionLabel:self.playersCard2Description
       withCardCostLabel:self.playersCard2Cost
           withUseButton:self.card2UseButton
       withDiscardButton:self.card2DiscardButton];

}

- (void)updateCard3
{
    [self configureCard:3
       withCardNameLabel:self.playersCard3Name
withCardDescriptionLabel:self.playersCard3Description
       withCardCostLabel:self.playersCard3Cost
           withUseButton:self.card3UseButton
       withDiscardButton:self.card3DiscardButton];
}

- (void)updateCard4
{
    [self configureCard:4
       withCardNameLabel:self.playersCard4Name
withCardDescriptionLabel:self.playersCard4Description
       withCardCostLabel:self.playersCard4Cost
           withUseButton:self.card4UseButton
       withDiscardButton:self.card4DiscardButton];
}

- (void)updateCurrentCard
{
    self.currentCardName.text = @"No card";
    self.currentCardDescription.text = @"No description";
    self.currentCardCost.text = @"No cost";
}

- (BOOL)isButtonAvailableToPlay:(NSInteger)buttonNumber
{
    NSInteger cardCost = [[player.cards objectAtIndex:buttonNumber] cardCost];
    NSInteger playerResource;
    if ([[[player.cards objectAtIndex:buttonNumber] cardColor] isEqualToString:@"Grey"]) {
        playerResource = [player bricks];
    } else if ([[[player.cards objectAtIndex:buttonNumber] cardColor] isEqualToString:@"Blue"]) {
        playerResource = [player gems];
    } else {
        playerResource = [player recruits];
    }
    if (cardCost <= playerResource) {
        return YES;
    }
    return NO;
}

- (void)configureCard:(NSInteger)cardNumber
    withCardNameLabel:(UILabel*)cardName
    withCardDescriptionLabel:(UILabel*)cardDescription
    withCardCostLabel:(UILabel*)cardCost
    withUseButton:(UIButton*)useButton
    withDiscardButton:(UIButton*)disButton
{
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Grey"]) {
        cardName.textColor = [UIColor grayColor];
        cardDescription.textColor = [UIColor grayColor];
        cardCost.textColor = [UIColor grayColor];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Blue"]) {
        cardName.textColor = [UIColor blueColor];
        cardDescription.textColor = [UIColor blueColor];
        cardCost.textColor = [UIColor blueColor];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Green"]) {
        cardName.textColor = [UIColor greenColor];
        cardDescription.textColor = [UIColor greenColor];
        cardCost.textColor = [UIColor greenColor];
    }
    cardName.text = [[[player cards] objectAtIndex:cardNumber] cardName];
    cardDescription.text = [[[player cards] objectAtIndex:cardNumber] cardDescription];
    cardCost.text = [NSString stringWithFormat:@"%d",[[[player cards] objectAtIndex:cardNumber] cardCost]];
    if ([self isButtonAvailableToPlay:cardNumber]) {
        useButton.enabled = YES;
        useButton.titleLabel.alpha = 1.0f;
    } else {
        useButton.enabled = NO;
        useButton.titleLabel.alpha = 0.2f;
    }
    //self.card5DiscardButton.enabled = NO;
    //self.card5DiscardButton.titleLabel.alpha = 0.2f;
}


@end
