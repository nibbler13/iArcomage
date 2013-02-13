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
}

#pragma mark -Initialization

+ (ComputerModel*)getComputer
{
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
        self.playedCard = -1;
        self.cards = [NSMutableArray arrayWithObjects:cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, nil];
    }
    return self;
}

#pragma mark -GamePlay

- (void)nextTurnIncreaseResource
{   
    self.bricks += self.quarries;
    self.gems += self.magics;
    self.recruits += self.dungeons;
    [self.delegate needToUpdateLabels];
}

- (void)computerTurn
{
    self.isThatComputerTurn = YES;
    player.isThatPlayerTurn = NO;
    
    if (player == nil) {
        player = [PlayerModel getPlayer];
    }
    
    [self getANewCard];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"hardMode"]) {
        [self analyzeCardsWeightHardLevel];
    } else {
        [self analyzeCardsWeight];
    }
    
    [self printCardsInHand];
    
    if (self.shouldDiscardACard) {
        [self discardACard];
        return;
    }
    
    if ([self checkAvailableCards]) {
        [self printAvailableCards];
        [self playSomeCard];
    
    } else {
        [self discardACard];
    }
}

- (BOOL)checkAvailableCards
{
    NSInteger cardCost;
    NSInteger computerResource;
    cardsAvailableToPlay = nil;
    cardsAvailableToPlay = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        cardCost = [[computer.cards objectAtIndex:i] cardCost];
        
        if ([[[computer.cards objectAtIndex:i] cardColor] isEqualToString:@"Grey"]) {
            computerResource = [computer bricks];
        } else if ([[[computer.cards objectAtIndex:i] cardColor] isEqualToString:@"Blue"]) {
            computerResource = [computer gems];
        } else {
            computerResource = [computer recruits];
        }
        
        if (cardCost <= computerResource) {
            [cardsAvailableToPlay addObject:[NSNumber numberWithInt:i]];
        } else if (computerResource - cardCost < -10) {
            [[self.cards objectAtIndex:i] increaseCardWeightOn:maxIdle];
        } else if (computerResource - cardCost < -5 && computerResource - cardCost > -10) {
            [[self.cards objectAtIndex:i] increaseCardWeightOn:middleIdle];
        } else if (computerResource - cardCost > -5) {
            [[self.cards objectAtIndex:i] increaseCardWeightOn:lowIdle];
        }
    }
    
    NSLog(@"========cardsAvailableToPlay: %d", [cardsAvailableToPlay count]);
    
    if ([cardsAvailableToPlay count] > 0) {
        if (!self.shouldDiscardACard) {
            return YES;
        }
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
    [self printCardInfoAtNumber:number];
    [self payForTheCard:number];
    self.playedCard = number;
}

- (void)getANewCard
{
    if (self.playedCard != -1) {
        [self.cards replaceObjectAtIndex:self.playedCard withObject:cardsScope.getRandomCard];
    }
}

- (void)playSomeCard
{
    self.isCardBeenDiscarded = NO;
    
    for (int i = 0; i < [[self cards] count]; i++) {
        [[[self cards] objectAtIndex:i] initPlayerModel:player andComputerModel:self];
    }
    
    NSInteger maximumWeight = -20;
    
    NSLog(@"======playSomeCard: availableToPlay: %d", [cardsAvailableToPlay count]);
    
    for (int i = 0; i < [cardsAvailableToPlay count]; i++) {
        NSLog(@"for i: %d", i);
        if (maximumWeight < [[self.cards objectAtIndex:[[cardsAvailableToPlay objectAtIndex:i] integerValue]] cardWeight]) {
            maximumWeight = [[self.cards objectAtIndex:[[cardsAvailableToPlay objectAtIndex:i] integerValue]] cardWeight];
            NSLog(@"if maximum: %d", [[self.cards objectAtIndex:[[cardsAvailableToPlay objectAtIndex:i] integerValue]] cardWeight]);
        }
    }
    NSLog(@"maximumWeight: %d", maximumWeight);
    
    if (maximumWeight < 1) {
        [self discardACard];
    }
    
    NSMutableArray *cardsWithMaximumWeight = [[NSMutableArray alloc] init];
    for (int i = 0; i < [cardsAvailableToPlay count]; i ++) {
        if ([[self.cards objectAtIndex:[[cardsAvailableToPlay objectAtIndex:i] integerValue]] cardWeight] == maximumWeight) {
            [cardsWithMaximumWeight addObject:[cardsAvailableToPlay objectAtIndex:i]];
        }
    }
    
    NSLog(@"cardsWithMaximumWeight: %d", [cardsWithMaximumWeight count]);
    
    NSInteger randomValue = arc4random()%[cardsWithMaximumWeight count];
    
    [self processCard:[[cardsWithMaximumWeight objectAtIndex:randomValue] integerValue]];
}

