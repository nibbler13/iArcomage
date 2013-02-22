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
#import "OptionsViewController.h"
#import "SoundSystem.h"
#import "VictoryConditionsViewController.h"
#import "OptionTabBarViewController.h"
#import "CampaignDataMainObject.h"
#import "CampaignData.h"
#import "CompletedView.h"
#import "ScoreSystem.h"
#import "HelpTitlesView.h"

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

@property (weak, nonatomic) IBOutlet UIImageView *card0Image;
@property (weak, nonatomic) IBOutlet UIImageView *card1Image;
@property (weak, nonatomic) IBOutlet UIImageView *card2Image;
@property (weak, nonatomic) IBOutlet UIImageView *card3Image;
@property (weak, nonatomic) IBOutlet UIImageView *card4Image;
@property (weak, nonatomic) IBOutlet UIImageView *card5Image;

@property (weak, nonatomic) IBOutlet UIView *card0View;
@property (weak, nonatomic) IBOutlet UIView *card1View;
@property (weak, nonatomic) IBOutlet UIView *card2View;
@property (weak, nonatomic) IBOutlet UIView *card3View;
@property (weak, nonatomic) IBOutlet UIView *card4View;
@property (weak, nonatomic) IBOutlet UIView *card5View;

@property (weak, nonatomic) IBOutlet UIView *playedCard0View;
@property (weak, nonatomic) IBOutlet UIImageView *playedCard0Background;
@property (weak, nonatomic) IBOutlet UILabel *playedCard0Desription;
@property (weak, nonatomic) IBOutlet UILabel *playedCard0Cost;
@property (weak, nonatomic) IBOutlet UILabel *playedCard0Name;

@property (weak, nonatomic) IBOutlet UIView *playedCard1View;
@property (weak, nonatomic) IBOutlet UIImageView *playedCard1Background;
@property (weak, nonatomic) IBOutlet UILabel *playedCard1Desription;
@property (weak, nonatomic) IBOutlet UILabel *playedCard1Cost;
@property (weak, nonatomic) IBOutlet UILabel *playedCard1Name;

@property (weak, nonatomic) IBOutlet UIView *playedCard2View;
@property (weak, nonatomic) IBOutlet UIImageView *playedCard2Background;
@property (weak, nonatomic) IBOutlet UILabel *playedCard2Desription;
@property (weak, nonatomic) IBOutlet UILabel *playedCard2Cost;
@property (weak, nonatomic) IBOutlet UILabel *playedCard2Name;

@property (weak, nonatomic) IBOutlet UIImageView *playedCard0Image;
@property (weak, nonatomic) IBOutlet UIImageView *playedCard1Image;
@property (weak, nonatomic) IBOutlet UIImageView *playedCard2Image;

@property (weak, nonatomic) IBOutlet UIImageView *computerCard0;
@property (weak, nonatomic) IBOutlet UIImageView *computerCard1;
@property (weak, nonatomic) IBOutlet UIImageView *computerCard2;
@property (weak, nonatomic) IBOutlet UIImageView *computerCard3;
@property (weak, nonatomic) IBOutlet UIImageView *computerCard4;
@property (weak, nonatomic) IBOutlet UIImageView *computerCard5;

@property (weak, nonatomic) IBOutlet UIImageView *card0NotAvailable;
@property (weak, nonatomic) IBOutlet UIImageView *card1NotAvailable;
@property (weak, nonatomic) IBOutlet UIImageView *card2NotAvailable;
@property (weak, nonatomic) IBOutlet UIImageView *card3NotAvailable;
@property (weak, nonatomic) IBOutlet UIImageView *card4NotAvailable;
@property (weak, nonatomic) IBOutlet UIImageView *card5NotAvailable;

@property (weak, nonatomic) IBOutlet UIView *playerTowerView;
@property (weak, nonatomic) IBOutlet UIView *playerWallView;

@property (weak, nonatomic) IBOutlet UIView *computerTowerView;
@property (weak, nonatomic) IBOutlet UIView *computerWallView;

@property (weak, nonatomic) IBOutlet UILabel *backgroundLabel;
@property (weak, nonatomic) IBOutlet UILabel *towersSetLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundPictureView;

@property (weak, nonatomic) IBOutlet UIImageView *playerTowerBodyBackground;
@property (weak, nonatomic) IBOutlet UIImageView *playerTowerHeadBackground;
@property (weak, nonatomic) IBOutlet UIImageView *playerWallBackground;

@property (weak, nonatomic) IBOutlet UIImageView *computerTowerBodyBackground;
@property (weak, nonatomic) IBOutlet UIImageView *computerTowerHeadBackground;
@property (weak, nonatomic) IBOutlet UIImageView *computerWallBackground;

@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property (weak, nonatomic) IBOutlet UIButton *victoryConditionsButton;

@property (weak, nonatomic) IBOutlet UILabel *computerNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;


- (IBAction)backButtonPressed:(id)sender;
- (IBAction)makePlayerWinButton:(id)sender;
- (IBAction)soundButtonPressed:(id)sender;
- (IBAction)victoryConditionsButtonPressed:(id)sender;

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
    
    BOOL isAnythingCardSelected;
    CGPoint lastTouch;
    
    BOOL isPlayedCard0Present;
    BOOL isPlayedCard1Present;
    BOOL isPlayedCard2Present;
    
    BOOL isPlayedCard0WasDiscarded;
    BOOL isPlayedCard1WasDiscarded;
    BOOL isPlayedCard2WasDiscarded;
    
    BOOL animationCompleted;
    
    BOOL operationComplete;
    
    BOOL needToReturnCardToDefaultPosition;
    
    int cardsOffset;
    
    NSArray *computersCards;
    
    BOOL doNotClearStack;
    
    NSInteger computerLastPlayedCard;
    
    float towerAim;
    float wallAim;
    
    CGFloat playerTowerBodyOriginY;
    CGFloat playerTowerBodyOriginX;
    
    NSInteger backgroundsCounter;
    NSInteger skinCounter;
    NSArray *backgroundPictures;
    
    ScoreSystem *score;
    
    //NSInteger gamesPlayed;
    //NSInteger gamesWined;
    
    UIPopoverController *popoverController;
    SoundSystem *soundSystem;
    
    CampaignDataMainObject *mainObject;
    
    BOOL victory;
}

#pragma mark - TouchDelegationMethods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (gameOver) { return; }
    
    if (!animationCompleted) { return; }
    
    if (!isAnythingCardSelected) {
        int count = 0;
        for (UITouch *touch in touches) {
            
            if (CGRectContainsPoint(defaultRectCard0View, [touch locationInView:self.view]) |
                CGRectContainsPoint(defaultRectCard1View, [touch locationInView:self.view]) |
                CGRectContainsPoint(defaultRectCard2View, [touch locationInView:self.view]) |
                CGRectContainsPoint(defaultRectCard3View, [touch locationInView:self.view]) |
                CGRectContainsPoint(defaultRectCard4View, [touch locationInView:self.view]) |
                CGRectContainsPoint(defaultRectCard5View, [touch locationInView:self.view])) {
            
            firstTouchPoint = [touch locationInView:self.view];
            lastTouch = [touch locationInView:self.view];
            
            isAnythingCardSelected = YES;
            [self dispatchFirstTouchAtPoint:[touch locationInView:self.view]];
            count++;
                
            } else { return; }
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!animationCompleted) { return; }
    
    int count = 0;
    for (UITouch *touch in touches) {
        count++;
        
        if (abs(lastTouch.x - [touch locationInView:self.view].x) > 100 |
            abs(lastTouch.y - [touch locationInView:self.view].y) > 100) {
            return;
        }
        
        lastTouch = [touch locationInView:self.view];
        [self dispatchTouchEventToPosition:[touch locationInView:self.view]];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!animationCompleted) { return; }
    
    
    for (UITouch *touch in touches) {
        if (abs(lastTouch.x - [touch locationInView:self.view].x) > 100 |
            abs(lastTouch.y - [touch locationInView:self.view].y) > 100) { return; }
        
        lastTouch = [touch locationInView:self.view];
        [self dispatchTouchEndToPosition:[touch locationInView:self.view]];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!animationCompleted) { return; }
    
    for (UITouch *touch in touches) {
        if (abs(lastTouch.x - [touch locationInView:self.view].x) > 100 |
            abs(lastTouch.y - [touch locationInView:self.view].y) > 100) { return; }
        
        lastTouch = [touch locationInView:self.view];
        [self dispatchTouchEndToPosition:[touch locationInView:self.view]];
    }
}

#pragma mark - DispatchMethods

//========================First touch algorithm=======================
- (void)dispatchFirstTouchAtPoint:(CGPoint)touchPoint
{
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card0View forCardImage:self.card0Background withCardNumber:0];
        
    } else if (CGRectContainsPoint(defaultRectCard1View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card1View forCardImage:self.card1Background withCardNumber:1];
        
    } else if (CGRectContainsPoint(defaultRectCard2View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card2View forCardImage:self.card2Background withCardNumber:2];
        
    } else if (CGRectContainsPoint(defaultRectCard3View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card3View forCardImage:self.card3Background withCardNumber:3];
        
    } else if (CGRectContainsPoint(defaultRectCard4View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card4View forCardImage:self.card4Background withCardNumber:4];
        
    } else if (CGRectContainsPoint(defaultRectCard5View, firstTouchPoint)) {
        [self animateFirstTouchForCardView:self.card5View forCardImage:self.card5Background withCardNumber:5];
    }
}

- (void)animateFirstTouchForCardView:(UIView*)cardView forCardImage:(UIImageView*)image withCardNumber:(NSInteger)number
{
    if ([self isCardAvailableToPlay:[[player cards] objectAtIndex:number]] && !player.shouldDiscardACard) {
        cardSelectionView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CardSelection"]];
    } else {
        cardSelectionView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CardSelectionRed"]];
    }
    
    cardSelectionView.center = image.center;
    cardSelectionView.alpha = 0.0;
    [cardView addSubview:cardSelectionView];
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:(UIViewAnimationCurveEaseOut)
                     animations:^{
                         cardSelectionView.alpha = 1.0;
                     }completion:nil];
}

//==================Move algorithm=====================
- (void)dispatchTouchEventToPosition:(CGPoint)position
{
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:[[player cards] objectAtIndex:0]] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) { return; }
        }
        
        if ([[[player.cards objectAtIndex:0] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) { return; }
        }
        
        [self calculateNewPosition:position forTheView:self.card0View withDefaultPosition:defaultPositionCard0View withCardNumber:0];
        
    } else if (CGRectContainsPoint(defaultRectCard1View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:[[player cards] objectAtIndex:1]] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) { return; }
        }
        
        if ([[[player.cards objectAtIndex:1] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) { return; }
        }
        
        [self calculateNewPosition:position forTheView:self.card1View withDefaultPosition:defaultPositionCard1View withCardNumber:1];
        
    } else if (CGRectContainsPoint(defaultRectCard2View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:[[player cards] objectAtIndex:2]] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) { return; }
        }
        
        if ([[[player.cards objectAtIndex:2] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) { return; }
        }
        
        [self calculateNewPosition:position forTheView:self.card2View withDefaultPosition:defaultPositionCard2View withCardNumber:2];
        
    } else if (CGRectContainsPoint(defaultRectCard3View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:[[player cards] objectAtIndex:3]] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) { return; }
        }
        
        if ([[[player.cards objectAtIndex:3] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) { return; }
        }
        
        [self calculateNewPosition:position forTheView:self.card3View withDefaultPosition:defaultPositionCard3View withCardNumber:3];
        
    } else if (CGRectContainsPoint(defaultRectCard4View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:[[player cards] objectAtIndex:4]] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) { return; }
        }
        
        if ([[[player.cards objectAtIndex:4] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) { return; }
        }
        
        [self calculateNewPosition:position forTheView:self.card4View withDefaultPosition:defaultPositionCard4View withCardNumber:4];
        
    } else if (CGRectContainsPoint(defaultRectCard5View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:[[player cards] objectAtIndex:5]] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) { return; }
        }
        
        if ([[[player.cards objectAtIndex:5] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) { return; }
        }
        
        [self calculateNewPosition:position forTheView:self.card5View withDefaultPosition:defaultPositionCard5View withCardNumber:5];
    }
}

