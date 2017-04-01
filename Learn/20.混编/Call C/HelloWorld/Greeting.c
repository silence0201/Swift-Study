//
//  File.swift
//  HelloWorld
//
//  Created by 杨晴贺 on 2017/4/1.
//  Copyright © 2017年 tonyguan. All rights reserved.
//

#include "Greeting.h"

const char* sayHello(const char* greeting, const char* name) {
    
    //多个4个字节，为Hi, 字符串准备
    char *result = malloc(strlen(greeting) + strlen(name) + 4);
    strcpy(result, "Hi,");
    strcat(result, name);
    strcat(result, " ");
    strcat(result, greeting);
    
    return result;
}
