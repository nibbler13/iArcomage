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

@property (weak, nonatomic) IBOutlet UIImageView *backgroundPicture;

@property (weak, nonatomic) IBOutlet UIImageView *playerTowerBodyBackground;
@property (weak, nonatomic) IBOutlet UIImageView *playerTowerHeadBackground;
@property (weak, nonatomic) IBOutlet UIImageView *playerWallBackground;

@property (weak, nonatomic) IBOutlet UIImageView *computerTowerBodyBackground;
@property (weak, nonatomic) IBOutlet UIImageView *computerTowerHeadBackground;
@property (weak, nonatomic) IBOutlet UIImageView *computerWallBackground;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)changeBackground:(id)sender;

@end

@implementation StartViewController
{
    PlayerModel *player;
    ComputerModel *computer;
    //BOOL gameOver;
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
    NSArray *backgroundPictures;
}

#pragma mark - TouchDelegationMethods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!animationCompleted) {
        return;
    }
    
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
            } else {
                return;
            }
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!animationCompleted) {
        return;
    }
    
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
    if (!animationCompleted) {
        return;
    }
    
    
    for (UITouch *touch in touches) {
        if (abs(lastTouch.x - [touch locationInView:self.view].x) > 100 |
            abs(lastTouch.y - [touch locationInView:self.view].y) > 100) {
            return;
        }
        
        lastTouch = [touch locationInView:self.view];
        [self dispatchTouchEndToPosition:[touch locationInView:self.view]];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!animationCompleted) {
        return;
    }
    
    for (UITouch *touch in touches) {
        if (abs(lastTouch.x - [touch locationInView:self.view].x) > 100 |
            abs(lastTouch.y - [touch locationInView:self.view].y) > 100) {
            return;
        }
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
    if ([self isCardAvailableToPlay:number] && !player.shouldDiscardACard) {
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
                     }completion:^(BOOL finished){
                     }];
}

//==================Move algorithm=====================
- (void)dispatchTouchEventToPosition:(CGPoint)position
{
    if (CGRectContainsPoint(defaultRectCard0View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:0] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) {
                return;
            }
        }
        
        if ([[[player.cards objectAtIndex:0] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) {
                return;
            }
        }
        
        [self calculateNewPosition:position forTheView:self.card0View withDefaultPosition:defaultPositionCard0View withCardNumber:0];
        
    } else if (CGRectContainsPoint(defaultRectCard1View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:1] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) {
                return;
            }
        }
        
        if ([[[player.cards objectAtIndex:1] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) {
                return;
            }
        }
        
        [self calculateNewPosition:position forTheView:self.card1View withDefaultPosition:defaultPositionCard1View withCardNumber:1];
        
    } else if (CGRectContainsPoint(defaultRectCard2View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:2] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) {
                return;
            }
        }
        
        if ([[[player.cards objectAtIndex:2] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) {
                return;
            }
        }
        
        [self calculateNewPosition:position forTheView:self.card2View withDefaultPosition:defaultPositionCard2View withCardNumber:2];
        
    } else if (CGRectContainsPoint(defaultRectCard3View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:3] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) {
                return;
            }
        }
        
        if ([[[player.cards objectAtIndex:3] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) {
                return;
            }
        }
        
        [self calculateNewPosition:position forTheView:self.card3View withDefaultPosition:defaultPositionCard3View withCardNumber:3];
        
    } else if (CGRectContainsPoint(defaultRectCard4View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:4] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) {
                return;
            }
        }
        
        if ([[[player.cards objectAtIndex:4] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) {
                return;
            }
        }
        
        [self calculateNewPosition:position forTheView:self.card4View withDefaultPosition:defaultPositionCard4View withCardNumber:4];
        
    } else if (CGRectContainsPoint(defaultRectCard5View, firstTouchPoint)) {
        if (![self isCardAvailableToPlay:5] || player.shouldDiscardACard) {
            if (firstTouchPoint.y > position.y) {
                return;
            }
        }
        
        if ([[[player.cards objectAtIndex:5] cardName] isEqualToString:@"Lodestone"]) {
            if (firstTouchPoint.y < position.y) {
                return;
            }
        }
        
        [self calculateNewPosition:position forTheView:self.card5View withDefaultPosition:defaultPositionCard5View withCardNumber:5];
    }
}

