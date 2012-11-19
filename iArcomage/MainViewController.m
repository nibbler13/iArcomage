//
//  ViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "MainViewController.h"
#import "StartViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) IBOutlet UISwitch *SoundSwitcher;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toStart"]) {
        StartViewController *controller = [segue destinationViewController];
        NSLog(@"self.soundsOn %u", self.SoundSwitcher.on);
        controller.soundsOn = self.SoundSwitcher.on;
        NSLog(@"controller.soundOn %u", controller.soundsOn);
    }
}

@end
