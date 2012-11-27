//
//  StartViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "StartViewController.h"
#import "Card.h"
#import "CardsScope.h"

@interface StartViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelX;
@property (weak, nonatomic) IBOutlet UILabel *labelY;

@property (weak, nonatomic) IBOutlet UILabel *playerQuarries;
@property (weak, nonatomic) IBOutlet UILabel *playerMagics;
@property (weak, nonatomic) IBOutlet UILabel *playerDungeons;
@property (weak, nonatomic) IBOutlet UILabel *playerBricks;
@property (weak, nonatomic) IBOutlet UILabel *playerGems;
@property (weak, nonatomic) IBOutlet UILabel *playerRecruits;
@property (weak, nonatomic) IBOutlet UILabel *playerWall;
@property (weak, nonatomic) IBOutlet UILabel *playerTower;

@property (weak, nonatomic) IBOutlet UILabel *computerQuarries;
@property (weak, nonatomic) IBOutlet UILabel *computerMagics;
@property (weak, nonatomic) IBOutlet UILabel *computerDungeons;
@property (weak, nonatomic) IBOutlet UILabel *computerBricks;
@property (weak, nonatomic) IBOutlet UILabel *computerGems;
@property (weak, nonatomic) IBOutlet UILabel *computerRecruits;
@property (weak, nonatomic) IBOutlet UILabel *computerWall;
@property (weak, nonatomic) IBOutlet UILabel *computerTower;

@property (weak, nonatomic) IBOutlet UILabel *currentCardName;
@property (weak, nonatomic) IBOutlet UILabel *currentCardDescription;
@property (weak, nonatomic) IBOutlet UILabel *currentCardCost;

@property (weak, nonatomic) IBOutlet UILabel *computersCurrentCardDescription;
@property (weak, nonatomic) IBOutlet UILabel *computersCurrentCardName;
@property (weak, nonatomic) IBOutlet UILabel *computersCurrentCardCost;

@property (weak, nonatomic) IBOutlet UIImageView *computersDiscardLabel;

@property (weak, nonatomic) IBOutlet UILabel *playersCard0Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard0Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard0Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard1Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard1Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard1Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard2Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard2Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard2Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard3Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard3Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard3Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard4Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard4Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard4Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard5Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard5Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard5Cost;

@property (weak, nonatomic) IBOutlet UIButton *card0UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card1UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card2UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card3UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card4UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card5UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card0DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card1DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card2DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card3DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card4DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card5DiscardButton;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIImageView *discardedImage;

@property (weak, nonatomic) IBOutlet UIImageView *card0Background;
@property (weak, nonatomic) IBOutlet UIImageView *card1Background;
@property (weak, nonatomic) IBOutlet UIImageView *card2Background;
@property (weak, nonatomic) IBOutlet UIImageView *card3Background;
@property (weak, nonatomic) IBOutlet UIImageView *card4Background;
@property (weak, nonatomic) IBOutlet UIImageView *card5Background;
@property (weak, nonatomic) IBOutlet UIImageView *computerCurrentCardBackground;
@property (weak, nonatomic) IBOutlet UIImageView *playerCurrentCardBackground;


- (IBAction)card0UseButtonPressed:(id)sender;
- (IBAction)card1UseButtonPressed:(id)sender;
- (IBAction)card2UseButtonPressed:(id)sender;
- (IBAction)card3UseButtonPressed:(id)sender;
- (IBAction)card4UseButtonPressed:(id)sender;
- (IBAction)card5UseButtonPressed:(id)sender;

- (IBAction)card0DiscardButtonPressed:(id)sender;
- (IBAction)card1DiscardButtonPressed:(id)sender;
- (IBAction)card2DiscardButtonPressed:(id)sender;
- (IBAction)card3DiscardButtonPressed:(id)sender;
- (IBAction)card4DiscardButtonPressed:(id)sender;
- (IBAction)card5DiscardButtonPressed:(id)sender;

- (IBAction)backButtonPressed:(id)sender;

- (IBAction)game:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *card0View;

@end