- (void)calculateNewPosition:(CGPoint)position forTheView:(UIView*)theView withDefaultPosition:(CGPoint)defaultPosition withCardNumber:(NSInteger)number
{
    
    if (firstTouchPoint.y < position.y) {
        cardSelectionView.image = [UIImage imageNamed:@"CardSelectionRed"];
    } else {
        if ([self isCardAvailableToPlay:[[player cards] objectAtIndex:number]]) { cardSelectionView.image = [UIImage imageNamed:@"CardSelection"]; }
    }
    
    if ((firstTouchPoint.y - position.y) > 91) { return; }
    
    [theView setCenter:CGPointMake(defaultPosition.x, defaultPosition.y - (firstTouchPoint.y - position.y))];
}

//============================Touch ended algorithm========================
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
    if (![self isCardAvailableToPlay:[[player cards] objectAtIndex:number]] || player.shouldDiscardACard) {
        
            if (firstTouchPoint.y > position.y) {
                
                firstTouchPoint = CGPointMake(0, 0);
                
                [UIView animateWithDuration:0.3
                                      delay:0.0
                                    options:UIViewAnimationCurveLinear
                                 animations:^{
                                     view.center = *defaultPosition;
                                 }completion:^(BOOL finished){
                                     
                                     needToReturnCardToDefaultPosition = YES;
                                     
                                     [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                                 }];
                return;
            }
        }
    
    if ([[[player.cards objectAtIndex:number] cardName] isEqualToString:@"Lodestone"]) {
        if (firstTouchPoint.y < position.y) {
            
            firstTouchPoint = CGPointMake(0, 0);
            
            [UIView animateWithDuration:0.3
                                  delay:0.0
                                options:UIViewAnimationCurveLinear
                             animations:^{
                                 view.center = *defaultPosition;
                             }completion:^(BOOL finished){
                                 
                                 needToReturnCardToDefaultPosition = YES;
                                 
                                 [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                             }];

            
            return;
        }
    }
    
    if (firstTouchPoint.y - 40 > position.y) {
        if (![self isCardAvailableToPlay:[[player cards] objectAtIndex:number]]) {
            [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
            return;
        }
        //=========CARD WAS BEEN SELECTED===========
        
        firstTouchPoint = CGPointMake(0, 0);
        
        [soundSystem playDealSoundEffectForEvent:@"WillTakeACard"];
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             view.center = CGPointMake(512, 400);
                             
                             xInitialPositionForCardView = 118;
                             cardsOffset = 196;
                             
                             player.playedCard = number;
                             
                             if (number != 0) { [self calculateBeforePlayOffsetForPlayerCard:0 withView:self.card0View]; }
                             if (number != 1) { [self calculateBeforePlayOffsetForPlayerCard:1 withView:self.card1View]; }
                             if (number != 2) { [self calculateBeforePlayOffsetForPlayerCard:2 withView:self.card2View]; }
                             if (number != 3) { [self calculateBeforePlayOffsetForPlayerCard:3 withView:self.card3View]; }
                             if (number != 4) { [self calculateBeforePlayOffsetForPlayerCard:4 withView:self.card4View]; }
                             if (number != 5) { [self calculateBeforePlayOffsetForPlayerCard:5 withView:self.card5View]; }
                             
                         }completion:^(BOOL finished){
                             
                             player.isThatPlayerTurn = YES;
                             
                             [[[player cards] objectAtIndex:number] initPlayerModel:player andComputerModel:computer];
                             
                                 
                                 if ([[player.cards objectAtIndex:number] quarriesSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] magicsSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] dungeonsSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] quarriesEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] magicsEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] dungeonsEnemy] > 0) {
                                     [soundSystem playDealSoundEffectForEvent:@"WillIncreaseSelfGeneralResource"];
                                 }
                                 if ([[player.cards objectAtIndex:number] quarriesSelf] < 0 & player.quarries > 1 ||
                                     [[player.cards objectAtIndex:number] magicsSelf] < 0 & player.magics > 1 ||
                                     [[player.cards objectAtIndex:number] dungeonsSelf] < 0 & player.dungeons > 1 ||
                                     [[player.cards objectAtIndex:number] quarriesEnemy] < 0 & computer.quarries > 1 ||
                                     [[player.cards objectAtIndex:number] magicsEnemy] < 0 & computer.magics > 1 ||
                                     [[player.cards objectAtIndex:number] dungeonsEnemy] < 0 & computer.dungeons > 1) {
                                     [soundSystem playDealSoundEffectForEvent:@"WillDecreaseSelfGeneralResource"];
                                 }
                                 if ([[player.cards objectAtIndex:number] bricksSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] gemsSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] recruitsSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] bricksEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] gemsEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] recruitsEnemy] > 0) {
                                     [soundSystem playDealSoundEffectForEvent:@"WillIncreaseSelfCommonResource"];
                                 }
                                 if ([[player.cards objectAtIndex:number] bricksSelf] < 0 & player.bricks > 0 ||
                                     [[player.cards objectAtIndex:number] gemsSelf] < 0 & player.gems > 0 ||
                                     [[player.cards objectAtIndex:number] recruitsSelf] < 0 & player.recruits > 0 ||
                                     [[player.cards objectAtIndex:number] bricksEnemy] < 0 & computer.bricks > 0 ||
                                     [[player.cards objectAtIndex:number] gemsEnemy] < 0 & computer.gems > 0 ||
                                     [[player.cards objectAtIndex:number] recruitsEnemy] < 0 & computer.recruits > 0) {
                                     [soundSystem playDealSoundEffectForEvent:@"WillDecreaseSelfCommonResource"];
                                 }
                                 if ([[player.cards objectAtIndex:number] towerSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] wallSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] towerEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] wallEnemy] > 0) {
                                     [soundSystem playDealSoundEffectForEvent:@"WillIncreaseTowerOrWall"];
                                 }
                                 if ([[player.cards objectAtIndex:number] towerSelf] < 0 ||
                                     [[player.cards objectAtIndex:number] wallSelf] < 0 ||
                                     [[player.cards objectAtIndex:number] towerEnemy] < 0 ||
                                     [[player.cards objectAtIndex:number] wallEnemy] < 0) {
                                     [soundSystem playDealSoundEffectForEvent:@"WillTakeDamage"];
                                 }
                             
                             
                             [player cardSelected:number];
                             
                             [self needToCheckThatTheVictoryConditionsIsAchieved];
                             
                             [self needToUpdateLabels];
                             [self updateTowersAndWalls];
                             
                             [self configureAnimationsForCardNumber:number];
                             
                             [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                             
                             if (player.shouldDiscardACard) {
                                 UILabel *discardLabel = [[UILabel alloc] init];
                                 [discardLabel setText:@"DISCARD A CARD"];
                                 [discardLabel setAlpha:0.6f];
                                 [discardLabel setShadowColor:[UIColor blackColor]];
                                 [discardLabel setShadowOffset:CGSizeMake(1.0f, 1.0f)];
                                 [discardLabel setBackgroundColor:[UIColor clearColor]];
                                 [discardLabel setTextColor:[self.computerNameLabel textColor]];
                                 [discardLabel setFont:[self.computerNameLabel font]];
                                 [discardLabel sizeToFit];
                                 [discardLabel setCenter:CGPointMake(512, 514)];
                                 [discardLabel setFrame:CGRectIntegral(discardLabel.frame)];
                                 discardLabel.tag = 1100;
                                 [self.view insertSubview:discardLabel aboveSubview:self.backgroundPictureView];
                             }
                             
                             double howLongShouldBeAnimation;
                             
                             if (doNotClearStack) { howLongShouldBeAnimation = 0.0; }
                             else { howLongShouldBeAnimation = 0.5; }
                             
                             [UIView animateWithDuration:howLongShouldBeAnimation
                                                   delay:0.0
                                                 options:UIViewAnimationCurveLinear
                                              animations:^{
                                                  if (!doNotClearStack) {
                                                      self.playedCard0View.center = CGPointMake(234, 110);
                                                      self.playedCard1View.center = CGPointMake(234, 110);
                                                      self.playedCard2View.center = CGPointMake(234, 110);
                                                      self.playedCard0View.alpha = 0.0;
                                                      self.playedCard1View.alpha = 0.0;
                                                      self.playedCard2View.alpha = 0.0;
                                                  }
                                                  
                                              }completion:^(BOOL finished){
                                                  
                                                  if (!doNotClearStack) {
                                                      isPlayedCard0Present = NO;
                                                      isPlayedCard1Present = NO;
                                                      isPlayedCard2Present = NO;
                                                      isPlayedCard0WasDiscarded = NO;
                                                      isPlayedCard1WasDiscarded = NO;
                                                      isPlayedCard2WasDiscarded = NO;
                                                      self.playedCard0View.hidden = YES;
                                                      self.playedCard1View.hidden = YES;
                                                      self.playedCard2View.hidden = YES;
                                                      self.playedCard0View.alpha = 1.0;
                                                      self.playedCard1View.alpha = 1.0;
                                                      self.playedCard2View.alpha = 1.0;
                                                      self.playedCard0View.center = CGPointMake(400, 110);
                                                      self.playedCard1View.center = CGPointMake(566, 110);
                                                      self.playedCard2View.center = CGPointMake(732, 110);
                                                      UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1000];
                                                      [tempView removeFromSuperview];
                                                      tempView = (UIImageView*)[self.view viewWithTag:1001];
                                                      [tempView removeFromSuperview];
                                                      tempView = (UIImageView*)[self.view viewWithTag:1002];
                                                      [tempView removeFromSuperview];
                                                  }
                             
                                                  [UIView animateWithDuration:0.5
                                                                        delay:0.5
                                                                      options:UIViewAnimationCurveLinear
                                                                   animations:^{
                                                  
                                                                       [self configurePlayedCardsForCardNumber:number withView:view isThatForPlayer:YES];
                                                  
                                                }completion:^(BOOL finished){
                                                  
                                                  if (isPlayedCard0Present) { self.playedCard0View.hidden = NO; }
                                                  if (isPlayedCard1Present) { self.playedCard1View.hidden = NO; }
                                                  if (isPlayedCard2Present) { self.playedCard2View.hidden = NO; }
                                                  
                                                    if (player.shouldPlayAgain || player.shouldDiscardACard) {
                                                      doNotClearStack = YES;
                                                      
                                                      xInitialPositionForCardView = 118;
                                                      cardsOffset = 196;
                                                      
                                                      [self calculateBeforePlayOffsetForPlayerCard:0 withView:self.card0View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:1 withView:self.card1View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:2 withView:self.card2View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:3 withView:self.card3View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:4 withView:self.card4View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:5 withView:self.card5View];
                                                      
                                                      xInitialPositionForCardView = 90;
                                                      cardsOffset = 169;
                                                      
                                                      [player getANewCard];
                                                      
                                                      [self needToUpdateLabels];
                                                      [self updateAllCards];
                                                      
                                                      [soundSystem playDealSoundEffectForEvent:@"WillTakeACard"];
                                                      
                                                      [UIView animateWithDuration:0.5
                                                                            delay:0.0
                                                                          options:UIViewAnimationCurveLinear
                                                                       animations:^{
                                                                           self.card0View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card1View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card2View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card3View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card4View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card5View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           
                                                                           [self updateCardPositions];
                                                                           
                                                                       }completion:^(BOOL finished){
                                                                           
                                                                           isAnythingCardSelected = NO;
                                                                           
                                                                           animationCompleted = YES;
                                                                           
                                                                           player.shouldPlayAgain = NO;
                                                                       }];
                                                  }
                                                  if (!player.shouldPlayAgain) {
                                                      
                                                      player.isThatPlayerTurn = NO;
                                                      
                                                      doNotClearStack = NO;
                                                      
                                                      [computer nextTurnIncreaseResource];
                                                      [self animateComputerTurn];
                                                  }
                                    }];
                         }];
            }];
        
    } else if (firstTouchPoint.y + 40 < position.y) {
        
        //=======CARD WAS BEEN DISCARDED===========
        
        firstTouchPoint = CGPointMake(0, 0);
        
        [soundSystem playDealSoundEffectForEvent:@"WillTakeACard"];
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             
                             view.center = CGPointMake(view.center.x, 1000);
                             
                             xInitialPositionForCardView = 118;
                             cardsOffset = 196;
                             
                             player.playedCard = number;
                             
                             if (number != 0) { [self calculateBeforePlayOffsetForPlayerCard:0 withView:self.card0View]; }
                             if (number != 1) { [self calculateBeforePlayOffsetForPlayerCard:1 withView:self.card1View]; }
                             if (number != 2) { [self calculateBeforePlayOffsetForPlayerCard:2 withView:self.card2View]; }
                             if (number != 3) { [self calculateBeforePlayOffsetForPlayerCard:3 withView:self.card3View]; }
                             if (number != 4) { [self calculateBeforePlayOffsetForPlayerCard:4 withView:self.card4View]; }
                             if (number != 5) { [self calculateBeforePlayOffsetForPlayerCard:5 withView:self.card5View]; }
                             
                             [self needToCheckThatTheVictoryConditionsIsAchieved];
                             
                         }completion:^(BOOL finished){
                             
                             player.isThatPlayerTurn = YES;
                             
                             [player cardDiscarded:number];
                             
                             [self needToUpdateLabels];
                             
                             double howLongShouldBeAnimation;
                             
                             if (doNotClearStack) { howLongShouldBeAnimation = 0.0; }
                             else { howLongShouldBeAnimation = 0.5; }
                             
                             [UIView animateWithDuration:howLongShouldBeAnimation
                                                   delay:0.0
                                                 options:UIViewAnimationCurveLinear
                                              animations:^{
                                                  if (!doNotClearStack) {
                                                      self.playedCard0View.center = CGPointMake(234, 110);
                                                      self.playedCard1View.center = CGPointMake(234, 110);
                                                      self.playedCard2View.center = CGPointMake(234, 110);
                                                      self.playedCard0View.alpha = 0.0;
                                                      self.playedCard1View.alpha = 0.0;
                                                      self.playedCard2View.alpha = 0.0;
                                                  }
                                                  
                                              }completion:^(BOOL finished){
                                                  
                                                  if (!doNotClearStack) {
                                                      isPlayedCard0Present = NO;
                                                      isPlayedCard1Present = NO;
                                                      isPlayedCard2Present = NO;
                                                      isPlayedCard0WasDiscarded = NO;
                                                      isPlayedCard1WasDiscarded = NO;
                                                      isPlayedCard2WasDiscarded = NO;
                                                      self.playedCard0View.hidden = YES;
                                                      self.playedCard1View.hidden = YES;
                                                      self.playedCard2View.hidden = YES;
                                                      self.playedCard0View.alpha = 1.0;
                                                      self.playedCard1View.alpha = 1.0;
                                                      self.playedCard2View.alpha = 1.0;
                                                      self.playedCard0View.center = CGPointMake(400, 110);
                                                      self.playedCard1View.center = CGPointMake(566, 110);
                                                      self.playedCard2View.center = CGPointMake(732, 110);
                                                      UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1000];
                                                      [tempView removeFromSuperview];
                                                      tempView = (UIImageView*)[self.view viewWithTag:1001];
                                                      [tempView removeFromSuperview];
                                                      tempView = (UIImageView*)[self.view viewWithTag:1002];
                                                      [tempView removeFromSuperview];
                                                  }
                                                  
                                                  [UIView animateWithDuration:0.5
                                                                        delay:0.2
                                                                      options:UIViewAnimationCurveLinear
                                                                   animations:^{
                                                                    
                                                                       [self configurePlayedCardsForCardNumber:number withView:view isThatForPlayer:YES];
                                                                       
                                                                       if (number == 0)      { self.card0NotAvailable.hidden = YES; }
                                                                       else if (number == 1) { self.card1NotAvailable.hidden = YES; }
                                                                       else if (number == 2) { self.card2NotAvailable.hidden = YES; }
                                                                       else if (number == 3) { self.card3NotAvailable.hidden = YES; }
                                                                       else if (number == 4) { self.card4NotAvailable.hidden = YES; }
                                                                       else if (number == 5) { self.card5NotAvailable.hidden = YES; }
                                                  
                                                                   }completion:^(BOOL finished){
                                                  
                                                  if (isPlayedCard0Present) { self.playedCard0View.hidden = NO; }
                                                  if (isPlayedCard1Present) { self.playedCard1View.hidden = NO; }
                                                  if (isPlayedCard2Present) { self.playedCard2View.hidden = NO; }
                                                  
                                                  [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                                                  
                                                  ///////////////////////////////////////////////////////
                                                  if (player.shouldDiscardACard) {
                                                      player.shouldDiscardACard = NO;
                                                      
                                                      [[self.view viewWithTag:1100] removeFromSuperview];
                                                      
                                                      xInitialPositionForCardView = 118;
                                                      cardsOffset = 196;
                                                      
                                                      [self calculateBeforePlayOffsetForPlayerCard:0 withView:self.card0View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:1 withView:self.card1View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:2 withView:self.card2View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:3 withView:self.card3View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:4 withView:self.card4View];
                                                      [self calculateBeforePlayOffsetForPlayerCard:5 withView:self.card5View];
                                                      
                                                      xInitialPositionForCardView = 90;
                                                      cardsOffset = 169;
                                                      
                                                      [player getANewCard];
                                                      
                                                      [self needToUpdateLabels];
                                                      [self updateAllCards];
                                                      
                                                      [soundSystem playDealSoundEffectForEvent:@"WillTakeACard"];
                                                      
                                                      [UIView animateWithDuration:0.5
                                                                            delay:0.0
                                                                          options:UIViewAnimationCurveLinear
                                                                       animations:^{
                                                                           self.card0View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card1View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card2View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card3View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card4View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           self.card5View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                           xInitialPositionForCardView += cardsOffset;
                                                                           
                                                                           
                                                                           [self updateCardPositions];
                                                                           
                                                                       }completion:^(BOOL finished){
                                                                           isAnythingCardSelected = NO;
                                                                           animationCompleted = YES;
                                                                       }];
                                                      return;
                                                  }
                                                  
                                                  ///////////////////////////////////////////////////////
                                                  
                                                  doNotClearStack = NO;     
                                                                       
                                                  player.isThatPlayerTurn = NO;
                                                                       
                                                  [self needToUpdateLabels];
                                                                       
                                                  [computer nextTurnIncreaseResource];
                                                  [self animateComputerTurn];
                                              }];
                                    }];
                         }];
        
    } else {
        
        //========PLAYER PUT THE CARD BACK===========
        
        firstTouchPoint = CGPointMake(0, 0);
        
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             view.center = *defaultPosition;
                         }completion:^(BOOL finished){
                             
                             needToReturnCardToDefaultPosition = YES;
                             
                             [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                         }];
    }
}

