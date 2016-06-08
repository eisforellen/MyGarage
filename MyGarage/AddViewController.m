//
//  AddViewController.m
//  MyGarage
//
//  Created by Ellen Mey on 6/8/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButtonClicked:(id)sender {
    _vehicle = [[Vehicle alloc]init];
    _vehicle.nickname = _nicknameInput.text;
    _vehicle.make = _makeInput.text;
    _vehicle.model = _modelInput.text;
    _vehicle.mileage = [_mileageInput.text intValue];
    
    
    NSLog(@"Nickname= %@", _vehicle.nickname);
   
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
