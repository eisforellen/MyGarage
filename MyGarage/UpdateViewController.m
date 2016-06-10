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
    
    [self setupUpdateVC];
    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self serviceButtonStatus];
}

-(void)viewDidDisappear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)setupUpdateVC{
    
    _regexMessageLabel.hidden=true;
    _nicknameLabel.text = _updatedVehicle.nickname;
    _makeLabel.text = _updatedVehicle.make;
    _modelLabel.text = _updatedVehicle.model;
    _currentMileageLabel.text = [NSString stringWithFormat:@"%i", _updatedVehicle.mileage];
    _remainingMileageLabel.text = [NSString stringWithFormat:@"%i", [self remainingMileageCalc]];
    _lastServicedDateLabel.text = [NSString stringWithFormat:@"%@", _updatedVehicle.lastServiceDate];
    NSLog(@"Mileage: %i  lastServiceMileage: %i", _updatedVehicle.mileage, _updatedVehicle.lastServiceMileage);
    
    [self serviceButtonStatus];

}




- (IBAction)saveNewMileageButtonClicked:(id)sender {
    // Add update current mileage logic
    [self validateInput];
    //    [self updateDataMileage:[_updatedMileageInput.text intValue]];
    //    NSLog(@"Updated mileage: %i", _updatedVehicle.mileage);
    //    [self setupUpdateVC];
    //    [self serviceButtonStatus];
    
    
}

-(void)validateInput{
    NSString *pattern = @"^[0-9]*$";
    NSString *string = _updatedMileageInput.text;
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    NSRange textRange = NSMakeRange(0, string.length);
    NSInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:textRange];
    if(numberOfMatches == 0){
        NSLog(@" Not Valid");
        _regexMessageLabel.hidden=false;
        _updatedMileageInput.layer.borderColor=[[UIColor redColor]CGColor];
        _updatedMileageInput.layer.borderWidth=1.0;
    }
    else{
        NSLog(@"Valid");
        _regexMessageLabel.hidden=true;
        _updatedMileageInput.layer.borderColor=[[UIColor clearColor] CGColor];
        [self updateDataMileage:[_updatedMileageInput.text intValue]];
        [self setupUpdateVC];
        [self serviceButtonStatus];
    };
}


-(int)remainingMileageCalc{
    int remainingMileage = 5000 - (_updatedVehicle.mileage - _updatedVehicle.lastServiceMileage);
    return remainingMileage;
}


- (void)serviceButtonStatus{
    if([self remainingMileageCalc] <= 0){
        _serviceCompleteButton.enabled=YES;
        _serviceCompleteButton.alpha = 1.0;
       [self alertForService];
        
    }
    else{
        _serviceCompleteButton.enabled=NO;
        _serviceCompleteButton.alpha = 0.2;
    }
}

- (IBAction)serviceCompleteButtonClicked:(id)sender {
    // Add service complete logic - needs if statement
    NSLog(@"Updated");
    if(_updatedMileageInput){
        [self updateDataLastServiceMileage:[_updatedMileageInput.text intValue]];
        [self updateDataMileage:[_updatedMileageInput.text intValue]];
//        _updatedVehicle.lastServiceMileage = [_updatedMileageInput.text intValue];
//        _updatedVehicle.mileage = [_updatedMileageInput.text intValue];
    } else {
    [self updateDataLastServiceMileage:_updatedVehicle.mileage];
        //_updatedVehicle.lastServiceMileage = _updatedVehicle.mileage;
    }
     //[self alertForService];
    _serviceCompleteButton.enabled=NO;
    _serviceCompleteButton.alpha = 0.2;
    _remainingMileageLabel.textColor = [UIColor blackColor];
    [self daysCalc];
    [self checkDaysSinceService];
    [self setupUpdateVC];
    
    
}

- (void)alertForService {
  //  NSLog(@"Alert!");
    
    
    _remainingMileageLabel.textColor = [UIColor redColor];
    
    
    
    
    
    
    //        UIAlertController * alert=   [UIAlertController
    //                                      alertControllerWithTitle:@"Notification:"
    //                                      message:@"Time for service!"
    //                                      preferredStyle:UIAlertControllerStyleAlert];
    //
    //        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK"
    //                                                     style:UIAlertActionStyleDefault
    //                                                   handler:^(UIAlertAction * action) {
    //                                                       //Do Some Action
    //                                                       [alert dismissViewControllerAnimated:YES completion:nil];
    //                                                   }];
    //
    //        [alert addAction:ok];
    //
    //        [self presentViewController:alert animated:YES completion:nil];
    
    
    /*second alert code*/
//    NSString *message=@"Time for service";
//    NSString *alertTitle=@"Notification Alert!";
//    NSString *OKText=@"OK";
//    
//    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:alertTitle message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:OKText style:UIAlertActionStyleCancel handler:nil];
//    [alertView addAction:alertAction];
//    [self presentViewController:alertView animated:YES completion:nil];
    
    
}

-(void)updateDataLastServiceMileage:(int)miles{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    _updatedVehicle.lastServiceMileage = miles;
    [realm commitWriteTransaction];
    //[_mTableView reloadData];
}

-(void)updateDataMileage:(int)miles{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    _updatedVehicle.mileage = miles;
    [realm commitWriteTransaction];
    //[_mTableView reloadData];
}

-(void)updateDataDate:(NSDate *)date{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    _updatedVehicle.lastServiceDate = date;
    [realm commitWriteTransaction];
    //[_mTableView reloadData];
}

// Calculate days between two dates
//NSString *start = @"2010-09-01";
//NSString *end = @"2010-12-01";


//NSDateFormatter *f = [[NSDateFormatter alloc] init];
//[f setDateFormat:@"yyyy-MM-dd"];
//NSDate *startDate = [f dateFromString:start];
//NSDate *endDate = [f dateFromString:end];
//
//NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
//                                                    fromDate:startDate
//                                                      toDate:endDate
//                                                     options:NSCalendarWrapComponents];

 
 
 -(NSInteger)daysCalc{
     NSDate *start = _updatedVehicle.lastServiceDate;
     NSDate *now =  [NSDate date];
 
     [self updateDataDate:now];
 
 NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
 NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
 fromDate:start
 toDate:now
 options:NSCalendarWrapComponents];
 NSLog(@"%ld", (long)[components day]);
     return [components day];
 
 }

-(void)checkDaysSinceService{
   NSInteger *days= [self daysCalc];
    if(days >180){
        NSLog(@"Alert");
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
