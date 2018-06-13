//
//  ViewController2.m
//  pc28
//
//  Created by linjiangfeng on 2017/4/20.
//  Copyright © 2017年 83830. All rights reserved.
//

#import "ViewController2.h"

#import "UIAlertView+Block.h"
#import "WebViewController.h"
#import "StatusView.h"


#define LabelWidth WIDTH_DYNAMIC(60)


@interface ViewController2 ()<UIGestureRecognizerDelegate>
{
    NSMutableArray *_arrData;

    
    NSString *_stringTemp;
    
    UIScrollView *_scrollview;
    
    NSMutableArray *_arrayNumber;
    
    
    NSMutableArray *_arrNumberLabels;
    
    NSInteger _maxHeight;
    
    
}

@property (nonatomic, strong)UIView *viewKeyboard;

@end

@implementation ViewController2

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [StatusView shared].viewController = self;
    
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationController.interactivePopGestureRecognizer.delegate=self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _arrNumberLabels = [NSMutableArray  array];
    
    _arrData = [NSMutableArray  arrayWithCapacity:28];
    for (int i=0; i<28; i++) {
        
        NSMutableArray *array = [NSMutableArray array];
        
        NSDictionary *dict = [NSDictionary dictionaryWithObject:array forKey:[NSString stringWithFormat:@"%d",i]];
        
        [_arrData addObject:dict];
    }
    
    
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_FULL_WIDTH, SCREEN_FULL_HEIGHT-64)];
    _scrollview = scrollview;
    [self.view addSubview:scrollview];
    
    int minx = 20;
    
    for (int i = 0; i<_arrData.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(minx, 0, LabelWidth, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [[[_arrData objectAtIndex:i] allKeys] objectAtIndex:0];
        [scrollview addSubview:label];
        
        UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 0, 1, CGRectGetHeight(scrollview.frame))];
        viewLine.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
        [scrollview addSubview:viewLine];
        
        minx+=LabelWidth;
        
    }
    scrollview.contentSize = CGSizeMake(minx+LabelWidth+20, 0);
    
    

    
    
    NSArray *arr = [[NSUserDefaults standardUserDefaults]objectForKey:@"ssssss"];
    if (arr) {
        _arrayNumber = [NSMutableArray arrayWithArray:arr];
        
        [self aaaa];
        
    }else
    {
        _arrayNumber = [NSMutableArray  array];
        
        [self update];
    }
    
    
    UIView *viewsss = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 20, SCREEN_FULL_HEIGHT-64)];
    [self.view addSubview:viewsss];
    
    
//    UIButton *button11 = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_FULL_HEIGHT-100, WIDTH_DYNAMIC(64), 64)];
//    button11.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
//    [button11 addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
//    [button11 setTitle:@"刷新" forState:UIControlStateNormal];
//    [button11 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//    [self.view addSubview:button11];
    
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake( 0,SCREEN_FULL_HEIGHT - 160, 64, 64)];
    button3.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    [button3 addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitle:@"刷新" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:button3];
    
    
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_FULL_WIDTH - 64, SCREEN_FULL_HEIGHT - 160, 64, 64)];
    button1.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    [button1 addTarget:self action:@selector(gongju) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"工具" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    //    [[UIApplication sharedApplication].delegate.window addSubview:button3];
    //    [[UIApplication sharedApplication].delegate.window addSubview:button1];
    [self.view addSubview:button1];
    
}

//工具
-(void)gongju
{
//    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请选择" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"pc28",@"jnd28",@"切换",nil];
//    [alertView mc_handlerClickedButton:^(UIAlertView *alertView, NSInteger btnIndex) {
//        
//        [[StatusView shared]selectBtnIndex:btnIndex];
//        
//    }];
//    [alertView show];
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请选择" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"http://www.pcdandanyuce.com/500/",@"http://www.dandan28kai.com/index/trends",@"http://www.dandan28kai.com/index/trends/type/2",nil];
    [alertView mc_handlerClickedButton:^(UIAlertView *alertView, NSInteger btnIndex) {
        
        NSString *title = [alertView buttonTitleAtIndex:btnIndex];
        [StatusView shared].url = title ;
        [self update];
        
        //        [[StatusView shared]selectBtnIndex:btnIndex];
        
    }];
    [alertView show];
    
}

-(void)update
{
    
    [[StatusView shared]showWithTitle:@"加载中..."];
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        //子线程异步执行下载任务，防止主线程卡顿
        NSURL *url = [NSURL URLWithString:[StatusView shared].url];
        
        NSString *string = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
        
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        //异步返回主线程，根据获取的数据，更新UI
        dispatch_async(mainQueue, ^{
            
            NSArray *array = [StatusView getStringssss:string type:[StatusView shared].type];
            
            if (_arrayNumber.count>0) {
                [self ccc];
            }
            
            _arrayNumber = [NSMutableArray arrayWithArray:array];
            [[NSUserDefaults standardUserDefaults]setObject:_arrayNumber forKey:@"ssssss"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            [self aaaa];
            
            [[StatusView shared]dismiss];
            
        });
        
    });
}


