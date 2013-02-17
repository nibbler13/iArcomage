//
//  ScoreSystem.m
//  iArcomage
//
//  Created by NIBBLER on 2/17/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "ScoreSystem.h"

@implementation ScoreSystem

- (id)init
{
    if (self = [super init]) {
        NSLog(@"init score");
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"Score.plist"];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
            plistPath = [[NSBundle mainBundle] pathForResource:@"Score" ofType:@"plist"];
        }
        
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSDictionary *dictionary = (NSDictionary*)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
        
        if (dictionary) {
            self.winnedByCollection = [[dictionary objectForKey:@"winnedByCollection"] integerValue];
            self.winnedByConstruction = [[dictionary objectForKey:@"winnedByConstruction"] integerValue];
            self.winnedByDestruction = [[dictionary objectForKey:@"winnedByDestruction"] integerValue];
            self.lossesGames = [[dictionary objectForKey:@"lossesGames"] integerValue];
            
        } else {
            self.winnedByCollection = 0;
            self.winnedByConstruction = 0;
            self.winnedByDestruction = 0;
            self.lossesGames = 0;
        }
    }
    
    return self;
}

- (void)saveScore
{
    NSLog(@"save score");
    NSString *error;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"Score.plist"];
    
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:
                               [NSArray arrayWithObjects:
                                [NSNumber numberWithInteger:self.winnedByCollection],
                                [NSNumber numberWithInteger:self.winnedByConstruction],
                                [NSNumber numberWithInteger:self.winnedByDestruction],
                                [NSNumber numberWithInteger:self.lossesGames], nil]
                                forKeys:
                               [NSArray arrayWithObjects:
                                @"winnedByCollection",
                                @"winnedByConstruction",
                                @"winnedByDestruction",
                                @"lossesGames", nil]];
    
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    if (plistData) {
        [plistData writeToFile:plistPath atomically:NO];
    } else {
        NSLog(@"%@", error);
    }
}

@end
