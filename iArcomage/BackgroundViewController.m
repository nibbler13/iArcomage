//
//  BackgroundViewController.m
//  iArcomage
//
//  Created by NIBBLER on 2/6/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "BackgroundViewController.h"
#import "CampaignDataMainObject.h"
#import "CampaignData.h"

@interface BackgroundViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *backgroundImageScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *textureScrollView;

@property (weak, nonatomic) IBOutlet UIButton *backgroundUpButton;
@property (weak, nonatomic) IBOutlet UIButton *backgroundDownButton;
@property (weak, nonatomic) IBOutlet UIButton *textureUpButton;
@property (weak, nonatomic) IBOutlet UIButton *textureDownButton;

- (IBAction)backgroundUpButtonPressed:(id)sender;
- (IBAction)backgroundDownButtonPressed:(id)sender;
- (IBAction)textureUpButtonPressed:(id)sender;
- (IBAction)textureDownButtonPressed:(id)sender;

@end

@implementation BackgroundViewController
{
    CampaignDataMainObject *mainObject;
    NSInteger currentBackgroundScrollPage;
    NSInteger currentTextureScrollPage;
    
    CGFloat backgroundItemWidth;
    CGFloat backgroundItemHeight;
    
    CGFloat textureItemWidth;
    CGFloat textureItemHeight;
    
    CGFloat margin;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    backgroundItemWidth = 200.0f;
    backgroundItemHeight = 150.0f;
    
    textureItemWidth = 80.0f;
    textureItemHeight = 150.0f;
    
    margin = 5.0f;
    
    NSInteger currentBackground = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentBackground"];
    NSInteger currentTexture = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentTexture"];
    
    mainObject = [CampaignDataMainObject sharedCampaignDataMainObject];
    
    self.backgroundImageScrollView.contentSize = CGSizeMake(backgroundItemWidth, (backgroundItemHeight+margin*2)*20);
    
    self.textureScrollView.contentSize = CGSizeMake(textureItemWidth, (textureItemHeight+margin*2)*20);
    
    for (int i = 0; i < 20; i++) {
        
        BOOL backgroundNotAvailable = YES;
        NSString *tavernName;
        
        CGRect currentBackgroundRect = CGRectMake(0, i * (backgroundItemHeight + margin * 2) + margin, backgroundItemWidth, backgroundItemHeight);
        CGRect currentTextureRect = CGRectMake(0, i * (textureItemHeight + margin * 2) + margin, textureItemWidth, textureItemHeight);
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:currentBackgroundRect];
        backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"BackgroundPreview%d", i]];
        [self.backgroundImageScrollView addSubview:backgroundImageView];
        
        UIImageView *textureImageView = [[UIImageView alloc] initWithFrame:currentTextureRect];
        textureImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"texturePreview%d", i]];
        [self.textureScrollView addSubview:textureImageView];
        
        if (i == currentBackground) {
            UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:currentBackgroundRect];
            tempImageView.image = [UIImage imageNamed:@"CheckBackground"];
            tempImageView.tag = 99;
            [self.backgroundImageScrollView addSubview:tempImageView];
        }
        
        if (i == currentTexture) {
            UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:currentTextureRect];
            tempImageView.image = [UIImage imageNamed:@"CheckTexture"];
            tempImageView.tag = 98;
            [self.textureScrollView addSubview:tempImageView];
        }
        
        if (i > 0 && i < 14) {
            if (![[mainObject.taverns objectAtIndex: i - 1] isAchieved]) {
                backgroundNotAvailable = NO;
                tavernName = [[mainObject.taverns objectAtIndex: i - 1] tavernName];
            }
        } else if (i > 13 && ![[mainObject.taverns objectAtIndex:12] isAchieved]) {
            backgroundNotAvailable = NO;
            tavernName = [[mainObject.taverns objectAtIndex:12] tavernName];
        }
        
        if (!backgroundNotAvailable) {
            
            UIImageView *backgroundNotAvailableImageView = [[UIImageView alloc] initWithFrame:currentBackgroundRect];
            backgroundNotAvailableImageView.image = [UIImage imageNamed:@"NotAvailableBackground"];
            [self.backgroundImageScrollView addSubview:backgroundNotAvailableImageView];
            
            UILabel *backgroundNotAvailableLable = [[UILabel alloc] initWithFrame:currentBackgroundRect];
            backgroundNotAvailableLable.textColor = [UIColor whiteColor];
            backgroundNotAvailableLable.textAlignment = NSTextAlignmentCenter;
            backgroundNotAvailableLable.numberOfLines = 4;
            backgroundNotAvailableLable.backgroundColor = [UIColor clearColor];
            backgroundNotAvailableLable.text = [NSString stringWithFormat:@"To unlock this background you must complete the \"%@\" tavern", tavernName];
            [backgroundNotAvailableLable setFont:[UIFont fontWithName:@"Papyrus" size:16.0f]];
            [self.backgroundImageScrollView addSubview:backgroundNotAvailableLable];
            
            UIImageView *textureNotAvailableImageView = [[UIImageView alloc] initWithFrame:currentTextureRect];
            textureNotAvailableImageView.image = [UIImage imageNamed:@"NotAvailableTexturePreview"];
            [self.textureScrollView addSubview:textureNotAvailableImageView];
            
            UILabel *textureNotAvailableLable = [[UILabel alloc] initWithFrame:currentTextureRect];
            textureNotAvailableLable.textColor = [UIColor whiteColor];
            textureNotAvailableLable.textAlignment = NSTextAlignmentCenter;
            textureNotAvailableLable.numberOfLines = 8;
            textureNotAvailableLable.backgroundColor = [UIColor clearColor];
            textureNotAvailableLable.text = [NSString stringWithFormat:@"To unlock this background you must complete the \"%@\" tavern", tavernName];
            [textureNotAvailableLable setFont:[UIFont fontWithName:@"Papyrus" size:12.0f]];
            [self.textureScrollView addSubview:textureNotAvailableLable];
            
        } else {
            
            UIButton *backgroundButton = [[UIButton alloc] initWithFrame:currentBackgroundRect];
            [backgroundButton setImage:[UIImage imageNamed:@"BlankBackground"] forState:UIControlStateNormal];
            [backgroundButton setImage:[UIImage imageNamed:@"GradientBackground"] forState:UIControlStateHighlighted];
            [backgroundButton addTarget:self action:@selector(backgroundChangeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
            [self.backgroundImageScrollView addSubview:backgroundButton];
            
            UIButton *textureButton = [[UIButton alloc] initWithFrame:currentTextureRect];
            [textureButton setImage:[UIImage imageNamed:@"BlankBackground"] forState:UIControlStateNormal];
            [textureButton setImage:[UIImage imageNamed:@"NotAvailableTexturePreview"] forState:UIControlStateHighlighted];
            [textureButton addTarget:self action:@selector(textureChangeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
            [self.textureScrollView addSubview:textureButton];
            
        }
    }
    
    currentBackgroundScrollPage = currentBackground;
    currentTextureScrollPage = currentTexture;
    
    if (currentBackgroundScrollPage == 0) {
        self.backgroundUpButton.hidden = YES;
    }
    if (currentBackgroundScrollPage == 19) {
        self.backgroundDownButton.hidden = YES;
    }
    
    if (currentTextureScrollPage == 0) {
        self.textureUpButton.hidden = YES;
    }
    if (currentTextureScrollPage == 19) {
        self.textureDownButton.hidden = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSInteger currentBackground = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentBackground"];
    NSInteger currentTexture = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentTexture"];
    
    currentBackgroundScrollPage = currentBackground;
    currentTextureScrollPage = currentTexture;
    
    [self backgroundScrollPageChanged];
    [self textureScrollPageChanged];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.backgroundImageScrollView]) {
        
        CGFloat height = backgroundItemHeight + margin * 2;
        int page = (self.backgroundImageScrollView.contentOffset.y + height/2.0f) / height;
        
        if (page < 0 || page > 19) {
            return;
        }
        
        currentBackgroundScrollPage = page;
        
        if (currentBackgroundScrollPage != 0) {
            self.backgroundUpButton.hidden = NO;
        } else {
            self.backgroundUpButton.hidden = YES;
        }
        
        if (currentBackgroundScrollPage != 19) {
            self.backgroundDownButton.hidden = NO;
        } else {
            self.backgroundDownButton.hidden = YES;
        }
    } else {
        
        CGFloat height = textureItemHeight + margin * 2;
        int page = (self.textureScrollView.contentOffset.y + height/2.0f) / height;
        
        if (page < 0 || page > 19) {
            return;
        }
        
        currentTextureScrollPage = page;
        
        if (currentTextureScrollPage != 0) {
            self.textureUpButton.hidden = NO;
        } else {
            self.textureUpButton.hidden = YES;
        }
        
        if (currentTextureScrollPage != 19) {
            self.textureDownButton.hidden = NO;
        } else {
            self.textureDownButton.hidden = YES;
        }
    }
}

- (void)backgroundChangeButtonPressed
{
    NSInteger currentBackground = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentBackground"];
    
    if (currentBackgroundScrollPage != currentBackground) {
        
        currentBackground = currentBackgroundScrollPage;
        [[NSUserDefaults standardUserDefaults] setInteger:currentBackground forKey:@"currentBackground"];
        
        UIImageView *tempImageView = (UIImageView*)[self.backgroundImageScrollView viewWithTag:99];
        tempImageView.frame = CGRectMake(0, currentBackgroundScrollPage * (backgroundItemHeight + margin * 2) + margin, backgroundItemWidth, backgroundItemHeight);
        [self.backgroundImageScrollView bringSubviewToFront:tempImageView];
        
        [self.delegate changeBackgroundImage];
    }
}

- (void)textureChangeButtonPressed
{
    NSInteger currentTexture = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentTexture"];
    
    if (currentTextureScrollPage != currentTexture) {
        
        currentTexture = currentTextureScrollPage;
        [[NSUserDefaults standardUserDefaults] setInteger:currentTexture forKey:@"currentTexture"];
        
        UIImageView *tempImageView = (UIImageView*)[self.textureScrollView viewWithTag:98];
        tempImageView.frame = CGRectMake(0, currentTextureScrollPage * (textureItemHeight + margin * 2) + margin, textureItemWidth, textureItemHeight);
        [self.textureScrollView bringSubviewToFront:tempImageView];
        
        [self.delegate changeTextureImage];
    }
}

- (void)backgroundScrollPageChanged
{
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backgroundImageScrollView.contentOffset = CGPointMake(0, (backgroundItemHeight + margin*2) * currentBackgroundScrollPage);
                     }completion:^(BOOL finished){
                         
                     }];
}

- (void)textureScrollPageChanged
{
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.textureScrollView.contentOffset = CGPointMake(0, (textureItemHeight + margin*2) * currentTextureScrollPage);
                     }completion:^(BOOL finished){
                         
                     }];
}

- (IBAction)backgroundUpButtonPressed:(id)sender
{
    currentBackgroundScrollPage--;
    [self backgroundScrollPageChanged];
}

- (IBAction)backgroundDownButtonPressed:(id)sender
{
    currentBackgroundScrollPage++;
    [self backgroundScrollPageChanged];
}

- (IBAction)textureUpButtonPressed:(id)sender
{
    currentTextureScrollPage--;
    [self textureScrollPageChanged];
}

- (IBAction)textureDownButtonPressed:(id)sender
{
    currentTextureScrollPage++;
    [self textureScrollPageChanged];
}

@end
