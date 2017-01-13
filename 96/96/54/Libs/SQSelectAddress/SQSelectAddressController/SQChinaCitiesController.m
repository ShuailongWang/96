//
//  SQChinaCitiesController.m
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQChinaCitiesController.h"
#import "SQChinaCity.h"

@interface SQChinaCityCell : UITableViewCell

@property (nonatomic, strong) SQChinaCity *chinaCity;

@end

@implementation SQChinaCityCell

+ (instancetype)chinaCityCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    static NSString *chinaCityIdentifier = @"SQChinaCityCell";
    SQChinaCityCell *cell = [tableView dequeueReusableCellWithIdentifier:chinaCityIdentifier];
    
    if (cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:chinaCityIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0];
        cell.textLabel.textColor = [UIColor colorWithRed:58/255.0 green:58/255.0 blue:58/255.0 alpha:1.0];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.imageView.image = [UIImage imageNamed:@"radiobox_default@2x"];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.contentView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    [super touchesCancelled:touches withEvent:event];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected)
    {
        self.imageView.image = [UIImage imageNamed:@"radiobox_selected@2x"];
    }
    else
    {
        self.imageView.image = [UIImage imageNamed:@"radiobox_default@2x"];
    }
}

- (void)setChinaCity:(SQChinaCity *)chinaCity
{
    _chinaCity = chinaCity;
    self.textLabel.text = chinaCity.name;
}

@end

@interface SQChinaCitiesController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SQChinaCitiesController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SQChinaCityCell *cell = [SQChinaCityCell chinaCityCellWithTableView:tableView indexPath:indexPath];
    
    cell.chinaCity = self.dataSource[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld", (long)indexPath.row);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(chinaCitiesController:selectCity:withType:)])
    {
        SQChinaCity *city = self.dataSource[indexPath.row];
        [self.delegate chinaCitiesController:self selectCity:city withType:self.selectType];
    }
}

- (void)setDataSource:(NSArray *)dataSource
{
    _dataSource = dataSource;
    [self.tableView reloadData];
}

#pragma mark - private getter

- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = 40;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