- (void)calculateNewPosition:(CGPoint)position forTheView:(UIView*)theView withDefaultPosition:(CGPoint)defaultPosition withCardNumber:(NSInteger)number
{
    
    if (firstTouchPoint.y < position.y) {
        cardSelectionView.image = [UIImage imageNamed:@"CardSelectionRed"];
    } else {
        if ([self isCardAvailableToPlay:number]) {
            cardSelectionView.image = [UIImage imageNamed:@"CardSelection"];
        }
    }
    
    if ((firstTouchPoint.y - position.y) > 91) {////////////////////////////////////91
        return;
    }
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
    if (![self isCardAvailableToPlay:number] || player.shouldDiscardACard) {
        
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
    
    if (firstTouchPoint.y - 40 > position.y) {/////////////////////////////80
        if (![self isCardAvailableToPlay:number]) {
            [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
            return;
        }
        //=========CARD WAS BEEN SELECTED===========
        
        firstTouchPoint = CGPointMake(0, 0);
        
        [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             view.center = CGPointMake(512, 400);
                         }completion:^(BOOL finished){
                             
                             player.isThatPlayerTurn = YES;
                             
                             [[[player cards] objectAtIndex:number] initPlayerModel:player andComputerModel:computer];
                             
                             if (self.soundsOn) {
                                 
                                 if ([[player.cards objectAtIndex:number] quarriesSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] magicsSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] dungeonsSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] quarriesEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] magicsEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] dungeonsEnemy] > 0) {
                                     [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfGeneralResource"];
                                 }
                                 if ([[player.cards objectAtIndex:number] quarriesSelf] < 0 & player.quarries > 1 ||
                                     [[player.cards objectAtIndex:number] magicsSelf] < 0 & player.magics > 1 ||
                                     [[player.cards objectAtIndex:number] dungeonsSelf] < 0 & player.dungeons > 1 ||
                                     [[player.cards objectAtIndex:number] quarriesEnemy] < 0 & computer.quarries > 1 ||
                                     [[player.cards objectAtIndex:number] magicsEnemy] < 0 & computer.magics > 1 ||
                                     [[player.cards objectAtIndex:number] dungeonsEnemy] < 0 & computer.dungeons > 1) {
                                     [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfGeneralResource"];
                                 }
                                 if ([[player.cards objectAtIndex:number] bricksSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] gemsSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] recruitsSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] bricksEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] gemsEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] recruitsEnemy] > 0) {
                                     [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfCommonResource"];
                                 }
                                 if ([[player.cards objectAtIndex:number] bricksSelf] < 0 & player.bricks > 0 ||
                                     [[player.cards objectAtIndex:number] gemsSelf] < 0 & player.gems > 0 ||
                                     [[player.cards objectAtIndex:number] recruitsSelf] < 0 & player.recruits > 0 ||
                                     [[player.cards objectAtIndex:number] bricksEnemy] < 0 & computer.bricks > 0 ||
                                     [[player.cards objectAtIndex:number] gemsEnemy] < 0 & computer.gems > 0 ||
                                     [[player.cards objectAtIndex:number] recruitsEnemy] < 0 & computer.recruits > 0) {
                                     [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfCommonResource"];
                                 }
                                 if ([[player.cards objectAtIndex:number] towerSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] wallSelf] > 0 ||
                                     [[player.cards objectAtIndex:number] towerEnemy] > 0 ||
                                     [[player.cards objectAtIndex:number] wallEnemy] > 0) {
                                     [cardsScope playDealSoundEffectForEvent:@"WillIncreaseTowerOrWall"];
                                 }
                                 if ([[player.cards objectAtIndex:number] towerSelf] < 0 ||
                                     [[player.cards objectAtIndex:number] wallSelf] < 0 ||
                                     [[player.cards objectAtIndex:number] towerEnemy] < 0 ||
                                     [[player.cards objectAtIndex:number] wallEnemy] < 0) {
                                     [cardsScope playDealSoundEffectForEvent:@"WillTakeDamage"];
                                 }
                             }
                             
                             
                             NSLog(@"===should present animation for player===");
                             [self configureAnimationsForCardNumber:number];
                             [player cardSelected:number];
                             [self needToUpdateLabels];
                             [self updateTowersAndWalls];
                             
                             [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                             
                             ///////////////////////
                             //AddingAnimationHere//
                             ///////////////////////
                             
                             
                             
                             double howLongShouldBeAnimation;
                             
                             if (doNotClearStack) {
                                 howLongShouldBeAnimation = 0.0;
                             } else {
                                 howLongShouldBeAnimation = 0.5;
                             }
                             
                             
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
                                                      self.playedCard0View.hidden = YES;
                                                      self.playedCard1View.hidden = YES;
                                                      self.playedCard2View.hidden = YES;
                                                      self.playedCard0View.alpha = 1.0;
                                                      self.playedCard1View.alpha = 1.0;
                                                      self.playedCard2View.alpha = 1.0;
                                                      self.playedCard0View.center = CGPointMake(400, 110);
                                                      self.playedCard1View.center = CGPointMake(566, 110);
                                                      self.playedCard2View.center = CGPointMake(732, 110);
                                                      UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1001];
                                                      [tempView removeFromSuperview];
                                                      tempView = (UIImageView*)[self.view viewWithTag:1002];
                                                      [tempView removeFromSuperview];
                                                      tempView = (UIImageView*)[self.view viewWithTag:1003];
                                                      [tempView removeFromSuperview];
                                                  }
                             
                                                  [UIView animateWithDuration:0.5
                                                                        delay:0.5
                                                                      options:UIViewAnimationCurveLinear
                                                                   animations:^{
                                                  
                                                                       [self configurePlayedCardsForPlayerCardNumber:number withView:view];
                                                  
                                                }completion:^(BOOL finished){
                                                  
                                                  if (isPlayedCard0Present) {
                                                      self.playedCard0View.hidden = NO;
                                                  }
                                                  if (isPlayedCard1Present) {
                                                      self.playedCard1View.hidden = NO;
                                                  }
                                                  if (isPlayedCard2Present) {
                                                      self.playedCard2View.hidden = NO;
                                                  }
                                                  
                                                  
                                                  
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
                                                      
                                                      [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
                                                      
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
                                                      
                                                      [self savePlayerAndComputerModels];
                                                      
                                                  [computer computerTurn];
                                                  [self animateComputerTurn];
                                                      
                                                  }
                                    }];
                         }];
            }];
        
    } else if (firstTouchPoint.y + 40 < position.y) {/////////////////////////////80
        
        //=======CARD WAS BEEN DISCARDED===========
        
        firstTouchPoint = CGPointMake(0, 0);
        
            [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             
                             view.center = CGPointMake(view.center.x, 1000);
                         }completion:^(BOOL finished){
                             
                             player.isThatPlayerTurn = YES;
                             [player cardDiscarded:number];
                             [self needToUpdateLabels];
                             
                             double howLongShouldBeAnimation;
                             
                             if (doNotClearStack) {
                                 howLongShouldBeAnimation = 0.0;
                             } else {
                                 howLongShouldBeAnimation = 0.5;
                             }
                             
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
                                                      self.playedCard0View.hidden = YES;
                                                      self.playedCard1View.hidden = YES;
                                                      self.playedCard2View.hidden = YES;
                                                      self.playedCard0View.alpha = 1.0;
                                                      self.playedCard1View.alpha = 1.0;
                                                      self.playedCard2View.alpha = 1.0;
                                                      self.playedCard0View.center = CGPointMake(400, 110);
                                                      self.playedCard1View.center = CGPointMake(566, 110);
                                                      self.playedCard2View.center = CGPointMake(732, 110);
                                                      UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1001];
                                                      [tempView removeFromSuperview];
                                                      tempView = (UIImageView*)[self.view viewWithTag:1002];
                                                      [tempView removeFromSuperview];
                                                      tempView = (UIImageView*)[self.view viewWithTag:1003];
                                                      [tempView removeFromSuperview];
                                                  }
                                                  
                                                  [UIView animateWithDuration:0.5
                                                                        delay:0.2
                                                                      options:UIViewAnimationCurveLinear
                                                                   animations:^{
                                                                    
                                                                       [self configurePlayedCardsForPlayerCardNumber:number withView:view];
                                                                       
                                                                       if (number == 0) {
                                                                           self.card0NotAvailable.hidden = YES;
                                                                       } else if (number == 1) {
                                                                           self.card1NotAvailable.hidden = YES;
                                                                       } else if (number == 2) {
                                                                           self.card2NotAvailable.hidden = YES;
                                                                       } else if (number == 3) {
                                                                           self.card3NotAvailable.hidden = YES;
                                                                       } else if (number == 4) {
                                                                           self.card4NotAvailable.hidden = YES;
                                                                       } else if (number == 5) {
                                                                           self.card5NotAvailable.hidden = YES;
                                                                       }
                                                                       
                                                  
                                                                   }completion:^(BOOL finished){
                                                  
                                                  if (isPlayedCard0Present) {
                                                      self.playedCard0View.hidden = NO;
                                                  }
                                                  if (isPlayedCard1Present) {
                                                      self.playedCard1View.hidden = NO;
                                                  }
                                                  if (isPlayedCard2Present) {
                                                      self.playedCard2View.hidden = NO;
                                                  }
                                                  
                                                  [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                                                  
                                                  ///////////////////////////////////////////////////////
                                                  if (player.shouldDiscardACard) {
                                                      player.shouldDiscardACard = NO;
                                                      
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
                                                      
                                                      [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
                                                      
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
                                                                       
                                                  [self savePlayerAndComputerModels];
                                                                       
                                                  [computer computerTurn];
                                                                       
                                                  [self needToUpdateLabels];
                                                                       
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

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //[PlayerModel destroyPlayer];
    //[ComputerModel destroyComputer];
    //player = nil;
    //computer = nil;
    //cardsScope = nil;
    //gameOver = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Computer's delegate method

- (void)animateComputerTurn
{
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
    
    [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
    
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
                         
                         [self configureComputerCard:computer.playedCard
                                   withCardNameLabel:self.playersCard0Name
                            withCardDescriptionLabel:self.playersCard0Description
                                   withCardCostLabel:self.playersCard0Cost
                                      withBackground:self.card0Background
                                withNotAvailableView:self.card0NotAvailable
                          withCardImage:self.card0Image];
                         
                         if (computer.playedCard == 0) {
                             self.card0View.center = CGPointMake(self.computerCard0.center.x, self.computerCard0.center.y);
                         } else if (computer.playedCard == 1) {
                             self.card0View.center = CGPointMake(self.computerCard1.center.x, self.computerCard1.center.y);
                         } else if (computer.playedCard == 2) {
                             self.card0View.center = CGPointMake(self.computerCard2.center.x, self.computerCard2.center.y);
                         } else if (computer.playedCard == 3) {
                             self.card0View.center = CGPointMake(self.computerCard3.center.x, self.computerCard3.center.y);
                         } else if (computer.playedCard == 4) {
                             self.card0View.center = CGPointMake(self.computerCard4.center.x, self.computerCard4.center.y);
                         } else if (computer.playedCard == 5) {
                             self.card0View.center = CGPointMake(self.computerCard5.center.x, self.computerCard5.center.y);
                         }
                         
                     }completion:^(BOOL finished){
                         
                         [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
                         
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
                                  if (self.soundsOn) {
                                  
                                  //NSLog(@"computer card name: %@", [[computer.cards objectAtIndex:computer.playedCard] cardName]);
                                  if ([[computer.cards objectAtIndex:computer.playedCard] quarriesSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] quarriesEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsEnemy] > 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfGeneralResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] quarriesSelf] < 0 & computer.quarries > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsSelf] < 0 & computer.magics > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsSelf] < 0 & computer.dungeons > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] quarriesEnemy] < 0 & player.quarries > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsEnemy] < 0 & player.magics > 1 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsEnemy] < 0 & player.dungeons > 1) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfGeneralResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] bricksSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] bricksEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsEnemy] > 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfCommonResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] bricksSelf] < 0 & computer.bricks > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsSelf] < 0 & computer.gems > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsSelf] < 0 & computer.recruits > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] bricksEnemy] < 0 & player.bricks > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsEnemy] < 0 & player.gems > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsEnemy] < 0 & player.recruits > 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfCommonResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] towerSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] towerEnemy] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallEnemy] > 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillIncreaseTowerOrWall"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] towerSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] towerEnemy] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallEnemy] < 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillTakeDamage"];
                                  }
                                  }
                                  
                                  [self configureAnimationsForCardNumber:computer.playedCard];
                                  
                                  [[computer.cards objectAtIndex:computer.playedCard] processCard];
                                  
                                  [computer.delegate needToCheckThatTheVictoryConditionsIsAchievedByComputer];
                              }
                              
                              [self needToUpdateLabels];
                              [self updateTowersAndWalls];
                              
                              double howLongShouldBeAnimation;
                              
                              if (doNotClearStack) {
                                  howLongShouldBeAnimation = 0.0;
                              } else {
                                  howLongShouldBeAnimation = 0.5;
                              }
                              
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
                                                       self.playedCard0View.hidden = YES;
                                                       self.playedCard1View.hidden = YES;
                                                       self.playedCard2View.hidden = YES;
                                                       self.playedCard0View.alpha = 1.0;
                                                       self.playedCard1View.alpha = 1.0;
                                                       self.playedCard2View.alpha = 1.0;
                                                       self.playedCard0View.center = CGPointMake(400, 110);
                                                       self.playedCard1View.center = CGPointMake(566, 110);
                                                       self.playedCard2View.center = CGPointMake(732, 110);
                                                       UIImageView *tempView = (UIImageView*)[self.view viewWithTag:1001];
                                                       [tempView removeFromSuperview];
                                                       tempView = (UIImageView*)[self.view viewWithTag:1002];
                                                       [tempView removeFromSuperview];
                                                       tempView = (UIImageView*)[self.view viewWithTag:1003];
                                                       [tempView removeFromSuperview];
                                                   }
                              
                                                   
                                                   
                                                   
                              [UIView animateWithDuration:0.5
                                                    delay:0.2
                                                  options:UIViewAnimationCurveLinear
                                               animations:^{
                                                   
                                                   self.card0NotAvailable.hidden = YES;
                                                   
                                                   if (computer.playedCard == 0) {
                                                       [self configurePlayedCardsForComputerCardNumber:0];
                                                   }
                                                   if (computer.playedCard == 1) {
                                                       [self configurePlayedCardsForComputerCardNumber:1];
                                                   }
                                                   if (computer.playedCard == 2) {
                                                       [self configurePlayedCardsForComputerCardNumber:2];
                                                   }
                                                   if (computer.playedCard == 3) {
                                                       [self configurePlayedCardsForComputerCardNumber:3];
                                                   }
                                                   if (computer.playedCard == 4) {
                                                       [self configurePlayedCardsForComputerCardNumber:4];
                                                   }
                                                   if (computer.playedCard == 5) {
                                                       [self configurePlayedCardsForComputerCardNumber:5];
                                                   }
                                                   
                                                   
                                               }completion:^(BOOL finished){
                                                   
                                                   if (isPlayedCard0Present) {
                                                       self.playedCard0View.hidden = NO;
                                                   }
                                                   if (isPlayedCard1Present) {
                                                       self.playedCard1View.hidden = NO;
                                                   }
                                                   if (isPlayedCard2Present) {
                                                       self.playedCard2View.hidden = NO;
                                                   }
                                                   
                                                   //NSLog(@"computer.shouldDiscard: %d, computer.shouldPlayAgain: %d", computer.shouldDiscardACard, computer.shouldPlayAgain);
                                                   
                                                   ///////////////////////////////////////////////////////////////////////////////////////////////////
                                                   //Проверяем нужно ли компьютеру сыграть еще раз
                                                   if (computer.shouldDiscardACard) {
                                                       doNotClearStack = YES;
                                                       
                                                       computerLastPlayedCard = computer.playedCard;
                                                       
                                                       [computer computerTurn];
                                                       [self animateComputerTurn];
                                                       return;
                                                   }
                                                   
                                                   
                                                   if (computer.shouldPlayAgain) {
                                                       doNotClearStack = YES;
                                                       computer.shouldPlayAgain = NO;
                                                       
                                                       computerLastPlayedCard = computer.playedCard;
                                                       
                                                       [computer computerTurn];
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
                                                                        
                                                                        [self needToUpdateLabels];
                                                                        [self updateAllCards];
                                                                        
                                                                        [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
                                                                        
                                                                        
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
    } else {
        cardView.center = CGPointMake(234, 110);
    }
}

- (void)calculateBeforePlayOffsetForComputerCard:(NSInteger)number withView:(UIImageView*)cardView
{
    if (computerLastPlayedCard != number) {
        cardView.center = CGPointMake(xInitialPositionForCardView, yInitialPositionForCardView);
        xInitialPositionForCardView += cardsOffset;
    } else {
        cardView.center = CGPointMake(234, 110);
    }
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

- (void)configurePlayedCardsForComputerCardNumber:(NSInteger)number
{
    
    //NSLog(@"ComputerPlayedCards state: isPlayedCard0Present: %d, isPlayedCard1Present: %d, isPlayedCard2Present: %d", isPlayedCard0Present, isPlayedCard1Present, isPlayedCard2Present);
    
    if (!isPlayedCard0Present) {
        
        //NSLog(@"PlayedCard0 not present");
        
        [self configureComputerCard:number
                  withCardNameLabel:self.playedCard0Name
           withCardDescriptionLabel:self.playedCard0Desription
                  withCardCostLabel:self.playedCard0Cost
                     withBackground:self.playedCard0Background
                           withNotAvailableView:nil
         withCardImage:self.playedCard0Image];
        
        self.card0View.center = CGPointMake(400, 110);
        
        if (computer.isCardBeenDiscarded && number == computer.playedCard) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard0View.bounds.size.width/2, self.playedCard0View.bounds.size.height/2-30);
            discardLabel.tag = 1001;
            [self.playedCard0View addSubview:discardLabel];
        }
        
        isPlayedCard0Present = YES;
        
    } else if (!isPlayedCard1Present){
        
        //NSLog(@"PlayedCard1 not present");
        
        [self configureComputerCard:number
                  withCardNameLabel:self.playedCard1Name
           withCardDescriptionLabel:self.playedCard1Desription
                  withCardCostLabel:self.playedCard1Cost
                     withBackground:self.playedCard1Background
                           withNotAvailableView:nil
         withCardImage:self.playedCard1Image];
        
        self.card0View.center = CGPointMake(566, 110);
        
        if (computer.isCardBeenDiscarded && number == computer.playedCard) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard1View.bounds.size.width/2, self.playedCard1View.bounds.size.height/2-30);
            discardLabel.tag = 1002;
            [self.playedCard1View addSubview:discardLabel];
        }
        
        isPlayedCard1Present = YES;
        
    } else if (!isPlayedCard2Present) {
        
        //NSLog(@"PlayedCard2 not present");
        
        [self configureComputerCard:number
                  withCardNameLabel:self.playedCard2Name
           withCardDescriptionLabel:self.playedCard2Desription
                  withCardCostLabel:self.playedCard2Cost
                     withBackground:self.playedCard2Background
                           withNotAvailableView:nil
         withCardImage:self.playedCard2Image];
        
        self.card0View.center = CGPointMake(732, 110);
        
        if (computer.isCardBeenDiscarded && number == computer.playedCard) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard2View.bounds.size.width/2, self.playedCard2View.bounds.size.height/2-30);
            discardLabel.tag = 1003;
            [self.playedCard2View addSubview:discardLabel];
        }
        
        isPlayedCard2Present = YES;
        
    } else {
        //NSLog(@"All PlayedCards are present and I'm should move stack left");
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             self.playedCard0View.center = CGPointMake(234, 110);
                             self.playedCard0View.alpha = 0.0;
                             self.playedCard1View.center = CGPointMake(400, 110);
                             self.playedCard2View.center = CGPointMake(566, 110);
                             
                             
                         }completion:^(BOOL finished){
                             
                             self.playedCard0View.alpha = 1.0;
                             self.playedCard0View.center = CGPointMake(400, 110);
                             self.playedCard1View.center = CGPointMake(566, 110);
                             self.playedCard2View.center = CGPointMake(732, 110);
                             
                             self.playedCard0Background.image = self.playedCard1Background.image;
                             self.playedCard0Cost.text = self.playedCard1Cost.text;
                             self.playedCard0Name.text = self.playedCard1Name.text;
                             self.playedCard0Desription.text = self.playedCard1Desription.text;
                             
                             self.playedCard1Background.image = self.playedCard2Background.image;
                             self.playedCard1Cost.text = self.playedCard2Cost.text;
                             self.playedCard1Name.text = self.playedCard2Name.text;
                             self.playedCard1Desription.text = self.playedCard2Desription.text;
                             
                             [self configureComputerCard:number
                                       withCardNameLabel:self.playedCard2Name
                                withCardDescriptionLabel:self.playedCard2Desription
                                       withCardCostLabel:self.playedCard2Cost
                                          withBackground:self.playedCard2Background
                                                          withNotAvailableView:nil
                              withCardImage:self.playedCard2Image];
                             
                             if (computer.isCardBeenDiscarded && number == computer.playedCard) {
                                 UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
                                 discardLabel.center = CGPointMake(self.playedCard2View.bounds.size.width/2, self.playedCard2View.bounds.size.height/2-30);
                                 discardLabel.tag = 1003;
                                 [self.playedCard2View addSubview:discardLabel];
                             }
                         }];
        
        self.card0View.center = CGPointMake(732, 110);
    }

}

