//
//  ScoreViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@property (weak, nonatomic) IBOutlet UILabel *gamesPlayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *gamesWinedLabel;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)increaseButtonPressed:(id)sender;

@end

@implementation ScoreViewController
{
    NSInteger gamesPlayed;
    NSInteger gamesWined;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    }
    
    gamesPlayed = [[temp objectForKey:@"GamesPlayed"] integerValue];
    gamesWined = [[temp objectForKey:@"GamesWined"] integerValue];
    NSLog(@"gamesPlayed: %d, gamesWined: %d", gamesPlayed, gamesWined);
    [self updateLabels];
}

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)increaseButtonPressed:(id)sender {
    gamesPlayed++;
    gamesWined++;
    [self updateLabels];
}

- (void)updateLabels
{
    self.gamesPlayedLabel.text = [NSString stringWithFormat:@"%d", gamesPlayed];
    self.gamesWinedLabel.text = [NSString stringWithFormat:@"%d", gamesWined];
}

- (void)viewWillDisappear:(BOOL)animated
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
}

@end
