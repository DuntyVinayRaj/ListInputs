//
//  Product.m
//  ListInputs
//
//  Created by Vinay Raj Dunty on 19/02/15.
//  Copyright (c) 2015 Myntra. All rights reserved.
//

#import "Product.h"

@implementation Product

-(NSString*)description
{
    return [NSString stringWithFormat:@"Product Name -> %@, Product Description -> %@", self.productName, self.userInput];
}


-(id)initWithName:(NSString*)name andInput:(NSString*)input
{
    if ([super init]) {
        self.productName = name;
        self.userInput = input;
    }
    return self;
}

-(void)updateInput : (NSString*)input
{
    if( input != nil && input.length > 0 )
    {
        self.userInput = input;
    }
}

@end
