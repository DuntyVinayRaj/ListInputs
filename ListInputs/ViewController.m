//
//  ViewController.m
//  ListInputs
//
//  Created by Vinay Raj Dunty on 19/02/15.
//  Copyright (c) 2015 Myntra. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "InputCell.h"

#define PRODUCT_RACK_SIZE 15
#define KEYBOARD_SIZE 250

@interface ViewController ()<UpdateRacks, ScrollProtocol>

@property (weak, nonatomic) IBOutlet UITableView *tblList;
@property NSMutableArray *productRack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.productRack = [[NSMutableArray alloc]init];
    
    for( int i=0; i < PRODUCT_RACK_SIZE; i++ )
    {
        Product *product = [[Product alloc]initWithName:[NSString stringWithFormat:@"Product-%d", i] andInput:@""];
        [self.productRack addObject:product];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.productRack.count;
}

-(InputCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Product *product = self.productRack[indexPath.row];
    
    cell.delegate = self;
    cell.customviewdelegate = self;
    cell.product = product;
    cell.txtProductName.text = product.productName;
    cell.txtUSerInput.text = product.userInput;
    
//    if( indexPath.row == self.productRack.count-1 )
//    {
//        [self fetchMore];
//    }
    
    return cell;
}

-(void)fetchMore{
    
    for( int i=(int)self.productRack.count; i<(self.productRack.count+PRODUCT_RACK_SIZE); i++ )
    {
        Product *product = [[Product alloc]initWithName:[NSString stringWithFormat:@"Product-%d", i] andInput:@""];
        [self.productRack addObject:product];
    }
    [self.tblList reloadData];
}


-(void)updateRackDataWith:(Product *)product
{
    [self.tblList setContentOffset:CGPointZero];
    
    if( [self.productRack containsObject:product] )
    {
        int indexToBeUpdated = -1;
        for( int i=0 ; i<PRODUCT_RACK_SIZE; i++ )
        {
            if( [self.productRack[i] isEqual:product] )
            {
                indexToBeUpdated = i;
                break;
            }
        }
        
        if( indexToBeUpdated != -1 )
        {
            [self.productRack replaceObjectAtIndex:indexToBeUpdated withObject:product];
            [self.tblList reloadData];
        }
    }
}

-(void)scrollToTopWithProduct : (Product*)product
{
    int index = (int)[self.productRack indexOfObject:product];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    InputCell * cell = (InputCell *)[self.tblList cellForRowAtIndexPath:indexPath];
    [self.tblList setContentOffset:CGPointMake(0,cell.center.y-KEYBOARD_SIZE) animated:YES];
}


@end