@implementation StartViewController
{
    PlayerModel *player;
    ComputerModel *computer;
    BOOL gameOver;
    CardsScope *cardsScope;
    CGPoint firstTouchLocation;
    CGPoint defaultPositionCard0View;
    CGRect defaultRectCard0View;
}

#pragma mark -TouchDelegationMethods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touches began");
    //NSLog(@"touches count: %d", [touches count]);
    //NSUInteger touchCount = 0;
    for (UITouch *touch in touches) {
        [self dispatchFirstTouchAtPoint:[touch locationInView:self.view] forEvent:nil];
        firstTouchLocation = [touch locationInView:self.view];
        self.labelX.text = [NSString stringWithFormat:@"X: %0.1f", firstTouchLocation.x];
        self.labelY.text = [NSString stringWithFormat:@"Y: %0.1f", firstTouchLocation.y];
        //touchCount++;
    }
    //NSLog(@"touch count: %d", touchCount);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touches cancelled");
    firstTouchLocation = CGPointMake(0, 0);
    defaultRectCard0View = self.card0View.frame;
    defaultPositionCard0View = self.card0View.center;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touches ended");
    for (UITouch *touch in touches) {
        [self dispatchTouchEndEvent:self.card0View toPosition:[touch locationInView:self.view]];
    }
    
    firstTouchLocation = CGPointMake(0, 0);
    
    //defaultRectCard0View = self.card0View.frame;
    //defaultPositionCard0View = self.card0View.center;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touches moved");
    NSUInteger touchCount = 0;
    for (UITouch *touch in touches) {
        [self dispatchTouchEvent:[touch view] toPosition:[touch locationInView:self.view]];
        touchCount++;
    }
    if (touchCount > 1) {
        NSLog(@"Found multitouch");
    }
}

#pragma mark -DispatchMethods

- (void)dispatchFirstTouchAtPoint:(CGPoint)touchPoint forEvent:(UIEvent*)event
{
    NSLog(@"dispatchFirstTouch");
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchLocation)) {
        NSLog(@"I'm in card0View");
        //==========================================================
        //here should be some cool animation for card0view selection
        //==========================================================
    }
}

- (void)dispatchTouchEvent:(UIView*)theView toPosition:(CGPoint)position
{
    NSLog(@"dispatchTouchEvent");
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchLocation)) {
        //here were are transiting the cardview to touch
        [self.card0View setCenter:CGPointMake(defaultPositionCard0View.x - (firstTouchLocation.x - position.x), defaultPositionCard0View.y - (firstTouchLocation.y - position.y))];
    }
}

- (void)dispatchTouchEndEvent:(UIView*)theView toPosition:(CGPoint)position
{
    NSLog(@"dispatchEndEvent");
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchLocation)) {
        //[self animateView:self.card0View toPosition:position];
        if (firstTouchLocation.y - 80 > position.y) {
            self.card0View.center = CGPointMake(426, 411);
            [player cardSelected:0];
        } else if (firstTouchLocation.y + 80 < position.y) {
            self.card0View.center = CGPointMake(0, 1000);
            [player cardDiscarded:0];
        } else {
            self.card0View.center = defaultPositionCard0View;
        }
        
        defaultPositionCard0View = self.card0View.center;
        defaultRectCard0View = self.card0View.frame;
    }
}

#pragma mark -AnimationForGestures

- (void)animateView:(UIView*)theView toPosition:(CGPoint)position
{
    NSLog(@"animateView");
    
}

#pragma mark -UIAlertView's delegate methods

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [PlayerModel destroyPlayer];
    [ComputerModel destroyComputer];
    player = nil;
    computer = nil;
    cardsScope = nil;
    gameOver = YES;
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
    /*[self configureUseCardButton:self.card0UseButton andDisButton:self.card0DiscardButton atNumber:0];
    [self configureUseCardButton:self.card1UseButton andDisButton:self.card1DiscardButton atNumber:1];
    [self configureUseCardButton:self.card2UseButton andDisButton:self.card2DiscardButton atNumber:2];
    [self configureUseCardButton:self.card3UseButton andDisButton:self.card3DiscardButton atNumber:3];
    [self configureUseCardButton:self.card4UseButton andDisButton:self.card4DiscardButton atNumber:4];
    [self configureUseCardButton:self.card5UseButton andDisButton:self.card5DiscardButton atNumber:5];*/
    [self.view.layer removeAnimationForKey:@"configureUpdateAnimation"];
    [self updatePlayerLabels];
    [self updateComputerLabels];
}

