//
//  Second2ViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "Second2ViewController.h"

@interface Second2ViewController ()

@end

@implementation Second2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"儿童文学";
    [self loadTableView];
}


- (void)setV2data:(Model *)v2data{
    _v2data = v2data;
    NSMutableArray * jsonData = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < _v2data.name.count ; i++) {
        id nameData = [_v2data.name objectAtIndex:i];
        if ([nameData isKindOfClass:[NSDictionary class]]) {
            [jsonData addObject: nameData[@"hxname"]];
        }
    }
    _data = jsonData;
    [self.tableView reloadData];
}


-(void)loadTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-65)];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SecondTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTableViewCell"];
    if (cell == nil) {
        [_tableView registerNib:[UINib nibWithNibName:@"SecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTableViewCell"];
    }
    Model * nameInfo = [_data objectAtIndex:indexPath.row];
    cell.nameLBL.text = nameInfo;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Second3ViewController * page3 = [[Second3ViewController alloc]init];
    
    
    
    NSArray * content = [[NSArray alloc]init];
    NSMutableArray * mutableArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<_v2data.content.count; i++) {
        id contentData = [_v2data.content objectAtIndex:i];
        if ([contentData isKindOfClass:[NSDictionary class]]) {
            [mutableArray addObject:contentData[@"hxcontent"]];
        }
    }
    content = mutableArray;
    page3.text = [content objectAtIndex:indexPath.row];
    
    page3.hidesBottomBarWhenPushed = YES;
    
    
    

    
    
    [self.navigationController pushViewController:page3 animated:YES];
}

@end