- (void)releaseCardSelectionForView:(UIView*)view withDefaultPosition:(CGPoint*)defaultPosition withDefaultRect:(CGRect*)defaultRect
{
    *defaultPosition = view.center;
    *defaultRect = view.frame;
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:UIViewAnimationCurveLinear
                     animations:^{
                         cardSelectionView.alpha = 0.0;
                     }completion:^(BOOL finished){
                         
                         [cardSelectionView removeFromSuperview];
                         cardSelectionView = nil;
                         
                         if (needToReturnCardToDefaultPosition) {
                             animationCompleted = YES;
                             isAnythingCardSelected = NO;
                             needToReturnCardToDefaultPosition = NO;
                         }
                     }];
}

#pragma mark - UIAlertView's delegate methods

/*- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self deleteOldFile];
    [self dismissViewControllerAnimated:YES completion:nil];
}*/

#pragma mark - Computer's delegate method

- (void)animateComputerTurn
{
    if (gameOver) { return; }
    
    [self needToCheckThatTheVictoryConditionsIsAchieved];
    [computer computerTurn];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    [self setPlayersCardsInvisible:YES];
    
    if (computer.playedCard == -1) {
        xInitialPositionForCardView = 90;
        cardsOffset = 169;
    } else {
        xInitialPositionForCardView = 118.0;
        cardsOffset = 196;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Разложение либо всех карт компьютера на столе (если первый ход), либо оставшихся пяти в руке, выдача новой карты
    
    [self calculateBeforePlayOffsetForComputerCard:0 withView:self.computerCard0];
    [self calculateBeforePlayOffsetForComputerCard:1 withView:self.computerCard1];
    [self calculateBeforePlayOffsetForComputerCard:2 withView:self.computerCard2];
    [self calculateBeforePlayOffsetForComputerCard:3 withView:self.computerCard3];
    [self calculateBeforePlayOffsetForComputerCard:4 withView:self.computerCard4];
    [self calculateBeforePlayOffsetForComputerCard:5 withView:self.computerCard5];
    
    [self updateComputerResourceLabels];
    
    [self setComputersCardsInvisible:NO];
    
    [soundSystem playDealSoundEffectForEvent:@"WillTakeACard"];
    
    //////////////////////////////////////////
    //Разложение всех карт компьютера на столе
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationCurveLinear
                     animations:^{
                         
                         yInitialPositionForCardView = 645.0;
                         xInitialPositionForCardView = 90;
                         
                         self.computerCard0.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                         xInitialPositionForCardView += 169;
                         
                         self.computerCard1.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                         xInitialPositionForCardView += 169;
                         
                         self.computerCard2.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                         xInitialPositionForCardView += 169;
                         
                         self.computerCard3.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                         xInitialPositionForCardView += 169;
                         
                         self.computerCard4.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                         xInitialPositionForCardView += 169;
                         
                         self.computerCard5.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                         xInitialPositionForCardView += 169;
                         
                         [self configureCard:[[computer cards] objectAtIndex:computer.playedCard]
                                   withCardNameLabel:self.playersCard0Name
                            withCardDescriptionLabel:self.playersCard0Description
                                   withCardCostLabel:self.playersCard0Cost
                                      withBackground:self.card0Background
                                withNotAvailableView:self.card0NotAvailable
                                       withCardImage:self.card0Image
                                     isThisForPlayer:NO];
                         
                         if (computer.playedCard == 0)      { self.card0View.center = CGPointMake(self.computerCard0.center.x, self.computerCard0.center.y); }
                         else if (computer.playedCard == 1) { self.card0View.center = CGPointMake(self.computerCard1.center.x, self.computerCard1.center.y); }
                         else if (computer.playedCard == 2) { self.card0View.center = CGPointMake(self.computerCard2.center.x, self.computerCard2.center.y); }
                         else if (computer.playedCard == 3) { self.card0View.center = CGPointMake(self.computerCard3.center.x, self.computerCard3.center.y); }
                         else if (computer.playedCard == 4) { self.card0View.center = CGPointMake(self.computerCard4.center.x, self.computerCard4.center.y); }
                         else if (computer.playedCard == 5) { self.card0View.center = CGPointMake(self.computerCard5.center.x, self.computerCard5.center.y); }
                         
                     }completion:^(BOOL finished){
                         
                         [soundSystem playDealSoundEffectForEvent:@"WillTakeACard"];
                         
                         /////////////////////////////////////////////////////////////////////////////////
                         //Перемещение сыгранной компьютером карты на стол или сброшенной в невидимую зону
                         [UIView animateWithDuration:0.5
                                               delay:0.2
                                             options:UIViewAnimationCurveLinear
                                          animations:^{
                                              
                                              xInitialPositionForCardView = 118.0;
                                              cardsOffset = 196;
                                              
                                              [self calculateOffsetForPlayedComputerCard:0 withView:self.computerCard0];
                                              [self calculateOffsetForPlayedComputerCard:1 withView:self.computerCard1];
                                              [self calculateOffsetForPlayedComputerCard:2 withView:self.computerCard2];
                                              [self calculateOffsetForPlayedComputerCard:3 withView:self.computerCard3];
                                              [self calculateOffsetForPlayedComputerCard:4 withView:self.computerCard4];
                                              [self calculateOffsetForPlayedComputerCard:5 withView:self.computerCard5];

                                          }completion:^(BOOL finished)
                          {
                              ////////////////////////////////////////////////////////////////
                              //Передвижение сыгранной или сброшенной компьютером карты в стэк
                              
                              if (!computer.isCardBeenDiscarded) {
                                  
                                  if ([[computer.cards objectAtIndex:computer.playedCard] quarriesSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] quarriesEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsEnemy] > 0) {
                                      [soundSystem playDealSoundEffectForEvent:@"WillIncreaseSelfGeneralResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] quarriesSelf] < 0 & computer.quarries > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsSelf] < 0 & computer.magics > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsSelf] < 0 & computer.dungeons > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] quarriesEnemy] < 0 & player.quarries > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsEnemy] < 0 & player.magics > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsEnemy] < 0 & player.dungeons > 1) {
                                      [soundSystem playDealSoundEffectForEvent:@"WillDecreaseSelfGeneralResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] bricksSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] bricksEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsEnemy] > 0) {
                                      [soundSystem playDealSoundEffectForEvent:@"WillIncreaseSelfCommonResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] bricksSelf] < 0 & computer.bricks > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsSelf] < 0 & computer.gems > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsSelf] < 0 & computer.recruits > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] bricksEnemy] < 0 & player.bricks > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsEnemy] < 0 & player.gems > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsEnemy] < 0 & player.recruits > 0) {
                                      [soundSystem playDealSoundEffectForEvent:@"WillDecreaseSelfCommonResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] towerSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] towerEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallEnemy] > 0) {
                                      [soundSystem playDealSoundEffectForEvent:@"WillIncreaseTowerOrWall"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] towerSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] towerEnemy] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallEnemy] < 0) {
                                      [soundSystem playDealSoundEffectForEvent:@"WillTakeDamage"];
                                  }
                                  
                                  
                                  [computer payForTheCard:computer.playedCard];
                                  [[computer.cards objectAtIndex:computer.playedCard] processCard];
                              }
                              
                              [self needToUpdateLabels];
                              [self updateTowersAndWalls];
                              
                              if (!computer.isCardBeenDiscarded) {
                                  [self configureAnimationsForCardNumber:computer.playedCard];
                              }
                              
                              [self needToCheckThatTheVictoryConditionsIsAchieved];
                              
                              double howLongShouldBeAnimation;
                              
                              if (doNotClearStack) { howLongShouldBeAnimation = 0.0; }
                              else { howLongShouldBeAnimation = 0.5; }
                              
                              [UIView animateWithDuration:howLongShouldBeAnimation
                                                    delay:0.0
                                                  options:UIViewAnimationCurveLinear
                                               animations:^{
                                                   if (!doNotClearStack) {
                                                       self.playedCard0View.center = CGPointMake(234, 110);
                                                       self.playedCard1View.center = CGPointMake(234, 110);
                                                       self.playedCard2View.center = CGPointMake(234, 110);
                                                       self.playedCard0View.alpha = 0.0;
                                                       self.playedCard1View.alpha = 0.0;
                                                       self.playedCard2View.alpha = 0.0;
                                                   }
                                                   
                                               }completion:^(BOOL finished){
                                                   if (!doNotClearStack) {
                                                       isPlayedCard0Present = NO;
                                                       isPlayedCard1Present = NO;
                                                       isPlayedCard2Present = NO;
                                                       isPlayedCard0WasDiscarded = NO;
                                                       isPlayedCard1WasDiscarded = NO;
                                                       isPlayedCard2WasDiscarded = NO;
                                                       self.playedCard0View.hidden = YES;
                                                       self.playedCard1View.hidden = YES;
                                                       self.playedCard2View.hidden = YES;
                                                       self.playedCard0View.alpha = 1.0;
                                                       self.playedCard1View.alpha = 1.0;
                                                       self.playedCard2View.alpha = 1.0;
                                                       self.playedCard0View.center = CGPointMake(400, 110);
                                                       self.playedCard1View.center = CGPointMake(566, 110);
                                                       self.playedCard2View.center = CGPointMake(732, 110);
                                                       UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1000];
                                                       [tempView removeFromSuperview];
                                                       tempView = (UIImageView*)[self.view viewWithTag:1001];
                                                       [tempView removeFromSuperview];
                                                       tempView = (UIImageView*)[self.view viewWithTag:1002];
                                                       [tempView removeFromSuperview];
                                                   }
                                                   
                              [UIView animateWithDuration:0.5
                                                    delay:0.2
                                                  options:UIViewAnimationCurveLinear
                                               animations:^{
                                                   
                                                   self.card0NotAvailable.hidden = YES;
                                                   
                                                   if (computer.playedCard == 0) { [self configurePlayedCardsForCardNumber:0 withView:self.card0View isThatForPlayer:NO]; }
                                                   if (computer.playedCard == 1) { [self configurePlayedCardsForCardNumber:1 withView:self.card0View isThatForPlayer:NO]; }
                                                   if (computer.playedCard == 2) { [self configurePlayedCardsForCardNumber:2 withView:self.card0View isThatForPlayer:NO]; }
                                                   if (computer.playedCard == 3) { [self configurePlayedCardsForCardNumber:3 withView:self.card0View isThatForPlayer:NO]; }
                                                   if (computer.playedCard == 4) { [self configurePlayedCardsForCardNumber:4 withView:self.card0View isThatForPlayer:NO]; }
                                                   if (computer.playedCard == 5) { [self configurePlayedCardsForCardNumber:5 withView:self.card0View isThatForPlayer:NO]; }
                                                   
                                               }completion:^(BOOL finished){
                                                   
                                                   if (isPlayedCard0Present) { self.playedCard0View.hidden = NO; }
                                                   if (isPlayedCard1Present) { self.playedCard1View.hidden = NO; }
                                                   if (isPlayedCard2Present) { self.playedCard2View.hidden = NO; }
                                                   
                                                   ///////////////////////////////////////////////////////////////////////////////////////////////////
                                                   //Проверяем нужно ли компьютеру сыграть еще раз
                                                   if (computer.shouldDiscardACard) {
                                                       doNotClearStack = YES;
                                                       
                                                       computerLastPlayedCard = computer.playedCard;
                                                       
                                                       [self animateComputerTurn];
                                                       
                                                       return;
                                                   }
                                                   
                                                   if (computer.shouldPlayAgain) {
                                                    
                                                       doNotClearStack = YES;
                                                       computer.shouldPlayAgain = NO;
                                                       
                                                       computerLastPlayedCard = computer.playedCard;
                                                       
                                                       [self animateComputerTurn];
                                                       
                                                       return;
                                                   }
                                                   
                                                   ////////////////////////////////////////////////////////////////////////////////////////////////
                                                   //Ход компьютера закончился, начинается ход игрока, нужно очистить стол и привести его в порядок
                                                   
                                                   if (!computer.shouldPlayAgain) {
                                                       
                                                   [self updateAllCards];
                                                   
                                                   xInitialPositionForCardView = 118;
                                                   cardsOffset = 196;
                                                   
                                                   [self setComputersCardsInvisible:YES];
                                                   [self setPlayersCardsInvisible:NO];
                                                   
                                                   [self calculateBeforePlayOffsetForPlayerCard:0 withView:self.card0View];
                                                   [self calculateBeforePlayOffsetForPlayerCard:1 withView:self.card1View];
                                                   [self calculateBeforePlayOffsetForPlayerCard:2 withView:self.card2View];
                                                   [self calculateBeforePlayOffsetForPlayerCard:3 withView:self.card3View];
                                                   [self calculateBeforePlayOffsetForPlayerCard:4 withView:self.card4View];
                                                   [self calculateBeforePlayOffsetForPlayerCard:5 withView:self.card5View];
                                                   
                                                   [UIView animateWithDuration:0.5
                                                                         delay:0
                                                                       options:UIViewAnimationCurveLinear
                                                                    animations:^{
                                                                        
                                                                        xInitialPositionForCardView = 90;
                                                                        cardsOffset = 169;
                                                                        
                                                                        [player getANewCard];
                                                                        [player nextTurnIncreaseResource];
                                                                        
                                                                        [self needToCheckThatTheVictoryConditionsIsAchieved];
                                                                        
                                                                        [self needToUpdateLabels];
                                                                        [self updateAllCards];
                                                                        
                                                                        [soundSystem playDealSoundEffectForEvent:@"WillTakeACard"];
                                                                        
                                                                        self.card0View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                        xInitialPositionForCardView += cardsOffset;
                                                                        
                                                                        self.card1View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                        xInitialPositionForCardView += cardsOffset;
                                                                        
                                                                        self.card2View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                        xInitialPositionForCardView += cardsOffset;
                                                                        
                                                                        self.card3View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                        xInitialPositionForCardView += cardsOffset;
                                                                        
                                                                        self.card4View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                        xInitialPositionForCardView += cardsOffset;
                                                                        
                                                                        self.card5View.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
                                                                        xInitialPositionForCardView += cardsOffset;
                                                                         
                                                                        [self updateCardPositions];
                                                                        
                                                                    }completion:^(BOOL finished){
                                                                        
                                                                        computer.isThatComputerTurn = NO;
                                                                        
                                                                        computerLastPlayedCard = computer.playedCard;
                                                                        
                                                                        isAnythingCardSelected = NO;
                                                                        
                                                                        animationCompleted = YES;
                                                                        
                                                                        doNotClearStack = NO;
                                                                        
                                                                        [self savePlayerAndComputerModels];
                                                                        
                                                                        
                                                                    }];}
                                                        }];
                                               }];
                                    }];
                     }];
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

