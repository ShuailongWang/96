//
//  SQSelectAddressViewController.m
//  SQSelectAddress
//
//  Created by XiaoBao on 2017/1/2.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQSelectAddressViewController.h"
#import "SQSelectAddressTransitioning.h"
#import "SQSelectAddressModel.h"
#import "SQChinaCity.h"
#import "SQProvince.h"
#import "SQCity.h"
#import "SQCounty.h"
#import "SQTown.h"
#import "SQChinaCitiesController.h"

@interface SQSelectAddressViewController ()<SQSelectAddressModelDelegate, SQChinaCitiesControllerDelegate, UIScrollViewDelegate>
/**
 动画代理
 */
@property (nonatomic, strong) SQSelectAddressTransitioning *transitoning;

/**
 显示或隐藏containerView动画
 */
@property (nonatomic, assign, getter=isAnimating) BOOL animating;

// ====================== 模型 ==================
@property (nonatomic, strong) SQSelectAddressModel *selectAddressModel;
@property (nonatomic, strong) SQProvince *province;
@property (nonatomic, strong) SQCity *city;
@property (nonatomic, strong) SQCounty *county;
@property (nonatomic, strong) SQTown *town;

// ================== 选择视图及子视图 ============
/**
 容器视图View
 */
@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIView *titleView;

@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, strong) UIView *footerView;

/**
 上一步
 */
@property (nonatomic, weak) UIButton *backButton;

@end

static NSString *const selectAddressCellIdentifier = @"selectAddressCell";

@implementation SQSelectAddressViewController

+ (nullable instancetype)selectAddressViewController
{
    SQSelectAddressViewController *selectAddressVC = [[self alloc] init];
    return selectAddressVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController) return;
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self createContainerViewAndLayout];
    [self addContainerViewSubViewAndLayout];
    [self createTitleViewSubviewsAndLayout];
    [self createFooterViewSubviewsAndLayout];
    [self.selectAddressModel loadingAddressLibrary];
    self.containerView.transform = CGAffineTransformMakeScale(0, 0);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.isAnimating) return;
    self.animating = YES;
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.transform = CGAffineTransformMakeScale(1, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.20 animations:^{
            self.containerView.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            self.containerView.transform = CGAffineTransformIdentity;
            self.animating = NO;
        }];
    }];
}

#pragma mark - SQSelectAddressModelDelegate

/**
 城市地址模型加载完成
 */
- (void)SQSelectAddressLibraryLoadingCompleted
{
    NSLog(@"-----");
    [self createContentViewSubviewsAndLayout];
    SQChinaCitiesController *provinceVC = [self.childViewControllers firstObject];
    provinceVC.dataSource = self.selectAddressModel.dataSource;
    self.backButton.hidden = YES;
}

#pragma mark - SQChinaCitiesControllerDelegate

- (void)chinaCitiesController:(SQChinaCitiesController *)cityController selectCity:(SQChinaCity *)chinaCity withType:(SQSelectAddressType)selectType
{
    CGFloat width = self.contentView.bounds.size.width;
    NSInteger index = (NSInteger)selectType + 1;
    CGFloat offsetX = width * index;
    switch (selectType) {
        case SQSelectAddressTypeProvince:
        {
            if (![self.province isEqual:chinaCity])
            {
                self.province = (SQProvince *)chinaCity;
                self.city = nil;
                self.county = nil;
                self.town = nil;
            }
        }
            break;
            
        case SQSelectAddressTypeCity:
        {
            if (![self.city isEqual:chinaCity])
            {
                self.city = (SQCity *)chinaCity;
                self.county = nil;
                self.town = nil;
            }
        }
            break;
            
        case SQSelectAddressTypeCounty:
        {
            if (![self.county isEqual:chinaCity])
            {
                self.county = (SQCounty *)chinaCity;
                self.town = nil;
            }
        }
            break;
            
        case SQSelectAddressTypeTown:
        {
            if (![self.county isEqual:chinaCity])
            {
                self.town = (SQTown *)chinaCity;
            }
        }
            break;
    }
    
    if (chinaCity.children.count)
    {
        SQChinaCitiesController *provinceVC = self.childViewControllers[index];
        provinceVC.dataSource = chinaCity.children;
        [self.contentView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
    else
    {
        [self hiddenContainerViewAnimation];
    }
}

#pragma mark -  UIScrollViewDelegate
//scrollView滚动时，就调用该方法。任何offset值改变都调用该方法。即滚动过程中，调用多次
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.backButton.hidden = scrollView.contentOffset.x < self.contentView.bounds.size.width * 0.5;
}

/**
 点击容器其他部分退出控制器
 */
/*
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.isAnimating) return;
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    if (!CGRectContainsPoint(self.containerView.frame, point))
    {
        [self dismiss];
    }
}
 */


/**
 隐藏容器视图的动画
 */
- (void)hiddenContainerViewAnimation
{
    self.animating = YES;
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        
        self.animating = NO;
        [self dismiss];
    }];
}