- (void)needToCheckThatTheVictoryConditionsIsAchievedByComputer
{
    if (computer.tower > 100 || computer.wall > 200 || (computer.bricks > 200 && computer.gems > 200 && computer.recruits > 200) || player.tower == 0) {
        [cardsScope playDealSoundEffectForEvent:@"PlayerLose"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You lose!" message:@"The computer has defeated you like a boss" delegate:self cancelButtonTitle:@"Ohhh god why?" otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)showCurrentComputerCard:(NSInteger)number withStatus:(NSString *)status
{
    NSLog(@"---/--- Should update current computer card");
    
    if ([[[[computer cards] objectAtIndex:number] cardColor] isEqualToString:@"Grey"]) {
        //self.computersCurrentCardName.textColor = [UIColor redColor];
        self.computerCurrentCardBackground.image = [UIImage imageNamed:@"GreyCardBlank"];
    }
    if ([[[[computer cards] objectAtIndex:number] cardColor] isEqualToString:@"Blue"]) {
        //self.computersCurrentCardName.textColor = [UIColor blueColor];
        self.computerCurrentCardBackground.image = [UIImage imageNamed:@"BlueCardBlank"];
    }
    if ([[[[computer cards] objectAtIndex:number] cardColor] isEqualToString:@"Green"]) {
        //self.computersCurrentCardName.textColor = [UIColor greenColor];
        self.computerCurrentCardBackground.image = [UIImage imageNamed:@"GreenCardBlank"];
    }
    
    self.computersCurrentCardName.text = [[[computer cards] objectAtIndex:number] cardName];
    self.computersCurrentCardDescription.text = [[[computer cards] objectAtIndex:number] cardDescription];
    self.computersCurrentCardCost.text = [NSString stringWithFormat:@"%d",[[[computer cards] objectAtIndex:number] cardCost]];
    
    if ([status isEqualToString:@"Discarded"]) {
        self.computersDiscardLabel.hidden = NO;
    } else {
        self.computersDiscardLabel.hidden = YES;
    }
    
}

#pragma mark -Player's delegate methods

- (void)needToCheckThatTheVictoryConditionsIsAchieved
{
    if (player.tower > 100 || player.wall > 200 || (player.bricks > 200 && player.gems > 200 && player.recruits > 200) || computer.tower == 0) {
        [cardsScope playDealSoundEffectForEvent:@"PlayerWin"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You win!" message:@"You win because you have completed the needed conditions" delegate:self cancelButtonTitle:@"Yeah! It's great!" otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)restoreUseButtons
{/*
    self.card0UseButton.hidden = NO;
    self.card1UseButton.hidden = NO;
    self.card2UseButton.hidden = NO;
    self.card3UseButton.hidden = NO;
    self.card4UseButton.hidden = NO;
    self.card5UseButton.hidden = NO;*/
}

- (void)shouldDiscardACard
{/*
    self.card0UseButton.hidden = YES;
    self.card1UseButton.hidden = YES;
    self.card2UseButton.hidden = YES;
    self.card3UseButton.hidden = YES;
    self.card4UseButton.hidden = YES;
    self.card5UseButton.hidden = YES;*/
}

- (void)showCurrentCard:(NSInteger)number withStatus:(NSString *)status
{
    [self configureCard:number
            withCardNameLabel:self.currentCardName
            withCardDescriptionLabel:self.currentCardDescription
            withCardCostLabel:self.currentCardCost
            withUseButton:nil
            withDiscardButton:nil
            withBackground:self.playerCurrentCardBackground];
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
    //=========================
    //[self updateCardsButton];
    //=========================
}

#pragma mark -Initializations

- (void)viewDidLoad
{
    [super viewDidLoad];
    defaultPositionCard0View = self.card0View.center;
    defaultRectCard0View = self.card0View.frame;
    gameOver = YES;
    [self game:nil];
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
        [self updateCurrentCard];
        cardsScope = [CardsScope getCardsScope];
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
    [self updateCard5];
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
       withDiscardButton:self.card0DiscardButton
          withBackground:self.card0Background];

}

- (void)updateCard1
{
    [self configureCard:1
       withCardNameLabel:self.playersCard1Name
withCardDescriptionLabel:self.playersCard1Description
       withCardCostLabel:self.playersCard1Cost
           withUseButton:self.card1UseButton
       withDiscardButton:self.card1DiscardButton
          withBackground:self.card1Background];

}

- (void)updateCard2
{
    [self configureCard:2
       withCardNameLabel:self.playersCard2Name
withCardDescriptionLabel:self.playersCard2Description
       withCardCostLabel:self.playersCard2Cost
           withUseButton:self.card2UseButton
       withDiscardButton:self.card2DiscardButton
          withBackground:self.card2Background];

}

- (void)updateCard3
{
    [self configureCard:3
       withCardNameLabel:self.playersCard3Name
withCardDescriptionLabel:self.playersCard3Description
       withCardCostLabel:self.playersCard3Cost
           withUseButton:self.card3UseButton
       withDiscardButton:self.card3DiscardButton
          withBackground:self.card3Background];
}

- (void)updateCard4
{
    [self configureCard:4
       withCardNameLabel:self.playersCard4Name
withCardDescriptionLabel:self.playersCard4Description
       withCardCostLabel:self.playersCard4Cost
           withUseButton:self.card4UseButton
       withDiscardButton:self.card4DiscardButton
          withBackground:self.card4Background];
}

- (void)updateCard5
{
    [self configureCard:5
       withCardNameLabel:self.playersCard5Name
withCardDescriptionLabel:self.playersCard5Description
       withCardCostLabel:self.playersCard5Cost
           withUseButton:self.card5UseButton
       withDiscardButton:self.card5DiscardButton
          withBackground:self.card5Background];
}

- (void)updateCurrentCard
{
    self.currentCardName.text = @"";
    self.currentCardDescription.text = @"";
    self.currentCardCost.text = @"";
    self.computersCurrentCardName.text = @"";
    self.computersCurrentCardDescription.text = @"";
    self.computersCurrentCardCost.text = @"";
    self.playerCurrentCardBackground.image = [UIImage imageNamed:@"CardBack"];
    self.computerCurrentCardBackground.image = [UIImage imageNamed:@"CardBack"];
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
    withBackground:(UIImageView*)background
{
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Grey"]) {
        background.image = [UIImage imageNamed:@"GreyCardBlank"];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Blue"]) {
        background.image = [UIImage imageNamed:@"BlueCardBlank"];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Green"]) {
        background.image = [UIImage imageNamed:@"GreenCardBlank"];
    }
    cardName.text = [[[player cards] objectAtIndex:cardNumber] cardName];
    cardDescription.text = [[[player cards] objectAtIndex:cardNumber] cardDescription];
    cardCost.text = [NSString stringWithFormat:@"%d",[[[player cards] objectAtIndex:cardNumber] cardCost]];

}


- (void)updateCardsButton
{/*
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
    [self.view.layer removeAnimationForKey:@"configureCardAnimation"];*/
}

- (void)configureUseCardButton:(UIButton*)use andDisButton:(UIButton*)dis atNumber:(NSInteger)number
{/*

    if ([self isButtonAvailableToPlay:number]) {
        use.enabled = YES;
        use.imageView.alpha = 1.0f;
    } else {
        use.enabled = NO;
        use.imageView.alpha = 0.5f;
    }
    if ([[[player.cards objectAtIndex:number] cardName] isEqualToString:@"Lodestone"]) {
        dis.enabled = NO;
        dis.imageView.alpha = 0.5f;
    } else {
        dis.enabled = YES;
        dis.imageView.alpha = 1.0f;
    }
*/
}


@end
