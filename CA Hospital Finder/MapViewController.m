//
//  MapViewController.m
//  CA Hospitals
//
//  Created by Jack Hsu on 2/14/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import "MapViewController.h"
#import "Location.h"
#import "HospitalInfo.h"
#import "HospitalDatabase.h"
#import "ListViewController.h"

@interface MapViewController () {
    NSString *_searchTextInMap;
}

@end

@implementation MapViewController
@synthesize hospitalInfo, backButton, searchButton, hospitals, mapTitle;

- (void)viewDidAppear:(BOOL)animated
{
    _searchTextInMap = self.searchText;
    
    #define UIColorFromRGB(rgbValue) [UIColor \
        colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
        blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
    
    self.mapNavigationBar.barTintColor = UIColorFromRGB(0x128FB8);
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.mapTitle.text = [NSString stringWithFormat:@"Map of %@", hospitalInfo.name];
    self.mapTitle.numberOfLines = 0;
    self.mapTitle.textColor = UIColorFromRGB(0xFFFFFF);
    
    Location *poiLocation = [[Location alloc] init];
    poiLocation.address = hospitalInfo.address;
    poiLocation.photo = hospitalInfo.photo;
    poiLocation.latitude = [hospitalInfo.latitude floatValue];
    poiLocation.longitude = [hospitalInfo.longitude floatValue];
    
    //NSLog(@"address: %@, latitude: %f, longitude: %f", poiLocation.address, poiLocation.latitude, poiLocation.longitude);
    
    CLLocationCoordinate2D poiCoodinates;
    poiCoodinates.latitude = poiLocation.latitude;
    poiCoodinates.longitude= poiLocation.longitude;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(poiCoodinates, 750, 750);
    
    [self.mapView setRegion:viewRegion animated:YES];
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBackSegue"]) {
        /*
        HospitalDatabase *db = [[HospitalDatabase alloc] init];
        self.hospitals = [db hospitalInfos:[NSString stringWithFormat:@"%@", _searchTextInMap]];
 
        ListViewController *listController = [segue destinationViewController];
        listController.hospitals = self.hospitals;
        listController.searchText = _searchTextInMap;
         */
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        ListViewController *listController = [segue destinationViewController];
        [listController.listTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        // Selection handler (for horizontal iPad)
        //[listController.listTableView:self.tableView didSelectRowAtIndexPath:indexPath];
        
        // Segue (for iPhone and vertical iPad)
        //[self performSegueWithIdentifier:@"showBackSegue" sender:self];
    }
}

@end
