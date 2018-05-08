//
//  AuthenViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/18.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AuthenViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "UIViewController+Blur.h"


#import "AuthenItem.h"
#import "AuthernConfirmItem.h"
#import "AuthenPhotoItem.h"
#import "AuthenChooseItem.h"

#import "UIViewController+DismissKeyboard.h"

#import "AuthenModel.h"

@interface AuthenViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) NSMutableDictionary *authenDic;
@property (nonatomic,copy) NSString *picType;  //显示是正面还是反面

@property (nonatomic,strong) NSData *frontData;
@property (nonatomic,strong) NSData *sideData;

@end

@implementation AuthenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"认证信息";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager[@"AuthenItem"] = @"AuthenCell";
    self.manager[@"AuthernConfirmItem"] = @"AuthenConfirmCell";
    self.manager[@"AuthenPhotoItem"] = @"AuthenPhotoCell";
    self.manager[@"AuthenChooseItem"] = @"AuthenChooseCell";
    
    [self setupAuthenTableView];
    
    [self setupForDismissKeyboard];
}

- (void) setupAuthenTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    MLWeakSelf;
    for (NSInteger i=0; i<2; i++) {
        NSArray *dsisidi = @[@"真实姓名：",@"身份证号："];
        NSArray *pla = @[@"请输入真实姓名",@"请输入18位身份证号"];
        AuthenItem *item0 = [[AuthenItem alloc] initWithLeftName:dsisidi[i] placeholder:pla[i]];
        item0.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:item0];
        
        //参数
        NSArray *paArr = @[@"realname",@"idcard"];
        item0.didEndEditingText = ^(NSString *text) {
        [weakself.authenDic setValue:text forKey:paArr[i]];
        };
    }
    
    AuthenChooseItem *item3 = [[AuthenChooseItem alloc] init];
    item3.dateString = @"请选择身份证有效期开始时间";
    item3.selectionStyle = UITableViewCellSelectionStyleNone;
    @weakify(item3);
    item3.didSelectedBtn = ^(NSInteger tag) {
        [weakself showDatePickerViewInView:weakself.view finishBlock:^(NSString *dateStr, NSDate *date) {
            @strongify(item3);
            item3.dateString = [dateStr substringWithRange:NSMakeRange(0, 10)];
            [self.authenDic setValue:item3.dateString forKey:@"startime"];
        }];
    };
    [section addItem:item3];
    
    AuthenChooseItem *item4 = [[AuthenChooseItem alloc] init];
    item4.dateString = @"请选择身份证有效期结束时间";
    item4.selectionStyle = UITableViewCellSelectionStyleNone;
    @weakify(item4);
    item4.didSelectedBtn = ^(NSInteger tag) {
        [weakself showDatePickerViewInView:weakself.view finishBlock:^(NSString *dateStr, NSDate *date) {
            @strongify(item4);
            item4.dateString = [dateStr substringWithRange:NSMakeRange(0, 10)];
            [self.authenDic setValue:item4.dateString forKey:@"endtime"];

        }];
    };
    [section addItem:item4];
    
    
    AuthenPhotoItem *item5 = [[AuthenPhotoItem alloc] initWithType:@"正面"];
    item5.selectionStyle = UITableViewCellSelectionStyleNone;
    item5.didSelectedBtn = ^(NSInteger tag) {
        weakself.picType = @"1";
        [weakself showAlertOfImageChoice];
    };
    [section addItem:item5];
    
    AuthenPhotoItem *item6 = [[AuthenPhotoItem alloc] initWithType:@"反面"];
    item6.selectionStyle = UITableViewCellSelectionStyleNone;
    item6.didSelectedBtn = ^(NSInteger tag) {
        weakself.picType = @"2";
         [weakself showAlertOfImageChoice];
    };
    [section addItem:item6];
    
    
    AuthernConfirmItem *item7 = [[AuthernConfirmItem alloc] init];
    item7.selectionStyle = UITableViewCellSelectionStyleNone;
    item7.didSelectedBtn = ^(NSInteger tag) {
        [weakself toAuthentyMessage];
    };
    [section addItem:item7];
}

