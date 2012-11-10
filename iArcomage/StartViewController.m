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
#import "CardsScope.h"

@interface StartViewController ()

@end

@implementation StartViewController
{
    PlayerModel *player;
    ComputerModel *computer;
    BOOL gameOver;
    CardsScope *cardsScope;
}

#pragma mark -UIAlertView's delegate methods

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    player = nil;
    computer = nil;
    gameOver = YES;
    [PlayerModel destroyPlayer];
    [ComputerModel destroyComputer];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -Computer's delegate method

- (void)needToUpdateLabels
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFromBottom;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.view.layer addAnimation:transition forKey:@"configureUpdateAnimation"];
    [self configureUseCardButton:self.card0UseButton andDisButton:self.card0DiscardButton atNumber:0];
    [self configureUseCardButton:self.card1UseButton andDisButton:self.card1DiscardButton atNumber:1];
    [self configureUseCardButton:self.card2UseButton andDisButton:self.card2DiscardButton atNumber:2];
    [self configureUseCardButton:self.card3UseButton andDisButton:self.card3DiscardButton atNumber:3];
    [self configureUseCardButton:self.card4UseButton andDisButton:self.card4DiscardButton atNumber:4];
    [self configureUseCardButton:self.card5UseButton andDisButton:self.card5DiscardButton atNumber:5];
    [self.view.layer removeAnimationForKey:@"configureUpdateAnimation"];
    [self updatePlayerLabels];
    [self updateComputerLabels];
}

