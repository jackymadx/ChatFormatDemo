//
//  Checker.m
//  Demo20170216
//
//  Created by Jacky Chan on 19/02/2017.
//  Copyright © 2017 MadX Studio. All rights reserved.
//

#import "Checker.h"
#import "MySingleton.h"
#import "MessageObject.h"

NSString *const keyConstant = @"carlist.my";

@implementation Checker

+(MessageObject *)checkData:(NSString *)input {
    NSDataDetector *detector = [[MySingleton sharedInstance] openDataDetector];
    
    NSArray *matches = [detector matchesInString:input options:0 range:NSMakeRange(0, [input length])];
    
    MessageObject *msg = [[MessageObject alloc] init];
    if (matches) {
        
       for (NSTextCheckingResult *match in matches) {
            NSString *mString = [match description];
           
            if ([match resultType] == NSTextCheckingTypeLink) {
                 NSURL *url = [match URL]; //Get URL
                
               if ([mString rangeOfString:keyConstant
                 options:NSRegularExpressionSearch].location != NSNotFound) {
                    
                    input = [input substringToIndex:match.range.location-1];
                    [msg setMessage:input];
                    [msg setUrl:[url absoluteString]];
                   input = nil;
                } else {
                    
                    input = [input stringByReplacingCharactersInRange:
                    NSMakeRange(match.range.location,match.range.length)
                    withString:@"*****"];
                    
                    [msg setMessage:input];
                    input = nil;
                }
                
            } else if ([match resultType] == NSTextCheckingTypePhoneNumber) {
                
                //NSString *phoneNumber = [match phoneNumber]; Get Phone Number
                input = [input stringByReplacingCharactersInRange:
                NSMakeRange(match.range.location,match.range.length)
                withString:@"************"];

                [msg setMessage:input];
                 input = nil;
            }
            
           // NSLog(@"found URL: %@", matchingString);
          //  NSLog(@"length %ld",match.range.length);
          //  NSLog(@"location %ld",match.range.location);
        }
    }
    
    [[MySingleton sharedInstance] closeDataDetector];
    
    return msg;
}

@end
