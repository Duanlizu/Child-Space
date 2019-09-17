//
//  MainTableViewCell.m
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "MainTableViewCell.h"

@implementation MainTableViewCell

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
    [self loadScroll];
    [self loadPageControl];
    [self loadtableView];
    
}

-(void)loadScroll{
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-300)/2, 64, 300, 200)];
    
    
    UIImage * img1 = [UIImage imageNamed:@"timg-1"];
    UIImage * img2 = [UIImage imageNamed:@"timg-2"];
    UIImage * img3 = [UIImage imageNamed:@"timg-3"];
    UIImage * img4 = [UIImage imageNamed:@"timg-4"];
    _array = @[img1,img2,img3,img4];
    
    
    self.scroll.contentSize = CGSizeMake(self.scroll.frame.size.width *4, self.scroll.frame.size.height);
    
    self.scroll.scrollEnabled = YES;
    self.scroll.pagingEnabled = YES;
    self.scroll.delegate = self;
    self.scroll.showsHorizontalScrollIndicator = NO;
    
    for (NSInteger i = 0; i< _array.count; i++) {
        UIImageView * imgView = [[UIImageView alloc]init];
        imgView.frame = CGRectMake(i * 300 , 0, 300, 200);
        
        
        imgView.image = _array[i];
        [self.scroll addSubview:imgView];
    }
    
    
    [self.view addSubview:self.scroll];
}

-(void)loadPageControl{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, 234, 200, 37)];
    _pageControl.numberOfPages = _array.count;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    _pageControl.pageIndicatorTintColor = [UIColor orangeColor];
    
    [self.view addSubview:_pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    _pageControl.currentPage = self.scroll.contentOffset.x/self.scroll.frame.size.width;
    
}



-(void)loadtableView{
    
    _maintableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, SCREEN_HEIGHT-364)];
    _maintableView.delegate = self;
    _maintableView.dataSource = self;
    
    [self.view addSubview:_maintableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIImage * img1 = [UIImage imageNamed:@"jiankang"];
    UIImage * img2 = [UIImage imageNamed:@"wenxue"];
    UIImage * img3 = [UIImage imageNamed:@"wenzhang"];
    NSArray * imgArr = @[img1,img2,img3];
    
    FirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell"];
    if (cell == nil) {
        [_maintableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell"];
    }
    if (indexPath.row == 0) {
        cell.titleLbl.text = @"儿童健康";
        cell.imgView.image = imgArr[0];
    }else if (indexPath.row == 1){
        cell.titleLbl.text = @"儿童文学";
        cell.imgView.image = imgArr[1];
    }else{
        cell.titleLbl.text = @"优秀作文";
        cell.imgView.image = imgArr[2];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        First1ViewController * page1 = [[First1ViewController alloc]init];
        page1.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:page1 animated:YES];
        
    }else if (indexPath.row == 1){
        Second1ViewController * page2 = [[Second1ViewController alloc]init];
        page2.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:page2 animated:YES];
    }else{
        Third1ViewController * page3 = [[Third1ViewController alloc]init];
        page3.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:page3 animated:YES];
        
    }
    
}


@end
