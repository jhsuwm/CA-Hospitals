//
//  ListTableViewCell.h
//  CA Hospitals
//
//  Created by Jack Hsu on 2/7/15.
//  Copyright (c) 2015 Jack Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameCell;
@property (weak, nonatomic) IBOutlet UILabel *addressCell;
@property (weak, nonatomic) IBOutlet UILabel *phoneCell;
@property (weak, nonatomic) IBOutlet UIImageView *photoCell;

@end
