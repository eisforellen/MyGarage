//
//  Vehicle.m
//  MyGarage
//
//  Created by Ellen Mey on 6/8/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

-(id)initVehicleWithNickname:(NSString *)nickname make:(NSString *)make model:(NSString *)model mileage:(int)miles{
    self = [super init];
    if (self) {
        NSLog(@"init: %@", self);
        _nickname = nickname;
        _make = make;
        _model = model;
        _mileage = miles;
    }
    return self;
}

@end
