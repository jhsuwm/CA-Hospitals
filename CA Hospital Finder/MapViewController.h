//
//  MapViewController.h
//  CA Hospitals
//
//  Created by Jack Hsu on 2/14/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "HospitalInfo.h"

@interface MapViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UINavigationBar *mapNavigationBar;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property float *latitude;
@property float *longitude;
@property (strong, nonatomic) HospitalInfo *hospitalInfo;
@property (strong, nonatomic) NSMutableArray *hospitals;
@property (weak, nonatomic) NSString *searchText;
@property (weak, nonatomic) IBOutlet UILabel *mapTitle;

@end
