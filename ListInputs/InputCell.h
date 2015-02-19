//
//  InputCell.h
//  ListInputs
//
//  Created by Vinay Raj Dunty on 19/02/15.
//  Copyright (c) 2015 Myntra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@protocol UpdateRacks <NSObject>
-(void)updateRackDataWith:(Product*)product;
@end

@protocol ScrollProtocol <NSObject>
-(void)scrollToTopWithProduct:(Product*)product;
@end


@interface InputCell : UITableViewCell<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtProductName;
@property (weak, nonatomic) IBOutlet UITextField *txtUSerInput;
@property Product *product;
@property id<UpdateRacks>delegate;
@property id<ScrollProtocol>customviewdelegate;

@end
