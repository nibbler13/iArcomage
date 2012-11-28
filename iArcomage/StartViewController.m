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

@property (weak, nonatomic) IBOutlet UIImageView *card0Background;
@property (weak, nonatomic) IBOutlet UIImageView *card1Background;
@property (weak, nonatomic) IBOutlet UIImageView *card2Background;
@property (weak, nonatomic) IBOutlet UIImageView *card3Background;
@property (weak, nonatomic) IBOutlet UIImageView *card4Background;
@property (weak, nonatomic) IBOutlet UIImageView *card5Background;

- (IBAction)backButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *card0View;
@property (weak, nonatomic) IBOutlet UIView *card1View;
@property (weak, nonatomic) IBOutlet UIView *card2View;
@property (weak, nonatomic) IBOutlet UIView *card3View;
@property (weak, nonatomic) IBOutlet UIView *card4View;
@property (weak, nonatomic) IBOutlet UIView *card5View;

@end

@implementation StartViewController
{
    PlayerModel *player;
    ComputerModel *computer;
    BOOL gameOver;
    CardsScope *cardsScope;
    CGPoint firstTouchPoint;
    
    CGPoint defaultPositionCard0View;
    CGRect defaultRectCard0View;
    
    CGPoint defaultPositionCard1View;
    CGRect defaultRectCard1View;
    
    CGPoint defaultPositionCard2View;
    CGRect defaultRectCard2View;
    
    CGPoint defaultPositionCard3View;
    CGRect defaultRectCard3View;
    
    CGPoint defaultPositionCard4View;
    CGRect defaultRectCard4View;
    
    CGPoint defaultPositionCard5View;
    CGRect defaultRectCard5View;
    
    UIImageView *cardSelectionView;
    
    CGFloat xInitialPositionForCardView;
    CGFloat yInitialPositionForCardView;
}

#pragma mark -TouchDelegationMethods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        firstTouchPoint = [touch locationInView:self.view];
        [self dispatchFirstTouchAtPoint:[touch locationInView:self.view]];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSUInteger touchCount = 0;
    for (UITouch *touch in touches) {
        [self dispatchTouchEventToPosition:[touch locationInView:self.view]];
        touchCount++;
    }
    if (touchCount > 1) {
        NSLog(@"Found multitouch");
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
            [self dispatchTouchEndToPosition:[touch locationInView:self.view]];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"@@@@@@@@@@@@@@@@Touches canceled");
}

#pragma mark -DispatchMethods

- (void)dispatchFirstTouchAtPoint:(CGPoint)touchPoint
{
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card0View forCardImage:self.card0Background];
        
    } else if (CGRectContainsPoint(defaultRectCard1View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card1View forCardImage:self.card1Background];
        
    } else if (CGRectContainsPoint(defaultRectCard2View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card2View forCardImage:self.card2Background];
        
    } else if (CGRectContainsPoint(defaultRectCard3View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card3View forCardImage:self.card3Background];
        
    } else if (CGRectContainsPoint(defaultRectCard4View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card4View forCardImage:self.card4Background];
        
    } else if (CGRectContainsPoint(defaultRectCard5View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card5View forCardImage:self.card5Background];
    }
}

- (void)animateFirstTouchForCardView:(UIView*)cardView forCardImage:(UIImageView*)image
{
    cardSelectionView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CardSelection"]];
    cardSelectionView.center = image.center;
    cardSelectionView.alpha = 0.0;
    [cardView addSubview:cardSelectionView];
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:(UIViewAnimationCurveEaseOut)
                     animations:^{
                         cardSelectionView.alpha = 1.0;
                     }completion:^(BOOL finished){
                     }];
}

- (void)dispatchTouchEventToPosition:(CGPoint)position
{
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchPoint)) {
        [self calculateNewPosition:position forTheView:self.card0View withDefaultPosition:defaultPositionCard0View];
        
    } else if (CGRectContainsPoint(defaultRectCard1View, firstTouchPoint)) {
        [self calculateNewPosition:position forTheView:self.card1View withDefaultPosition:defaultPositionCard1View];
        
    } else if (CGRectContainsPoint(defaultRectCard2View, firstTouchPoint)) {
        [self calculateNewPosition:position forTheView:self.card2View withDefaultPosition:defaultPositionCard2View];
        
    } else if (CGRectContainsPoint(defaultRectCard3View, firstTouchPoint)) {
        [self calculateNewPosition:position forTheView:self.card3View withDefaultPosition:defaultPositionCard3View];
        
    } else if (CGRectContainsPoint(defaultRectCard4View, firstTouchPoint)) {
        [self calculateNewPosition:position forTheView:self.card4View withDefaultPosition:defaultPositionCard4View];
        
    } else if (CGRectContainsPoint(defaultRectCard5View, firstTouchPoint)) {
        [self calculateNewPosition:position forTheView:self.card5View withDefaultPosition:defaultPositionCard5View];
    }
}

