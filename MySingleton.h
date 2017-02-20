//
//  MySingleton.h
//  Demo20170216
//
//  Created by Jacky Chan on 16/02/2017.
//  Copyright © 2017 MadX Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageObject.h"

@interface MySingleton : NSObject

//Properties

@property(nonatomic,strong) MessageObject  *msgObj;
@property(nonatomic,strong) NSDataDetector *detector;

// Required: A method to retrieve the shared instance
+(MySingleton *) sharedInstance;

// Shared Public Methods:
//   - Using static methods for opertations is a nice convenience
//   - Each method should ensure it is using the above sharedInstance
//+(NSString *)getMyData;
//+(void) setMyData:(NSString *)someData;
+(NSString *)getResponse;
+(void)setMessage:(MessageObject *)object;

-(NSDataDetector *)openDataDetector;
-(void)closeDataDetector;

@end
