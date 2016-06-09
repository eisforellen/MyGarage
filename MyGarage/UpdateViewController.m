//
//  UpdateViewController.m
//  MyGarage
//
//  Created by Ellen Mey on 6/9/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    
    _nicknameLabel.text = _updatedVehicle.nickname;
     _makeLabel.text = _updatedVehicle.make;
     _modelLabel.text = _updatedVehicle.model;
    _currentMileageLabel.text = [NSString stringWithFormat:@"%i", _updatedVehicle.mileage];
    _remainingMileageLabel.text = [NSString stringWithFormat:@"%i", [self remainingMileageCalc]];
    NSLog(@"Mileage: %i  lastServiceMileage: %i", _updatedVehicle.mileage, _updatedVehicle.lastServiceMileage);
    
    [self alertForService];
    [self serviceButtonStatus];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
   // _nicknameLabel.text =[Vehicle _nicknakeInput.text]
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertForService {
    if ([self remainingMileageCalc] <= 0){
        NSLog(@"Alert!");
    }
}

-(int)remainingMileageCalc{
    int remainingMileage = 5000 - (_updatedVehicle.mileage - _updatedVehicle.lastServiceMileage);
    return remainingMileage;
}

- (IBAction)serviceCompleteButtonClicked:(id)sender {
    // Add service complete logic - needs if statement
    NSLog(@"Updated");
    _updatedVehicle.lastServiceMileage = _updatedVehicle.mileage;
    [self viewDidLoad];
    
}
- (IBAction)saveNewMileageButtonClicked:(id)sender {
    // Add update current mileage logic
    _updatedVehicle.mileage = [_updatedMileageInput.text intValue];
    NSLog(@"Updated mileage: %i", _updatedVehicle.mileage);
    [self viewDidLoad];
    
}

- (void)serviceButtonStatus{
    if([self remainingMileageCalc] <= 0){
        _serviceCompleteButton.enabled=YES;
        _serviceCompleteButton.alpha = 1.0;
    }
    else{
        _serviceCompleteButton.enabled=NO;
        _serviceCompleteButton.alpha = 0.2;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