- (void)calculateNewPosition:(CGPoint)position forTheView:(UIView*)theView withDefaultPosition:(CGPoint)defaultPosition
{
    [theView setCenter:
        CGPointMake(defaultPosition.x - (firstTouchPoint.x - position.x),
                    defaultPosition.y - (firstTouchPoint.y - position.y))];
}

- (void)dispatchTouchEndToPosition:(CGPoint)position
{
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchPoint)) {
        [self calculateEndPosition:position toView:self.card0View withDefaultPosition:&defaultPositionCard0View withDefaultRect:&defaultRectCard0View forCardNumber:0];

    } else if (CGRectContainsPoint(defaultRectCard1View, firstTouchPoint)) {
        [self calculateEndPosition:position toView:self.card1View withDefaultPosition:&defaultPositionCard1View withDefaultRect:&defaultRectCard1View forCardNumber:1];
        
    } else if (CGRectContainsPoint(defaultRectCard2View, firstTouchPoint)) {
        [self calculateEndPosition:position toView:self.card2View withDefaultPosition:&defaultPositionCard2View withDefaultRect:&defaultRectCard2View forCardNumber:2];
        
    } else if (CGRectContainsPoint(defaultRectCard3View, firstTouchPoint)) {
        [self calculateEndPosition:position toView:self.card3View withDefaultPosition:&defaultPositionCard3View withDefaultRect:&defaultRectCard3View forCardNumber:3];
        
    } else if (CGRectContainsPoint(defaultRectCard4View, firstTouchPoint)) {
        [self calculateEndPosition:position toView:self.card4View withDefaultPosition:&defaultPositionCard4View withDefaultRect:&defaultRectCard4View forCardNumber:4];
        
    } else if (CGRectContainsPoint(defaultRectCard5View, firstTouchPoint)) {
        [self calculateEndPosition:position toView:self.card5View withDefaultPosition:&defaultPositionCard5View withDefaultRect:&defaultRectCard5View forCardNumber:5];
    }
}

- (void)calculateEndPosition:(CGPoint)position toView:(UIView*)view withDefaultPosition:(CGPoint*)defaultPosition withDefaultRect:(CGRect*)defaultRect forCardNumber:(NSUInteger)number
{
    if (firstTouchPoint.y - 80 > position.y) {
        //=========CARD WAS BEEN SELECTED===========
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             view.center = CGPointMake(self.view.center.x, 399);
                         }completion:^(BOOL finished){
                             [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                             [player cardSelected:number];
                         }];
    } else if (firstTouchPoint.y + 80 < position.y) {
        //=======CARD WAS BEEN DISCARDED===========
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             view.center = CGPointMake(512, 1000);
                         }completion:^(BOOL finished){
                             [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                             [UIView animateWithDuration:0.5
                                                   delay:0.0 options:UIViewAnimationCurveLinear
                                              animations:^{UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
                                                  discardLabel.center = CGPointMake(view.bounds.size.width/2, view.bounds.size.height/2-30);
                                                  [view addSubview:discardLabel];
                                                  view.center = CGPointMake(400, 110);
                                              }completion:^(BOOL finished){
                                                  [player cardDiscarded:number];
                                              }];
                         }];
    } else {
        NSLog(@"                                             i'm in else");
        //========PLAYER PUT THE CARD BACK===========
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             view.center = *defaultPosition;
                         }completion:^(BOOL finished){
                             [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                         }];
    }
    
    }

- (void)releaseCardSelectionForView:(UIView*)view withDefaultPosition:(CGPoint*)defaultPosition withDefaultRect:(CGRect*)defaultRect
{
    firstTouchPoint = CGPointMake(0, 0);
    *defaultPosition = view.center;
    *defaultRect = view.frame;
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationCurveLinear
                     animations:^{
                         cardSelectionView.alpha = 0.0;
                     }completion:^(BOOL finished){
                         [cardSelectionView removeFromSuperview];
                         cardSelectionView = nil;
                     }];

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

- (void)needToUpdateComputerCards
{
    
    
    
    
    
    
    
    
    
    
    
}

- (void)computerHasDiscardTheCard:(NSInteger)number
{
    
    
    
    
    
    
    
    
    
    
    
}

- (void)computerHasPlayTheCard:(NSInteger)number
{
    
    
    
    
    
    
    
    
    
    
    
}

- (void)playerShouldTakeANewCard
{
    
    
    
    
    
    
    
    
    
    
    
}

- (void)needToUpdateLabels
{
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
    
    
    
    
    
    
    
    
    
}

#pragma mark -Player's delegate methods

- (void)playerShouldDiscardACard
{
    
    
    
    
    
    
    
    
    
}