- (void)discardACard
{
    if (self.shouldDiscardACard) {
        self.shouldDiscardACard = NO;
    }
    
    NSInteger minimumValue = 20;
    
    for (int i = 0; i < [self.cards count]; i++) {
        if (minimumValue > [[self.cards objectAtIndex:i] cardWeight]) {
            minimumValue = [[self.cards objectAtIndex:i] cardWeight];
        }
    }
    
    NSMutableArray *cardsWithMinimumWeight = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.cards count]; i ++) {
        if ([[self.cards objectAtIndex:i] cardWeight] == minimumValue) {
            
            if (![[[self.cards objectAtIndex:i] cardName] isEqualToString:@"Lodestone"]) {
                [cardsWithMinimumWeight addObject:[NSNumber numberWithInt:i]];
            }
        }
    }
    
    NSInteger randomValue = 0;
    
    if ([cardsWithMinimumWeight count] != 0) {
        randomValue = arc4random()%[cardsWithMinimumWeight count];
        self.playedCard = [[cardsWithMinimumWeight objectAtIndex:randomValue] integerValue];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                        message:@"There's no available cards to discard"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok, I'll check this"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    self.isCardBeenDiscarded = YES;
}

 - (void)analyzeCardsWeight
{
    NSLog(@"analyzeCommon");
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

- (void)analyzeCardsWeightHardLevel
{
    NSLog(@"analyzeHard");
    for (int i = 0; i < [self.cards count]; i++) {
        
        Card *currentCard = [self.cards objectAtIndex:i];
        [currentCard setCardWeight:0];
        NSLog(@"---currentCardW: %d", currentCard.cardWeight);
        
        //=========================QUARRYS========================
        [currentCard increaseCardWeightOn:[self calculateWeightForSelfResource:computer.quarries
                                                           andForEnemyResource:player.quarries
                                                             withEffectForSelf:currentCard.quarriesSelf
                                                            withEffectForEnemy:currentCard.quarriesEnemy
                                                         isThisGeneralResource:YES
                                                                isThisForTower:NO
                                                                 isThisForWall:NO]];
        
        NSLog(@"Q: %d", currentCard.cardWeight);
        //========================MAGICS=================================
        [currentCard increaseCardWeightOn:[self calculateWeightForSelfResource:computer.magics
                                                           andForEnemyResource:player.magics
                                                             withEffectForSelf:currentCard.magicsSelf
                                                            withEffectForEnemy:currentCard.magicsEnemy
                                                         isThisGeneralResource:YES
                                                                isThisForTower:NO
                                                                 isThisForWall:NO]];
        
        NSLog(@"M: %d", currentCard.cardWeight);
        //==========================DUNGEONS==============================
        [currentCard increaseCardWeightOn:[self calculateWeightForSelfResource:computer.dungeons
                                                           andForEnemyResource:player.dungeons
                                                             withEffectForSelf:currentCard.dungeonsSelf
                                                            withEffectForEnemy:currentCard.dungeonsEnemy
                                                         isThisGeneralResource:YES
                                                                isThisForTower:NO
                                                                 isThisForWall:NO]];
        
        NSLog(@"D: %d", currentCard.cardWeight);
        //=========================BRICKS========================
        [currentCard increaseCardWeightOn:[self calculateWeightForSelfResource:computer.bricks
                                                           andForEnemyResource:player.bricks
                                                             withEffectForSelf:currentCard.bricksSelf
                                                            withEffectForEnemy:currentCard.bricksEnemy
                                                         isThisGeneralResource:NO
                                                                isThisForTower:NO
                                                                 isThisForWall:NO]];
        
        NSLog(@"B: %d", currentCard.cardWeight);
        //=========================GEMS========================
        [currentCard increaseCardWeightOn:[self calculateWeightForSelfResource:computer.gems
                                                           andForEnemyResource:player.gems
                                                             withEffectForSelf:currentCard.gemsSelf
                                                            withEffectForEnemy:currentCard.gemsEnemy
                                                         isThisGeneralResource:NO
                                                                isThisForTower:NO
                                                                 isThisForWall:NO]];
        
        NSLog(@"G: %d", currentCard.cardWeight);
        //=========================RECRUITS========================
        [currentCard increaseCardWeightOn:[self calculateWeightForSelfResource:computer.recruits
                                                           andForEnemyResource:player.recruits
                                                             withEffectForSelf:currentCard.recruitsSelf
                                                            withEffectForEnemy:currentCard.recruitsEnemy
                                                         isThisGeneralResource:NO
                                                                isThisForTower:NO
                                                                 isThisForWall:NO]];
        
        NSLog(@"R: %d", currentCard.cardWeight);
        //=========================WALL========================
        [currentCard increaseCardWeightOn:[self calculateWeightForSelfResource:computer.wall
                                                           andForEnemyResource:player.wall
                                                             withEffectForSelf:currentCard.wallSelf
                                                            withEffectForEnemy:currentCard.wallEnemy
                                                         isThisGeneralResource:NO
                                                                isThisForTower:NO
                                                                 isThisForWall:YES]];
        
        NSLog(@"W: %d", currentCard.cardWeight);
        //=========================TOWER=======================
        [currentCard increaseCardWeightOn:[self calculateWeightForSelfResource:computer.tower
                                                           andForEnemyResource:player.tower
                                                             withEffectForSelf:currentCard.towerSelf
                                                            withEffectForEnemy:currentCard.towerEnemy
                                                         isThisGeneralResource:NO
                                                                isThisForTower:YES
                                                                 isThisForWall:NO]];
        
        NSLog(@"T: %d", currentCard.cardWeight);
        
        if (currentCard.additionalTerms) {
            
            if ([currentCard.cardName isEqualToString:@"Lucky Cache"]
                ||  [currentCard.cardName isEqualToString:@"Friendly Terrain"]
                ||  [currentCard.cardName isEqualToString:@"Tremors"]
                ||  [currentCard.cardName isEqualToString:@"Secret Room"]
                ||  [currentCard.cardName isEqualToString:@"Quartz"]
                ||  [currentCard.cardName isEqualToString:@"Prism"]
                ||  [currentCard.cardName isEqualToString:@"Faerie"]
                ||  [currentCard.cardName isEqualToString:@"Elven Scout"]
                ||  [currentCard.cardName isEqualToString:@"Shadow Faerie"]
                ||  [currentCard.cardName isEqualToString:@"Smoky Quartz"]
                ||  [currentCard.cardName isEqualToString:@"Prism"]
                ||  [currentCard.cardName isEqualToString:@"Elven Scout"]) {
                
                [currentCard increaseCardWeightOn:3];
                
            }
        }

        
        [self.cards replaceObjectAtIndex:i withObject:currentCard];
        
    }
}

- (NSInteger)calculateWeightForSelfResource:(NSInteger)resource andForEnemyResource:(NSInteger)resourceEnemy withEffectForSelf:(NSInteger)changeSelf withEffectForEnemy:(NSInteger)changeEnemy isThisGeneralResource:(BOOL)general isThisForTower:(BOOL)tower isThisForWall:(BOOL)wall
{
    NSInteger counter = 0;
    
    NSInteger tempMax;
    NSInteger tempMiddle;
    NSInteger tempLow;
    
    NSInteger tempLowLimit;
    NSInteger tempMaxLimit;
    
    NSInteger minimum;
    
    if (general && !tower && !wall) {
        tempMax = maxWeightForSuperResource;
        tempMiddle = middleWeightForSuperResource;
        tempLow = lowWeightForSuperResource;
        tempLowLimit = 3;
        tempMaxLimit = 6;
        minimum = 1;
    } else if (!general && !tower && !wall) {
        tempMax = maxWeightForResource;
        tempMiddle = middleWeightForResource;
        tempLow = lowWeightForResource;
        tempLowLimit = 10;
        tempMaxLimit = 20;
        minimum = 1;
    }
    
    if (tower) {
        tempMax = maxWeightForTower;
        tempMiddle = middleWeightForTower;
        tempLow = lowWeightForTower;
        tempLowLimit = 15;
        tempMaxLimit = 30;
        minimum = -1;
    }
    
    if (wall) {
        tempMax = maxWeightForWall;
        tempMiddle = middleWeightForWall;
        tempLow = lowWeightForWall;
        tempLowLimit = 10;
        tempMaxLimit = 20;
        minimum = -1;
    }
    
    if (resource <= tempLowLimit) {
        if (changeSelf > 0) {
            counter += tempMax;
        } else if (changeSelf < 0 && resource > minimum) {
            counter -= tempMax;
        }
    } else  if (resource > tempLowLimit && resource < tempMaxLimit){
        if (changeSelf > 0) {
            counter += tempMiddle;
        } else if (changeSelf < 0 && resource > minimum) {
            counter -= tempMiddle;
        }
    } else {
        if (changeSelf > 0) {
            counter += tempLow;
        } else if (changeSelf < 0 && resource > minimum) {
            counter -= tempLow;
        }
    }
    
    if (resourceEnemy <= tempLowLimit) {
        if (changeEnemy > 0) {
            counter -= tempMax;
        } else if (changeEnemy < 0 && resourceEnemy > minimum) {
            counter += tempMax;
        }
    } else if (resourceEnemy > tempLowLimit && resourceEnemy < tempMaxLimit) {
        if (changeEnemy > 0) {
            counter -= tempMiddle;
        } else if (changeEnemy < 0 && resourceEnemy > minimum) {
            counter += tempMiddle;
        }
    } else {
        if (changeEnemy > 0) {
            counter -= tempLow;
        } else if (changeEnemy < 0 && resourceEnemy > minimum) {
            counter += tempLow;
        }
    }
    
    NSLog(@"counter: %d", counter);
    return counter;
}

@end
