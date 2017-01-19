//
//  HYFreshModel.h
//  96
//
//  Created by admin on 17/1/18.
//  Copyright © 2017年 王帅龙. All rights reserved.
/*
 {
 "id": "56842",
 "name": "桃李阳光的味道切片面包",
 "store_nums": "50",
 "sort": "81",
 "brand_id": "478",
 "hot_degree": "0",
 "safe_day": "6",
 "market_price": "6.50",
 "cid": "143",
 "category_id": "143",
 "pcid": "55",
 "partner_price": "4.90",
 "brand_name": "桃李",
 "ismix": "0",
 "pre_img": "0000056842_65460.jpg",
 "pre_imgs": "0000056842_91850.jpg,",
 "cart_group_id": "0",
 "source_id": "1",
 "tag_ids": "5",
 "is_del": "0",
 "attribute": "",
 "specifics": "360g 赠30g",
 "product_id": "56842",
 "dealer_id": "7951",
 "price": "6.00",
 "number": "0",
 "had_pm": 0,
 "pm_desc": "",
 "is_xf": 1,
 "img": "http://img01.bqstatic.com/upload/goods/000/005/6842/0000056842_65460.jpg@300w_300h_90Q.jpg"
 }
 */

#import <Foundation/Foundation.h>

@interface HYFreshModel : NSObject

@property (copy, nonatomic) NSString *img;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *specifics;
@property (copy, nonatomic) NSString *market_price;
@property (copy, nonatomic) NSString *brand_id;
@property (copy, nonatomic) NSString *brand_name;

+(NSArray *)FreshModelWithArray;

@end
