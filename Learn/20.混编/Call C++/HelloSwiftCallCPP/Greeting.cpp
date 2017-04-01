//
//  HelloWorld
//
//  Created by 杨晴贺 on 2017/4/1.
//  Copyright © 2017年 tonyguan. All rights reserved.
//

#include "Greeting.h"
#include <iostream>
using namespace std;

const char* sayHello(const char* greeting, const char* name) {
    
    string strGreeting(greeting);
    string strName(name);
    string str = "Hi," + strName + " " + strGreeting;
    
    char* result = strcpy((char*)malloc(str.length()+1), str.c_str());
    
    return result;
    
}
