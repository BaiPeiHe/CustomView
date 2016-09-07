//
//  Case1HeadView.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case1HeadView.h"
#import "Masonry.h"

@interface Case1HeadView ()
// 标题视图
@property (nonatomic, strong)UILabel *titleLabel;

// 箭头
@property (nonatomic, strong)UIImageView *arrowImageView;

@end

@implementation Case1HeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if(self){
        [self createView];
    }
    return self;
}

- (void)createView{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicViewAction)];
    [self.contentView addGestureRecognizer:tap];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).with.offset(40);
        make.right.equalTo(self.contentView.mas_right).with.offset(20);
        
        make.centerY.equalTo(self.contentView.mas_centerY);
        
        make.height.equalTo(@25);
    }];
    
    self.arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    [self.contentView addSubview:self.arrowImageView];
    self.arrowImageView.userInteractionEnabled = YES;
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).with.offset(12);
        
        make.centerY.equalTo(self.contentView.mas_centerY);
        
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    
    
    // 分割线
    UIView *split = [UIView new];
    split.backgroundColor = [UIColor colorWithRed:242 / 255.0 green:243 / 255.0 blue:244 / 255.0 alpha:1];
    [self addSubview:split];
    
    [split mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.and.right.equalTo(self).with.offset(0);
        
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        
        make.height.equalTo(@1);
        
    }];
    
    
}

- (void)setDataModel:(Case1Model *)dataModel{
    
    _dataModel = dataModel;
    
    
    [self.titleLabel setText:dataModel.title];
    
    if(!_dataModel.spread){
        self.arrowImageView.transform = CGAffineTransformIdentity;
    }
    else{
        self.arrowImageView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    }
    
}

- (void)clicViewAction{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        if(_dataModel.spread){
            self.arrowImageView.transform = CGAffineTransformIdentity;
        }
        else{
            self.arrowImageView.transform = CGAffineTransformMakeRotation(M_PI / 2);
        }
        _dataModel.spread = !_dataModel.spread;
    }];
    
    self.callBack();
}



@end
