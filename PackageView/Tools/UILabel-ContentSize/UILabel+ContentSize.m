//
//  UILabel+ContentSize.m
//  Example
//
//  Created by 白鹤 on 16/9/2.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "UILabel+ContentSize.h"

@implementation UILabel (ContentSize)

/**
 *  计算当前 Label 的尺寸
 */
- (CGSize)contentSize{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;
    
    NSDictionary *attributes = @{NSFontAttributeName : self.font,
                                 NSParagraphStyleAttributeName : paragraphStyle};
    CGSize contentSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;
    
    return contentSize;
}


@end