- (void)calculateBeforePlayOffsetForPlayerCard:(NSInteger)number withView:(UIView*)cardView
{
    if (player.playedCard != number) {
        cardView.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
        xInitialPositionForCardView += cardsOffset;
    } else { cardView.center = CGPointMake(234, 110); }
}

- (void)calculateBeforePlayOffsetForComputerCard:(NSInteger)number withView:(UIImageView*)cardView
{
    if (computerLastPlayedCard != number) {
        cardView.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
        xInitialPositionForCardView += cardsOffset;
    } else { cardView.center = CGPointMake(234, 110); }
}

- (void)calculateOffsetForPlayedComputerCard:(NSInteger)number withView:(UIImageView*)cardView
{
    if (computer.playedCard != number) {
        cardView.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
        xInitialPositionForCardView += cardsOffset;
    } else {
        self.card0View.hidden = NO;
        cardView.hidden = YES;
        if (computer.isCardBeenDiscarded) {
            self.card0View.center = CGPointMake(cardView.center.x, 1000);
        } else {
            self.card0View.center = CGPointMake(512, 400);
        }
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)configurePlayedCardsForCardNumber:(NSInteger)number withView:(UIView*)cardView isThatForPlayer:(BOOL)isForPlayer
{
    Card *tempCard;
    if (isForPlayer) { tempCard = [[player cards] objectAtIndex:number]; }
    else { tempCard = [[computer cards] objectAtIndex:number]; }
    
    BOOL isCardBeenDiscarded = NO;
    if (isForPlayer) { if (player.isCardHasBeenDiscarded) { isCardBeenDiscarded = YES; } }
    else { if (computer.isCardBeenDiscarded) { isCardBeenDiscarded = YES; } }
    
    if (!isPlayedCard0Present) {
        
        [self configureCard:tempCard
          withCardNameLabel:self.playedCard0Name
   withCardDescriptionLabel:self.playedCard0Desription
          withCardCostLabel:self.playedCard0Cost
             withBackground:self.playedCard0Background
       withNotAvailableView:nil
              withCardImage:self.playedCard0Image
            isThisForPlayer:isForPlayer];
        
        cardView.center = CGPointMake(400, 110);
        
        if (isCardBeenDiscarded) {
            isPlayedCard0WasDiscarded = YES;
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard0View.bounds.size.width/2, self.playedCard0View.bounds.size.height/2-30);
            discardLabel.tag = 1000;
            [self.playedCard0View addSubview:discardLabel];
        }
        
        isPlayedCard0Present = YES;
        
    } else if (!isPlayedCard1Present){
        
        [self configureCard:tempCard
          withCardNameLabel:self.playedCard1Name
   withCardDescriptionLabel:self.playedCard1Desription
          withCardCostLabel:self.playedCard1Cost
             withBackground:self.playedCard1Background
       withNotAvailableView:nil
              withCardImage:self.playedCard1Image
            isThisForPlayer:isForPlayer];
        
        cardView.center = CGPointMake(566, 110);
        
        if (isCardBeenDiscarded) {
            isPlayedCard1WasDiscarded = YES;
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard1View.bounds.size.width/2, self.playedCard1View.bounds.size.height/2-30);
            discardLabel.tag = 1001;
            [self.playedCard1View addSubview:discardLabel];
        }
        
        isPlayedCard1Present = YES;
        
    } else if (!isPlayedCard2Present) {
        
        [self configureCard:tempCard
          withCardNameLabel:self.playedCard2Name
   withCardDescriptionLabel:self.playedCard2Desription
          withCardCostLabel:self.playedCard2Cost
             withBackground:self.playedCard2Background
       withNotAvailableView:nil
              withCardImage:self.playedCard2Image
            isThisForPlayer:isForPlayer];
        
        cardView.center = CGPointMake(732, 110);
        
        if (isCardBeenDiscarded) {
            isPlayedCard2WasDiscarded = YES;
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard2View.bounds.size.width/2, self.playedCard2View.bounds.size.height/2-30);
            discardLabel.tag = 1002;
            [self.playedCard2View addSubview:discardLabel];
        }
        
        isPlayedCard2Present = YES;
        
    } else {
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             self.playedCard0View.center = CGPointMake(234, 110);
                             self.playedCard0View.alpha = 0.0;
                             self.playedCard1View.center = CGPointMake(400, 110);
                             self.playedCard2View.center = CGPointMake(566, 110);
                             
                             
                         }completion:^(BOOL finished){
                             
                             self.playedCard0Background.image = self.playedCard1Background.image;
                             [self.playedCard0Image setImage:[UIImage imageNamed:self.playedCard1Name.text]];
                             [self.playedCard0Cost setText:self.playedCard1Cost.text];
                             [self.playedCard0Name setText:self.playedCard1Name.text];
                             [self.playedCard0Desription setText:self.playedCard1Desription.text];
                             
                             if (isPlayedCard1WasDiscarded) {
                                 UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1000];
                                 [tempView removeFromSuperview];
                                 tempView = (UIImageView*)[self.view viewWithTag:1001];
                                 [tempView removeFromSuperview];
                                 UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
                                 discardLabel.center = CGPointMake(self.playedCard0View.bounds.size.width/2, self.playedCard0View.bounds.size.height/2-30);
                                 discardLabel.tag = 1000;
                                 [self.playedCard0View addSubview:discardLabel];
                                 isPlayedCard1WasDiscarded = NO;
                                 isPlayedCard0WasDiscarded = YES;
                             } else {
                                 isPlayedCard0WasDiscarded = NO;
                             }
                             
                             self.playedCard1Background.image = self.playedCard2Background.image;
                             [self.playedCard1Image setImage:[UIImage imageNamed:self.playedCard2Name.text]];
                             [self.playedCard1Cost setText:self.playedCard2Cost.text];
                             [self.playedCard1Name setText:self.playedCard2Name.text];
                             [self.playedCard1Desription setText:self.playedCard2Desription.text];
                             
                             if (isPlayedCard2WasDiscarded) {
                                 UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1001];
                                 [tempView removeFromSuperview];
                                 tempView = (UIImageView*)[self.view viewWithTag:1002];
                                 [tempView removeFromSuperview];
                                 UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
                                 discardLabel.center = CGPointMake(self.playedCard1View.bounds.size.width/2, self.playedCard1View.bounds.size.height/2-30);
                                 discardLabel.tag = 1001;
                                 [self.playedCard1View addSubview:discardLabel];
                                 isPlayedCard2WasDiscarded = NO;
                                 isPlayedCard1WasDiscarded = YES;
                             } else {
                                 isPlayedCard1WasDiscarded = NO;
                             }
                             
                             [self configureCard:tempCard
                               withCardNameLabel:self.playedCard2Name
                        withCardDescriptionLabel:self.playedCard2Desription
                               withCardCostLabel:self.playedCard2Cost
                                  withBackground:self.playedCard2Background
                            withNotAvailableView:nil
                                   withCardImage:self.playedCard2Image
                                 isThisForPlayer:isForPlayer];
                             
                             if (isCardBeenDiscarded) {
                                 UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
                                 discardLabel.center = CGPointMake(self.playedCard2View.bounds.size.width/2, self.playedCard2View.bounds.size.height/2-30);
                                 discardLabel.tag = 1002;
                                 [self.playedCard2View addSubview:discardLabel];
                                 isPlayedCard2WasDiscarded = YES;
                             } else {
                                 isPlayedCard2WasDiscarded = NO;
                             }
                             
                             if (!isPlayedCard0WasDiscarded) {
                                 UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1000];
                                 [tempView removeFromSuperview];
                             }
                             if (!isPlayedCard1WasDiscarded) {
                                 UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1001];
                                 [tempView removeFromSuperview];
                             }
                             if (!isPlayedCard2WasDiscarded) {
                                 UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1002];
                                 [tempView removeFromSuperview];
                             }
                             
                             self.playedCard0View.alpha = 1.0;
                             self.playedCard0View.center = CGPointMake(400, 110);
                             self.playedCard1View.center = CGPointMake(566, 110);
                             self.playedCard2View.center = CGPointMake(732, 110);
                             self.playedCard2View.hidden = YES;
                         }];
        cardView.center = CGPointMake(732, 110);
    }
}

