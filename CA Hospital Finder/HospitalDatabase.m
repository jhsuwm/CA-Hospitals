//
//  HospitalDatabase.m
//  CA Hospital Finder
//
//  Created by Jack Hsu on 2/6/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import "HospitalDatabase.h"
#import "HospitalInfo.h"

@interface HospitalDatabase () {
    NSString *_query;
}

@end

@implementation HospitalDatabase

static HospitalDatabase *_database;

+ (HospitalDatabase *)database {
    if (_database == nil) {
        _database = [[HospitalDatabase alloc] init];
    }
    return _database;
}

- (id)init {
    if (self = [super init]) {
        NSString *sqliteDB = [[NSBundle mainBundle] pathForResource:@"CA-H-Finder" ofType:@"db"];
        
        if (sqlite3_open([sqliteDB UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database");
        }
    }
    return self;
}

- (void)dealloc {
    sqlite3_close(_database);
}

- (NSMutableArray *)hospitalInfos:(NSString *)cityOrZip {
    //NSLog(@"received search argument: %@", cityOrZip);
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    if ([cityOrZip isEqualToString:@"California"]) {
        _query = [NSString stringWithFormat:@"SELECT h.hospital_name, h.address, h.phone, h.photo_file, h.latitude, h.longitude FROM hospital h, zip z, city c WHERE h.zip_id=z.zip_id AND z.city_id=c.city_id ORDER BY 1"];
    } else if ([cityOrZip isEqualToString:@"palo alto"]) {
        _query = [NSString stringWithFormat:@"SELECT h.hospital_name, h.address, h.phone, h.photo_file, h.latitude, h.longitude FROM hospital h, zip z, city c WHERE h.zip_id=z.zip_id AND z.city_id=c.city_id AND (LOWER(c.city_name) IN ('palo alto','stanford')) ORDER BY 1"];
    } else {
        _query = [NSString stringWithFormat:@"SELECT h.hospital_name, h.address, h.phone, h.photo_file, h.latitude, h.longitude FROM hospital h, zip z, city c WHERE h.zip_id=z.zip_id AND z.city_id=c.city_id AND (LOWER(c.city_name)='%@' OR z.zip_code='%@') ORDER BY 1", cityOrZip, cityOrZip];
    }
    //NSLog(@"query: %@", _query);
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [_query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        //NSLog(@"sql prepare ok");
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //NSLog(@"sql step ok");
            
            NSString *hospitalName = [[NSString alloc] initWithUTF8String:sqlite3_column_text(statement, 0)];
            NSString *hospitalAddress = [[NSString alloc] initWithUTF8String:sqlite3_column_text(statement, 1)];
            NSString *hospitalPhone = [[NSString alloc] initWithUTF8String:sqlite3_column_text(statement, 2)];
            NSString *hospitalPhoto = [[NSString alloc] initWithUTF8String:sqlite3_column_text(statement, 3)];
            NSNumber *mapLatitude = [NSNumber numberWithFloat:(float)sqlite3_column_double(statement, 4)];
            NSNumber *mapLongitude = [NSNumber numberWithFloat:(float)sqlite3_column_double(statement, 5)];
            //NSLog(@"in HospitalDatabase.m: : name: %@, address: %@, phone: %@, photo: %@, latitude: %@, longitude: %@", hospitalName, hospitalAddress, hospitalPhone, hospitalPhoto, mapLatitude, mapLongitude);

            HospitalInfo *info = [[HospitalInfo alloc] initWithName:hospitalName address:hospitalAddress phone:hospitalPhone photo:hospitalPhoto latitude:mapLatitude longitude:mapLongitude];
            //NSLog(@"info assigned ok");
            
            [retval addObject:info];
            
        }
        //NSLog(@"sql returned ok");
        sqlite3_finalize(statement);
    } else {
        NSLog(@"SQL error: %s", sqlite3_errmsg(_database));
    }
    return retval;
}

@end
