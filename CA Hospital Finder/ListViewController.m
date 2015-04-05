//
//  ListViewController.m
//  CA Hospitals
//
//  Created by Jack Hsu on 2/7/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewCell.h"
#import "HospitalInfo.h"
#import "MapViewController.h"

@interface ListViewController () {
    NSString *_searchTextInList;;
}

@end

@implementation ListViewController
@synthesize listTableView, backButton, searchText, hospitals, listTitle;

-(void)viewDidLoad {
    [super viewDidLoad];
    self.listTableView.dataSource = self;
    self.listTableView.delegate = self;
    _searchTextInList = self.searchText;
    
    #define UIColorFromRGB(rgbValue) [UIColor \
        colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
        blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
    
    self.listTableView.backgroundColor = UIColorFromRGB(0xFFFFFF);
    self.listNavigationBar.barTintColor = UIColorFromRGB(0x128FB8);
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.listTitle.text = [NSString stringWithFormat:@"Hospitals in %@", [_searchTextInList capitalizedString]];
    self.listTitle.textColor = UIColorFromRGB(0xFFFFFF);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.hospitals count];
}

// Please note that we replace "UITableViewCell" with "ListTableViewCell" here so we can use our custom cell labels and image.
-(ListTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    /*
    for (HospitalInfo *info in self.hospitals) {
        NSLog(@"in ListTableViewCell(): %@, %@, %@, %@, %@", info.name, info.address, info.phone, info.photo, info.latitude, info.longitude);
    }
     */
    
    // set up the cell
    HospitalInfo *info = [self.hospitals objectAtIndex:indexPath.row];
    
    #define UIColorFromRGB(rgbValue) [UIColor \
        colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
        blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
    
    cell.nameCell.lineBreakMode = NSLineBreakByWordWrapping;
    cell.nameCell.numberOfLines = 0;
    cell.nameCell.text = [NSString stringWithFormat:@"%@", info.name];
    
    cell.addressCell.lineBreakMode = NSLineBreakByWordWrapping;
    cell.addressCell.numberOfLines = 0;
    cell.addressCell.text = [NSString stringWithFormat:@"%@", info.address];
    
    cell.phoneCell.lineBreakMode = NSLineBreakByWordWrapping;
    cell.phoneCell.numberOfLines = 0;
    cell.phoneCell.text = [NSString stringWithFormat:@"%@", info.phone];
    cell.phoneCell.textColor = UIColorFromRGB(0xFF0000);

    cell.photoCell.image = [UIImage imageNamed:info.photo];
    
    cell.backgroundColor = UIColorFromRGB(0xFFFFFF);
    
    return cell;
}

- (IBAction)unwindToList:(UIStoryboardSegue *)unwindSegue {
    UIViewController *sourceViewController = unwindSegue.sourceViewController;
    /*
    if ([sourceViewController isKindOfClass:[MapViewController class]]) {
        NSLog(@"Segue from Map view Back button, and page should be positioned to where the selected cell was.");
    }
     */
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showMapSegue"]) {
        NSIndexPath *indexPath = [listTableView indexPathForSelectedRow];
        
        MapViewController *mapController = [segue destinationViewController];
        mapController.hospitalInfo = self.hospitals[indexPath.row];
        mapController.searchText = _searchTextInList;
    }
}

@end
