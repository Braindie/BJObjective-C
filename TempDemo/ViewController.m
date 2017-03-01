//
//  ViewController.m
//  TempDemo
//
//  Created by zhangwenjun on 16/6/2.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

#import "ViewController.h"

#import "UMSocial.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor orangeColor];

    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(100, 200, 100, 50);
    [shareBtn setTitle:@"Share" forState:UIControlStateNormal];
    shareBtn.backgroundColor = [UIColor grayColor];
    [shareBtn addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:shareBtn];



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
