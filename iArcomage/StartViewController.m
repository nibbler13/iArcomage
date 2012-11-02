//
//  StartViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "StartViewController.h"
#import "Card.h"
#import <QuartzCore/QuartzCore.h>

@interface StartViewController ()

@end

@implementation StartViewController
{
    PlayerModel *player;
    ComputerModel *computer;
    BOOL gameOver;
}

- (void)showCurrentCard:(NSInteger)number withStatus:(NSString *)status
{
    [self configureCard:number withCardNameLabel:self.currentCardName withCardDescriptionLabel:self.currentCardDescription withCardCostLabel:self.currentCardCost withUseButton:nil withDiscardButton:nil];
    if ([status isEqualToString:@"Discarded"]) {
        self.discardedImage.hidden = NO;
    } else {
        self.discardedImage.hidden = YES;
    }
}

- (void)needToUpdateCards
{
    [self updateAllCards];
}

- (void)needToUpdateLabelAndButton
{
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateCardsButton];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    gameOver = YES;
}

- (IBAction)card0UseButtonPressed:(id)sender {
    [player cardSelected:0];
}

- (IBAction)card1UseButtonPressed:(id)sender {
    [player cardSelected:1];
}

- (IBAction)card2UseButtonPressed:(id)sender {
    [player cardSelected:2];
}

- (IBAction)card3UseButtonPressed:(id)sender {
    [player cardSelected:3];
}

- (IBAction)card4UseButtonPressed:(id)sender {
    [player cardSelected:4];
}

- (IBAction)card0DiscardButtonPressed:(id)sender {
    [player cardDiscarded:0];
}

- (IBAction)card1DiscardButtonPressed:(id)sender {
    [player cardDiscarded:1];
}

- (IBAction)card2DiscardButtonPressed:(id)sender {
    [player cardDiscarded:2];
}

- (IBAction)card3DiscardButtonPressed:(id)sender {
    [player cardDiscarded:3];
}

- (IBAction)card4DiscardButtonPressed:(id)sender {
    [player cardDiscarded:4];
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Main game cycle

- (IBAction)game:(id)sender {
    if (gameOver) {    
        player = [PlayerModel getPlayer];
        player.delegate = self;
        [self updatePlayerLabels];
    
        computer = [ComputerModel getComputer];
        computer.delegate = self;
        [self updateComputerLabels];
        [self updateAllCards];
        [self updateCardsButton];
        [self updateCurrentCard];
        gameOver = NO;
        self.startButton.titleLabel.textColor = [UIColor lightGrayColor];
        self.startButton.hidden = YES;
        self.startButton.enabled = NO;
    }
}


#pragma mark - UpdatingLabels

- (void)updateAllCards
{
    [self updateCard0];
    [self updateCard1];
    [self updateCard2];
    [self updateCard3];
    [self updateCard4];
}

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
    self.currentCardCost.text = @"No";
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
        cardName.backgroundColor = [UIColor grayColor];
        cardDescription.backgroundColor = [UIColor grayColor];
        cardCost.backgroundColor = [UIColor grayColor];
        cardName.textColor = [UIColor whiteColor];
        cardDescription.textColor = [UIColor whiteColor];
        cardCost.textColor = [UIColor whiteColor];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Blue"]) {
        cardName.backgroundColor = [UIColor blueColor];
        cardDescription.backgroundColor = [UIColor blueColor];
        cardCost.backgroundColor = [UIColor blueColor];
        cardName.textColor = [UIColor whiteColor];
        cardDescription.textColor = [UIColor whiteColor];
        cardCost.textColor = [UIColor whiteColor];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Green"]) {
        cardName.backgroundColor = [UIColor greenColor];
        cardDescription.backgroundColor = [UIColor greenColor];
        cardCost.backgroundColor = [UIColor greenColor];
        cardName.textColor = [UIColor blackColor];
        cardDescription.textColor = [UIColor blackColor];
        cardCost.textColor = [UIColor blackColor];
    }
    //CATransition *transition = [CATransition animation];
    //transition.type = kCATransitionFade;
    //transition.duration = 1;
    //transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    //[self.view.layer addAnimation:transition forKey:@"configureCardAnimation"];
    cardName.text = [[[player cards] objectAtIndex:cardNumber] cardName];
    cardDescription.text = [[[player cards] objectAtIndex:cardNumber] cardDescription];
    cardCost.text = [NSString stringWithFormat:@"%d",[[[player cards] objectAtIndex:cardNumber] cardCost]];
    //[self.view.layer removeAnimationForKey:@"configureCardAnimation"];

}

- (void)updateCardsButton
{
    [self configureUseCardButton:self.card0UseButton andDisButton:self.card0DiscardButton atNumber:0];
    [self configureUseCardButton:self.card1UseButton andDisButton:self.card1DiscardButton atNumber:1];
    [self configureUseCardButton:self.card2UseButton andDisButton:self.card2DiscardButton atNumber:2];
    [self configureUseCardButton:self.card3UseButton andDisButton:self.card3DiscardButton atNumber:3];
    [self configureUseCardButton:self.card4UseButton andDisButton:self.card4DiscardButton atNumber:4];
}

- (void)configureUseCardButton:(UIButton*)use andDisButton:(UIButton*)dis atNumber:(NSInteger)number
{

    if ([self isButtonAvailableToPlay:number]) {
        use.enabled = YES;
        use.titleLabel.alpha = 1.0f;
    } else {
        use.enabled = NO;
        use.titleLabel.alpha = 0.2f;
    }
    if ([[[player.cards objectAtIndex:number] cardName] isEqualToString:@"Lodestone"]) {
        dis.enabled = NO;
        dis.titleLabel.alpha = 0.2f;
    } else {
        dis.enabled = YES;
        dis.titleLabel.alpha = 1.0f;
    }

}


@end
