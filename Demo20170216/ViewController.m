//
//  ViewController.m
//  Demo20170216
//
//  Created by Jacky Chan on 16/02/2017.
//  Copyright © 2017 MadX Studio. All rights reserved.
//

#import "ViewController.h"
#import "MySingleton.h"
#import "MessageObject.h"
#import "Checker.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@" %s",__FUNCTION__);
    
    NSString *test1 = @"Hi Lee, can  you call me at +60175570098";
    NSString *test2 = @"You can find the listing at https://www.carlist.my/used-cars/3300445/2011-toyota-vios-1-5-trd-sportivo-33-000km-full-toyota-serviced-record-like-new-11/";
    NSString *test3 = @"I have another car at  http://www.example.com/listing10.htm";
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
   
    MessageObject *mo = [Checker checkData:test1];
    [MySingleton setMessage:mo];
    
    NSLog(@" %@",[MySingleton getResponse]);
    mo = nil;
    [MySingleton setMessage:nil];
    
    MessageObject *mo2 = [Checker checkData:test2];
    [MySingleton setMessage:mo2];
   
    NSLog(@" %@",[MySingleton getResponse]);
    mo2 = nil;
    [MySingleton setMessage:nil];

    MessageObject *mo3 = [Checker checkData:test3];
    [MySingleton setMessage:mo3];
    
    NSLog(@" %@",[MySingleton getResponse]);
    mo3 = nil;
    [MySingleton setMessage:nil];
    
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
