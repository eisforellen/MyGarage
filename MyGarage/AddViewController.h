//
//  AddViewController.h
//  MyGarage
//
//  Created by Ellen Mey on 6/8/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vehicle.h"
@interface AddViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nicknameInput;
@property (strong, nonatomic) IBOutlet UITextField *makeInput;
@property (strong, nonatomic) IBOutlet UITextField *modelInput;
@property (strong, nonatomic) IBOutlet UITextField *mileageInput;
@property (strong, nonatomic) Vehicle *vehicle;
@property (strong, nonatomic) NSDate *initialDate;
@end