- (void)setPlayersCardsInvisible:(BOOL)invisible
{
    self.card0View.hidden = invisible;
    self.card1View.hidden = invisible;
    self.card2View.hidden = invisible;
    self.card3View.hidden = invisible;
    self.card4View.hidden = invisible;
    self.card5View.hidden = invisible;
}

- (void)setComputersCardsInvisible:(BOOL)invisible
{
    self.computerCard0.hidden = invisible;
    self.computerCard1.hidden = invisible;
    self.computerCard2.hidden = invisible;
    self.computerCard3.hidden = invisible;
    self.computerCard4.hidden = invisible;
    self.computerCard5.hidden = invisible;
}

- (void)needToUpdateLabels
{
    [self updatePlayerLabels];
    [self updateComputerLabels];
}

#pragma mark - Victory conditions checker

- (void)needToCheckThatTheVictoryConditionsIsAchieved
{
    if (gameOver) {
        return;
    }
    
    NSString *finalLabel;
    
    if (player.tower >= towerAim) {
        score.winnedByConstruction += 1;
        finalLabel = @"by tower construction";
        victory = YES;
    } else if (player.bricks >= self.resourcesCampaignAim || player.gems >= self.resourcesCampaignAim || player.recruits >= self.resourcesCampaignAim) {
        score.winnedByCollection += 1;
        finalLabel = @"by resource collection";
        victory = YES;
    } else if (computer.tower < 1) {
        score.winnedByDestruction += 1;
        finalLabel = @"by tower destruction";
        victory = YES;
    } else if (computer.tower >= towerAim) {
        finalLabel = @"Computer have win by tower construction";
        victory = NO;
    } else if (computer.bricks >= self.resourcesCampaignAim || computer.gems >= self.resourcesCampaignAim || computer.recruits >= self.resourcesCampaignAim) {
        finalLabel = @"Computer have win by resource collection";
        victory = NO;
    } else if (player.tower < 1) {
        finalLabel = @"Computer have win by tower destruction";
        victory = NO;
    } else {
        return;
    }
    
    if (victory) {
        [soundSystem playDealSoundEffectForEvent:@"PlayerWin"];
    } else {
        score.lossesGames += 1;
        [soundSystem playDealSoundEffectForEvent:@"PlayerLose"];
    }
    
    gameOver = YES;
    
    [self drawFinalTitlesWithTitle:finalLabel isThisWin:victory];

}

- (void)drawFinalTitlesWithTitle:(NSString*)title isThisWin:(BOOL)win
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1024.0, 768.0)];
    view.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.6f];
    
    [self.view addSubview:view];
    
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    fadeAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    fadeAnimation.duration = 1.0f;
    [view.layer addAnimation:fadeAnimation forKey:@"fadeAnimation"];
    
    NSString *completedViewName;
    CompletedView *completedView;
    
    if (win) {
        if (self.isThisCampaignPlaying && ![[mainObject.taverns objectAtIndex:self.levelNumber] isAchieved]) {
                        
            if (self.levelNumber < 12) {
                completedViewName = @"CompletedView";
                completedView = [[[NSBundle mainBundle] loadNibNamed:completedViewName owner:self options:nil] lastObject];
                
                NSArray *songsName = [NSArray arrayWithObjects:
                                      @"Harmondale theme",
                                      @"Tularean Forest theme",
                                      @"Erathia theme",
                                      @"Bracada Desert theme",
                                      @"Devja theme",
                                      @"Stone City theme",
                                      @"Barrow Drowns theme",
                                      @"Celeste theme",
                                      @"The Pit theme",
                                      @"Avlee theme",
                                      @"Tatalia theme",
                                      @"Evermorn Isle theme",
                                      @"Nighon theme",
                                      @"Bonus Track 1",
                                      @"Bonus Track 2",
                                      @"Bonus Track 3",
                                      @"Bonus Track 4",
                                      @"Bonus Track 5",
                                      @"Bonus Track 6",
                                      nil];

                [completedView.backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"BackgroundPreview%d", self.levelNumber+1]]];
                [completedView.textureImageVIew setImage:[UIImage imageNamed:[NSString stringWithFormat:@"texturePreview%d", self.levelNumber+1]]];
                [completedView.trackNameLabel setText:songsName[self.levelNumber]];
            } else {
                completedViewName = @"CongratulationView";
                completedView = [[[NSBundle mainBundle] loadNibNamed:completedViewName owner:self options:nil] lastObject];
            }
        } else {
            completedViewName = @"CompletedWithScoreView";
            
            completedView = [[[NSBundle mainBundle] loadNibNamed:completedViewName owner:self options:nil] lastObject];
            completedView.gamesLossLabel.text = [NSString stringWithFormat:@"%d", score.lossesGames];
            completedView.gamesWinnedLabel.text = [NSString stringWithFormat:@"%d", score.winnedByCollection + score.winnedByConstruction + score.winnedByDestruction];
            completedView.totalGamePlayedLabel.text = [NSString stringWithFormat:@"%d", score.winnedByCollection + score.winnedByConstruction + score.winnedByDestruction + score.lossesGames];
        }
    } else {
        completedViewName = @"LossView";
        completedView = [[[NSBundle mainBundle] loadNibNamed:completedViewName owner:self options:nil] lastObject];
    }
    
    completedView.byTowerConstructionLabel.text = title;
    
    completedView.delegate = (id)self;
    
    completedView.center = view.center;
    
    [self.view addSubview:completedView];
    
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    
    bounceAnimation.duration = 1.5;
    bounceAnimation.delegate = self;
    
    bounceAnimation.values = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:0.5f],
                              [NSNumber numberWithFloat:1.0f], nil];
    
    bounceAnimation.keyTimes = [NSArray arrayWithObjects:
                                [NSNumber numberWithFloat:0.0f],
                                [NSNumber numberWithFloat:1.0f], nil];
    
    bounceAnimation.timingFunctions = [NSArray arrayWithObjects:
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], nil];
    
    [completedView.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [completedView.layer addAnimation:fadeAnimation forKey:@"fadeAnimation"];

}