//撤销
-(void)xxx
{
    NSString *string = [[self getStirng:[_arrayNumber lastObject]] string];;
    [_arrayNumber removeLastObject];
    
    _stringTemp = [_arrayNumber lastObject];
    
    [[NSUserDefaults standardUserDefaults]setObject:_arrayNumber forKey:@"ssssss"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    UILabel *label = [_arrNumberLabels lastObject];
    if ([label.text isEqualToString:string]) {
        [label removeFromSuperview];
        [_arrNumberLabels removeLastObject];
    }
    
    NSMutableArray *array = [[_arrData objectAtIndex:[_stringTemp intValue]] objectForKey:[NSString stringWithFormat:@"%d",[_stringTemp intValue]]];
    [array removeLastObject];
}

//清除
-(void)ccc
{
    [_arrayNumber removeAllObjects];
    [[NSUserDefaults standardUserDefaults]setObject:_arrayNumber forKey:@"ssssss"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    for (UIView *view  in _scrollview.subviews) {
        if (view.tag == 38) {
            [view removeFromSuperview];
        }
    }
    
    _stringTemp = nil;
    
    _arrData = [NSMutableArray  arrayWithCapacity:28];
    for (int i=0; i<28; i++) {
        
        NSMutableArray *array = [NSMutableArray array];
        
        NSDictionary *dict = [NSDictionary dictionaryWithObject:array forKey:[NSString stringWithFormat:@"%d",i]];
        
        [_arrData addObject:dict];
    }
}
-(void)ooo
{
    NSArray *arr = [[NSUserDefaults standardUserDefaults]objectForKey:@"ssssss"];
    if (arr) {
        
        NSMutableString *stringm=[NSMutableString string];
        for (NSString *stringg in arr) {
            
            [stringm appendFormat:@"%@  ",stringg];
        }
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"开奖查询" message:stringm delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
        
        [alertView show];
        
    }
    
}

-(void)aaaa
{
    for (int i=0 ; i<_arrayNumber.count; i++) {
        NSString *string = [_arrayNumber objectAtIndex:i];
        
        if (_stringTemp) {
            
            [self ddd:string stringTemp:_stringTemp];
            _stringTemp = string;
        }else
        {
            _stringTemp = string;
        }
    }
}




-(void)ddd:(NSString *)string stringTemp:(NSString *)stringTemp
{
    int sss = [stringTemp intValue];
    
    
    NSAttributedString *text = [self getStirng:string];
    
    
    NSMutableArray *array = [[_arrData objectAtIndex:sss] objectForKey:[NSString stringWithFormat:@"%d",sss]];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(sss*LabelWidth+20, array.count*20+20, LabelWidth, 20)];
    label.tag = 38;
    //    label.font = [UIFont systemFontOfSize:WIDTH_DYNAMIC(14)];
    label.attributedText = text;
    label.textAlignment = NSTextAlignmentCenter;
    [_scrollview addSubview:label];
    
    [array addObject:string];
    
    
    [_arrNumberLabels addObject:label];
    
    
    [_scrollview setContentOffset:CGPointMake(CGRectGetMinX(label.frame), 0) animated:YES];
    
    if (_maxHeight < CGRectGetMaxY(label.frame)) {
        
        _maxHeight = CGRectGetMaxY(label.frame);
        _scrollview.contentSize = CGSizeMake(_scrollview.contentSize.width, _maxHeight);
    }
    
}


-(NSAttributedString *)getStirng:(NSString *)numberStr
{
    int ddd = [numberStr intValue];
    
    NSMutableString *aaa = [NSMutableString string];
    [aaa appendString:numberStr];
    
    BOOL isBig = NO;
    BOOL isDoubel = NO;
    
    if (ddd<14) {
        [aaa appendString:@"小"];
    }else
    {
        [aaa appendString:@"大"];
        isBig = YES;
    }
    if (ddd%2==0) {
        isDoubel = YES;
        [aaa appendString:@"双"];
    }else
    {
        [aaa appendString:@"单"];
    }
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:aaa];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:WIDTH_DYNAMIC(15)] range:NSMakeRange(0, aaa.length)];
    if (isBig) {
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 1)];
        [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:WIDTH_DYNAMIC(15)]  range:NSMakeRange(2, 1)];
    }
    if (isDoubel) {
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, 1)];
        [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:WIDTH_DYNAMIC(15)]  range:NSMakeRange(3, 1)];
    }
    
    
    return attString;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
