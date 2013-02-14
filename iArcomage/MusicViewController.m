//
//  MusicViewController.m
//  iArcomage
//
//  Created by NIBBLER on 2/6/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "MusicViewController.h"
#import "CampaignDataMainObject.h"
#import "CampaignData.h"

@interface MusicViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MusicViewController
{
    CampaignDataMainObject *mainObject;
    NSInteger currentMusic;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainObject = [CampaignDataMainObject sharedCampaignDataMainObject];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForItem:[[NSUserDefaults standardUserDefaults] integerForKey:@"currentMusic"] inSection:0];
    [self.tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"randomMusic"]) {
        
        if ([self.view viewWithTag:105] == nil) {
            UIView *newView = [[UIView alloc] initWithFrame:self.view.frame];
            newView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.6f];
            newView.tag = 105;
            
            UILabel *newLabel = [[UILabel alloc] init];
            [newLabel setFont:[UIFont fontWithName:@"Papyrus" size:18.0f]];
            [newLabel setText:@"Switch off random music to select manually"];
            [newLabel sizeToFit];
            [newLabel setBackgroundColor:[UIColor clearColor]];
            [newLabel setTextColor:[UIColor whiteColor]];
            [newLabel setNumberOfLines:2];
            [newLabel setTextAlignment:NSTextAlignmentCenter];
            [newLabel setFrame:CGRectMake(self.view.center.x - (newLabel.frame.size.width * 0.60 / 2), (self.view.center.y - newLabel.frame.size.height), newLabel.frame.size.width * 0.60, newLabel.frame.size.height * 2)];
            [newLabel setFrame:CGRectIntegral(newLabel.frame)];
            
            [newView addSubview:newLabel];
            
            [self.view addSubview:newView];
        }
    } else {
        [[self.view viewWithTag:105] removeFromSuperview];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    currentMusic = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentMusic"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trackCell"];
    UILabel *trackLabel = (UILabel*)[cell viewWithTag:60];
    NSString *tempString;
    NSInteger numberOfLines = 1;
    float fontSize = 16.0;
    UIColor *color = [UIColor whiteColor];
    
    if (indexPath.row > 0 && indexPath.row < 14) {
        if ([[mainObject.taverns objectAtIndex:indexPath.row - 1] isAchieved]) {
            tempString = [NSString stringWithFormat:@"%@", [[mainObject.taverns objectAtIndex:indexPath.row - 1] backgroundMusic]];
        } else {
            numberOfLines = 2;
            fontSize = 12.0;
            tempString = [NSString stringWithFormat:@"To unlock this track you must complete the \"%@\" tavern", [[mainObject.taverns objectAtIndex:indexPath.row - 1] tavernName]];
            color = [UIColor lightTextColor];
        }
    } else if (indexPath.row != 0) {
        if ([[mainObject.taverns objectAtIndex:12] isAchieved]) {
            tempString = [NSString stringWithFormat:@"%@", [[mainObject.taverns objectAtIndex:12] backgroundMusic]];
        } else {
            numberOfLines = 2;
            fontSize = 12.0;
            tempString = [NSString stringWithFormat:@"To unlock this track you must complete the \"%@\" tavern", [[mainObject.taverns objectAtIndex:12] tavernName]];
            color = [UIColor lightTextColor];
        }
    } else {
        tempString = @"The first song";
    }
    
    trackLabel.textColor = color;
    trackLabel.numberOfLines = numberOfLines;
    trackLabel.font = [UIFont fontWithName:@"Papyrus" size:fontSize];
    trackLabel.text = tempString;
    
    
    UIImageView *checkBoxImageView = (UIImageView*)[cell viewWithTag:95];
    
    if (indexPath.row == currentMusic) {
        checkBoxImageView.hidden = NO;
    } else {
        checkBoxImageView.hidden = YES;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    currentMusic = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentMusic"];
    NSIndexPath *pathToOldCell = [NSIndexPath indexPathForItem:currentMusic inSection:0];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:pathToOldCell];
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:95];
    imageView.hidden = YES;
    
    cell = [self.tableView cellForRowAtIndexPath:indexPath];
    imageView = (UIImageView*)[cell viewWithTag:95];
    imageView.hidden = NO;
    
    [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:@"currentMusic"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.delegate changeMusic];
    
    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 0 && indexPath.row < 14) {
        if (![[mainObject.taverns objectAtIndex:indexPath.row - 1] isAchieved]) {
            return NO;
        }
    } else if (indexPath.row != 0) {
        if (![[mainObject.taverns objectAtIndex:12] isAchieved]) {
            return NO;
        }
    }
    
    return YES;
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 0 && indexPath.row < 14) {
        if (![[mainObject.taverns objectAtIndex:indexPath.row - 1] isAchieved]) {
            return nil;
        }
    } else if (indexPath.row != 0) {
        if (![[mainObject.taverns objectAtIndex:12] isAchieved]) {
            return nil;
        }
    }
    
    return indexPath;
}

@end