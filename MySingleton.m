//
//  MySingleton.m
//  Demo20170216
//
//  Created by Jacky Chan on 16/02/2017.
//  Copyright © 2017 MadX Studio. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

@synthesize msgObj;
@synthesize detector;

#pragma mark Singleton Implementation
static MySingleton *sharedObject;

+ (MySingleton*)sharedInstance {
    static dispatch_once_t once;
    
    if (sharedObject == nil) {
        dispatch_once(&once, ^{
         sharedObject = [[super allocWithZone:NULL] init];
            
        });
    }
    return sharedObject;
}

+ (void)setMessage:(MessageObject *)object {
  
    MySingleton *shared = [MySingleton sharedInstance];
    if (object) {
        shared.msgObj = object;
    }
}

+(NSString *)getResponse {
    MySingleton *obj = [MySingleton sharedInstance];
    
    NSString *result = @"\nReturn (String): \n";
    
    if (!obj.msgObj.url) {
        NSString *resp = [NSString stringWithFormat:@"{\"message\": [\"%@\"] }",obj.msgObj.message];

        result = [result stringByAppendingString:resp];
    } else {
        
        NSString *resp = [NSString stringWithFormat:@"{\"message\": [\"%@\"], \"Links\":[{\"url\": \"%@\"}] }", obj.msgObj.message,obj.msgObj.url];
        
        result = [result stringByAppendingString:resp];
    }
    
    return result;
}

-(NSDataDetector *)openDataDetector {
    
    NSError *error = nil;
    
    self.detector =
    [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink|
     NSTextCheckingTypePhoneNumber error:&error];
    if (error)  return nil;
    else return self.detector;
}

-(void)closeDataDetector {
    self.detector = nil;
}


@end
