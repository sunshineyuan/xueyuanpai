//
//  ComponeyInforViewController.h
//  xueyuanpai
//
//  Created by 王园园 on 16/5/29.
//  Copyright © 2016年 lidachao. All rights reserved.
//

#import "BaseViewController.h"

#import "SchoolRecruitmentModel.h"

@interface ComponeyInforViewController : BaseViewController

///请求数据的model类
@property (nonatomic,strong)SchoolRecruitmentDetailModel * model;
@property (nonatomic,strong)UIViewController * superVC;



@end
