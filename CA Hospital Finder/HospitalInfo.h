//
//  HospitalInfo.h
//  CA Hospital Finder
//
//  Created by Jack Hsu on 2/6/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HospitalInfo : NSObject {
    NSString *_name;
    NSString *_address;
    NSString *_phone;
    NSString *_photo;
    NSNumber *_latitude;
    NSNumber *_longitude;
}

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *photo;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;

- (id)initWithName:(NSString *)name address:(NSString *)address phone:(NSString *)phone photo:(NSString *)photo latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude;
//- (id)initWithName:(NSString *)name address:(NSString *)address phone:(NSString *)phone latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude;

@end
