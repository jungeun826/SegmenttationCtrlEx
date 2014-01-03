//
//  ViewController.m
//  SegmenttationCtrlEx
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UISegmentedControl *segment;
    NSArray *items;
}
- (IBAction)chooseImage:(UISegmentedControl *)sender ;
@end

@implementation ViewController


- (IBAction)chooseNumber:(UISegmentedControl *)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    NSString *selectedStr = [control titleForSegmentAtIndex:control.selectedSegmentIndex];
    NSLog(@"\nIB create Segment -Index:%d -title:%@", (int)control.selectedSegmentIndex, selectedStr);
}
- (IBAction)chooseImage:(UISegmentedControl *)sender {
    segment = [[UISegmentedControl alloc] initWithItems:items];
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"\nbaseball!");
            [segment setImage:[[UIImage imageNamed:@"야구공2.png" ]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] forSegmentAtIndex:0];
            break;
        case 1:
            NSLog(@"\nrabbit!");
            [segment setImage:[UIImage imageNamed:@"토끼2.jpg"] forSegmentAtIndex:1];
            break;
        case 2:
            NSLog(@"\nfootball");
            [segment setImage:[UIImage imageNamed:@"축구공2.png"] forSegmentAtIndex:2];
            break;
        case 3:
            NSLog(@"\nwilson");
            [segment setImage:[UIImage imageNamed:@"윌신2.jpg"] forSegmentAtIndex:3];
        default:
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *baseBall = [[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"야구공" ofType:@".png"]] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    UIImage *rabbit = [[UIImage imageNamed:@"토끼.jpg"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal ];
    UIImage *footBall = [[UIImage imageNamed:@"축구공.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    UIImage *wilson = [[UIImage imageNamed:@"윌슨.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    items = [NSArray arrayWithObjects: baseBall, rabbit, footBall, wilson, nil];
    segment = [[UISegmentedControl alloc] initWithItems:items];
    segment.frame = CGRectMake(10, 100, 300, 40);
    [self.view insertSubview:segment atIndex:0];
    
    /*int i = 0;
    for (UIView *seg in [segment subviews]) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:items[i]];
        imgView.frame = CGRectMake(0 , 0, 75, 40);

        
        [seg addSubview:imgView];
        i++;
    }*/
    
    segment.tintColor = [UIColor clearColor];
    //segment.selectedSegmentIndex = 2;
    [segment addTarget:self action:@selector(chooseImage:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}@end
