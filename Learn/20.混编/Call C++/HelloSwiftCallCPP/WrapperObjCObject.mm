//
//  HelloWorld
//
//  Created by 杨晴贺 on 2017/4/1.
//  Copyright © 2017年 tonyguan. All rights reserved.
//

#import "WrapperObjCObject.h"
#import "CppObject.h"

@interface WrapperObjCObject () {
    CppObject cppObject;
}

@end

@implementation WrapperObjCObject

-(int)add:(int)a :(int)b {
    return cppObject.add(a, b);
}

-(int)sub:(int)a :(int)b {
    return cppObject.sub(a, b);
}

+(int)static_add:(int)a :(int)b {
    return CppObject::static_add(a, b);
}

+(int)static_sub:(int)a :(int)b {
    return CppObject::static_sub(a, b);
}

@end
