//
//  EditTeacherProfileViewController.m
//  xueyuanpai
//
//  Created by 王园园 on 16/6/9.
//  Copyright © 2016年 lidachao. All rights reserved.
//

#import "EditTeacherProfileViewController.h"

#import "EditTeacherProfileTableViewCell.h"
#import "EditTeacherTwoTableViewCell.h"

#import "CommonTableViewCell.h"

#import "SelectedImageView.h"



@interface EditTeacherProfileViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    SelectedImageView *selectedImageView;
    NSString          *avatarImageUploaded;
}

///选择头像的按钮
@property (nonatomic,strong)UIButton *headImageSelectedBtn;

@property (nonatomic,strong)UITableView *tableView;


@end

@implementation EditTeacherProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"认证导师资料";
    [self createLeftBackNavBtn];
    
    
    //设置头像
    [self setContentView];
    
    [self createTableView];
    
    [self createCommitButton];

}

#pragma mark - 创建tableView
- (void)createTableView{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, SCREEN_HEIGHT -150) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    //注册cell
    
    
    [tableView registerNib:[UINib nibWithNibName:@"EditTeacherProfileTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    
    [tableView registerNib:[UINib nibWithNibName:@"EditTeacherTwoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"twoCell"];
    
    
    [tableView registerClass:[CommonTableViewCell class] forCellReuseIdentifier:@"threeCell"];
}


#pragma mark - 设置修改头像视图
-(void)setContentView
{
    float space = 16;
    float headImageheight = 60;
    float headImageWidth = 60;
    ///选择头像
    _headImageSelectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headImageSelectedBtn setBackgroundImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
    [_headImageSelectedBtn setImage:[UIImage imageNamed:@"avatar_change"] forState:UIControlStateNormal];
    [_headImageSelectedBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [_headImageSelectedBtn setFrame:CGRectMake((SCREEN_WIDTH-headImageWidth)/2, space+NAV_TOP_HEIGHT, headImageWidth,headImageheight)];
    
    _headImageSelectedBtn.layer.cornerRadius = 30;
    _headImageSelectedBtn.layer.masksToBounds = YES;
    
    [_headImageSelectedBtn addTarget:self action:@selector(selectedImageFromPhotoAlbum:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_headImageSelectedBtn];
    
    
    if ([UserAccountManager sharedInstance].userIcon.length > 0) {
        NSURL *imageUrl = [NSURL URLWithString:[UserAccountManager sharedInstance].userIcon];
        
        [_headImageSelectedBtn setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]] forState:UIControlStateNormal];
    }
    
    
    
}

#pragma mark - tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section == 0) {
        return 6;

    }else{
        return 1;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                
                EditTeacherProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.contentLabel.text = [UserAccountManager sharedInstance].userRealName;
                
                return cell;
                
                
            }
                break;
            case 1:{
                
                EditTeacherProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                cell.titleLabel.text = @"身份证号";
                cell.contentLabel.text = [UserAccountManager sharedInstance].userIdCard;
                
                

                return cell;
                
            }
                break;
            case 2:{
                
                EditTeacherTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                cell.titleLabel.text = @"工作单位";
                cell.contentTextField.text = [UserAccountManager sharedInstance].userCompany;
                
                return cell;
                
            }
                break;
            case 3:{
                
                EditTeacherTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                cell.titleLabel.text = @"职务";
                cell.contentTextField.text = [UserAccountManager sharedInstance].userJob;
                
                return cell;
                
            }
                break;
            case 4:{
                
                EditTeacherTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                cell.titleLabel.text = @"联系电话";
                cell.contentTextField.text = [UserAccountManager sharedInstance].userMobile;
                
                return cell;

            }
                break;
            case 5:{
                EditTeacherTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                cell.titleLabel.text = @"邮箱";
                cell.contentTextField.text = [UserAccountManager sharedInstance].userEmail;
                
                return cell;
                
            }
                break;
                
            default:
                
                return nil;
                break;
        }
    }else if (indexPath.section == 1){
        
        CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.titleLabel.text = @"擅长辅导领域";
        
        cell.textView.text = [UserAccountManager sharedInstance].userSkillful;
        
        
        return cell;
        
    }else{
        
        CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.titleLabel.text = @"导师背景";
        
        cell.textView.text = [UserAccountManager sharedInstance].userTutorbackground;
        
        
        return cell;
        

    }
    
   
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 48;
    }else{
        
        return 100;
    }
}


