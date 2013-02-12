//
//  VictoryConditionsViewController.m
//  iArcomage
//
//  Created by NIBBLER on 1/13/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "VictoryConditionsViewController.h"

@interface VictoryConditionsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *towerAimLabel;
@property (weak, nonatomic) IBOutlet UILabel *resourcesAimLabel;

@end

@implementation VictoryConditionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.towerAimLabel.text = [NSString stringWithFormat:@"- Your tower must be at %d or higher", self.tower];
    self.resourcesAimLabel.text = [NSString stringWithFormat:@"- Each of your resources must be at %d or higher", self.resources];
}

@end
