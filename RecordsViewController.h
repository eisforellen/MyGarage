//
//  RecordsViewController.h
//  MyGarage
//
//  Created by Ellen Mey on 6/10/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vehicle.h"

@interface RecordsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *pastServicesLabel;
@property (strong, nonatomic) IBOutlet UILabel *recordsHeaderLabel;
@property (strong, nonatomic) Vehicle *vehicle;

@property (strong, nonatomic) IBOutlet UILabel *milesAtLastServiceLabel;

@end
