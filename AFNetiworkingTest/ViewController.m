//
//  ViewController.m
//  AFNetiworkingTest
//
//  Created by 한상민(iPhone) on 2014. 2. 6..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>

#define URL @"http://petmily_2.0164740237.cloulu.com/fampage"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager
                                              ];

    NSDictionary *parameters = @{@"fam_id":@"aaa"};

    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        [NSLog(@"json: %@",[operation responseString]);
         id innerJSON = [responseObject objectForKey:@"5"];


    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];


    [self.uiimagView setImageWithURL:[NSURL URLWithString:URL]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
