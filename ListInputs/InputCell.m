//
//  InputCell.m
//  ListInputs
//
//  Created by Vinay Raj Dunty on 19/02/15.
//  Copyright (c) 2015 Myntra. All rights reserved.
//

#import "InputCell.h"

@implementation InputCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if( textField == self.txtProductName )
    {
        self.product.productName = textField.text;
    }
    else if (textField == self.txtUSerInput)
    {
        self.product.userInput = textField.text;
    }
    
    [self.delegate updateRackDataWith:self.product];
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.customviewdelegate scrollToTopWithProduct:self.product];
}


@end
