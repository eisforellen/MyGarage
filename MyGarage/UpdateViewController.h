//
//  UpdateViewController.h
//  MyGarage
//
//  Created by Ellen Mey on 6/9/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vehicle.h"
@interface UpdateViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *makeLabel;
@property (strong, nonatomic) IBOutlet UILabel *modelLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentMileageLabel;
@property (strong, nonatomic) IBOutlet UILabel *remainingMileageLabel;
@property (strong, nonatomic) IBOutlet UITextField *updatedMileageInput;
@property (strong, nonatomic) IBOutlet UIButton *serviceCompleteButton;
@property (strong, nonatomic) Vehicle *updatedVehicle;
@property (strong, nonatomic) IBOutlet UILabel *lastServicedDateLabel;
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
//@property (weak, nonatomic) IBOutlet UILabel *regexMessageLabel;

@property (weak, nonatomic) IBOutlet UILabel *regexMessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;

@end
