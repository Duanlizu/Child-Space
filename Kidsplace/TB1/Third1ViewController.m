//
//  Third1ViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "Third1ViewController.h"

@interface Third1ViewController ()

@end

@implementation Third1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view1 =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view1.backgroundColor  = [UIColor yellowColor];
    self.navigationItem.title = @"优秀作文";
    [self.view addSubview:view1];
    [self loadtableView2];
    [self loadDataWithName];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(void)loadDataWithName{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"wenzhang" ofType:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    
    [self loadJsonData:[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]];
}

-(void)loadJsonData:(NSDictionary *)dic{
    
    if (dic) {
        if ([dic isKindOfClass:[NSDictionary class]]) {
            NSMutableArray * jsondata = [[NSMutableArray alloc]initWithCapacity:6];
            NSArray * array = [ dic objectForKey: @"data"];
            for (NSInteger i = 0; i<array.count; i++) {
                id healthdic = [array objectAtIndex:i];
                if ([healthdic isKindOfClass:[NSDictionary class]]) {
                    Model * medelInfo = [Model modelWithDict:healthdic];
                    [jsondata addObject:medelInfo];
                }
            }
            _dataArray = jsondata;
            [self.tableView reloadData];
        }
    }
}


-(void)loadtableView2{
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH,SCREEN_HEIGHT- 65)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell"];
    
    if (cell == nil) {
        [_tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell"];
    }
    
    Model * modelInfo = [_dataArray objectAtIndex:indexPath.row];
    cell.First1data = modelInfo;
    for (NSInteger i = 0; i<= indexPath.row; i++) {
        NSString * str = [NSString stringWithFormat:@"wz-%ld",i+1];
        UIImage * img = [UIImage imageNamed:str];
        
        cell.imgView.image = img;
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Third2ViewController * page2 = [[Third2ViewController alloc]init];
    page2.v2data = [_dataArray objectAtIndex:indexPath.row];
    page2.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:page2 animated:YES];
    
}




@end