- (void)needToCheckThatTheVictoryConditionsIsAchievedByComputer
{
    if (computer.tower > 100 || computer.wall > 200 || computer.bricks > 200 || computer.gems > 200 || computer.recruits > 200 || player.tower == 0) {
        [cardsScope playDealSoundEffectForEvent:@"PlayerLose"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You lose!" message:@"The computer has defeated you like a boss" delegate:self cancelButtonTitle:@"Ohhh god why?" otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)showCurrentComputerCard:(NSInteger)number withStatus:(NSString *)status
{
    NSLog(@"---/--- Should update current computer card");
    /*
    if ([[[[computer cards] objectAtIndex:number] cardColor] isEqualToString:@"Grey"]) {
        self.computersCurrentCardName.textColor = [UIColor redColor];
    }
    if ([[[[computer cards] objectAtIndex:number] cardColor] isEqualToString:@"Blue"]) {
        self.computersCurrentCardName.textColor = [UIColor blueColor];
    }
    if ([[[[computer cards] objectAtIndex:number] cardColor] isEqualToString:@"Green"]) {
        self.computersCurrentCardName.textColor = [UIColor greenColor];
    }*/
    /*CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [self.view.layer addAnimation:transition forKey:@"configureCardAnimation"];
    self.computersCurrentCardName.text = [[[computer cards] objectAtIndex:number] cardName];
    self.computersCurrentCardDescription.text = [[[computer cards] objectAtIndex:number] cardDescription];
    self.computersCurrentCardCost.text = [NSString stringWithFormat:@"%d",[[[computer cards] objectAtIndex:number] cardCost]];
    [self.view.layer removeAnimationForKey:@"configureCardAnimation"];
    */
    /*
    if ([status isEqualToString:@"Discarded"]) {
        self.computersDiscardLabel.hidden = NO;
    } else {
        self.computersDiscardLabel.hidden = YES;
    }*/
    UIImageView *testImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CardBack"]];
    testImage.center = CGPointMake(439, 266);
    [self.view addSubview:testImage];
    CABasicAnimation *testImageMover = [CABasicAnimation animationWithKeyPath:@"position"];
    testImageMover.removedOnCompletion = YES;
    testImageMover.fillMode = kCAFillModeForwards;
    testImageMover.duration = 1.0f;
    testImageMover.fromValue = [NSValue valueWithCGPoint:testImage.center];
    testImageMover.toValue = [NSValue valueWithCGPoint:CGPointMake(126, 50)];
    testImageMover.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    testImageMover.delegate = self;
    [testImage.layer addAnimation:testImageMover forKey:@"testImageMover"];
    /*
    testImageMover.removedOnCompletion = NO;
    testImageMover.fillMode = kCAFillModeRemoved;
    testImageMover.duration = 1.0f;
    testImageMover.fromValue = [NSValue valueWithCGPoint:testImage.center];
    testImageMover.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2)];
    testImageMover.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    testImageMover.delegate = self;
    [testImage.layer addAnimation:testImageMover forKey:@"testImageMover"];
     */
    
}

#pragma mark -Player's delegate methods

- (void)needToCheckThatTheVictoryConditionsIsAchieved
{
    if (player.tower > 100 || player.wall > 200 || player.bricks > 200 || player.gems > 200 || player.recruits > 200 || computer.tower == 0) {
        [cardsScope playDealSoundEffectForEvent:@"PlayerWin"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You win!" message:@"You win because you have completed the needed conditions" delegate:self cancelButtonTitle:@"Yeah! It's great!" otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)restoreUseButtons
{
    self.card0UseButton.hidden = NO;
    self.card1UseButton.hidden = NO;
    self.card2UseButton.hidden = NO;
    self.card3UseButton.hidden = NO;
    self.card4UseButton.hidden = NO;
    self.card5UseButton.hidden = NO;
}

- (void)shouldDiscardACard
{
    self.card0UseButton.hidden = YES;
    self.card1UseButton.hidden = YES;
    self.card2UseButton.hidden = YES;
    self.card3UseButton.hidden = YES;
    self.card4UseButton.hidden = YES;
    self.card5UseButton.hidden = YES;
}

- (void)showCurrentCard:(NSInteger)number withStatus:(NSString *)status
{
    //[self configureCard:number withCardNameLabel:self.currentCardName withCardDescriptionLabel:self.currentCardDescription withCardCostLabel:self.currentCardCost withUseButton:nil withDiscardButton:nil];
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

#pragma mark -Initializations

- (void)viewDidLoad
{
    [super viewDidLoad];
    gameOver = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"I'm in view will disappear");
    player = nil;
    computer = nil;
    gameOver = YES;
    [PlayerModel destroyPlayer];
    [ComputerModel destroyComputer];
    [super viewDidLoad];
}

#pragma mark -Buttons method

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

- (IBAction)card5UseButtonPressed:(id)sender {
    [player cardSelected:5];
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

- (IBAction)card5DiscardButtonPressed:(id)sender {
    [player cardDiscarded:5];
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Main game cycle

- (IBAction)game:(id)sender {
    if (gameOver) {    
        player = [PlayerModel getPlayer];
        player.delegate = self;
        player.soundsOn = self.soundsOn;
        computer = [ComputerModel getComputer];
        computer.delegate = self;
        [self updatePlayerLabels];
        [self updateComputerLabels];
        [self updateAllCards];
        [self updateCardsButton];
        //[self updateCurrentCard];
        cardsScope = [CardsScope getCardsScope];
        gameOver = NO;
        self.startButton.titleLabel.textColor = [UIColor lightGrayColor];
        self.startButton.hidden = YES;
        self.startButton.enabled = NO;
    }
}


#pragma mark - UpdatingLabels

- (void)updateAllCards
{/*
    [self updateCard0];
    [self updateCard1];
    [self updateCard2];
    [self updateCard3];
    [self updateCard4];
    [self updateCard5];*/
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
    //NSLog(@"update computer label");
    //NSLog(@"%d", computer.gems);
    self.computerQuarries.text = [NSString stringWithFormat:@"%d", computer.quarries];
    self.computerMagics.text = [NSString stringWithFormat:@"%d", computer.magics];
    self.computerDungeons.text = [NSString stringWithFormat:@"%d", computer.dungeons];
    self.computerBricks.text = [NSString stringWithFormat:@"%d", computer.bricks];
    self.computerGems.text = [NSString stringWithFormat:@"%d", computer.gems];
    self.computerRecruits.text = [NSString stringWithFormat:@"%d", computer.recruits];
    self.computerWall.text = [NSString stringWithFormat:@"%d", computer.wall];
    self.computerTower.text = [NSString stringWithFormat:@"%d", computer.tower];
}
/*
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

- (void)updateCard5
{
    [self configureCard:5
      withCardNameLabel:self.playersCard5Name
withCardDescriptionLabel:self.playersCard5Description
      withCardCostLabel:self.playersCard5Cost
          withUseButton:self.card5UseButton
      withDiscardButton:self.card5DiscardButton];
}

- (void)updateCurrentCard
{
    self.currentCardName.text = @"No card";
    self.currentCardDescription.text = @"No description";
    self.currentCardCost.text = @"No";
    self.computersCurrentCardName.text = @"No card";
    self.computersCurrentCardDescription.text = @"No card";
    self.computersCurrentCardCost.text = @"No";
}
*/
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
        //cardCost.backgroundColor = [UIColor grayColor];
        cardName.textColor = [UIColor redColor];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Blue"]) {
        //cardCost.backgroundColor = [UIColor blueColor];
        cardName.textColor = [UIColor blueColor];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Green"]) {
        //cardCost.backgroundColor = [UIColor greenColor];
        cardName.textColor = [UIColor greenColor];
    }
    cardName.text = [[[player cards] objectAtIndex:cardNumber] cardName];
    cardDescription.text = [[[player cards] objectAtIndex:cardNumber] cardDescription];
    cardCost.text = [NSString stringWithFormat:@"%d",[[[player cards] objectAtIndex:cardNumber] cardCost]];

}


- (void)updateCardsButton
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.view.layer addAnimation:transition forKey:@"configureCardAnimation"];
    [self configureUseCardButton:self.card0UseButton andDisButton:self.card0DiscardButton atNumber:0];
    [self configureUseCardButton:self.card1UseButton andDisButton:self.card1DiscardButton atNumber:1];
    [self configureUseCardButton:self.card2UseButton andDisButton:self.card2DiscardButton atNumber:2];
    [self configureUseCardButton:self.card3UseButton andDisButton:self.card3DiscardButton atNumber:3];
    [self configureUseCardButton:self.card4UseButton andDisButton:self.card4DiscardButton atNumber:4];
    [self configureUseCardButton:self.card5UseButton andDisButton:self.card5DiscardButton atNumber:5];
    [self.view.layer removeAnimationForKey:@"configureCardAnimation"];
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
