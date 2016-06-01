//
//  JobMarketCollectionViewCell.m
//  xueyuanpai
//
//  Created by 王园园 on 16/5/30.
//  Copyright © 2016年 lidachao. All rights reserved.
//

#import "JobMarketCollectionViewCell.h"

@interface JobMarketCollectionViewCell ()

///显示商品图片的数据
@property (nonatomic,strong)UIImageView *goodsImageView;

///显示商品名称的label
@property (nonatomic,strong)UILabel *nameLabel;

///显示当前价格的label
@property (nonatomic,strong)UILabel *currentPriceLabel;


///显示已经弃用价格的label
@property (nonatomic,strong)UILabel *deprecatedPriceLabel;



@end

@implementation JobMarketCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createImageView];
    }
    
    return self;
}

- (void)createImageView{
    
    //创建imageView用于显示数据
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 165, 165)];
    imageView.image = [UIImage imageNamed:@"test1.jpg"];
    [self.contentView addSubview:imageView];
    self.goodsImageView = imageView;
    
    
    //创建用于显示商品名称的Label
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) + 5, 200, 17)];
    nameLabel.text = @"神州笔记本电脑";
    nameLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    
    //创建用于显示价格的label
    UILabel *currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(nameLabel.frame) + 5, 100, 17)];
    currentPriceLabel.text = @"￥1900";
    currentPriceLabel.font = [UIFont systemFontOfSize:12];
    [currentPriceLabel setTextColor:[CommonUtils colorWithHex:@"ff6478"]];
    [self.contentView addSubview:currentPriceLabel];
    self.currentPriceLabel = currentPriceLabel;

    
    
    //创建用于显示弃用价格的label
    UILabel *deprecatedPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, CGRectGetMinY(currentPriceLabel.frame), 100, 17)];
    deprecatedPriceLabel.text = @"￥1900";
    deprecatedPriceLabel.font = [UIFont systemFontOfSize:12];
    [deprecatedPriceLabel setTextColor:[CommonUtils colorWithHex:@"c7c6cb"]];
    [self.contentView addSubview:deprecatedPriceLabel];
    self.deprecatedPriceLabel = deprecatedPriceLabel;
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(deprecatedPriceLabel.frame)+2, CGRectGetMinY(deprecatedPriceLabel.frame)+8, 40, 1)];
    lineView.backgroundColor = [CommonUtils colorWithHex:@"c7c6cb"];
    [self.contentView addSubview:lineView];

    
}



@end