/**
 销毁控制器
 */
- (void)dismiss
{
    if (self.delegate)
    {
        if ([self.delegate respondsToSelector:@selector(selectAddressViewController:selectedDetailAdreess:townCode:)])
        {
            NSMutableString *address = [[NSMutableString alloc] init];
            NSString *code = @"";
            
            if (self.province)
            {
                [address appendString:self.province.name];
                code = self.province.code;
            }
            
            if (self.city)
            {
                [address appendString:self.city.name];
                code = self.city.code;
            }
            
            if (self.county)
            {
                [address appendString:self.county.name];
                code = self.county.code;
            }
            
            if (self.town)
            {
                [address appendString:self.town.name];
                code = self.town.code;
            }
            
            [self.delegate selectAddressViewController:self selectedDetailAdreess:address townCode:code];
        }
        
        if ([self.delegate respondsToSelector:@selector(selectAddressViewControllerSelectedProvince:)])
        {
            [self.delegate selectAddressViewControllerSelectedProvince:self.province];
        }
        
        if ([self.delegate respondsToSelector:@selector(selectAddressViewControllerSelectedCity:)])
        {
            [self.delegate selectAddressViewControllerSelectedCity:self.city];
        }
        
        if ([self.delegate respondsToSelector:@selector(selectAddressViewControllerSelectedCounty:)])
        {
            [self.delegate selectAddressViewControllerSelectedCounty:self.county];
        }
        
        if ([self.delegate respondsToSelector:@selector(selectAddressViewControllerSelectedTown:)])
        {
            [self.delegate selectAddressViewControllerSelectedTown:self.town];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 创建容器并布局
 */
- (void)createContainerViewAndLayout
{
    [self.view addSubview:self.containerView];
    
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *cons = [NSMutableArray array];
    
    // 设置containerView与父视图垂直居中
    [cons addObject:[NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    // 设置containerView的高度
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[containerView(330)]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"containerView" : self.containerView}]];
    
    // 与父视图在水平方向上左右对齐
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[containerView]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"containerView" : self.containerView}]];
    [self.view addConstraints:cons];
}

/**
 布局容器的TitleView和ContentView和footerView
 */
- (void)addContainerViewSubViewAndLayout
{
    [self.containerView addSubview:self.titleView];
    [self.containerView addSubview:self.contentView];
    [self.containerView addSubview:self.footerView];
    
    self.titleView.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.footerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSMutableArray *cons = [NSMutableArray array];
    NSDictionary *dict = @{@"titleView": self.titleView, @"contentView" : self.contentView, @"footerView" : self.footerView};
    // 设置titleView水平的左右与父视图左右对齐
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleView]|" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:nil views:dict]];
    // 设置其他控件在垂直方向与titleView左右对齐
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleView(44)]-0.5-[contentView]-0.5-[footerView(44)]|" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:nil views:dict]];
    
    [self.containerView addConstraints:cons];
}


/**
 创建titleView的子控件并布局
 */
- (void)createTitleViewSubviewsAndLayout
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"address_select_close@3x"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.titleView addSubview:button];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"选择区域";
    titleLabel.textColor = [UIColor colorWithRed:58/255.0 green:58/255.0 blue:58/255.0 alpha:1.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:16.0];
    [self.titleView addSubview:titleLabel];
    
    // 布局titleView的子控件
    button.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSMutableArray *cons = [NSMutableArray array];
    NSDictionary *dict = @{@"button": button, @"titleLabel" : titleLabel};
    NSDictionary *metrics = @{@"buttonWidth" : @50};
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[button]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:dict]];
    
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-buttonWidth-[titleLabel]-[button(buttonWidth)]|" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:dict]];
    [self.titleView addConstraints:cons];
}

- (void)createContentViewSubviewsAndLayout
{
    CGFloat width = self.contentView.bounds.size.width;
    CGFloat height = self.contentView.bounds.size.height;
    for (NSInteger i = 0; i<4; i++)
    {
        SQChinaCitiesController *chinaCitiesVC = [[SQChinaCitiesController alloc] init];
        chinaCitiesVC.selectType = (SQSelectAddressType)i;
        chinaCitiesVC.view.frame = CGRectMake(i * width, 0, width, height);
        chinaCitiesVC.delegate = self;
        [self.contentView addSubview:chinaCitiesVC.view];
        [self addChildViewController:chinaCitiesVC];
    }
    self.contentView.contentSize = CGSizeMake(width * self.childViewControllers.count, 0);
}

