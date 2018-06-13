//
//  StatusView.m
//  pc28
//
//  Created by 83830 on 2016/11/18.
//  Copyright © 2016年 83830. All rights reserved.
//

#import "StatusView.h"
// 设备全屏高
#define SCREEN_FULL_HEIGHT  [[UIScreen mainScreen] bounds].size.height
// 设备全屏宽
#define SCREEN_FULL_WIDTH [[UIScreen mainScreen] bounds].size.width

#define URL_1_XY @"http://www.pcdandanyuce.com/500/"
#define URL_1_JND @"http://www.pc2820.com/jnd28"
#define URL_1_HOST @"www.pcdandanyuce.com"



//#define URL_2_XY @"http://www.262.hk"
//#define URL_2_JND @"http://www.262.hk"
//#define URL_2_HOST @"www.262.hk"

#define URL_2_XY @"http://www.dandan28kai.com/index/trends"
#define URL_2_JND @"http://www.dandan28kai.com/index/trends/type/2"
#define URL_2_HOST @"www.dandan28kai.com"


@implementation StatusView
{
    UILabel *_label;
}
+ (StatusView *)shared {
    static dispatch_once_t once;
    static StatusView *shared;
    dispatch_once(&once, ^ {
        shared = [[self alloc] init];
    });
    return shared;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, SCREEN_FULL_WIDTH, SCREEN_FULL_HEIGHT);
        
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:self.bounds];
        [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
        _label = label;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor whiteColor];
        label.layer.borderColor = [UIColor lightGrayColor].CGColor;
        label.layer.borderWidth = 1;
        label.layer.cornerRadius = 5;
        label.layer.masksToBounds = YES;
        label.center = CGPointMake(SCREEN_FULL_WIDTH/2, SCREEN_FULL_HEIGHT/2);
        [self addSubview:label];
    
        
        self.url = URL_1_XY;
        
    }
    return self;
}
-(void)showWithTitle:(NSString *)title
{
    if (!self.superview) {
        [[[UIApplication sharedApplication].delegate window] addSubview:self];
    }
    
    _label.text = title;
    
    if (self.aaaaaaa > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            [StatusView shared].aaaaaaa = 0;
            [self dismiss];
        });
    }
}
-(void)dismiss
{
    [self removeFromSuperview];
}


