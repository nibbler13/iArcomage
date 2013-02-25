//
//  CardsScope.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CardsScope.h"

static CardsScope *cardsScope;

@implementation CardsScope

#pragma mark -Initialization

+ (CardsScope*)getCardsScope
{
    if (cardsScope == nil) {
        cardsScope = [[CardsScope alloc] init];
    }
    return cardsScope;
}

+ (void)destroyCardsScope
{
    if (cardsScope != nil) {
        cardsScope = nil;
    }
}

- (id)init
{
    if (self = [super init]) {
        
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *finalPath = [path stringByAppendingPathComponent:@"CardsList.plist"];
        NSArray *plistArray  = [NSArray arrayWithContentsOfFile:finalPath];
        self.cards = [[NSMutableArray alloc] initWithCapacity:102];
        int x = [plistArray count];
        for (int i = 0; i < x; i++) {
            NSDictionary *info = [plistArray objectAtIndex:i];
            [self.cards addObject:[self fillCardSlotWithInfo:info]];
        }
    }
    return self;
}

- (Card*)fillCardSlotWithInfo:(NSDictionary*)info
{
    Card *card = [[Card alloc] init];
    card.cardName = [info objectForKey:@"cardName"];
    card.cardColor = [info objectForKey:@"cardColor"];
    card.cardDescription = [[info objectForKey:@"cardDescription"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    card.cardCost = [[info objectForKey:@"cardCost"] integerValue];
    card.quarriesSelf = [[info objectForKey:@"quarriesSelf"] integerValue];
    card.quarriesEnemy = [[info objectForKey:@"quarriesEnemy"] integerValue];
    card.magicsSelf = [[info valueForKey:@"magicsSelf"] integerValue];
    card.magicsEnemy = [[info valueForKey:@"magicsEnemy"] integerValue];
    card.dungeonsSelf = [[info valueForKey:@"dungeonsSelf"] integerValue];
    card.dungeonsEnemy = [[info valueForKey:@"dungeonsEnemy"] integerValue];
    card.bricksSelf = [[info valueForKey:@"bricksSelf"] integerValue];
    card.bricksEnemy = [[info valueForKey:@"bricksEnemy"] integerValue];
    card.gemsSelf = [[info valueForKey:@"gemsSelf"] integerValue];
    card.gemsEnemy = [[info valueForKey:@"gemsEnemy"] integerValue];
    card.recruitsSelf = [[info valueForKey:@"recruitsSelf"] integerValue];
    card.recruitsEnemy = [[info valueForKey:@"recruitsEnemy"] integerValue];
    card.wallSelf = [[info valueForKey:@"wallSelf"] integerValue];
    card.wallEnemy = [[info valueForKey:@"wallEnemy"] integerValue];
    card.towerSelf = [[info valueForKey:@"towerSelf"] integerValue];
    card.towerEnemy = [[info valueForKey:@"towerEnemy"] integerValue];
    card.additionalTerms =  [[info valueForKey:@"additionalTerms"] boolValue];
    card.cardWeight = 0;
    return card;
}

#pragma mark -GamePlay

- (Card*)getRandomCard
{
    NSInteger random = (1 + arc4random()%([self.cards count] -1));
    [[self.cards objectAtIndex:random] setCardNumber:random];
    return [self.cards objectAtIndex:random];
}

- (Card*)getCardAtNumber:(NSInteger)number
{
    [[self.cards objectAtIndex:number] setCardNumber:number];
    return [self.cards objectAtIndex:number];
}

@end