#pragma mark - Initializations

- (void)viewWillDisappear:(BOOL)animated
{
    [PlayerModel destroyPlayer];
    [ComputerModel destroyComputer];
    [CardsScope destroyCardsScope];
    player = nil;
    computer = nil;
    cardsScope = nil;
    
    [soundSystem stopMusic];
    
    [CampaignDataMainObject destroyCampaignDataMainObject];
    
    [super viewWillDisappear:animated];
}

#pragma mark - Buttons method
- (IBAction)backButtonPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    OptionsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"quitViewController"];
    controller.delegate = self;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
    popoverController.delegate = (id)self;
    [popoverController presentPopoverFromRect:self.backButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
}

- (void)noQuitButtonPressed
{
    [popoverController dismissPopoverAnimated:YES];
}

- (void)yesQuitButtonPressed
{
    [popoverController dismissPopoverAnimated:YES];
    
    if (self.isThisCampaignPlaying) { [self.delegate levelCompletedWithVictory:NO]; }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)makePlayerWinButton:(id)sender
{
    player.tower = 400;
}

- (IBAction)soundButtonPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    if (self.isThisCampaignPlaying) {
        OptionsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"OptionsView"];
        controller.delegate = self;
        popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
        popoverController.delegate = (id)self;
        [popoverController presentPopoverFromRect:self.soundButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    } else {
        OptionTabBarViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
        controller.rootController = self;
        popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
        popoverController.delegate = (id)self;
        [popoverController presentPopoverFromRect:self.soundButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    }
}

- (IBAction)victoryConditionsButtonPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    
    VictoryConditionsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"VictoryConditions"];
    controller.tower = towerAim;
    controller.resources = self.resourcesCampaignAim;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
    
    [popoverController presentPopoverFromRect:self.victoryConditionsButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

#pragma mark - Main game cycle

- (void)game
{
    player = [PlayerModel getPlayer];
    player.delegate = self;
    computer = [ComputerModel getComputer];
    computer.delegate = self;
    cardsScope = [CardsScope getCardsScope];
    
    mainObject = [CampaignDataMainObject sharedCampaignDataMainObject];
    
    if (self.needToLoadGame) {
        [self loadPlayerAndComputer];
    } else {
        [self deleteOldFile];
    }
    
    if (self.isThisCampaignPlaying) {
            
        if (!self.needToLoadGame) {
            player.tower = self.initialTowerValue;
            player.wall = self.initialWallValue;
            computer.tower = self.initialTowerValue;
            computer.wall = self.initialWallValue;
        }
            
        towerAim = self.towerCampaignAim;
        wallAim = self.towerCampaignAim * 2;
            
        self.backgroundPictureView.image = [UIImage imageNamed:self.backgroundImage];
            
        self.playerTowerBodyBackground.image = [UIImage imageNamed:self.towerImage];
        self.playerTowerHeadBackground.image = [UIImage imageNamed:self.playerTowerHeadImage];
        self.playerWallBackground.image = [UIImage imageNamed:self.wallImage];
            
        self.computerTowerBodyBackground.image = [UIImage imageNamed:self.towerImage];
        self.computerTowerHeadBackground.image = [UIImage imageNamed:self.computerTowerHeadImage];
        self.computerWallBackground.image = [UIImage imageNamed:self.wallImage];
            
    } else {
        towerAim = 100.0;
        wallAim = 100.0;
        self.resourcesCampaignAim = 200;
    }
    
    [self updatePlayerLabels];
    [self updateComputerLabels];
    [self updateAllCards];
    [self updateCardPositions];
    
    score = [[ScoreSystem alloc] init];
    
    doNotClearStack = NO;
    computerLastPlayedCard = -1;
    yInitialPositionForCardView = 645.0;
        
    if (player.tower == 0 ||
        player.wall == 0 ||
        computer.tower == 0 ||
        computer.wall == 0 ||
        towerAim == 0 ||
        wallAim == 0) {
        NSLog(@"THERE IS AN ERROR WITH INITIALIZATION BASIC PARAMETERS");
    }
        
    self.playerTowerView.autoresizesSubviews = NO;
    self.playerTowerView.clipsToBounds = YES;
        
    self.playerWallView.autoresizesSubviews = NO;
    self.playerWallView.clipsToBounds = YES;
        
    self.computerTowerView.autoresizesSubviews = NO;
    self.computerTowerView.clipsToBounds = YES;
        
    self.computerWallView.autoresizesSubviews = NO;
    self.computerWallView.clipsToBounds = YES;
        
    [self updateTowersAndWalls];
    
    if (!self.isThisCampaignPlaying) {
        [self needToChangeRandomBackgroundMode];
        [self needToChangeRandomMusicMode];
    }
    
    [self needToChangeHardMode];
    
    //NSLog(@"%d", [[NSUserDefaults standardUserDefaults] boolForKey:@"hideHelpTitles"]);
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hideHelpTitles"]) {
        HelpTitlesView *helpView = [[[NSBundle mainBundle] loadNibNamed:@"HelpTitlesView" owner:self options:nil] lastObject];
        helpView.center = self.view.center;
        [self.view addSubview:helpView];
    }
}

#pragma mark - UpdatingLabels

- (void)updateTowersAndWalls
{
    NSInteger playerTower = player.tower;
    NSInteger playerWall = player.wall;
    NSInteger computerTower = computer.tower;
    NSInteger computerWall = computer.wall;
    
    if (playerTower > towerAim) { playerTower = towerAim; }
    if (playerWall > wallAim) { playerWall = wallAim; }
    if (computerTower > towerAim) { computerTower = towerAim; }
    if (computerWall > wallAim) { computerWall = wallAim; }
    
    [self.playerTowerView setFrame:CGRectMake(self.playerTowerView.frame.origin.x,
                                              (float)(495-(152+324*(playerTower/towerAim))),
                                              self.playerTowerView.frame.size.width,
                                              (float)(152+324*(playerTower/towerAim)))];
    
    [self.playerWallView setFrame:CGRectMake(self.playerWallView.frame.origin.x,
                                             (float)(495-(318*(playerWall/wallAim))),
                                             self.playerWallView.frame.size.width,
                                             (float)(318*(playerWall/wallAim)))];
    
    [self.computerTowerView setFrame:CGRectMake(self.computerTowerView.frame.origin.x,
                                              (float)(495-(152+324*(computerTower/towerAim))),
                                              self.computerTowerView.frame.size.width,
                                              (float)(152+324*(computerTower/towerAim)))];
    
    [self.computerWallView setFrame:CGRectMake(self.computerWallView.frame.origin.x,
                                             (float)(495-(318*(computerWall/wallAim))),
                                             self.computerWallView.frame.size.width,
                                             (float)(318*(computerWall/wallAim)))];
}

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
    [self.playerQuarries sizeToFit];
    self.playerMagics.text = [NSString stringWithFormat:@"%d", player.magics];
    [self.playerMagics sizeToFit];
    self.playerDungeons.text = [NSString stringWithFormat:@"%d", player.dungeons];
    [self.playerDungeons sizeToFit];
    self.playerBricks.text = [NSString stringWithFormat:@"%d", player.bricks];
    [self.playerBricks sizeToFit];
    self.playerGems.text = [NSString stringWithFormat:@"%d", player.gems];
    [self.playerGems sizeToFit];
    self.playerRecruits.text = [NSString stringWithFormat:@"%d", player.recruits];
    [self.playerRecruits sizeToFit];
    self.playerWall.text = [NSString stringWithFormat:@"%d", player.wall];
    self.playerTower.text = [NSString stringWithFormat:@"%d", player.tower];
}

- (void)updateComputerLabels
{
    [self updateComputerResourceLabels];
    [self updateComputerTowerAndWallLabels];
}

- (void)updateComputerResourceLabels
{
    self.computerQuarries.text = [NSString stringWithFormat:@"%d", computer.quarries];
    [self.computerQuarries sizeToFit];
    self.computerMagics.text = [NSString stringWithFormat:@"%d", computer.magics];
    [self.computerMagics sizeToFit];
    self.computerDungeons.text = [NSString stringWithFormat:@"%d", computer.dungeons];
    [self.computerDungeons sizeToFit];
    self.computerBricks.text = [NSString stringWithFormat:@"%d", computer.bricks];
    [self.computerBricks sizeToFit];
    self.computerGems.text = [NSString stringWithFormat:@"%d", computer.gems];
    [self.computerGems sizeToFit];
    self.computerRecruits.text = [NSString stringWithFormat:@"%d", computer.recruits];
    [self.computerRecruits sizeToFit];
}

- (void)updateComputerTowerAndWallLabels
{
    self.computerWall.text = [NSString stringWithFormat:@"%d", computer.wall];
    self.computerTower.text = [NSString stringWithFormat:@"%d", computer.tower];
}

- (void)updateCard0
{
    [self configureCard:[[player cards] objectAtIndex:0]
       withCardNameLabel:self.playersCard0Name
withCardDescriptionLabel:self.playersCard0Description
       withCardCostLabel:self.playersCard0Cost
          withBackground:self.card0Background
    withNotAvailableView:self.card0NotAvailable
           withCardImage:self.card0Image
         isThisForPlayer:YES];
}

- (void)updateCard1
{
    [self configureCard:[[player cards] objectAtIndex:1]
       withCardNameLabel:self.playersCard1Name
withCardDescriptionLabel:self.playersCard1Description
       withCardCostLabel:self.playersCard1Cost
          withBackground:self.card1Background
    withNotAvailableView:self.card1NotAvailable
           withCardImage:self.card1Image
         isThisForPlayer:YES];
}

- (void)updateCard2
{
    [self configureCard:[[player cards] objectAtIndex:2]
       withCardNameLabel:self.playersCard2Name
withCardDescriptionLabel:self.playersCard2Description
       withCardCostLabel:self.playersCard2Cost
          withBackground:self.card2Background
    withNotAvailableView:self.card2NotAvailable
           withCardImage:self.card2Image
         isThisForPlayer:YES];
}

- (void)updateCard3
{
    [self configureCard:[[player cards] objectAtIndex:3]
       withCardNameLabel:self.playersCard3Name
withCardDescriptionLabel:self.playersCard3Description
       withCardCostLabel:self.playersCard3Cost
          withBackground:self.card3Background
    withNotAvailableView:self.card3NotAvailable
           withCardImage:self.card3Image
         isThisForPlayer:YES];
}

- (void)updateCard4
{
    [self configureCard:[[player cards] objectAtIndex:4]
       withCardNameLabel:self.playersCard4Name
withCardDescriptionLabel:self.playersCard4Description
       withCardCostLabel:self.playersCard4Cost
          withBackground:self.card4Background
    withNotAvailableView:self.card4NotAvailable
           withCardImage:self.card4Image
         isThisForPlayer:YES];
}

- (void)updateCard5
{
    [self configureCard:[[player cards] objectAtIndex:5]
       withCardNameLabel:self.playersCard5Name
withCardDescriptionLabel:self.playersCard5Description
       withCardCostLabel:self.playersCard5Cost
          withBackground:self.card5Background
    withNotAvailableView:self.card5NotAvailable
           withCardImage:self.card5Image
         isThisForPlayer:YES];
}

