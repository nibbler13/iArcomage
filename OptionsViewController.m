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
@property (weak, nonatomic) IBOutlet UISwitch *randomBackground;
@property (weak, nonatomic) IBOutlet UISwitch *randomMusic;

- (IBAction)musicVolumeChanged:(id)sender;
- (IBAction)soundVolumeChanged:(id)sender;
- (IBAction)hardModeChanged:(id)sender;
- (IBAction)randomBackgroundChanged:(id)sender;
- (IBAction)randomMusicChanged:(id)sender;

@end

@implementation OptionsViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.musicVolume.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"];
    self.soundVolume.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"soundVolume"];
    self.hardMode.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"hardMode"];
    self.randomBackground.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"randomBackground"];
    self.randomMusic.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"randomMusic"];
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
    if ([self.delegate respondsToSelector:@selector(needToChangeHardMode)]) {
        [self.delegate needToChangeHardMode];
    }
}

- (IBAction)randomBackgroundChanged:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:self.randomBackground.on forKey:@"randomBackground"];
    if ([self.delegate respondsToSelector:@selector(needToChangeRandomBackgroundMode)]) {
        [self.delegate needToChangeRandomBackgroundMode];
    }
}

- (IBAction)randomMusicChanged:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:self.randomMusic.on forKey:@"randomMusic"];
    if ([self.delegate respondsToSelector:@selector(needToChangeRandomMusicMode)]) {
        [self.delegate needToChangeRandomMusicMode];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    [super viewWillDisappear:animated];
}

@end
