//
//  ItemCollectionViewCell.m
//  PackageView
//
//  Created by 白鹤 on 16/9/8.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "ItemCollectionViewCell.h"

@interface ItemCollectionViewCell ()


@property (nonatomic, strong)UILabel *titleLabel;


@end

@implementation ItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createView];
    }
    return self;
}

- (void)createView{
    
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:self.contentView.frame];
    self.titleLabel.backgroundColor = [UIColor clearColor];
//    self.titleLabel.font = [UIFont systemFontOfSize:20];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
}

- (void)setTitle:(NSString *)title{
    
    [self.titleLabel setText:title];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.frame = self.contentView.bounds;
}

- (void)setCellStatue:(BOOL)isClick{
    
    if(isClick){
        
        self.titleLabel.textColor = [UIColor blueColor];
        
    }
    else{
        
        self.titleLabel.textColor = [UIColor blackColor];
        
    }
    
    
}



@end
