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

- (IBAction)backButtonPressed:(id)sender;

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
    
    BOOL animationCompleted;
    
    BOOL operationComplete;
    
    BOOL needToReturnCardToDefaultPosition;
    
    int cardsOffset;
    
    NSArray *computersCards;
    
    BOOL doNotClearStack;
    
    NSInteger computerLastPlayedCard;
}

#pragma mark -TouchDelegationMethods

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
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"touch canceled" message:@"touch has been canceled" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    
    [alert show];
    
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

#pragma mark -DispatchMethods

//========================First touch algorithm=======================
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
        
        [self calculateNewPosition:position forTheView:self.card0View withDefaultPosition:defaultPositionCard0View];
        
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
        
        [self calculateNewPosition:position forTheView:self.card1View withDefaultPosition:defaultPositionCard1View];
        
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
        
        [self calculateNewPosition:position forTheView:self.card2View withDefaultPosition:defaultPositionCard2View];
        
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
        
        [self calculateNewPosition:position forTheView:self.card3View withDefaultPosition:defaultPositionCard3View];
        
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
        
        [self calculateNewPosition:position forTheView:self.card4View withDefaultPosition:defaultPositionCard4View];
        
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
        
        [self calculateNewPosition:position forTheView:self.card5View withDefaultPosition:defaultPositionCard5View];
    }
}