- (BOOL)isCardAvailableToPlay:(Card*)card
{
    NSInteger cardCost = [card cardCost];
    NSInteger playerResource;
    
    if ([[card cardColor] isEqualToString:@"Grey"]) { playerResource = [player bricks]; }
    else if ([[card cardColor] isEqualToString:@"Blue"]) { playerResource = [player gems]; }
    else { playerResource = [player recruits]; }
    
    if (cardCost <= playerResource) { return YES; }
    
    return NO;
}

- (void)configureCard:(Card*)card
    withCardNameLabel:(UILabel*)cardName
    withCardDescriptionLabel:(UILabel*)cardDescription
    withCardCostLabel:(UILabel*)cardCost
    withBackground:(UIImageView*)background
    withNotAvailableView:(UIImageView*)view
    withCardImage:(UIImageView*)cardImage
    isThisForPlayer:(BOOL)isForPlayer
{
    if ([[card cardColor] isEqualToString:@"Grey"])  { background.image = [UIImage imageNamed:@"CardBlank_Red"]; }
    if ([[card cardColor] isEqualToString:@"Blue"])  { background.image = [UIImage imageNamed:@"CardBlank_Blue"]; }
    if ([[card cardColor] isEqualToString:@"Green"]) { background.image = [UIImage imageNamed:@"CardBlank_Green"]; }
    
    cardImage.image = [UIImage imageNamed:[card cardName]];
    cardName.text = [card cardName];
    cardDescription.text = [card cardDescription];
    cardCost.text = [NSString stringWithFormat:@"%d",[card cardCost]];
    
    [cardName setFrame:CGRectIntegral(cardName.frame)];
    [cardDescription setFrame:CGRectIntegral(cardDescription.frame)];
    [cardCost setFrame:CGRectIntegral(cardCost.frame)];
    
    if (isForPlayer) {
        if (![self isCardAvailableToPlay:card]) {
            view.hidden = NO;
        } else {
            view.hidden = YES;
        }
    } else {
        if (computer.isCardBeenDiscarded) {
            view.hidden = NO;
        } else {
            view.hidden = YES;
        }
    }
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

#pragma mark - Animations

- (void)configureAnimationsForCardNumber:(NSInteger)number
{
    //NSLog(@"player.isThatPlayerTurn: %d, computer,isThisComputerTurn: %d", player.isThatPlayerTurn, computer.isThatComputerTurn);
    
    if (player.isThatPlayerTurn) {
        
        if ([[player.cards objectAtIndex:number] quarriesSelf] > 0){
            [self calculatePositionOfAnimationForLabel:self.playerQuarries isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] quarriesSelf] < 0 & player.quarries > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerQuarries isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] magicsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerMagics isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] magicsSelf] < 0 & player.magics > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerMagics isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] dungeonsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerDungeons isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] dungeonsSelf] < 0 & player.dungeons > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerDungeons isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] quarriesEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerQuarries isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] quarriesEnemy] < 0 & computer.quarries > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerQuarries isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] magicsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerMagics isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] magicsEnemy] < 0 & computer.magics > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerMagics isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] dungeonsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerDungeons isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] dungeonsEnemy] < 0 & computer.dungeons > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerDungeons isAnimationPositive:NO];
        }
        
        
        if ([[player.cards objectAtIndex:number] bricksSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerBricks isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] bricksSelf] < 0 & player.bricks > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerBricks isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] gemsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerGems isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] gemsSelf] < 0 & player.gems > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerGems isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] recruitsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerRecruits isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] recruitsSelf] < 0 & player.recruits > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerRecruits isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] bricksEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerBricks isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] bricksEnemy] < 0 & computer.bricks > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerBricks isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] gemsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerGems isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] gemsEnemy] < 0 & computer.gems > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerGems isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] recruitsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerRecruits isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] recruitsEnemy] < 0 & computer.recruits > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerRecruits isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] towerSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerTower isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] towerSelf] < 0) {
            [self calculatePositionOfAnimationForLabel:self.playerTower isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] wallSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerWall isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] wallSelf] < 0) {
            [self calculatePositionOfAnimationForLabel:self.playerWall isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] towerEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerTower isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] towerEnemy] < 0) {
            [self calculatePositionOfAnimationForLabel:self.computerTower isAnimationPositive:NO];
        }
        
        if ([[player.cards objectAtIndex:number] wallEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerWall isAnimationPositive:YES];
        } else if ([[player.cards objectAtIndex:number] wallEnemy] < 0) {
            [self calculatePositionOfAnimationForLabel:self.computerWall isAnimationPositive:NO];
        }
        
    } else if (computer.isThatComputerTurn) {
            
        if ([[computer.cards objectAtIndex:number] quarriesSelf] > 0){
            [self calculatePositionOfAnimationForLabel:self.computerQuarries isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] quarriesSelf] < 0 & computer.quarries > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerQuarries isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] magicsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerMagics isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] magicsSelf] < 0 & computer.magics > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerMagics isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] dungeonsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerDungeons isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] dungeonsSelf] < 0 & computer.dungeons > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerDungeons isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] quarriesEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerQuarries isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] quarriesEnemy] < 0 & player.quarries > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerQuarries isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] magicsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerMagics isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] magicsEnemy] < 0 & player.magics > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerMagics isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] dungeonsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerDungeons isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] dungeonsEnemy] < 0 & player.dungeons > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerDungeons isAnimationPositive:NO];
        }
        
        
        if ([[computer.cards objectAtIndex:number] bricksSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerBricks isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] bricksSelf] < 0 & computer.bricks > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerBricks isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] gemsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerGems isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] gemsSelf] < 0 & computer.gems > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerGems isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] recruitsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerRecruits isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] recruitsSelf] < 0 & computer.recruits > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerRecruits isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] bricksEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerBricks isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] bricksEnemy] < 0 & player.bricks > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerBricks isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] gemsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerGems isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] gemsEnemy] < 0 & player.gems > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerGems isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] recruitsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerRecruits isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] recruitsEnemy] < 0 & player.recruits > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerRecruits isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] towerSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerTower isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] towerSelf] < 0) {
            [self calculatePositionOfAnimationForLabel:self.computerTower isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] wallSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerWall isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] wallSelf] < 0) {
            [self calculatePositionOfAnimationForLabel:self.computerWall isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] towerEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerTower isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] towerEnemy] < 0) {
            [self calculatePositionOfAnimationForLabel:self.playerTower isAnimationPositive:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] wallEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerWall isAnimationPositive:YES];
        } else if ([[computer.cards objectAtIndex:number] wallEnemy] < 0) {
            [self calculatePositionOfAnimationForLabel:self.playerWall isAnimationPositive:NO];
        }

    } else {
        NSLog(@"wrongAnimationConfigurating, isThisTurn property is nil");
    }
}

- (void)calculatePositionOfAnimationForLabel:(UILabel*)label isAnimationPositive:(BOOL)positive
{
    float centerOfAnimation = 48.0;
    
    if (positive) {
        [self drawPositiveAnimationAtX:(label.center.x - centerOfAnimation /*- labelOffsetX*/) andAtY:(label.center.y - centerOfAnimation)];
    } else {
        [self drawNegativeAnimationAtX:(label.center.x - centerOfAnimation /*- labelOffsetX*/) andAtY:(label.center.y - centerOfAnimation)];
    }
}

- (void)drawPositiveAnimationAtX:(float)x andAtY:(float)y
{
    UIImageView *healImage = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 96, 96)];
    
    healImage.animationImages = @[[UIImage imageNamed:@"Firework01.png"],
                                  [UIImage imageNamed:@"Firework02.png"],
                                  [UIImage imageNamed:@"Firework03.png"],
                                  [UIImage imageNamed:@"Firework04.png"],
                                  [UIImage imageNamed:@"Firework05.png"],
                                  [UIImage imageNamed:@"Firework06.png"],
                                  [UIImage imageNamed:@"Firework07.png"],
                                  [UIImage imageNamed:@"Firework08.png"],
                                  [UIImage imageNamed:@"Firework09.png"],
                                  [UIImage imageNamed:@"Firework10.png"],
                                  [UIImage imageNamed:@"Firework11.png"],
                                  [UIImage imageNamed:@"Firework12.png"],
                                  [UIImage imageNamed:@"Firework13.png"],
                                  [UIImage imageNamed:@"Firework14.png"],
                                  [UIImage imageNamed:@"Firework15.png"],
                                  [UIImage imageNamed:@"Firework16.png"],
                                  [UIImage imageNamed:@"Firework17.png"],
                                  [UIImage imageNamed:@"Firework18.png"],
                                  [UIImage imageNamed:@"Firework19.png"],
                                  [UIImage imageNamed:@"Firework20.png"]];
    healImage.animationDuration = 1.2;
    healImage.animationRepeatCount = 1;
    [healImage startAnimating];
    [self.view addSubview:healImage];
}

- (void)drawNegativeAnimationAtX:(float)x andAtY:(float)y
{
    UIImageView *healImage = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 96, 96)];
    healImage.animationImages = @[[UIImage imageNamed:@"Fire01.png"],
                                  [UIImage imageNamed:@"Fire02.png"],
                                  [UIImage imageNamed:@"Fire03.png"],
                                  [UIImage imageNamed:@"Fire04.png"],
                                  [UIImage imageNamed:@"Fire05.png"],
                                  [UIImage imageNamed:@"Fire06.png"],
                                  [UIImage imageNamed:@"Fire07.png"],
                                  [UIImage imageNamed:@"Fire08.png"],
                                  [UIImage imageNamed:@"Fire09.png"],
                                  [UIImage imageNamed:@"Fire10.png"],
                                  [UIImage imageNamed:@"Fire11.png"],
                                  [UIImage imageNamed:@"Fire12.png"],
                                  [UIImage imageNamed:@"Fire13.png"],
                                  [UIImage imageNamed:@"Fire14.png"],
                                  [UIImage imageNamed:@"Fire15.png"],
                                  [UIImage imageNamed:@"Fire16.png"],
                                  [UIImage imageNamed:@"Fire17.png"],
                                  [UIImage imageNamed:@"Fire18.png"],
                                  [UIImage imageNamed:@"Fire19.png"],
                                  [UIImage imageNamed:@"Fire20.png"]];
    healImage.animationDuration = 1.2;
    healImage.animationRepeatCount = 1;
    [healImage startAnimating];
    [self.view addSubview:healImage];
}

#pragma mark - Persistence data file

- (NSString*)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    return documentsDirectory;
}

- (NSString*)dataFilePath
{
    if (!self.isThisCampaignPlaying) {
        return [[self documentsDirectory] stringByAppendingPathComponent:@"quickGameSave.plist"];
    } else {
        return [[self documentsDirectory] stringByAppendingPathComponent:[NSString stringWithFormat:@"campaignSave-%@.plist", self.levelName]];
    }
}

