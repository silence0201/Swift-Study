//
//  HelloWorld
//
//  Created by 杨晴贺 on 2017/4/1.
//  Copyright © 2017年 tonyguan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WrapperObjCObject : NSObject

-(int)add:(int)a :(int)b;
-(int)sub:(int)a :(int)b;
+(int)static_add:(int)a :(int)b;
+(int)static_sub:(int)a :(int)b;


@end
