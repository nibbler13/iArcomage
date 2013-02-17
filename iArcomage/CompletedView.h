//
//  CompletedView.h
//  iArcomage
//
//  Created by NIBBLER on 2/16/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CompletedViewDelegate <NSObject>

- (void)closeButtonPressed;

@end

@interface CompletedView : UIView

@property (weak, nonatomic) IBOutlet UILabel *gamesLossLabel;
@property (weak, nonatomic) IBOutlet UILabel *gamesWinnedLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalGamePlayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *byTowerConstructionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *textureImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *trackNameLabel;

@property (strong, nonatomic) id <CompletedViewDelegate> delegate;

@end
