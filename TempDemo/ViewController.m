//
//  ViewController.m
//  TempDemo
//
//  Created by zhangwenjun on 16/6/2.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

#import "ViewController.h"

#import "UMSocial.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "BookModel.h"

@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *linkManArray;
@end

@implementation ViewController
- (NSMutableArray *)linkManArray{
    if (_linkManArray == nil) {
        _linkManArray = [[NSMutableArray alloc] init];
    }
    return _linkManArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor orangeColor];

    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0, 200, self.view.frame.size.width, 50);
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    shareBtn.backgroundColor = [UIColor grayColor];
    [shareBtn addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:shareBtn];

    UIButton *bookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bookBtn.frame = CGRectMake(0, 300, self.view.frame.size.width, 50);
    [bookBtn setTitle:@"获取通讯录" forState:UIControlStateNormal];
    bookBtn.backgroundColor = [UIColor grayColor];
    [bookBtn addTarget:self action:@selector(bookAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:bookBtn];

}

- (void)bookAction:(UIButton *)sender{
    
    ABAddressBookRef addressBookref = ABAddressBookCreateWithOptions(NULL, NULL);
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookref, ^(bool granted, CFErrorRef error) {
            CFErrorRef *error1 = NULL;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
            [self copyAddressBook:addressBook];
        });
    }else if(ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        CFErrorRef *error1 = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
        [self copyAddressBook:addressBook];
        
    }else{
        UIAlertView *alert  = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有获取通讯录权限" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        alert.delegate = self;
        [alert show];
    }
}

- (void)copyAddressBook:(ABAddressBookRef)addressBook{
    //获取联系人个数
    CFIndex numberOfPeoples = ABAddressBookGetPersonCount(addressBook);
    CFArrayRef peoples = ABAddressBookCopyArrayOfAllPeople(addressBook);
    NSLog(@"有%ld个联系人", numberOfPeoples);
    //循环获取联系人
    for (int i = 0; i < numberOfPeoples; i++) {
        
        ABRecordRef person = CFArrayGetValueAtIndex(peoples, i);
        BookModel *bookModel = [[BookModel alloc] init];
        bookModel.firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        bookModel.lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
        bookModel.nickName = (__bridge NSString*)ABRecordCopyValue(person, kABPersonNicknameProperty);
        bookModel.organiztion = (__bridge NSString*)ABRecordCopyValue(person, kABPersonOrganizationProperty);
        bookModel.headImage = (__bridge NSData*)ABPersonCopyImageData(person);
        
        
        if (bookModel.firstName && bookModel.lastName) {
            bookModel.name = [NSString stringWithFormat:@"%@%@",bookModel.lastName, bookModel.firstName];
        }else if(!bookModel.firstName){
            bookModel.name = bookModel.lastName;
        }else{
            bookModel.name = bookModel.firstName;
        }
        if (!bookModel.name) {
            bookModel.name = bookModel.organiztion;
        }
        if (bookModel.nickName) {
            bookModel.name =[NSString stringWithFormat:@"%@", bookModel.nickName];
        }
        
        //读取电话多值
        NSMutableArray *phoneArray = [[NSMutableArray alloc] init];
        ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
        for (int k = 0; k<ABMultiValueGetCount(phone); k++)
        {
            //获取电话Label
            NSString * personPhoneLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phone, k));
            //获取該Label下的电话值
            NSString * tempstr = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phone, k);
            NSArray *array = [NSArray arrayWithObjects:personPhoneLabel, tempstr, nil];
            [phoneArray addObject:array];
        }
        bookModel.phones = phoneArray;
        [self.linkManArray addObject:bookModel];
    }
//    NSDictionary *dict = [ICPinyinGroup group:self.linkManArray  key:@"name"];
//    
//    self.tableHeaderArray = [dict objectForKey:LEOPinyinGroupCharKey];
//    self.sortedArrForArrays = [dict objectForKey:LEOPinyinGroupResultKey];
//    [self performSelectorOnMainThread:@selector(reloadTable) withObject:nil waitUntilDone:YES];
    NSLog(@"%@",self.linkManArray);
}


- (void)shareAction:(UIButton *)sender{
    
    /*点击后调到的URL*/
    //QQ
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    //微信
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://i-7.vcimg.com/trim/314ffd43f70e68c50802ca243d32887e83085/trim.jpg";
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://baidu.com";
    //微博
    [UMSocialData defaultData].extConfig.sinaData.urlResource.url = @"http://baidu.com";

    
    
    /*框框里的内容*/
    [UMSocialData defaultData].extConfig.title = @"你大爷的";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5770fde8e0f55a84e9002cb5"
                                      shareText:@"你大爷的，又骗我，你敢点我吗？"
                                     shareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://c.hiphotos.baidu.com/baike/w%3D268%3Bg%3D0/sign=bd870efb272dd42a5f0906ad3b003c88/dcc451da81cb39dbdc503cc4d2160924aa18308b.jpg"]]]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:self];
    
      
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