+(NSArray *)getStringssss:(NSString *)string type:(NSInteger)type
{
    
    if (!string) {
        [StatusView shared].aaaaaaa = 1;
        [[StatusView shared] showWithTitle:@"空页面"];
        return @[];
    }
    
    NSURL *url = [NSURL URLWithString:[StatusView shared].url];
    
    
    
    if ([url.host isEqualToString:@"www.dandan28kai.com"]) {
        NSMutableArray *array= [NSMutableArray array];
        
        NSString *key1 = [NSString stringWithFormat:@"<td class=\"int\">"];
        NSRange range1 = [string rangeOfString:key1];//匹配得到的下标
        
        while(range1.length != 0)
        {
            if (string.length>=range1.location+range1.length) {
                
                NSString *str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 2)];
                
                if([str rangeOfString:@"<"].location !=NSNotFound)//_roaldSearchText
                {
                    str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 1)];
                    str = [NSString stringWithFormat:@"0%@",str];
                }
                
                [array addObject:str];
                
                string = [string substringFromIndex:range1.location+range1.length];
                
                range1 = [string rangeOfString:key1];
                
            }else
            {
                range1.length = 0;
            }
            
            
        }
        
        NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
        
        
        return reversedArray;
        
        
    }else if([url.host isEqualToString:@"www.262.hk" ])
    {
        
        NSMutableArray *array= [NSMutableArray array];
        
        NSString *key1 = [NSString stringWithFormat:@"</span></td>"];
        NSRange range1 = [string rangeOfString:key1];//匹配得到的下标
        
        while(range1.length != 0)
        {
            if (string.length>=range1.location+range1.length) {
                
                NSString *str = [string substringWithRange:NSMakeRange(range1.location-2, 2)];
                
                if([str rangeOfString:@"<"].location !=NSNotFound)//_roaldSearchText
                {
                    str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 1)];
                    str = [NSString stringWithFormat:@"0%@",str];
                }
                
                [array addObject:str];
                
                string = [string substringFromIndex:range1.location+range1.length];
                
                range1 = [string rangeOfString:key1];
                
            }else
            {
                range1.length = 0;
            }
            
            
        }
        
        NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
        
        
        return reversedArray;
        
    }else if([url.host isEqualToString:@"www.pc3777.com"])
    {
        
        NSMutableArray *array= [NSMutableArray array];
        
        NSString *key1 = [NSString stringWithFormat:@"\"color:red\">"];
        NSRange range1 = [string rangeOfString:key1];//匹配得到的下标
        
        while(range1.length != 0)
        {
            if (string.length>=range1.location+range1.length) {
                
                NSString *str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 2)];
                
                if([str rangeOfString:@"<"].location !=NSNotFound)//_roaldSearchText
                {
                    str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 1)];
                    str = [NSString stringWithFormat:@"0%@",str];
                }
                
                [array addObject:str];
                
                string = [string substringFromIndex:range1.location+range1.length];
                
                range1 = [string rangeOfString:key1];
                
            }else
            {
                range1.length = 0;
            }
            
            
        }
        
        NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
        
        
        return reversedArray;
        
        
    }else if ([url.host isEqualToString:@"www.pcdandanyuce.com"])
    {
        
        NSMutableArray *array= [NSMutableArray array];
        
        NSString *key1 = [NSString stringWithFormat:@"<td class=\"kjj\">"];
        NSRange range1 = [string rangeOfString:key1];//匹配得到的下标
        
        while(range1.length != 0)
        {
            if (string.length>=range1.location+range1.length) {
                
                NSString *str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 2)];
                
                if([str rangeOfString:@"<"].location !=NSNotFound)//_roaldSearchText
                {
                    str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 1)];
                    str = [NSString stringWithFormat:@"0%@",str];
                }
                
                [array addObject:str];
                
                string = [string substringFromIndex:range1.location+range1.length];
                
                range1 = [string rangeOfString:key1];
                
            }else
            {
                range1.length = 0;
            }
            
            
        }
        
        NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
        
        
        return reversedArray;
    }else if([url.host isEqualToString:@"www.pc0222.com"])
    {

        NSMutableArray *array= [NSMutableArray array];
        
        NSString *key1 = [NSString stringWithFormat:@"\t= "];
        NSRange range1 = [string rangeOfString:key1];//匹配得到的下标
        
        while(range1.length != 0)
        {
            
            if (string.length>=range1.location+range1.length) {
                
                NSString *str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 2)];
                
                if([str rangeOfString:@"\t"].location !=NSNotFound)//_roaldSearchText
                {
                    str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 1)];
                    str = [NSString stringWithFormat:@"0%@",str];
                }
                
                [array addObject:str];
                
                string = [string substringFromIndex:range1.location+range1.length];
                
                range1 = [string rangeOfString:key1];
                
            }else
            {
                range1.length = 0;
            }
            
            
        }
        
        NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
        
        
        return reversedArray;
        
        
    }else if([url.host isEqualToString:@"m.hbpc28.com"])
    {
        NSMutableArray *array= [NSMutableArray array];
        
        NSString *key1 = [NSString stringWithFormat:@"color:red\">"];
        NSRange range1 = [string rangeOfString:key1];//匹配得到的下标
        
        while(range1.length != 0)
        {
            if (string.length>=range1.location+range1.length) {
                
                NSString *str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 2)];
                
                if([str rangeOfString:@"<"].location !=NSNotFound)//_roaldSearchText
                {
                    str = [string substringWithRange:NSMakeRange(range1.location+range1.length, 1)];
                    str = [NSString stringWithFormat:@"0%@",str];
                }
                
                [array addObject:str];
                
                string = [string substringFromIndex:range1.location+range1.length];
                
                range1 = [string rangeOfString:key1];
                
            }else
            {
                range1.length = 0;
            }
            
            
        }
        
        NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
        
        
        return reversedArray;
    }
    
    return @[];
}


-(void)qiehuanWithType:(NSInteger)type
{
    self.type = type;
    if (type==0) {
        
        [StatusView shared].type = 0;
        
        NSURL *url = [NSURL URLWithString:[StatusView shared].url];
        if ([url.host isEqualToString:URL_1_HOST]) {
            
            [StatusView shared].url = URL_1_XY;

            
        }else
        {
            
            [StatusView shared].url = URL_2_XY;
            
            
        }
        
    }else
    {
        [StatusView shared].type = 1;
        
        NSURL *url = [NSURL URLWithString:[StatusView shared].url];
        if ([url.host isEqualToString:URL_1_HOST]) {
            
            [StatusView shared].url = URL_1_JND;
            
        }else
        {
            [StatusView shared].url = URL_2_JND;
            
        }
    }
}

-(void)selectBtnIndex:(NSInteger)index
{
    if (index == 1) {
        //更新网络数据
        
        [[StatusView shared] qiehuanWithType:0];
        
        [self.viewController update];
        
    }else if(index == 2)
    {
        //更新网络数据
        [[StatusView shared] qiehuanWithType:1];
        
        [self.viewController update];
        
    }else if(index == 3)
    {
        NSURL *url = [NSURL URLWithString:[StatusView shared].url];
        if ([url.host isEqualToString:URL_1_HOST]) {
            
            if ([StatusView shared].type == 0) {
                [StatusView shared].url = URL_2_XY;
            }else
            {
                [StatusView shared].url = URL_2_JND;
            }
            
        }else
        {
            
            if ([StatusView shared].type == 0) {
                [StatusView shared].url = URL_1_XY;
            }else
            {
                [StatusView shared].url = URL_1_JND;
            }
            
        }
        
        [self.viewController update];
    }
}

@end
