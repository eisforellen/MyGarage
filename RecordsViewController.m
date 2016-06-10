//
//  RecordsViewController.m
//  MyGarage
//
//  Created by Ellen Mey on 6/10/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "RecordsViewController.h"

@interface RecordsViewController ()

@end

@implementation RecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _recordsHeaderLabel.text = [NSString stringWithFormat:@"%@ Records", _vehicle.nickname];
    _pastServicesLabel.text = [NSString stringWithFormat:@"%@", _vehicle.lastServiceDate];
     _milesAtLastServiceLabel.text = [NSString stringWithFormat:@"%d miles", _vehicle.lastServiceMileage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
