//
//  ListViewController.h
//  CA Hospitals
//
//  Created by Jack Hsu on 2/7/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *listNavigationBar;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) NSString *searchText;
@property (strong, nonatomic) NSMutableArray *hospitals;
@property (weak, nonatomic) IBOutlet UILabel *listTitle;

@end