- (void)calculateNewPosition:(CGPoint)position forTheView:(UIView*)theView withDefaultPosition:(CGPoint)defaultPosition
{
    if ((firstTouchPoint.y - position.y) > 91) {
        return;
    }
    [theView setCenter:
        CGPointMake(defaultPosition.x, defaultPosition.y - (firstTouchPoint.y - position.y))];
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
    
    if ([[[player.cards objectAtIndex:0] cardName] isEqualToString:@"Lodestone"]) {
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
    
    if (firstTouchPoint.y - 80 > position.y) {
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
                             [player cardSelected:number];
                             [self needToUpdateLabels];
                             
                             [self releaseCardSelectionForView:view withDefaultPosition:defaultPosition withDefaultRect:defaultRect];
                             
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
                                                      
                                                  [computer computerTurn];
                                                  [self animateComputerTurn];
                                                      
                                                  }
                                    }];
                         }];
            }];
        
    } else if (firstTouchPoint.y + 80 < position.y) {
        //=======CARD WAS BEEN DISCARDED===========
        
        firstTouchPoint = CGPointMake(0, 0);
        
            [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
        
        [UIView animateWithDuration:1.5
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
                                                                        delay:0.5
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
                                                  
                                                  player.isThatPlayerTurn = NO;
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
                                withNotAvailableView:self.card0NotAvailable];
                         
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
                                  
                                  if ([[computer.cards objectAtIndex:computer.playedCard] quarriesSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsSelf] > 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfGeneralResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] quarriesSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] magicsSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] dungeonsSelf] < 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfGeneralResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] bricksSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsSelf] > 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfCommonResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] bricksSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] gemsSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] recruitsSelf] < 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfCommonResource"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] towerSelf] > 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallSelf] > 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillIncreaseTowerOrWall"];
                                  }
                                  if ([[computer.cards objectAtIndex:computer.playedCard] towerSelf] < 0 ||
                                      [[computer.cards objectAtIndex:computer.playedCard] wallSelf] < 0) {
                                      [cardsScope playDealSoundEffectForEvent:@"WillTakeDamage"];
                              }}
                              
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
                                                       self.playedCard0Background.alpha = 1.0;
                                                       self.playedCard1Background.alpha = 1.0;
                                                       self.playedCard2Background.alpha = 1.0;
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
                                                       [self configurePlayedCardsForComputerCardNumber:0 withView:self.computerCard0];
                                                   }
                                                   if (computer.playedCard == 1) {
                                                       [self configurePlayedCardsForComputerCardNumber:1 withView:self.computerCard1];
                                                   }
                                                   if (computer.playedCard == 2) {
                                                       [self configurePlayedCardsForComputerCardNumber:2 withView:self.computerCard2];
                                                   }
                                                   if (computer.playedCard == 3) {
                                                       [self configurePlayedCardsForComputerCardNumber:3 withView:self.computerCard3];
                                                   }
                                                   if (computer.playedCard == 4) {
                                                       [self configurePlayedCardsForComputerCardNumber:4 withView:self.computerCard4];
                                                   }
                                                   if (computer.playedCard == 5) {
                                                       [self configurePlayedCardsForComputerCardNumber:5 withView:self.computerCard5];
                                                   }
                                                   
                                                   
                                               }completion:^(BOOL finished){
                                                   
                                                   [self needToUpdateLabels];
                                                   
                                                   if (isPlayedCard0Present) {
                                                       self.playedCard0View.hidden = NO;
                                                   }
                                                   if (isPlayedCard1Present) {
                                                       self.playedCard1View.hidden = NO;
                                                   }
                                                   if (isPlayedCard2Present) {
                                                       self.playedCard2View.hidden = NO;
                                                   }
                                                   
                                                   NSLog(@"computer.shouldDiscard: %d, computer.shouldPlayAgain: %d", computer.shouldDiscardACard, computer.shouldPlayAgain);
                                                   
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
                                                                        
                                                                        computerLastPlayedCard = computer.playedCard;
                                                                        
                                                                        isAnythingCardSelected = NO;
                                                                        
                                                                        animationCompleted = YES;
                                                                        
                                                                        doNotClearStack = NO;
                                                                        
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

- (void)configurePlayedCardsForComputerCardNumber:(NSInteger)number withView:(UIImageView*)cardImageView
{
    
    if (!isPlayedCard0Present) {
        [self configureComputerCard:number
                  withCardNameLabel:self.playedCard0Name
           withCardDescriptionLabel:self.playedCard0Desription
                  withCardCostLabel:self.playedCard0Cost
                     withBackground:self.playedCard0Background
                           withNotAvailableView:nil];
        self.card0View.center = CGPointMake(400, 110);
        if (computer.isCardBeenDiscarded && number == computer.playedCard) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard0View.bounds.size.width/2, self.playedCard0View.bounds.size.height/2-30);
            discardLabel.tag = 1001;
            [self.playedCard0View addSubview:discardLabel];
        }
        isPlayedCard0Present = YES;
        
    } else if (!isPlayedCard1Present){
        [self configureComputerCard:number
                  withCardNameLabel:self.playedCard1Name
           withCardDescriptionLabel:self.playedCard1Desription
                  withCardCostLabel:self.playedCard1Cost
                     withBackground:self.playedCard1Background
                           withNotAvailableView:nil];//self.playedCard1View];
        self.card0View.center = CGPointMake(566, 110);
        if (computer.isCardBeenDiscarded && number == computer.playedCard) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard1View.bounds.size.width/2, self.playedCard1View.bounds.size.height/2-30);
            discardLabel.tag = 1002;
            [self.playedCard1View addSubview:discardLabel];
        }
        isPlayedCard1Present = YES;
        
    } else if (!isPlayedCard2Present) {
        [self configureComputerCard:number
                  withCardNameLabel:self.playedCard2Name
           withCardDescriptionLabel:self.playedCard2Desription
                  withCardCostLabel:self.playedCard2Cost
                     withBackground:self.playedCard2Background
                           withNotAvailableView:nil];//self.playedCard2View];
        self.card0View.center = CGPointMake(732, 110);
        if (computer.isCardBeenDiscarded && number == computer.playedCard) {
            UIImageView *discardLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discard_label"]];
            discardLabel.center = CGPointMake(self.playedCard2View.bounds.size.width/2, self.playedCard2View.bounds.size.height/2-30);
            discardLabel.tag = 1003;
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
                             
                             self.playedCard0View.alpha = 1.0;
                             self.playedCard0View.center = CGPointMake(400, 110);
                             self.playedCard1View.center = CGPointMake(566, 110);
                             self.playedCard2View.center = CGPointMake(732, 110);
                             
                             self.playedCard0Background = self.playedCard1Background;
                             self.playedCard0Cost = self.playedCard1Cost;
                             self.playedCard0Name = self.playedCard1Name;
                             self.playedCard0Desription = self.playedCard1Desription;
                             
                             self.playedCard1Background = self.playedCard2Background;
                             self.playedCard1Cost = self.playedCard2Cost;
                             self.playedCard1Name = self.playedCard2Name;
                             self.playedCard1Desription = self.playedCard2Desription;
                             
                             [self configureComputerCard:number
                                       withCardNameLabel:self.playedCard2Name
                                withCardDescriptionLabel:self.playedCard2Desription
                                       withCardCostLabel:self.playedCard2Cost
                                          withBackground:self.playedCard2Background
                                                          withNotAvailableView:nil];//]self.playedCard2View];
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
    
    if (!isPlayedCard0Present) {
        [self configureCard:number
                  withCardNameLabel:self.playedCard0Name
           withCardDescriptionLabel:self.playedCard0Desription
                  withCardCostLabel:self.playedCard0Cost
                     withBackground:self.playedCard0Background
                       withNotAvailableView:nil];
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
                      withNotAvailableView:nil];
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
                       withNotAvailableView:nil];
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
                             
                             self.playedCard0Background = self.playedCard1Background;
                             self.playedCard0Cost = self.playedCard1Cost;
                             self.playedCard0Name = self.playedCard1Name;
                             self.playedCard0Desription = self.playedCard1Desription;
                             
                             self.playedCard1Background = self.playedCard2Background;
                             self.playedCard1Cost = self.playedCard2Cost;
                             self.playedCard1Name = self.playedCard2Name;
                             self.playedCard1Desription = self.playedCard2Desription;
                             
                             [self configureCard:number
                                       withCardNameLabel:self.playedCard2Name
                                withCardDescriptionLabel:self.playedCard2Desription
                                       withCardCostLabel:self.playedCard2Cost
                                          withBackground:self.playedCard2Background
                                            withNotAvailableView:nil];
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
    if (computer.tower > 100 || computer.wall > 200 || (computer.bricks > 200 && computer.gems > 200 && computer.recruits > 200) || player.tower == 0) {
        [cardsScope playDealSoundEffectForEvent:@"PlayerLose"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You lose!" message:@"The computer has defeated you like a boss" delegate:self cancelButtonTitle:@"Ohhh god why?" otherButtonTitles: nil];
        [alertView show];
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

- (void)showCurrentCard:(NSInteger)number
{
    yInitialPositionForCardView = 645.0;
    xInitialPositionForCardView = 118.0;
    
    
    [UIView animateWithDuration:0.5
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
                         
                         [self updateCardPositions];
                         
                     }completion:^(BOOL finished){
                         
                         
                         
                     }];
    
}

#pragma mark -Initializations

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.multipleTouchEnabled = NO;
    gameOver = YES;
    
    animationCompleted = YES;
    
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
        [self updateCardPositions];
        cardsScope = [CardsScope getCardsScope];
        gameOver = NO;
        doNotClearStack = NO;
        computerLastPlayedCard = -1;
        yInitialPositionForCardView = 645.0;
        computersCards = @[self.computerCard0,
                           self.computerCard1,
                           self.computerCard2,
                           self.computerCard3,
                           self.computerCard4,
                           self.computerCard5];
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
          withBackground:self.card0Background
            withNotAvailableView:self.card0NotAvailable];

}

