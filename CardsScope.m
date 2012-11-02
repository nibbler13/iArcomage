//
//  CardsScope.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CardsScope.h"

@implementation CardsScope

#pragma mark -Initialization

+ (CardsScope*)getCardsScope
{
    static CardsScope *cardsScope;
    if (cardsScope == nil) {
        cardsScope = [[CardsScope alloc] init];
    }
    return cardsScope;
}

- (id)init
{
    if ([super init] != nil) {
        //NSLog(@"cardScope init complete");
    }
    return self;
}

- (void)loadDataFromPlist
{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"CardsList.plist"];
    NSArray *plistArray  = [NSArray arrayWithContentsOfFile:finalPath];
    self.cards = [[NSMutableArray alloc] initWithCapacity:102];
    int x = [plistArray count];
    for (int i = 0; i < x; i++) {
        NSDictionary *info = [plistArray objectAtIndex:i];
        [self.cards addObject:[self fillCardSlotWithInfo:info]];
    }
    //NSLog(@"cards count is: %d", [self.cards count]);
}

- (Card*)fillCardSlotWithInfo:(NSDictionary*)info
{
    Card *card = [[Card alloc] init];
    card.cardName = [info objectForKey:@"cardName"];
    card.cardColor = [info objectForKey:@"cardColor"];
    card.cardDescription = [info objectForKey:@"cardDescription"];
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
    
    //NSLog(@"%@ %@ %@ %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", card.cardName, card.cardColor, card.cardDescription, card.cardCost, card.quarriesSelf, card.quarriesEnemy, card.magicsSelf, card.magicsEnemy, card.dungeonsSelf, card.dungeonsEnemy, card.bricksSelf, card.bricksEnemy, card.gemsSelf, card.gemsEnemy, card.recruitsSelf, card.recruitsEnemy, card.wallSelf, card.wallEnemy, card.towerSelf, card.towerEnemy, card.additionalTerms);
    return card;
}

#pragma mark -GamePlay

- (Card*)getRandomCard
{
    NSInteger random = (1 + arc4random()%([self.cards count] -1));
    return [self.cards objectAtIndex:random];
}

@end
