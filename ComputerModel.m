//
//  ComputerModel.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "ComputerModel.h"
#import "CardsScope.h"
#import "Card.h"
#import "PlayerModel.h"

static ComputerModel *computer;

@implementation ComputerModel
{
    CardsScope *cardsScope;
    NSMutableArray *cardsAvailableToPlay;
    PlayerModel *player;
    NSInteger playedCard;
}

#pragma mark -Initialization

+ (ComputerModel*)getComputer
{
    NSLog(@"get computer");
    if (computer == nil) {
        computer = [[ComputerModel alloc] init];
    }
    return computer;
}

+ (void)destroyComputer
{
    if (computer != nil) {
        computer = nil;
    }
}

- (id)init
{
    NSLog(@"init computer");
    if ([super init] != nil) {
        self.quarries = 1;
        self.magics = 1;
        self.dungeons = 1;
        self.bricks = 5;
        self.gems = 5;
        self.recruits = 5;
        self.wall = 20;
        self.tower = 20;
        self.shouldDrawACard = NO;
        self.shouldDiscardACard = NO;
        self.shouldPlayAgain = NO;
        self.isThatComputerTurn = NO;
        self.cards = [[NSMutableArray alloc] init];
        cardsScope = [CardsScope getCardsScope];
        self.cards = [NSMutableArray arrayWithObjects:cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, nil];
        NSLog(@"done with init computer");
    }
    return self;
}

#pragma mark -GamePlay

- (void)nextTurnIncreaseResource
{
    NSLog(@"=============next increase===========");
    self.bricks += self.quarries;
    self.gems += self.magics;
    self.recruits += self.dungeons;
    [self.delegate needToUpdateLabels];
}

- (void)computerTurn
{
    if (player == nil) {
        player = [PlayerModel getPlayer];
    }
    
    
    self.isThatComputerTurn = YES;
    NSLog(@"ComputerTurn");
    NSLog(@"Computer have next resource: %d %d %d", self.bricks, self.gems, self.recruits);
    [self getNewCardAtNumber:playedCard];
    [self analyzeCardsWeight];
    [self printCardsInHand];
    
    if ([self checkAvailableCards]) {
        
        NSLog(@"There are some available cards");
        [self printAvailableCards];
        [self playSomeCard];
        if (self.shouldDrawACard) {
            self.shouldDrawACard = NO;
            NSLog(@"Computer should draw a new card");
            [self.cards addObject:cardsScope.getRandomCard];
            NSLog(@"Now I have %d cards in hand", [self.cards count]);
        }
        
        if (self.shouldDiscardACard) {
            self.shouldDiscardACard = NO;
            
            //==============================NEED TO CHECK============================
            NSLog(@"Computer should discard a card");
            /*
            NSInteger randomValue = arc4random()%[self.cards count];
            NSLog(@"I want to discard card at number: %d", randomValue);
            [self.cards removeObjectAtIndex:randomValue];
             */
             [self discardACard];
            NSLog(@"Now I have %d cards in hand", [self.cards count]);
            //==============================NEED TO CHECK============================
        }
        
        if (self.shouldPlayAgain) {
            NSLog(@"Computer should play again");
            self.shouldPlayAgain = NO;
            [self nextTurnIncreaseResource];
            [self computerTurn];
            return;
        }
    
    } else {
        NSLog(@"No available cards to play");
        [self discardACard];
        //[self.delegate needToUpdateLabels];
    }
    [self nextTurnIncreaseResource];
    NSLog(@"!!!computer turn nexturnincrease");
    self.isThatComputerTurn = NO;
    
    [self.delegate playerShouldTakeANewCard];
}