- (void)updateCard1
{
    [self configureCard:1
       withCardNameLabel:self.playersCard1Name
withCardDescriptionLabel:self.playersCard1Description
       withCardCostLabel:self.playersCard1Cost
         withBackground:self.card1Background
           withNotAvailableView:self.card1NotAvailable];

}

- (void)updateCard2
{
    [self configureCard:2
       withCardNameLabel:self.playersCard2Name
withCardDescriptionLabel:self.playersCard2Description
       withCardCostLabel:self.playersCard2Cost
         withBackground:self.card2Background
           withNotAvailableView:self.card2NotAvailable];

}

- (void)updateCard3
{
    [self configureCard:3
       withCardNameLabel:self.playersCard3Name
withCardDescriptionLabel:self.playersCard3Description
       withCardCostLabel:self.playersCard3Cost
         withBackground:self.card3Background
           withNotAvailableView:self.card3NotAvailable];
}

- (void)updateCard4
{
    [self configureCard:4
       withCardNameLabel:self.playersCard4Name
withCardDescriptionLabel:self.playersCard4Description
       withCardCostLabel:self.playersCard4Cost
         withBackground:self.card4Background
           withNotAvailableView:self.card4NotAvailable];
}

- (void)updateCard5
{
    [self configureCard:5
       withCardNameLabel:self.playersCard5Name
withCardDescriptionLabel:self.playersCard5Description
       withCardCostLabel:self.playersCard5Cost
         withBackground:self.card5Background
           withNotAvailableView:self.card5NotAvailable];
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
{
    if ([[[[computer cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Grey"]) {
        background.image = [UIImage imageNamed:@"GreyCardBlank"];
    }
    if ([[[[computer cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Blue"]) {
        background.image = [UIImage imageNamed:@"BlueCardBlank"];
    }
    if ([[[[computer cards] objectAtIndex:cardNumber] cardColor] isEqualToString:@"Green"]) {
        background.image = [UIImage imageNamed:@"GreenCardBlank"];
    }
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

@end
