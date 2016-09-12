//
//  UIButton+Extension.m
//  PackageView
//
//  Created by 白鹤 on 16/9/12.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>
@implementation UIButton (Extension)



@dynamic hitEdgeInsets;

static const NSString *KEY_HIT_EDGE_INSETS = @"HitEdgeInsets";


-(void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets {
    
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)hitEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

@end