- (BOOL)checkAvailableCards
{
    NSInteger cardCost;
    NSInteger computerResource;
    cardsAvailableToPlay = nil;
    cardsAvailableToPlay = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        [[self.cards objectAtIndex:i] thatCardIsAvailable:NO];
        cardCost = [[computer.cards objectAtIndex:i] cardCost];
        
        if ([[[computer.cards objectAtIndex:i] cardColor] isEqualToString:@"Grey"]) {
            computerResource = [computer bricks];
        } else if ([[[computer.cards objectAtIndex:i] cardColor] isEqualToString:@"Blue"]) {
            computerResource = [computer gems];
        } else {
            computerResource = [computer recruits];
        }
        
        if (cardCost <= computerResource) {
            NSLog(@"--- Found another one available card");
            [cardsAvailableToPlay addObject:[NSNumber numberWithInt:i]];
            [[self.cards objectAtIndex:i] thatCardIsAvailable:YES];
        } else if (computerResource - cardCost < -10) {
            [[self.cards objectAtIndex:i] increaseCardWeightOn:maxIdle];
        } else if (computerResource - cardCost < -5 && computerResource - cardCost > -10) {
            [[self.cards objectAtIndex:i] increaseCardWeightOn:middleIdle];
        } else if (computerResource - cardCost > -5) {
            [[self.cards objectAtIndex:i] increaseCardWeightOn:lowIdle];
        }
    }
    if ([cardsAvailableToPlay count] > 0) {
        return YES;
    }
    return NO;
}

- (void)printCardsInHand
{
    for (int i = 0; i < [self.cards count]; i++) {
        [self printCardInfoAtNumber:i];
    }
}

- (void)printCardInfoAtNumber:(NSInteger)number
{
    NSLog(@"*** %d - %@, descr: %@, cost: %d, color: %@, weight: %d", number, [[self.cards objectAtIndex:number] cardName], [[self.cards objectAtIndex:number] cardDescription], [[self.cards objectAtIndex:number] cardCost], [[self.cards objectAtIndex:number] cardColor], [[self.cards objectAtIndex:number] cardWeight]);
}

- (void)printAvailableCards
{
    for (int i = 0; i < [cardsAvailableToPlay count]; i++) {
        NSLog(@"--- Available to play: %@", [cardsAvailableToPlay objectAtIndex:i]);
    }
}

- (void)payForTheCard:(NSInteger)number
{
    if ([[[[self cards] objectAtIndex:number] cardColor] isEqualToString:@"Grey"]) {
        self.bricks -= [[[self cards] objectAtIndex:number] cardCost];
    }
    if ([[[[self cards] objectAtIndex:number] cardColor] isEqualToString:@"Blue"]) {
        self.gems -= [[[self cards] objectAtIndex:number] cardCost];
    }
    if ([[[[self cards] objectAtIndex:number] cardColor] isEqualToString:@"Green"]) {
        self.recruits -= [[[self cards] objectAtIndex:number] cardCost];
    }
    
}

- (void)processCard:(NSInteger)number
{
    NSLog(@"=== I will play the next card:");
    [self printCardInfoAtNumber:number];
    [self payForTheCard:number];
    [[self.cards objectAtIndex:number] processCardForPlayer:player andComputer:self];
    playedCard = number;
    [self.delegate computerHasPlayTheCard:number];
    //[self getNewCardAtNumber:number];
    //[self.delegate needToUpdateLabels];
    [self.delegate needToCheckThatTheVictoryConditionsIsAchievedByComputer];
}

- (void)getNewCardAtNumber:(NSInteger)number
{
    NSLog(@"I will get a new card");
    [self.delegate needToUpdateComputerCards];
    [self.cards replaceObjectAtIndex:playedCard withObject:cardsScope.getRandomCard];
}

