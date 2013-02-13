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
@property (weak, nonatomic) IBOutlet UISwitch *hardMode;

- (IBAction)musicVolumeChanged:(id)sender;
- (IBAction)soundVolumeChanged:(id)sender;
- (IBAction)hardModeChanged:(id)sender;

@end

@implementation OptionsViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.musicVolume.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"];
    self.soundVolume.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"soundVolume"];
    self.hardMode.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"hardMode"];
}

- (IBAction)musicVolumeChanged:(id)sender {
    [[NSUserDefaults standardUserDefaults] setFloat:self.musicVolume.value forKey:@"musicVolume"];
    [self.delegate needToChangeSoundsLevel];
}

- (IBAction)soundVolumeChanged:(id)sender {
    [[NSUserDefaults standardUserDefaults] setFloat:self.soundVolume.value forKey:@"soundVolume"];
    [self.delegate needToChangeSoundsLevel];
}

- (IBAction)hardModeChanged:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:self.hardMode.on forKey:@"hardMode"];
    [self.delegate needToChangeHardMode];
    NSLog(@"hardModeChanged");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"OptionsView loaded");
}

@end
