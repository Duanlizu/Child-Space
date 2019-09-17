//
//  InfoViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "InfoViewController.h"
#import "UIImageView+AFNetworking.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"资讯";
    
    [self getUrl];
    [self loadTableView2];
   
}

-(void)loadTableView2{
    _SecondTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-65)];
    _SecondTableView.delegate = self;
    _SecondTableView.dataSource = self;
    
    [self.view addSubview:_SecondTableView];
}

-(void)loadJsonData:(NSDictionary *)dic{
    
    if (dic) {
        if ([dic isKindOfClass:[NSDictionary class]]) {
            NSMutableArray * jsondata = [[NSMutableArray alloc]initWithCapacity:6];
            NSArray * array = [ dic objectForKey: @"data"];
            for (NSInteger i = 0; i<array.count; i++) {
                id healthdic = [array objectAtIndex:i];
                if ([healthdic isKindOfClass:[NSDictionary class]]) {
                    Model2 * medelInfo = [Model2 model2WithDict:healthdic];
                    [jsondata addObject:medelInfo];
                }
            }
            _array = jsondata;
            [self.SecondTableView reloadData];
        }
    }
}

-(void)getUrl{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString *url = @"http://api.xiniubaba.com/data.php";
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self loadJsonData:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@", error);
    }];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell"];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"InfoTableViewCell" bundle:nil ] forCellReuseIdentifier:@"InfoTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell"];
    }
    Model2 * modelInfo = [_array objectAtIndex:indexPath.row];
    cell.data = modelInfo;
    cell.Infolbl.text = modelInfo.title;
    cell.Picture.image = [self getImageWithUrl:modelInfo.url];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
}

-(UIImage * )getImageWithUrl:(NSString *) url{
    
    UIImage * image = [[UIImage alloc]init];
    NSURL * URL = [NSURL URLWithString:url];
    NSData * data = [[NSData alloc]initWithContentsOfURL:URL];
    image = [UIImage imageWithData:data];
    
    return image;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoContentViewController * page2 = [[InfoContentViewController alloc]init];
    
    page2.infoPage2 = [_array objectAtIndex:indexPath.row];
    
    page2.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:page2 animated:YES];
}


@end
