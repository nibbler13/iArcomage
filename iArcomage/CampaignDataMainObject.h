//
//  CampaignDataMainObject.h
//  iArcomage
//
//  Created by NIBBLER on 2/9/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CampaignDataMainObject : NSObject

@property (nonatomic) NSMutableArray *taverns;

+ (id)sharedCampaignDataMainObject;
+ (void)destroyCampaignDataMainObject;

@end
