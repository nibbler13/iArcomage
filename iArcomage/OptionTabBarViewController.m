//
//  OptionTabBarViewController.m
//  iArcomage
//
//  Created by NIBBLER on 2/6/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "OptionTabBarViewController.h"
#import "OptionsViewController.h"
#import "BackgroundViewController.h"
#import "MusicViewController.h"
#import "CampaignDataMainObject.h"

@interface OptionTabBarViewController ()

@end

@implementation OptionTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    OptionsViewController *controller0 = [self.viewControllers objectAtIndex:0];
    controller0.delegate = self.rootController;
    
    BackgroundViewController *controller1 = [self.viewControllers objectAtIndex:1];
    controller1.delegate = self.rootController;
    
    MusicViewController *controller2 = [self.viewControllers objectAtIndex:2];
    controller2.delegate = self.rootController;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [CampaignDataMainObject destroyCampaignDataMainObject];
    
    [super viewDidDisappear:animated];
}

@end