- (void)playSomeCard
{
    NSInteger maximumWeight = 0;
    for (int i = 0; i < [cardsAvailableToPlay count]; i++) {
        if (maximumWeight < [[self.cards objectAtIndex:[[cardsAvailableToPlay objectAtIndex:i] integerValue]] cardWeight]) {
            maximumWeight = [[self.cards objectAtIndex:[[cardsAvailableToPlay objectAtIndex:i] integerValue]] cardWeight];
        }
    }
    NSLog(@"MaximumWeight: %d", maximumWeight);
    NSMutableArray *cardsWithMaximumWeight = [[NSMutableArray alloc] init];
    for (int i = 0; i < [cardsAvailableToPlay count]; i ++) {
        if ([[self.cards objectAtIndex:[[cardsAvailableToPlay objectAtIndex:i] integerValue]] cardWeight] == maximumWeight) {
            [cardsWithMaximumWeight addObject:[cardsAvailableToPlay objectAtIndex:i]];
        }
    }
    NSInteger randomValue = arc4random()%[cardsWithMaximumWeight count];
    [self.delegate showCurrentComputerCard:[[cardsWithMaximumWeight objectAtIndex:randomValue] integerValue] withStatus:@"Selected"];
    [self processCard:[[cardsWithMaximumWeight objectAtIndex:randomValue] integerValue]];
}

