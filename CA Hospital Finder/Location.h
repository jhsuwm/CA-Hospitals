//
//  Location.h
//  CA Hospitals
//
//  Created by Jack Hsu on 2/14/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *photo;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

@end
