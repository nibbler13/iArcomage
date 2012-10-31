//
//  CardsScope.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CardsScope.h"
#import "Card.h"

@implementation CardsScope

- (id)init
{
    if ([super init] != nil) {
        self.cards = [[NSMutableArray alloc] initWithCapacity:102];
    }
    return self;
}

@end