- (void)configurePlayedCardsForPlayerCardNumber:(NSInteger)number withView:(UIView*)cardView
{
    
    //NSLog(@"PlayersPlayedCards state: isPlayedCard0Present: %d, isPlayedCard1Present: %d, isPlayedCard2Present: %d", isPlayedCard0Present, isPlayedCard1Present, isPlayedCard2Present);
    
    if (!isPlayedCard0Present) {
        
        [self configureCard:number
                  withCardNameLabel:self.playedCard0Name
           withCardDescriptionLabel:self.playedCard0Desription
                  withCardCostLabel:self.playedCard0Cost
                     withBackground:self.playedCard0Background
                       withNotAvailableView:nil
         withCardImage:self.playedCard0Image];
        
        cardView.center = CGPointMake(400, 110);
        
        isPlayedCard0Present = YES;
        
        if (player.isCardHasBeenDiscarded) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard0View.bounds.size.width/2, self.playedCard0View.bounds.size.height/2-30);
            discardLabel.tag = 1001;
            [self.playedCard0View addSubview:discardLabel];
        }
        
    } else if (!isPlayedCard1Present){
        
        [self configureCard:number
                  withCardNameLabel:self.playedCard1Name
           withCardDescriptionLabel:self.playedCard1Desription
                  withCardCostLabel:self.playedCard1Cost
                    withBackground:self.playedCard1Background
                      withNotAvailableView:nil
         withCardImage:self.playedCard1Image];
        
        cardView.center = CGPointMake(566, 110);
        
        isPlayedCard1Present = YES;
        
        if (player.isCardHasBeenDiscarded) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard1View.bounds.size.width/2, self.playedCard1View.bounds.size.height/2-30);
            discardLabel.tag = 1002;
            [self.playedCard1View addSubview:discardLabel];
        }
        
    } else if (!isPlayedCard2Present) {
        
        [self configureCard:number
                  withCardNameLabel:self.playedCard2Name
           withCardDescriptionLabel:self.playedCard2Desription
                  withCardCostLabel:self.playedCard2Cost
                     withBackground:self.playedCard2Background
                       withNotAvailableView:nil
         withCardImage:self.playedCard2Image];
        
        cardView.center = CGPointMake(732, 110);
        
        isPlayedCard2Present = YES;
        
        if (player.isCardHasBeenDiscarded) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard2View.bounds.size.width/2, self.playedCard2View.bounds.size.height/2-30);
            discardLabel.tag = 1003;
            [self.playedCard2View addSubview:discardLabel];
        }
        
    } else {
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             self.playedCard0View.center = CGPointMake(234, 110);
                             self.playedCard0View.alpha = 0.0;
                             self.playedCard1View.center = CGPointMake(400, 110);
                             self.playedCard2View.center = CGPointMake(566, 110);
                             
                             
                         }completion:^(BOOL finished){
                             
                            self.playedCard0View.alpha = 1.0;
                            self.playedCard0View.center = CGPointMake(400, 110);
                            self.playedCard1View.center = CGPointMake(566, 110);
                            self.playedCard2View.center = CGPointMake(732, 110);
                             
                             self.playedCard0Background.image = self.playedCard1Background.image;
                             self.playedCard0Cost.text = self.playedCard1Cost.text;
                             self.playedCard0Name.text = self.playedCard1Name.text;
                             self.playedCard0Desription.text = self.playedCard1Desription.text;
                             
                             self.playedCard1Background.image = self.playedCard2Background.image;
                             self.playedCard1Cost.text = self.playedCard2Cost.text;
                             self.playedCard1Name.text = self.playedCard2Name.text;
                             self.playedCard1Desription.text = self.playedCard2Desription.text;
                             
                            [self configureCard:number
                                       withCardNameLabel:self.playedCard2Name
                                withCardDescriptionLabel:self.playedCard2Desription
                                       withCardCostLabel:self.playedCard2Cost
                                          withBackground:self.playedCard2Background
                                            withNotAvailableView:nil
                             withCardImage:self.playedCard2Image];
                             
                             if (player.isCardHasBeenDiscarded) {
                                 UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
                                 discardLabel.center = CGPointMake(self.playedCard2View.bounds.size.width/2, self.playedCard2View.bounds.size.height/2-30);
                                 discardLabel.tag = 1003;
                                 [self.playedCard2View addSubview:discardLabel];
                             }
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

- (void)needToCheckThatTheVictoryConditionsIsAchievedByComputer
{
    if (computer.tower >= towerAim || computer.wall >= wallAim || (computer.bricks >= 200 && computer.gems >= 200 && computer.recruits >= 200) || player.tower < 1) {
        [cardsScope playDealSoundEffectForEvent:@"PlayerLose"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You lose!" message:@"The computer has defeated you like a boss" delegate:self cancelButtonTitle:@"Ohhh god why?" otherButtonTitles: nil];
        [alertView show];
    }
}


#pragma mark - Player's delegate methods


- (void)needToCheckThatTheVictoryConditionsIsAchieved
{
    if (player.tower >= towerAim || player.wall >= wallAim || (player.bricks >= 200 && player.gems >= 200 && player.recruits >= 200) || computer.tower < 1) {
        [cardsScope playDealSoundEffectForEvent:@"PlayerWin"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You win!" message:@"You win because you have completed the needed conditions" delegate:self cancelButtonTitle:@"Yeah! It's great!" otherButtonTitles: nil];
        [alertView show];
    }
}

#pragma mark - Initializations

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Documents folder is %@", [self documentsDirectory]);
    NSLog(@"Data file paths is %@", [self dataFilePath]);
    
    self.view.multipleTouchEnabled = NO;
    //gameOver = YES;
    
    animationCompleted = YES;
    
    [self game];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [PlayerModel destroyPlayer];
    [ComputerModel destroyComputer];
    [CardsScope destroyCardsScope];
    player = nil;
    computer = nil;
    cardsScope = nil;
    [super viewWillDisappear:YES];
}

#pragma mark - Buttons method
- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeBackground:(id)sender
{
    self.backgroundPicture.image = [UIImage imageNamed:backgroundPictures[backgroundsCounter]];
    self.backgroundLabel.text = backgroundPictures[backgroundsCounter];
    backgroundsCounter++;
    if (backgroundsCounter > [backgroundPictures count] - 1) {
        backgroundsCounter = 0;
    }
}

#pragma mark - Main game cycle

- (void)game
{
    //NSLog(@"player: %@, computer: %@, cardscope: %@", player, computer, cardsScope);
    //if (gameOver) {
        player = [PlayerModel getPlayer];
        player.delegate = self;
        player.soundsOn = self.soundsOn;
        computer = [ComputerModel getComputer];
        computer.delegate = self;
    
    if (self.needToLoadGame) {
        [self loadPlayerAndComputer];
    }
    
        //Campaign game initialization
        if (self.isThisCampaignPlaying) {
            
            player.tower = self.initialTowerValue;
            player.wall = self.initialWallValue;
            computer.tower = self.initialTowerValue;
            computer.wall = self.initialWallValue;
            towerAim = self.towerCampaignAim;
            wallAim = self.towerCampaignAim * 2;
            
            self.backgroundPicture.image = [UIImage imageNamed:self.backgroundImage];
            
            self.playerTowerBodyBackground.image = [UIImage imageNamed:self.towerImage];
            self.playerTowerHeadBackground.image = [UIImage imageNamed:self.playerTowerHeadImage];
            self.playerWallBackground.image = [UIImage imageNamed:self.wallImage];
            
            self.computerTowerBodyBackground.image = [UIImage imageNamed:self.towerImage];
            self.computerTowerHeadBackground.image = [UIImage imageNamed:self.computerTowerHeadImage];
            self.computerWallBackground.image = [UIImage imageNamed:self.wallImage];
            
        } else {
            towerAim = 100.0;
            wallAim = 100.0;
        }
        
        //NSLog(@"%@", [NSString stringWithFormat:@"%@", self.backgroundPicture.image]);
        
        [self updatePlayerLabels];
        [self updateComputerLabels];
        [self updateAllCards];
        [self updateCardPositions];
        
        cardsScope = [CardsScope getCardsScope];
        cardsScope.soundsOn = self.soundsOn;
        //gameOver = NO;
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
        
        backgroundsCounter = 0;
        backgroundPictures = @[@"Background",
                                        @"Background2",
                                        @"Background3",
                                        @"Background4.jpg",
                                        @"Background5",
                                        @"Background9",
                                        @"Background10",
                                        @"Background11",
                                        @"Background12",
                                        @"Background13",
                                        @"Background14",
                                        @"Background15",
                                        @"Background16",
                                        @"Background17",
                                        @"Background18",
                                        @"Background19",
                                        @"Background20.jpg",
                                        @"Background21.jpg",
                                        @"Background22.jpg",
                                        @"Background23.jpg",
                                        @"Background24.jpg",
                                        @"Background25.jpg",
                                        @"Background26.jpg",
                                        @"Background30.jpg",
                                        @"Background31.jpg",
                                        @"Background33.jpg",
                                        @"Background34.jpg",
                                        @"Background36.jpg",
                                        @"Background37.jpg",
                                        @"Background38.jpg",
                                        @"Background39.jpg",
                                        @"Background40.jpg",
                                        @"Background41.jpg",
                                        @"Background42.jpg",
                                        @"Background43.jpg",
                                        @"Background44.jpg",
                                        @"Background45.jpg",
                                        @"Background46.jpg",
                                        @"Background48.jpg",
                                        @"Background49.jpg"];
    //}
}

#pragma mark - UpdatingLabels

- (void)updateTowersAndWalls
{
    [self.playerTowerView setFrame:CGRectMake(self.playerTowerView.frame.origin.x,
                                              (float)(495-(152+324*(player.tower/towerAim))),
                                              self.playerTowerView.frame.size.width,
                                              (float)(152+324*(player.tower/towerAim)))];
    
    [self.playerWallView setFrame:CGRectMake(self.playerWallView.frame.origin.x,
                                             (float)(495-(318*(player.wall/wallAim))),
                                             self.playerWallView.frame.size.width,
                                             (float)(318*(player.wall/wallAim)))];
    
    [self.computerTowerView setFrame:CGRectMake(self.computerTowerView.frame.origin.x,
                                              (float)(495-(152+324*(computer.tower/towerAim))),
                                              self.computerTowerView.frame.size.width,
                                              (float)(152+324*(computer.tower/towerAim)))];
    
    [self.computerWallView setFrame:CGRectMake(self.computerWallView.frame.origin.x,
                                             (float)(495-(318*(computer.wall/wallAim))),
                                             self.computerWallView.frame.size.width,
                                             (float)(318*(computer.wall/wallAim)))];
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
    [self updateComputerResourceLabels];
    [self updateComputerTowerAndWallLabels];
}

- (void)updateComputerResourceLabels
{
    self.computerQuarries.text = [NSString stringWithFormat:@"%d", computer.quarries];
    self.computerMagics.text = [NSString stringWithFormat:@"%d", computer.magics];
    self.computerDungeons.text = [NSString stringWithFormat:@"%d", computer.dungeons];
    self.computerBricks.text = [NSString stringWithFormat:@"%d", computer.bricks];
    self.computerGems.text = [NSString stringWithFormat:@"%d", computer.gems];
    self.computerRecruits.text = [NSString stringWithFormat:@"%d", computer.recruits];
}

- (void)updateComputerTowerAndWallLabels
{
    self.computerWall.text = [NSString stringWithFormat:@"%d", computer.wall];
    self.computerTower.text = [NSString stringWithFormat:@"%d", computer.tower];
}

- (void)updateCard0
{
    [self configureCard:0
       withCardNameLabel:self.playersCard0Name
withCardDescriptionLabel:self.playersCard0Description
       withCardCostLabel:self.playersCard0Cost
          withBackground:self.card0Background
            withNotAvailableView:self.card0NotAvailable
     withCardImage:self.card0Image];

}

- (void)updateCard1
{
    [self configureCard:1
       withCardNameLabel:self.playersCard1Name
withCardDescriptionLabel:self.playersCard1Description
       withCardCostLabel:self.playersCard1Cost
         withBackground:self.card1Background
           withNotAvailableView:self.card1NotAvailable
     withCardImage:self.card1Image];

}

- (void)updateCard2
{
    [self configureCard:2
       withCardNameLabel:self.playersCard2Name
withCardDescriptionLabel:self.playersCard2Description
       withCardCostLabel:self.playersCard2Cost
         withBackground:self.card2Background
           withNotAvailableView:self.card2NotAvailable
     withCardImage:self.card2Image];

}

- (void)updateCard3
{
    [self configureCard:3
       withCardNameLabel:self.playersCard3Name
withCardDescriptionLabel:self.playersCard3Description
       withCardCostLabel:self.playersCard3Cost
         withBackground:self.card3Background
           withNotAvailableView:self.card3NotAvailable
     withCardImage:self.card3Image];
}

- (void)updateCard4
{
    [self configureCard:4
       withCardNameLabel:self.playersCard4Name
withCardDescriptionLabel:self.playersCard4Description
       withCardCostLabel:self.playersCard4Cost
         withBackground:self.card4Background
           withNotAvailableView:self.card4NotAvailable
     withCardImage:self.card4Image];
}

- (void)updateCard5
{
    [self configureCard:5
       withCardNameLabel:self.playersCard5Name
withCardDescriptionLabel:self.playersCard5Description
       withCardCostLabel:self.playersCard5Cost
         withBackground:self.card5Background
           withNotAvailableView:self.card5NotAvailable
     withCardImage:self.card5Image];
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
    withNotAvailableView:(UIImageView*)view
    withCardImage:(UIImageView*)cardImage
{
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Grey"]) {
        background.image = [UIImage imageNamed:@"CardBlank_Red"];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Blue"]) {
        background.image = [UIImage imageNamed:@"CardBlank_Blue"];
    }
    if ([[[[player cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Green"]) {
        background.image = [UIImage imageNamed:@"CardBlank_Green"];
    }
    
    cardImage.image = [UIImage imageNamed:[[[player cards] objectAtIndex:cardNumber] cardName]];
    cardName.text = [[[player cards] objectAtIndex:cardNumber] cardName];
    cardDescription.text = [[[player cards] objectAtIndex:cardNumber] cardDescription];
    cardCost.text = [NSString stringWithFormat:@"%d",[[[player cards] objectAtIndex:cardNumber] cardCost]];
    
    if (![self isCardAvailableToPlay:cardNumber]) {
        view.hidden = NO;
    } else {
        view.hidden = YES;
    }
    

}

- (void)configureComputerCard:(NSInteger)cardNumber
            withCardNameLabel:(UILabel*)cardName
     withCardDescriptionLabel:(UILabel*)cardDescription
            withCardCostLabel:(UILabel*)cardCost
               withBackground:(UIImageView*)background
         withNotAvailableView:(UIImageView*)view
                withCardImage:(UIImageView*)cardImage
{
    if ([[[[computer cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Grey"]) {
        background.image = [UIImage imageNamed:@"CardBlank_Red"];
    }
    if ([[[[computer cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Blue"]) {
        background.image = [UIImage imageNamed:@"CardBlank_Blue"];
    }
    if ([[[[computer cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Green"]) {
        background.image = [UIImage imageNamed:@"CardBlank_Green"];
    }
    
    
    cardImage.image = [UIImage imageNamed:[[[computer cards] objectAtIndex:cardNumber] cardName]];
    cardName.text = [[[computer cards] objectAtIndex:cardNumber] cardName];
    cardDescription.text = [[[computer cards] objectAtIndex:cardNumber] cardDescription];
    cardCost.text = [NSString stringWithFormat:@"%d",[[[computer cards] objectAtIndex:cardNumber] cardCost]];
    
    ////////////////////////////////////////////////////////////////////////
    if (computer.isCardBeenDiscarded && cardNumber == computer.playedCard) {
        view.hidden = NO;
    } else {
        view.hidden = YES;
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
    NSLog(@"configureAnimations for card: %d", number);
    if (player.isThatPlayerTurn) {
        NSLog(@"animation: this is player turn");
        NSLog(@"isThisPlayer: %d, isThisComputer: %d", player.isThatPlayerTurn, computer.isThatComputerTurn);
        NSLog(@"%@, %d", [[[player cards] objectAtIndex:number] cardName], [[[player cards] objectAtIndex:number] cardCost]);
        NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
              [[[player cards] objectAtIndex:number] quarriesSelf],
              [[[player cards] objectAtIndex:number] quarriesEnemy],
              [[[player cards] objectAtIndex:number] magicsSelf],
              [[[player cards] objectAtIndex:number] magicsEnemy],
              [[[player cards] objectAtIndex:number] dungeonsSelf],
              [[[player cards] objectAtIndex:number] dungeonsEnemy],
              [[[player cards] objectAtIndex:number] bricksSelf],
              [[[player cards] objectAtIndex:number] bricksEnemy],
              [[[player cards] objectAtIndex:number] gemsSelf],
              [[[player cards] objectAtIndex:number] gemsEnemy],
              [[[player cards] objectAtIndex:number] recruitsSelf],
              [[[player cards] objectAtIndex:number] recruitsEnemy],
              [[[player cards] objectAtIndex:number] towerSelf],
              [[[player cards] objectAtIndex:number] towerEnemy],
              [[[player cards] objectAtIndex:number] wallSelf],
              [[[player cards] objectAtIndex:number] wallEnemy]);
        
        if ([[player.cards objectAtIndex:number] quarriesSelf] > 0){
            [self calculatePositionOfAnimationForLabel:self.playerQuarries isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[player.cards objectAtIndex:number] quarriesSelf] < 0 & player.quarries > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerQuarries isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[player.cards objectAtIndex:number] magicsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerMagics isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[player.cards objectAtIndex:number] magicsSelf] < 0 & player.magics > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerMagics isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[player.cards objectAtIndex:number] dungeonsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerDungeons isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[player.cards objectAtIndex:number] dungeonsSelf] < 0 & player.dungeons > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerDungeons isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[player.cards objectAtIndex:number] quarriesEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerQuarries isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[player.cards objectAtIndex:number] quarriesEnemy] < 0 & computer.quarries > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerQuarries isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[player.cards objectAtIndex:number] magicsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerMagics isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[player.cards objectAtIndex:number] magicsEnemy] < 0 & computer.magics > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerMagics isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[player.cards objectAtIndex:number] dungeonsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerDungeons isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[player.cards objectAtIndex:number] dungeonsEnemy] < 0 & computer.dungeons > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerDungeons isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        
        if ([[player.cards objectAtIndex:number] bricksSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerBricks isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] bricksSelf] < 0 & player.bricks > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerBricks isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] gemsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerGems isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] gemsSelf] < 0 & player.gems > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerGems isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] recruitsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerRecruits isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] recruitsSelf] < 0 & player.recruits > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerRecruits isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] bricksEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerBricks isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] bricksEnemy] < 0 & computer.bricks > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerBricks isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] gemsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerGems isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] gemsEnemy] < 0 & computer.gems > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerGems isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] recruitsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerRecruits isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] recruitsEnemy] < 0 & computer.recruits > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerRecruits isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] towerSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerTower isAnimationPositive:YES isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] towerSelf] < 0) {
            [self calculatePositionOfAnimationForLabel:self.playerTower isAnimationPositive:NO isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] wallSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerWall isAnimationPositive:YES isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] wallSelf] < 0) {
            [self calculatePositionOfAnimationForLabel:self.playerWall isAnimationPositive:NO isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] towerEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerTower isAnimationPositive:YES isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] towerEnemy] < 0) {
            [self calculatePositionOfAnimationForLabel:self.computerTower isAnimationPositive:NO isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        }
        
        if ([[player.cards objectAtIndex:number] wallEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerWall isAnimationPositive:YES isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        } else if ([[player.cards objectAtIndex:number] wallEnemy] < 0) {
            [self calculatePositionOfAnimationForLabel:self.computerWall isAnimationPositive:NO isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        }
        
        ////////////////////////////////////////////////////
    } else if (computer.isThatComputerTurn) {
        NSLog(@"animation: this is computer turn");
        NSLog(@"isThisPlayer: %d, isThisComputer: %d", player.isThatPlayerTurn, computer.isThatComputerTurn);
        NSLog(@"%@, %d", [[[computer cards] objectAtIndex:number] cardName], [[[computer cards] objectAtIndex:number] cardCost]);
        NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
              [[[computer cards] objectAtIndex:number] quarriesSelf],
              [[[computer cards] objectAtIndex:number] quarriesEnemy],
              [[[computer cards] objectAtIndex:number] magicsSelf],
              [[[computer cards] objectAtIndex:number] magicsEnemy],
              [[[computer cards] objectAtIndex:number] dungeonsSelf],
              [[[computer cards] objectAtIndex:number] dungeonsEnemy],
              [[[computer cards] objectAtIndex:number] bricksSelf],
              [[[computer cards] objectAtIndex:number] bricksEnemy],
              [[[computer cards] objectAtIndex:number] gemsSelf],
              [[[computer cards] objectAtIndex:number] gemsEnemy],
              [[[computer cards] objectAtIndex:number] recruitsSelf],
              [[[computer cards] objectAtIndex:number] recruitsEnemy],
              [[[computer cards] objectAtIndex:number] towerSelf],
              [[[computer cards] objectAtIndex:number] towerEnemy],
              [[[computer cards] objectAtIndex:number] wallSelf],
              [[[computer cards] objectAtIndex:number] wallEnemy]);
            
        if ([[computer.cards objectAtIndex:number] quarriesSelf] > 0){
            [self calculatePositionOfAnimationForLabel:self.computerQuarries isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[computer.cards objectAtIndex:number] quarriesSelf] < 0 & computer.quarries > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerQuarries isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[computer.cards objectAtIndex:number] magicsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerMagics isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[computer.cards objectAtIndex:number] magicsSelf] < 0 & computer.magics > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerMagics isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[computer.cards objectAtIndex:number] dungeonsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerDungeons isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[computer.cards objectAtIndex:number] dungeonsSelf] < 0 & computer.dungeons > 1) {
            [self calculatePositionOfAnimationForLabel:self.computerDungeons isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[computer.cards objectAtIndex:number] quarriesEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerQuarries isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[computer.cards objectAtIndex:number] quarriesEnemy] < 0 & player.quarries > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerQuarries isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[computer.cards objectAtIndex:number] magicsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerMagics isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[computer.cards objectAtIndex:number] magicsEnemy] < 0 & player.magics > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerMagics isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        if ([[computer.cards objectAtIndex:number] dungeonsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerDungeons isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        } else if ([[computer.cards objectAtIndex:number] dungeonsEnemy] < 0 & player.dungeons > 1) {
            [self calculatePositionOfAnimationForLabel:self.playerDungeons isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:YES];
        }
        
        
        if ([[computer.cards objectAtIndex:number] bricksSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerBricks isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] bricksSelf] < 0 & computer.bricks > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerBricks isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] gemsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerGems isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] gemsSelf] < 0 & computer.gems > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerGems isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] recruitsSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerRecruits isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] recruitsSelf] < 0 & computer.recruits > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerRecruits isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] bricksEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerBricks isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] bricksEnemy] < 0 & player.bricks > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerBricks isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] gemsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerGems isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] gemsEnemy] < 0 & player.gems > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerGems isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] recruitsEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerRecruits isAnimationPositive:YES isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] recruitsEnemy] < 0 & player.recruits > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerRecruits isAnimationPositive:NO isThisForTowerOrWall:NO isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] towerSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerTower isAnimationPositive:YES isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] towerSelf] < 0) {
            [self calculatePositionOfAnimationForLabel:self.computerTower isAnimationPositive:NO isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] wallSelf] > 0) {
            [self calculatePositionOfAnimationForLabel:self.computerWall isAnimationPositive:YES isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] wallSelf] < 0) {
            [self calculatePositionOfAnimationForLabel:self.computerWall isAnimationPositive:NO isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] towerEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerTower isAnimationPositive:YES isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] towerEnemy] < 0) {
            [self calculatePositionOfAnimationForLabel:self.playerTower isAnimationPositive:NO isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        }
        
        if ([[computer.cards objectAtIndex:number] wallEnemy] > 0) {
            [self calculatePositionOfAnimationForLabel:self.playerWall isAnimationPositive:YES isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        } else if ([[computer.cards objectAtIndex:number] wallEnemy] < 0) {
            [self calculatePositionOfAnimationForLabel:self.playerWall isAnimationPositive:NO isThisForTowerOrWall:YES isThisForGeneralResources:NO];
        }

    } else {
        NSLog(@"wrongAnimationConfigurating");
    }
}

