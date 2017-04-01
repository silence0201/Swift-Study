//
//  HelloWorld
//
//  Created by 杨晴贺 on 2017/4/1.
//  Copyright © 2017年 tonyguan. All rights reserved.
//

#ifndef CppObject_hpp
#define CppObject_hpp

#include <stdio.h>

class CppObject
{
public:
    int add(int a, int b);
    int sub(int a, int b);
    static int static_add(int a, int b);
    static int static_sub(int a, int b);

};

#endif /* CppObject_hpp */