#pragma mark - 从相册中选择图片

-(void)selectedImageFromPhotoAlbum:(UIButton *)sender
{
    
    float height = 200;
    
    selectedImageView = [[SelectedImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-height, SCREEN_WIDTH, height) withSuperController:self];
    weakSelf(wSelf)
    selectedImageView.callBackBlock = ^(UIImage * selectedImage){
        
        [wSelf.headImageSelectedBtn setBackgroundImage:selectedImage forState:UIControlStateNormal];
        [wSelf.headImageSelectedBtn setImage:[UIImage imageNamed:@"avatar_change"] forState:UIControlStateNormal];
        //需要把图片上传到服务器
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        NSMutableDictionary * imageDic = [NSMutableDictionary dictionary];
        NSData * imageData = UIImagePNGRepresentation(selectedImage);
        [imageDic setObject:imageData forKey:@"Users[file]"];
        [[HttpClient sharedInstance]uploadImageWithParams:dic withUploadDic:imageDic withSuccessBlock:^(HttpResponseCodeModel *model) {
            avatarImageUploaded = [dic objectForKey:@"picUrl"];
        } withFaileBlock:^(NSError *error) {
            
        }];
        
    };
    [[UIApplication sharedApplication].delegate.window addSubview:selectedImageView];
    
}


#pragma mark - 创建提交按钮
- (void)createCommitButton{
    
    //确定按钮
    //发布按钮的创建
    
    float space = 16;
    float btnHeight = 44;
    float footViewHeight = 48;
    float btnWidth = SCREEN_WIDTH - 30;
    
    UIView *backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, footViewHeight)];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"确定提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn setBackgroundColor:[CommonUtils colorWithHex:@"00beaf"]];
    [submitBtn setFrame:CGRectMake(space, space, btnWidth,btnHeight)];
    submitBtn.layer.cornerRadius = 10.0;
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [submitBtn addTarget:self action:@selector(commitAction) forControlEvents:UIControlEventTouchUpInside];
    [backGroundView addSubview:submitBtn];
    
    self.tableView.tableFooterView = backGroundView;
    
    
}

#pragma mark - 提交按钮
- (void)commitAction{
    
    [CommonUtils showToastWithStr:@"提交"];
}


#pragma mark - 提交的接口响应
-(void)submit
{
    /*
     user_id int    必需    用户序号
     realname   string    非必需    真实姓名
     idcard string   非必需     身份证号
     company string   非必需     工作单位
     job string   非必需         职务
     telphone string   非必需     联系电话
     email string   非必需      邮箱
     skillful sting   非必需     擅长辅导领域
     tutorbackground string   非必需     导师背景
     icon string   非必需     头像
     */
    
    /*
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setObject:[UserAccountManager sharedInstance].userId forKey:@"user_id"];
    if (name&&name.length>0) {
        [dic setObject:name forKey:@"realname"];
    }
    if (identityNum&&identityNum.length>0) {
        [dic setObject:identityNum forKey:@"idcard"];
    }
    if (workUnit&&workUnit.length>0) {
        [dic setObject:workUnit forKey:@"company"];
    }
    if (job&&job.length>0) {
        [dic setObject:job forKey:@"job"];
    }
    if (telephoneNum&&telephoneNum.length>0) {
        [dic setObject:telephoneNum forKey:@"telphone"];
    }
    if (goodAtField&&goodAtField.length>0) {
        [dic setObject:goodAtField forKey:@"skillful"];
    }
    if (teacherBackground&&teacherBackground.length>0) {
        [dic setObject:teacherBackground forKey:@"tutorbackground"];
    }
    if (avatarImageUploaded&&avatarImageUploaded.length>0) {
        [dic setObject:avatarImageUploaded forKey:@"icon"];
    }
    
    [[HttpClient sharedInstance]updateTeacherInfoWithParams:dic withSuccessBlock:^(HttpResponseCodeModel *model) {
        //更新导师资料
        if (model.responseCode == ResponseCodeSuccess) {
            [CommonUtils showToastWithStr:@"提交审核成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            [CommonUtils showToastWithStr:model.responseMsg];
        }
    } withFaileBlock:^(NSError *error) {
        
    }];
     
     */
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end