- (void)calculatePositionOfAnimationForLabel:(UILabel*)label isAnimationPositive:(BOOL)positive isThisForTowerOrWall:(BOOL)tower isThisForGeneralResources:(BOOL)general
{
    float centerOfAnimation = 48.0;
    float labelOffsetX;
    
    if (general) {
        if ([label.text integerValue] > 9) {
            labelOffsetX = 0.0;
        } else {
            labelOffsetX = label.frame.size.height / 4;
        }
    } else if (!tower) {
        if ([label.text integerValue] > 9) {
            labelOffsetX = label.frame.size.height / 2 - 5.0;
        } else if ([label.text integerValue] > 99) {
            labelOffsetX = 0.0;
        } else {
            labelOffsetX = label.frame.size.height / 3;
        }
    }
    
    if (tower) {
        labelOffsetX = 0.0;
    }
    
    if (positive) {
        [self drawPositiveAnimationAtX:(label.center.x - centerOfAnimation - labelOffsetX) andAtY:(label.center.y - 48.0)];
    } else {
        [self drawNegativeAnimationAtX:(label.center.x - centerOfAnimation - labelOffsetX) andAtY:(label.center.y - 48.0)];
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
    return [[self documentsDirectory] stringByAppendingPathComponent:@"iArcomage.plist"];
}

- (void)savePlayerAndComputerModels
{
    NSMutableData *playerData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:playerData];
    [archiver encodeObject:player forKey:@"PlayerModel"];
    [archiver encodeObject:computer forKey:@"ComputerModel"];
    [archiver finishEncoding];
    [playerData writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadPlayerAndComputer
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        PlayerModel *playerRestored;
        ComputerModel *computerRestored;
        playerRestored = [unarchiver decodeObjectForKey:@"PlayerModel"];
        computerRestored = [unarchiver decodeObjectForKey:@"ComputerModel"];
        [unarchiver finishDecoding];
        
        player.quarries = playerRestored.quarries;
        player.magics = playerRestored.magics;
        player.dungeons = playerRestored.dungeons;
        player.bricks = playerRestored.bricks;
        player.gems = playerRestored.gems;
        player.recruits = playerRestored.recruits;
        player.wall = playerRestored.wall;
        player.tower = playerRestored.tower;
        player.cards = playerRestored.cards;
        player.playedCard = playerRestored.playedCard;
        player.shouldPlayAgain = playerRestored.shouldPlayAgain;
        player.shouldDiscardACard = playerRestored.shouldDiscardACard;
        player.isThatPlayerTurn = playerRestored.isThatPlayerTurn;
        player.soundsOn = playerRestored.soundsOn;
        player.isCardHasBeenDiscarded = playerRestored.isCardHasBeenDiscarded;
        
        computer.quarries = computerRestored.quarries;
        computer.magics = computerRestored.magics;
        computer.dungeons = computerRestored.dungeons;
        computer.bricks = computerRestored.bricks;
        computer.gems = computerRestored.gems;
        computer.recruits = computerRestored.recruits;
        computer.wall = computerRestored.wall;
        computer.tower = computerRestored.tower;
        computer.cards = computerRestored.cards;
        computer.playedCard = computerRestored.playedCard;
        computer.isCardBeenDiscarded = computerRestored.isCardBeenDiscarded;
        computer.shouldPlayAgain = computerRestored.shouldPlayAgain;
        computer.shouldDiscardACard = computerRestored.shouldDiscardACard;
        computer.shouldDrawACard = computerRestored.shouldDrawACard;
        computer.isThatComputerTurn = computerRestored.isThatComputerTurn;
    }
}

@end























