//
//  MainTableViewController.h
//  MyGarage
//
//  Created by Ellen Mey on 6/8/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
@interface MainTableViewController : UITableViewController <UITableViewDataSource>

@property (strong, nonatomic) Vehicle *addedVehicle;

@end
