//
//  DetailViewController.h
//  SmileTickets
//
//  Created by Wang Long on 2/6/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

typedef enum {
    detailTypeTickets = 0,
    detailTypeValley,
    detailTypeSettings,
    detailTypeOrders,
    detailTypeAbout
} DetailType;

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property DetailType detailType;

@end
