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

#define URL @"http://pettest.0164740237.cloulu.com/myhome"
@interface ViewController ()


@property (readwrite,nonatomic,copy)    NSMutableDictionary *data;
@property (readwrite,nonatomic,copy) NSArray *array;
@property (readwrite,nonatomic,copy)    NSString *string;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager
                                              ];

    NSDictionary *parameters = @{@"fam_id":@"ggg"};
    self.data = [[NSMutableDictionary alloc]init];

    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        data=[operation responseString];
    //    NSLog(@"%@",responseObject);
        self.data = [responseObject objectForKey:@"fampage"][0];


    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];

//    item=[[NSArray alloc]init];

/*    NSString *labelstring= [NSString stringWithFormat:@"%@",[dic objectForKey:@"user_name"]];
    NSLog(@"%@",[dic objectForKey:@"user_name"]);*/
  //  self.label.text = labelstring;

    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)ok:(id)sender
{
    NSLog(@"data:%@",self.data);
             NSLog(@"post_no :%@", [self.data objectForKey:@"post_no"]);


    NSURL *url = [NSURL URLWithString:[self.data objectForKey:@"post_img"]];


    NSString *string = [NSString stringWithFormat:@"%@",[self.data objectForKey:@"fam_name"]];
    NSLog(@"%@",string);

    [self.imageView setImageWithURL:url];

    self.label.text = string;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
