//
//  MusicViewController.h
//  iArcomage
//
//  Created by NIBBLER on 2/6/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MusicViewControllerDelegate <NSObject>

- (void)changeMusic;

@end

@interface MusicViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) id <MusicViewControllerDelegate> delegate;

@end
