//
//  OptionsViewController.m
//  iArcomage
//
//  Created by NIBBLER on 1/11/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@property (weak, nonatomic) IBOutlet UISlider *musicVolume;
@property (weak, nonatomic) IBOutlet UISlider *soundVolume;

- (IBAction)musicVolumeChanged:(id)sender;
- (IBAction)soundVolumeChanged:(id)sender;

@end

@implementation OptionsViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.musicVolume.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"];
}

- (IBAction)musicVolumeChanged:(id)sender {
    [[NSUserDefaults standardUserDefaults] setFloat:self.musicVolume.value forKey:@"musicVolume"];
    [self.delegate needToChangeSoundsLevel];
}

- (IBAction)soundVolumeChanged:(id)sender {
    [[NSUserDefaults standardUserDefaults] setFloat:self.soundVolume.value forKey:@"soundValue"];
    [self.delegate needToChangeSoundsLevel];
}

@end