#pragma mark - 认证
- (void) toAuthentyMessage {
    NSString *authentyStr = [NSString stringWithFormat:@"%@%@%@",MLBaseUrl,MLAuthenty,TOKEN];

    if (!self.authenDic[@"front"]) {
            [self.authenDic setValue:@"" forKey:@"front"];
    }
    
    if (!self.authenDic[@"side"]) {
        [self.authenDic setValue:@"" forKey:@"side"];
    }
    
    MLWeakSelf;
    [self requestDataPostWithString:authentyStr params:self.authenDic successBlock:^(id responseObject) {
        BaseModel *momo = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:momo.info];

        if ([momo.status isEqualToString:@"200"]) {
            [[NSUserDefaults standardUserDefaults] setValue:momo.status forKey:@"authen"];
            [weakself.navigationController popViewControllerAnimated:YES];
        }
    } andFailBlock:^(NSError *error) {

    }];
}

- (NSMutableDictionary *)authenDic {
    if (!_authenDic) {
        _authenDic = [NSMutableDictionary dictionary];
    }
    return _authenDic;
}

#pragma mark - take photos
- (void) showAlertOfImageChoice {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择照片来源" message:nil preferredStyle:0];
    
    MLWeakSelf;
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:@"照相机" style:0 handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *imageController = [[UIImagePickerController alloc]init];
            imageController.delegate = weakself;
            imageController.allowsEditing = YES;
            imageController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imageController animated:YES completion:nil];
        }else{
            UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"相机" message:@"相机不可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            
            return;
        }
    }];
    [alertController addAction:action0];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"从相册选择" style:0 handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = weakself;
        //设置选择后的图片可被编辑
        picker.allowsEditing = YES;
        [weakself presentViewController:picker animated:YES completion:nil];
    }];
    [alertController addAction:action1];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:0 handler:nil];
    [alertController addAction:action2];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSLog( @" info is   %@",info);
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    NSString *filePath = [self getFilePathToSaveUnUpdatedImage];
    [UIImageJPEGRepresentation(image, 0.7) writeToFile:filePath atomically:YES];
    
    
    NSData *imgData = [NSData dataWithContentsOfFile:filePath];
    NSString *imgStr = [NSString stringWithFormat:@"%@",imgData];
    
//    [self.authenDic setValue:imgStr forKey:self.picType];
    
    if ([self.picType integerValue] == 1)   {//正面
        
    }else {//反面
    }
    
    [self uploadImageWithImage:image withSide:self.picType];
}

- (NSString *)getFilePathToSaveUnUpdatedImage {
    NSString *filePath = [[self getImagesFilePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Image_%@.jpg", [NSString stringWithFormat:@"%.0f",[[NSDate new] timeIntervalSince1970] * 1000]]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
    return filePath;
}

- (NSString *)getImagesFilePath {
    NSString *path = [NSString stringWithFormat:@"%@/images",NSTemporaryDirectory()];
    BOOL dictionary;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&dictionary]) {
        //如果该目录不存在 则创建该目录
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}


- (void) uploadImageWithImage:(UIImage *)image withSide:(NSString *)side  {

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                              @"text/html",
                                                              @"image/jpeg",
                                                              @"image/png",
                                                              @"application/octet-stream",
                                                              @"text/json",
                                                              nil];
    
    NSString *opop = [NSString stringWithFormat:@"%@%@%@/%@",MLBaseUrl,MLUploadImage,TOKEN,side];
    
    MLWeakSelf;
    [session POST:opop parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *imageData =UIImageJPEGRepresentation(image,1);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat =@"yyyy-MM-dd H:mm:ss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:fileName
                                mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AuthenModel *model = [AuthenModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];
        
        if ([model.status isEqualToString:@"200"]) {
            if ([weakself.picType integerValue] == 1) {
                [weakself.authenDic setValue:model.src forKey:@"front"];
            }else if ([weakself.picType integerValue] == 2){
                [weakself.authenDic setValue:model.src forKey:@"side"];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
