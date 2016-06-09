//
//  Vehicle.h
//  MyGarage
//
//  Created by Ellen Mey on 6/8/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject

@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *make;
@property (strong, nonatomic) NSString *model;
@property int mileage;
@property int lastServiceMileage;

-(id)initVehicleWithNickname:(NSString *)nickname make:(NSString *)make model:(NSString *)model mileage:(int)miles;


@end
