//
//  Case1HeadView.h
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Case1Model.h"

@interface Case1HeadView : UITableViewHeaderFooterView

@property (nonatomic, strong)Case1Model *dataModel;

@property (nonatomic, copy)void(^callBack)();

@end
