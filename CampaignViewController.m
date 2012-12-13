//
//  CampaignViewController.m
//  iArcomage
//
//  Created by NIBBLER on 12/13/12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CampaignViewController.h"
#import "CampaignData.h"

@interface CampaignViewController ()

- (IBAction)backButtonPressed:(id)sender;

@end

@implementation CampaignViewController
{
    NSMutableArray *taverns;
}

- (void)viewDidLoad
{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"Taverns.plist"];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:finalPath];
    taverns = [[NSMutableArray alloc] init];
    int x = [plistArray count];
    for (int i = 0; i < x; i++) {
        NSDictionary *info = plistArray[i];
        [taverns addObject:[self fillCampaignDataWithInfo:info]];
    }
}

- (CampaignData*)fillCampaignDataWithInfo:(NSDictionary*)info
{
    CampaignData *data = [[CampaignData alloc] init];
    data.tavernName = [info objectForKey:@"tavernName"];
    data.initialTower = [[info objectForKey:@"initialTower"] integerValue];
    data.initialWall = [[info objectForKey:@"initialWall"] integerValue];
    data.finalTower = [[info objectForKey:@"finalTower"] integerValue];
    data.finalResources = [[info objectForKey:@"finalResources"] integerValue];
    data.backgroundPicture = [info objectForKey:@"backgroundPicture"];
    data.towerBackground = [info objectForKey:@"towerBackground"];
    data.towerHeadPlayerBackground = [info objectForKey:@"towerHeadPlayerBackground"];
    data.towerHeadComputerBackground = [info objectForKey:@"towerHeadComputerBackground"];
    data.wallBackground = [info objectForKey:@"wallBackground"];
    data.backgroundMusic = [info objectForKey:@"backgroundMusic"];
    data.imageForTavern = [info objectForKey:@"imageForTavern"];
    data.isAchieved = [[info objectForKey:@"isAchieved"] boolValue];
    return data;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [taverns count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TavernCell"];
    
    UILabel *labelName = (UILabel*)[cell viewWithTag:900];
    labelName.text = [[taverns objectAtIndex:indexPath.row] tavernName];
    
    UILabel *labelInitial = (UILabel*)[cell viewWithTag:901];
    labelInitial.text = [NSString stringWithFormat:@"Start at tower: %d and wall:%d", [[taverns objectAtIndex:indexPath.row] initialTower], [[taverns objectAtIndex:indexPath.row] initialWall]];
    
    UILabel *labelFinal = (UILabel*)[cell viewWithTag:902];
    labelFinal.text = [NSString stringWithFormat:@"Win with tower: %d and resources: %d", [[taverns objectAtIndex:indexPath.row] finalTower], [[taverns objectAtIndex:indexPath.row] finalResources]];
    
    UIImageView *tavernImage = (UIImageView*)[cell viewWithTag:903];
    tavernImage.image = [UIImage imageNamed:[[taverns objectAtIndex:indexPath.row] imageForTavern]];
    
    if ([[taverns objectAtIndex:indexPath.row] isAchieved]) {
        UIImageView *achievedImage = (UIImageView*)[cell viewWithTag:904];
        achievedImage.image = [UIImage imageNamed:@"Completed"];
    }
    
    return cell;
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
