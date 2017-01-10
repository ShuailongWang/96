//
//  HYTypeCell.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYTypeCell.h"


@interface HYTypeCell()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *myScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end


@implementation HYTypeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.numberOfSinglePage = 10;
        [self setupUI];
    }
    return self;
}


-(void)setupUI{
    if (!self.dataArr) {
        NSString * dataPath = [[NSBundle mainBundle] pathForResource:@"HomeType.plist" ofType:nil];
        _dataArr = [NSArray arrayWithContentsOfFile:dataPath];
    }
    NSInteger pageCount = self.dataArr.count / self.numberOfSinglePage;
    if (self.dataArr.count % self.numberOfSinglePage > 0) {
        pageCount += 1;
    }
    
    if (nil == _myScrollView) {
        _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreen_Width, HYTypeCellHeight)];
        _myScrollView.delegate = self;
        _myScrollView.contentSize = CGSizeMake(KScreen_Width * pageCount, HYTypeCellHeight);
        _myScrollView.pagingEnabled = YES;
        _myScrollView.showsVerticalScrollIndicator = NO;
        _myScrollView.showsHorizontalScrollIndicator = NO;
        
        for (int i = 0; i < pageCount; i++) {
            [self addBtnsWithPageNum:i];
        }
        [self addSubview: _myScrollView];
    }
    if (nil == _pageControl) {
        // 添加pageControl
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.frame = CGRectMake(KScreen_Width / 2, HYTypeCellHeight - 20, 0, 0);
        _pageControl.centerX = self.contentView.centerX;
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.numberOfPages = pageCount;
        [self addSubview:_pageControl];
        [self bringSubviewToFront:_pageControl];
    }
}

// 循环添加按钮
-(void)addBtnsWithPageNum:(NSInteger)number{
    NSInteger cols = 5;
    CGFloat btnW = KScreen_Width / 5;
    CGFloat btnH = btnW;
    NSInteger count = self.dataArr.count - (number * self.numberOfSinglePage);
    NSInteger indexCount;
    if (count > 0 && count <= self.numberOfSinglePage) {
        indexCount = count;
    }else if(count > self.numberOfSinglePage){
        indexCount = self.numberOfSinglePage;
    }else{
        return;
    }
    
    for (int i = 0; i<indexCount; i++) {
        UIButton  * btn = [[UIButton alloc]init];

        int col = i % cols;
        int row = i / cols;
        NSInteger index = i + number * self.numberOfSinglePage;
        btn.tag = index;
        NSDictionary * btnDic = self.dataArr[index];
        
        //设置图片内容（使图片和文字水平居中显示）
        btn.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        [btn setTitle:btnDic[Title] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setImage:[UIImage imageNamed:btnDic[Icon]] forState:UIControlStateNormal];
        
        
        btn.frame = CGRectMake(col * btnW + number * KScreen_Width, row * btnH, btnW, btnH);
        
        //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.currentImage.size.height+20 ,-btn.imageView.frame.size.width, 0,0)];
        //图片距离右边框距离减少图片的宽度，其它不变
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, (btn.width - btn.imageView.width)/2 ,0 ,0)];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_myScrollView addSubview:btn];
    }
}


// 按钮点击事件
-(void)btnClick:(UIButton *)btn{
    if (self.myBlock) {
        self.myBlock(btn.tag);
    }
}

#pragma mark - scroll delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger correntCount = (scrollView.contentOffset.x + self.width/2)/self.width;
    self.pageControl.currentPage = correntCount;
}















@end