- (void)savePlayerAndComputerModels
{
    //NSLog(@"save player and computer models");
    
    if (player != nil && computer != nil && ([[player cards] count] == 6) && ([[computer cards] count] == 6 && animationCompleted)) {
    
        //NSLog(@"saving data");
        
        NSString *error;
        NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:
                               [NSArray arrayWithObjects:
                                [NSNumber numberWithInteger:player.tower],
                                [NSNumber numberWithInteger:player.wall],
                                [NSNumber numberWithInteger:player.quarries],
                                [NSNumber numberWithInteger:player.magics],
                                [NSNumber numberWithInteger:player.dungeons],
                                [NSNumber numberWithInteger:player.bricks],
                                [NSNumber numberWithInteger:player.gems],
                                [NSNumber numberWithInteger:player.recruits],
                                [NSNumber numberWithInteger:[[[player cards] objectAtIndex:0] cardNumber]],
                                [NSNumber numberWithInteger:[[[player cards] objectAtIndex:1] cardNumber]],
                                [NSNumber numberWithInteger:[[[player cards] objectAtIndex:2] cardNumber]],
                                [NSNumber numberWithInteger:[[[player cards] objectAtIndex:3] cardNumber]],
                                [NSNumber numberWithInteger:[[[player cards] objectAtIndex:4] cardNumber]],
                                [NSNumber numberWithInteger:[[[player cards] objectAtIndex:5] cardNumber]],
                                [NSNumber numberWithBool:player.shouldPlayAgain],
                                [NSNumber numberWithBool:player.shouldDiscardACard],
                                [NSNumber numberWithInteger:computer.tower],
                                [NSNumber numberWithInteger:computer.wall],
                                [NSNumber numberWithInteger:computer.quarries],
                                [NSNumber numberWithInteger:computer.magics],
                                [NSNumber numberWithInteger:computer.dungeons],
                                [NSNumber numberWithInteger:computer.bricks],
                                [NSNumber numberWithInteger:computer.gems],
                                [NSNumber numberWithInteger:computer.recruits],
                                [NSNumber numberWithInteger:[[[computer cards] objectAtIndex:0] cardNumber]],
                                [NSNumber numberWithInteger:[[[computer cards] objectAtIndex:1] cardNumber]],
                                [NSNumber numberWithInteger:[[[computer cards] objectAtIndex:2] cardNumber]],
                                [NSNumber numberWithInteger:[[[computer cards] objectAtIndex:3] cardNumber]],
                                [NSNumber numberWithInteger:[[[computer cards] objectAtIndex:4] cardNumber]],
                                [NSNumber numberWithInteger:[[[computer cards] objectAtIndex:5] cardNumber]],
                                [NSNumber numberWithBool:computer.shouldPlayAgain],
                                [NSNumber numberWithBool:computer.shouldDiscardACard],
                                nil]
                               
                               forKeys:
                               [NSArray arrayWithObjects:
                                @"playerTower",
                                @"playerWall",
                                @"playerQuarries",
                                @"playerMagics",
                                @"playerDungeons",
                                @"playerBricks",
                                @"playerGems",
                                @"playerRecruits",
                                @"playerCard0",
                                @"playerCard1",
                                @"playerCard2",
                                @"playerCard3",
                                @"playerCard4",
                                @"playerCard5",
                                @"playerShouldPlayAgain",
                                @"playerShouldDiscardACard",
                                @"computerTower",
                                @"computerWall",
                                @"computerQuarries",
                                @"computerMagics",
                                @"computerDungeons",
                                @"computerBricks",
                                @"computerGems",
                                @"computerRecruits",
                                @"computerCard0",
                                @"computerCard1",
                                @"computerCard2",
                                @"computerCard3",
                                @"computerCard4",
                                @"computerCard5",
                                @"computerShouldPlayAgain",
                                @"computerShouldDiscardACard",
                                nil]];
    
        NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
        if (plistData) {
            [plistData writeToFile:[self dataFilePath] atomically:NO];
        } else {
            NSLog(@"%@", error);
        }
    
    } else {
        NSLog(@"ERROR WHILE SAVING DATA!!!");
    }
}

- (void)loadPlayerAndComputer
{
    //NSLog(@"load Player And Computer");
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self dataFilePath]]) {
        NSLog(@"file don't exist");
        return;
    }
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:[self dataFilePath]];
    NSDictionary *temp = (NSDictionary*)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!temp) {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    } else {
        //NSLog(@"loading data");
        
        player.tower = [[temp objectForKey:@"playerTower"] integerValue];
        player.wall = [[temp objectForKey:@"playerWall"] integerValue];
        player.quarries = [[temp objectForKey:@"playerQuarries"] integerValue];
        player.magics = [[temp objectForKey:@"playerMagics"] integerValue];
        player.dungeons = [[temp objectForKey:@"playerDungeons"] integerValue];
        player.bricks = [[temp objectForKey:@"playerBricks"] integerValue];
        player.gems = [[temp objectForKey:@"playerGems"] integerValue];
        player.recruits = [[temp objectForKey:@"playerRecruits"] integerValue];
        [player.cards replaceObjectAtIndex:0 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"playerCard0"] integerValue]]];
        [player.cards replaceObjectAtIndex:1 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"playerCard1"] integerValue]]];
        [player.cards replaceObjectAtIndex:2 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"playerCard2"] integerValue]]];
        [player.cards replaceObjectAtIndex:3 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"playerCard3"] integerValue]]];
        [player.cards replaceObjectAtIndex:4 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"playerCard4"] integerValue]]];
        [player.cards replaceObjectAtIndex:5 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"playerCard5"] integerValue]]];
        player.shouldPlayAgain = [[temp objectForKey:@"playerShouldPlayAgain"] boolValue];
        player.shouldDiscardACard = [[temp objectForKey:@"playerShouldDiscardACard"] boolValue];
        
        computer.tower = [[temp objectForKey:@"computerTower"] integerValue];
        computer.wall = [[temp objectForKey:@"computerWall"] integerValue];
        computer.quarries = [[temp objectForKey:@"computerQuarries"] integerValue];
        computer.magics = [[temp objectForKey:@"computerMagics"] integerValue];
        computer.dungeons = [[temp objectForKey:@"computerDungeons"] integerValue];
        computer.bricks = [[temp objectForKey:@"computerBricks"] integerValue];
        computer.gems = [[temp objectForKey:@"computerGems"] integerValue];
        computer.recruits = [[temp objectForKey:@"computerRecruits"] integerValue];
        [computer.cards replaceObjectAtIndex:0 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"computerCard0"] integerValue]]];
        [computer.cards replaceObjectAtIndex:1 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"computerCard1"] integerValue]]];
        [computer.cards replaceObjectAtIndex:2 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"computerCard2"] integerValue]]];
        [computer.cards replaceObjectAtIndex:3 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"computerCard3"] integerValue]]];
        [computer.cards replaceObjectAtIndex:4 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"computerCard4"] integerValue]]];
        [computer.cards replaceObjectAtIndex:5 withObject:[cardsScope getCardAtNumber:[[temp objectForKey:@"computerCard5"] integerValue]]];
        computer.shouldPlayAgain = [[temp objectForKey:@"computerShouldPlayAgain"] boolValue];
        computer.shouldDiscardACard = [[temp objectForKey:@"computerShouldDiscardACard"] boolValue];
    }
}

- (void)deleteOldFile
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSFileManager *filemanager = [NSFileManager defaultManager];
        [filemanager removeItemAtPath:path error:nil];
    }
}

/*- (void)loadScore
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"Score.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"Score" ofType:@"plist"];
    }
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary*)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!temp) {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        gamesPlayed = 0;
        gamesWined = 0;
    } else {
        gamesPlayed = [[temp objectForKey:@"GamesPlayed"] integerValue];
        gamesWined = [[temp objectForKey:@"GamesWined"] integerValue];
    }
}*/

/*- (void)saveScore
{
    NSString *error;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"Score.plist"];
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInteger:gamesPlayed], [NSNumber numberWithInteger:gamesWined], nil] forKeys:[NSArray arrayWithObjects:@"GamesPlayed", @"GamesWined", nil]];
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    if (plistData) {
        [plistData writeToFile:plistPath atomically:YES];
    } else {
        NSLog(@"%@", error);
    }
}*/

#pragma mark - Sounds

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.isThisCampaignPlaying) {
        soundSystem = [[SoundSystem alloc] initWithFileName:self.backgroundMusic];
    } else {
        soundSystem = [[SoundSystem alloc] initWithFileName:@"07-TristansLament"];
    }
    
    self.view.multipleTouchEnabled = NO;
    
    animationCompleted = YES;
    
    [self game];
}

#pragma  mark - OptionControllersDelegateMethods

- (void)needToChangeSoundsLevel
{
    [soundSystem updateSoundVolume];
}

- (void)changeBackgroundImage
{
    NSInteger currentBackground = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentBackground"];
    
    self.backgroundPictureView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Background%d.jpg", currentBackground]];
}

- (void)changeTextureImage
{
    NSInteger currentTexture = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentTexture"];
    
    self.playerTowerBodyBackground.image = [UIImage imageNamed:[NSString stringWithFormat:@"TowerBody%d", currentTexture]];
    self.playerTowerHeadBackground.image = [UIImage imageNamed:[NSString stringWithFormat:@"PlayersTowerHead%d", currentTexture]];
    self.playerWallBackground.image = [UIImage imageNamed:[NSString stringWithFormat:@"WallBody%d", currentTexture]];
    
    self.computerTowerBodyBackground.image = [UIImage imageNamed:[NSString stringWithFormat:@"TowerBody%d", currentTexture]];
    self.computerTowerHeadBackground.image = [UIImage imageNamed:[NSString stringWithFormat:@"ComputersTowerHead%d", currentTexture]];
    self.computerWallBackground.image = [UIImage imageNamed:[NSString stringWithFormat:@"WallBody%d", currentTexture]];
}

- (void)changeMusic
{
    //NSLog(@"changeMusic");
}

- (void)needToChangeHardMode
{
    /*for (NSString *familyName in [UIFont familyNames]){
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]){
            NSLog(@"%@", fontName);
        }
    }*/
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"hardMode"]) {
        
        UILabel *label = [[UILabel alloc] init];
        [label setFont:[UIFont fontWithName:@"Helvetica" size:10.0f]];
        label.text = @"hard mode";
        [label sizeToFit];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = self.computerNameLabel.textColor;
        label.alpha = 0.8;
        label.tag = 101;
        label.shadowColor = [UIColor blackColor];
        label.shadowOffset = CGSizeMake(1.0f, 1.0f);
        label.center = CGPointMake(self.computerNameLabel.center.x, self.computerNameLabel.center.y + 10);
        [label setFrame:CGRectIntegral(label.frame)];
        [self.view addSubview:label];
    } else {
        [[self.view viewWithTag:101] removeFromSuperview];
    }
}

- (void)needToChangeRandomBackgroundMode
{
    //NSLog(@"random background");
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"randomBackground"]) {
        NSInteger counter = 0;
        for (CampaignData *tavern in mainObject.taverns) {
            if (tavern.isAchieved) {
                counter += 1;
            }
            //NSLog(@"counter: %d", counter);
        }
        
        if (counter == [mainObject.taverns count]) {
            counter = 19;
            //NSLog(@"all levels completed");
        }
        //NSLog(@"counter: %d", counter);
        NSInteger randomValue = arc4random() % (counter + 1);
        //NSLog(@"random: %d", randomValue);
        
        [self.backgroundPictureView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Background%d.jpg", randomValue]]];
        
        [self.playerTowerBodyBackground setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TowerBody%d", randomValue]]];
        [self.playerTowerHeadBackground setImage:[UIImage imageNamed:[NSString stringWithFormat:@"PlayersTowerHead%d", randomValue]]];
        [self.playerWallBackground setImage:[UIImage imageNamed:[NSString stringWithFormat:@"WallBody%d", randomValue]]];
        
        [self.computerTowerBodyBackground setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TowerBody%d", randomValue]]];
        [self.computerTowerHeadBackground setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ComputersTowerHead%d", randomValue]]];
        [self.computerWallBackground setImage:[UIImage imageNamed:[NSString stringWithFormat:@"WallBody%d", randomValue]]];
        
    } else {
        [self changeBackgroundImage];
        [self changeTextureImage];
    }
}

- (void)needToChangeRandomMusicMode
{
    //NSLog(@"random music");
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"randomMusic"]) {
        NSInteger counter = 0;
        for (CampaignData *tavern in mainObject.taverns) {
            if (tavern.isAchieved) {
                counter += 1;
            }
            //NSLog(@"counter: %d", counter);
        }
        
        if (counter == [mainObject.taverns count]) {
            counter = 19;
            //NSLog(@"all levels completed");
        }
        
        //NSInteger randomValue = arc4random()%counter;
        //NSLog(@"random: %d", randomValue);
    } else {
        [self changeMusic];
    }
}

- (void)closeButtonPressed
{
    if (self.isThisCampaignPlaying) { [self.delegate levelCompletedWithVictory:victory]; }
    
    [score saveScore];
    [self deleteOldFile];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end