- (void)needToCheckThatTheVictoryConditionsIsAchieved
{
    if (player.tower > 100 || player.wall > 200 || (player.bricks > 200 && player.gems > 200 && player.recruits > 200) || computer.tower == 0) {
        [cardsScope playDealSoundEffectForEvent:@"PlayerWin"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You win!" message:@"You win because you have completed the needed conditions" delegate:self cancelButtonTitle:@"Yeah! It's great!" otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)restoreUseButtons
{
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)shouldDiscardACard
{
    
    
    
    
    
    
    
    
    
    
    
}

- (void)showCurrentCard:(NSInteger)number withStatus:(NSString *)status
{
    yInitialPositionForCardView = 645.0;
    xInitialPositionForCardView = 118.0;
    /*
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationCurveLinear
                     animations:^{
                         
                         if (number != 0) {
                             self.card0View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                             xInitialPositionForCardView += 196;
                         }
                         
                         if (number != 1) {
                             self.card1View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                             xInitialPositionForCardView += 196;
                         }
                         
                         if (number != 2) {
                             self.card2View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                             xInitialPositionForCardView += 196;
                         }
                         
                         if (number != 3) {
                             self.card3View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                             xInitialPositionForCardView += 196;
                         }
                         
                         if (number != 4) {
                             self.card4View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                             xInitialPositionForCardView += 196;
                         }
                         
                         if (number != 5) {
                             self.card5View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                             xInitialPositionForCardView += 196;
                         }
                         
                     }completion:^(BOOL finished){
                         [self updateCardPositions];
                     }];
    
    
    */
    
    
    
    
    
}

- (void)needToUpdateCards
{
    [self updateAllCards];
}

- (void)needToUpdateLabelAndButton
{
    [self updatePlayerLabels];
    [self updateComputerLabels];
}

#pragma mark -Initializations

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.multipleTouchEnabled = NO;
    gameOver = YES;
    [self game];
}

- (void)viewWillDisappear:(BOOL)animated
{
    player = nil;
    computer = nil;
    gameOver = YES;
    [PlayerModel destroyPlayer];
    [ComputerModel destroyComputer];
    [super viewDidLoad];
}

#pragma mark -Buttons method
- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Main game cycle

- (void)game
{
    if (gameOver) {    
        player = [PlayerModel getPlayer];
        player.delegate = self;
        player.soundsOn = self.soundsOn;
        computer = [ComputerModel getComputer];
        computer.delegate = self;
        [self updatePlayerLabels];
        [self updateComputerLabels];
        [self updateAllCards];
        [self updateCurrentCard];
        [self updateCardPositions];
        cardsScope = [CardsScope getCardsScope];
        gameOver = NO;
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
    [self updateCardPositions];
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
          withBackground:self.card0Background];

}

- (void)updateCard1
{
    [self configureCard:1
       withCardNameLabel:self.playersCard1Name
withCardDescriptionLabel:self.playersCard1Description
       withCardCostLabel:self.playersCard1Cost
          withBackground:self.card1Background];

}

- (void)updateCard2
{
    [self configureCard:2
       withCardNameLabel:self.playersCard2Name
withCardDescriptionLabel:self.playersCard2Description
       withCardCostLabel:self.playersCard2Cost
          withBackground:self.card2Background];

}

- (void)updateCard3
{
    [self configureCard:3
       withCardNameLabel:self.playersCard3Name
withCardDescriptionLabel:self.playersCard3Description
       withCardCostLabel:self.playersCard3Cost
          withBackground:self.card3Background];
}

- (void)updateCard4
{
    [self configureCard:4
       withCardNameLabel:self.playersCard4Name
withCardDescriptionLabel:self.playersCard4Description
       withCardCostLabel:self.playersCard4Cost
          withBackground:self.card4Background];
}

- (void)updateCard5
{
    [self configureCard:5
       withCardNameLabel:self.playersCard5Name
withCardDescriptionLabel:self.playersCard5Description
       withCardCostLabel:self.playersCard5Cost
          withBackground:self.card5Background];
}

- (void)updateCurrentCard
{
    
    
    
    
    
    
    
    
    
    
    
}

- (BOOL)isCardAvailableToPlay:(NSInteger)cardNumber
{
    NSInteger cardCost = [[player.cards objectAtIndex:cardNumber] cardCost];
    NSInteger playerResource;
    if ([[[player.cards objectAtIndex:cardNumber] cardColor] isEqualToString:@"Grey"]) {
        playerResource = [player bricks];
    } else if ([[[player.cards objectAtIndex:cardNumber] cardColor] isEqualToString:@"Blue"]) {
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

- (void)updateCardPositions
{
    defaultPositionCard0View = self.card0View.center;
    defaultRectCard0View = self.card0View.frame;
    
    defaultPositionCard1View = self.card1View.center;
    defaultRectCard1View = self.card1View.frame;
    
    defaultPositionCard2View = self.card2View.center;
    defaultRectCard2View = self.card2View.frame;
    
    defaultPositionCard3View = self.card3View.center;
    defaultRectCard3View = self.card3View.frame;
    
    defaultPositionCard4View = self.card4View.center;
    defaultRectCard4View = self.card4View.frame;
    
    defaultPositionCard5View = self.card5View.center;
    defaultRectCard5View = self.card5View.frame;
}

@end
