//
//  Product.h
//  ListInputs
//
//  Created by Vinay Raj Dunty on 19/02/15.
//  Copyright (c) 2015 Myntra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property NSString *productName;
@property NSString *userInput;

-(id)initWithName:(NSString*)name andInput:(NSString*)input;
-(void)updateInput : (NSString*)input;


@end
