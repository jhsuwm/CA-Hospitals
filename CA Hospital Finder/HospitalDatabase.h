//
//  HospitalDatabase.h
//  CA Hospital Finder
//
//  Created by Jack Hsu on 2/6/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface HospitalDatabase : NSObject {
    sqlite3 *_database;
}

+ (HospitalDatabase *)database;
- (NSMutableArray *)hospitalInfos:(NSString *)cityOrZip;

@end