- (void)discardACard
{
    NSInteger minimumValue = 20;
    for (int i = 0; i < [self.cards count]; i++) {
        if (minimumValue > [[self.cards objectAtIndex:i] cardWeight]) {
            minimumValue = [[self.cards objectAtIndex:i] cardWeight];
        }
    }
    NSLog(@"MinimumWeight: %d", minimumValue);
    NSMutableArray *cardsWithMinimumWeight = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.cards count]; i ++) {
        if ([[self.cards objectAtIndex:i] cardWeight] == minimumValue) {
            [cardsWithMinimumWeight addObject:[NSNumber numberWithInt:i]];
        }
    }
    NSInteger randomValue = arc4random()%[cardsWithMinimumWeight count];
    [self.delegate showCurrentComputerCard:[[cardsWithMinimumWeight objectAtIndex:randomValue] integerValue] withStatus:@"Discarded"];
    playedCard = [[cardsWithMinimumWeight objectAtIndex:randomValue] integerValue];
    [self.delegate computerHasDiscardTheCard:playedCard];
    //[self getNewCardAtNumber:[[cardsWithMinimumWeight objectAtIndex:randomValue] integerValue]];
}

 - (void)analyzeCardsWeight
{
    for (int i = 0; i < [self.cards count]; i++) {
        [[self.cards objectAtIndex:i] increaseCardWeightOn:(-1 * [[self.cards objectAtIndex:i] cardWeight])];
        
        //=========================QUARRYS========================
        if (self.quarries <= 3) {
            if ([[self.cards objectAtIndex:i] quarriesSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForSuperResource];
            }
        } else  if (self.quarries > 3 && self.quarries < 6){
            if ([[self.cards objectAtIndex:i] quarriesSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForSuperResource];
            }
        } else {
            if ([[self.cards objectAtIndex:i] quarriesSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        }
        
        if (player.quarries > 1 && player.quarries < 3) {
            if ([[self.cards objectAtIndex:i] quarriesEnemy] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:(maxWeightForSuperResource * -1)];
            } else if ([[self.cards objectAtIndex:i] quarriesEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        } else if (player.quarries >= 3) {
            if ([[self.cards objectAtIndex:i] quarriesEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        }
        
        //========================MAGICS=================================
        if (self.magics <= 3) {
            if ([[self.cards objectAtIndex:i] magicsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForSuperResource];
            }
        } else  if (self.magics > 3 && self.magics < 6){
            if ([[self.cards objectAtIndex:i] magicsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForSuperResource];
            }
        } else {
            if ([[self.cards objectAtIndex:i] magicsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        }
        
        if (player.magics > 1 && player.magics < 3) {
            if ([[self.cards objectAtIndex:i] magicsEnemy] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:(maxWeightForSuperResource * -1)];
            } else if ([[self.cards objectAtIndex:i] magicsEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        } else if (player.magics >= 3) {
            if ([[self.cards objectAtIndex:i] magicsEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        }
        
        //==========================DUNGEONS==============================
        if (self.dungeons <= 3) {
            if ([[self.cards objectAtIndex:i] dungeonsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForSuperResource];
            }
        } else  if (self.dungeons > 3 && self.dungeons < 6){
            if ([[self.cards objectAtIndex:i] dungeonsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForSuperResource];
            }
        } else {
            if ([[self.cards objectAtIndex:i] dungeonsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        }
        
        if (player.dungeons > 1 && player.dungeons < 3) {
            if ([[self.cards objectAtIndex:i] dungeonsEnemy] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:(maxWeightForSuperResource * -1)];
            } else if ([[self.cards objectAtIndex:i] dungeonsEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        } else if (player.dungeons >= 3) {
            if ([[self.cards objectAtIndex:i] dungeonsEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForSuperResource];
            }
        }
        
        //=========================BRICKS========================
        if (self.bricks <= 3) {
            if ([[self.cards objectAtIndex:i] bricksSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForResource];
            }
        } else  if (self.bricks > 3 && self.bricks < 6){
            if ([[self.cards objectAtIndex:i] bricksSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForResource];
            }
        } else {
            if ([[self.cards objectAtIndex:i] bricksSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        }
        
        if (player.bricks > 1 && player.bricks < 3) {
            if ([[self.cards objectAtIndex:i] bricksEnemy] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:(maxWeightForResource * -1)];
            } else if ([[self.cards objectAtIndex:i] bricksEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        } else if (player.bricks >= 3) {
            if ([[self.cards objectAtIndex:i] bricksEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        }
        
        //=========================GEMS========================
        if (self.gems <= 3) {
            if ([[self.cards objectAtIndex:i] gemsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForResource];
            }
        } else  if (self.gems > 3 && self.gems < 6){
            if ([[self.cards objectAtIndex:i] gemsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForResource];
            }
        } else {
            if ([[self.cards objectAtIndex:i] gemsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        }
        
        if (player.gems > 1 && player.gems < 3) {
            if ([[self.cards objectAtIndex:i] gemsEnemy] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:(maxWeightForResource * -1)];
            } else if ([[self.cards objectAtIndex:i] gemsEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        } else if (player.gems >= 3) {
            if ([[self.cards objectAtIndex:i] gemsEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        }
        
        //=========================RECRUITS========================
        if (self.recruits <= 3) {
            if ([[self.cards objectAtIndex:i] recruitsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForResource];
            }
        } else  if (self.recruits > 3 && self.recruits < 6){
            if ([[self.cards objectAtIndex:i] recruitsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForResource];
            }
        } else {
            if ([[self.cards objectAtIndex:i] recruitsSelf] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        }
        
        if (player.recruits > 1 && player.recruits < 3) {
            if ([[self.cards objectAtIndex:i] recruitsEnemy] > 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:(maxWeightForResource * -1)];
            } else if ([[self.cards objectAtIndex:i] recruitsEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        } else if (player.recruits >= 3) {
            if ([[self.cards objectAtIndex:i] recruitsEnemy] < 0) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForResource];
            }
        }
        
        //=========================WALL========================
        if ([[self.cards objectAtIndex:i] wallSelf] > 0) {
            if (self.wall < 10) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForWall];
            } else if (self.wall > 10 && self.wall < 30) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForWall];
            } else {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForWall];
            }
        }
        
        if ([[self.cards objectAtIndex:i] wallEnemy] < 0) {
            if (player.wall < 10) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForWall];
            } else if (player.wall > 10 && player.wall < 30) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForWall];
            } else {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForWall];
            }
        }
        //=========================TOWER=======================
        if ([[self.cards objectAtIndex:i] towerSelf] > 0) {
            if (self.tower < 10) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForTower];
            } else if (self.tower > 10 && self.tower < 30) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForTower];
            } else {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForTower];
            }
        }
        
        if ([[self.cards objectAtIndex:i] towerEnemy] < 0) {
            if (player.tower < 10) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:maxWeightForTower];
            } else if (player.tower > 10 && player.tower < 30) {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:middleWeightForTower];
            } else {
                [[self.cards objectAtIndex:i] increaseCardWeightOn:lowWeightForTower];
            }
        }
    
    }
}

@end
