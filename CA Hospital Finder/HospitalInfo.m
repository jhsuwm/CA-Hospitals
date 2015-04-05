//
//  HospitalInfo.m
//  CA Hospital Finder
//
//  Created by Jack Hsu on 2/6/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import "HospitalInfo.h"

@implementation HospitalInfo

@synthesize name = _name;
@synthesize address = _address;
@synthesize phone = _phone;
@synthesize photo = _photo;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;

- (id)initWithName:(NSString *)name address:(NSString *)address phone:(NSString *)phone photo:(NSString *)photo latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude {
    if (self = [super init]) {
        self.name = name;
        self.address = address;
        self.phone = phone;
        self.photo = photo;
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}

@end