/**
 创建FooterView的子控件并布局
 */
- (void)createFooterViewSubviewsAndLayout
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"上一步" forState:UIControlStateNormal];
    backButton.layer.cornerRadius = 5;
    backButton.layer.masksToBounds = YES;
    backButton.layer.borderColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0].CGColor;
    backButton.layer.borderWidth = 1.0;
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backward) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:backButton];
    self.backButton = backButton;
    self.backButton.hidden = YES;
    backButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    nextButton.layer.cornerRadius = 5;
    nextButton.layer.masksToBounds = YES;
    nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton setBackgroundColor:[UIColor colorWithRed:251/255.0 green:44/255.0 blue:46/255.0 alpha:1.0]];
    [nextButton addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:nextButton];
    nextButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSMutableArray *cons = [NSMutableArray array];
    NSDictionary *dict = @{@"backButton": backButton, @"nextButton" : nextButton};
    NSDictionary *metrics = @{@"marginX" : @10, @"marginY" : @5};
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-marginY-[backButton]-marginY-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:dict]];
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-marginY-[nextButton]-marginY-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:dict]];
    [cons addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-marginX-[backButton]-marginX-[nextButton(==backButton)]-marginX-|" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:dict]];
    [self.footerView addConstraints:cons];

}

/**
 上一步按钮的响应事件
 */
- (void)backward
{
    CGFloat currentOffsetX = self.contentView.contentOffset.x;
    CGFloat willOffsetX = currentOffsetX - self.contentView.bounds.size.width;
    if (currentOffsetX <=0)
    {
        [self.contentView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    else
    {
        if (willOffsetX <= 0)
        {
            [self.contentView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        else
        {
            [self.contentView setContentOffset:CGPointMake(willOffsetX, 0) animated:YES];
        }
    }
}

/**
 下一步按钮的响应事件
 */
- (void)forward
{
    CGFloat currentOffsetX = self.contentView.contentOffset.x;
    CGFloat width = self.contentView.bounds.size.width;
    NSInteger index = currentOffsetX / width;
    CGFloat willOffsetX = currentOffsetX;
    if (index == 0 && self.province)
    {
        willOffsetX = (index + 1) * width;
        [self.contentView setContentOffset:CGPointMake(willOffsetX, 0) animated:YES];
    }
    else if (index == 1 && self.city)
    {
        willOffsetX = (index + 1) * width;
        [self.contentView setContentOffset:CGPointMake(willOffsetX, 0) animated:YES];
    }
    else if (index == 2 && self.county)
    {
        willOffsetX = (index + 1) * width;
        [self.contentView setContentOffset:CGPointMake(willOffsetX, 0) animated:YES];
    }
}

#pragma mark - private method
/**
 初始化alertController
 
 @return alertController
 */
- (instancetype)init
{
    if (self = [super init])
    {
        // 设置展示的样式为自定义 弹出风格
        self.modalPresentationStyle = UIModalPresentationCustom;
        // 设置过渡代理(设置展示的控制器)
        self.transitioningDelegate = self.transitoning;
    }
    return self;
}

/**
 present动画的代理
 */
- (SQSelectAddressTransitioning *)transitoning
{
    if (_transitoning == nil)
    {
        _transitoning = [[SQSelectAddressTransitioning alloc] init];
    }
    return _transitoning;
}

- (SQSelectAddressModel *)selectAddressModel
{
    if (_selectAddressModel == nil)
    {
        _selectAddressModel = [[SQSelectAddressModel alloc] init];
        _selectAddressModel.delegate = self;
    }
    return _selectAddressModel;
}

- (UIView *)containerView
{
    if (_containerView == nil)
    {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    }
    return _containerView;
}

- (UIView *)titleView
{
    if (_titleView == nil)
    {
        _titleView = [[UIView alloc] init];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}

- (UIScrollView *)contentView
{
    if (_contentView == nil)
    {
        _contentView = [[UIScrollView alloc] init];
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.pagingEnabled = YES;
        _contentView.scrollEnabled = NO;
        _contentView.delegate = self;
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

- (UIView *)footerView
{
    if (_footerView == nil)
    {
        _footerView = [[UIView alloc] init];
        _footerView.backgroundColor = [UIColor whiteColor];
    }
    return _footerView;
}

- (void)dealloc
{
    NSLog(@"[%@ -- dealloc]", self.class);
}

@end
