//
//  ViewController.m
//  RuntimeTest1
//
//  Created by joe on 16/5/9.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(doSomething)];
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(doSomething)) {
        NSLog(@"add method here");
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void dynamicMethodIMP(id self, SEL _cmd)
{
    NSLog(@"doSomething SEL");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
