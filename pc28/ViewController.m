//
//  ViewController.m
//  pc28
//
//  Created by 83830 on 2016/11/17.
//  Copyright © 2016年 83830. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+Block.h"
#import "WebViewController.h"
#import "StatusView.h"

#import "ViewController2.h"

#define LabelWidth WIDTH_DYNAMIC(20)

@interface ViewController ()<UIWebViewDelegate>
{
    
    UIScrollView *_scrollview1;
    UIScrollView *_scrollview2;
    
    NSArray *_arrData;
    
    NSInteger _maxHeight;
    NSInteger _maxHeight2;
    
    BOOL _isBig;
    BOOL _isDoubel;
    
    NSInteger _minx,_miny;
    NSInteger _minx2,_miny2;
    
}


@property (nonatomic, strong) UIView *viewKeyboard;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [StatusView shared].viewController = self;
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [StatusView shared].type = 0;

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIBarButtonItem *baritem = [[UIBarButtonItem alloc]initWithTitle:@"前往" style:UIBarButtonItemStylePlain target:self action:@selector(ssss)];
    self.navigationItem.rightBarButtonItem = baritem;
    
//    UIBarButtonItem *baritemLeft = [[UIBarButtonItem alloc]initWithTitle:@"前往" style:UIBarButtonItemStylePlain target:self action:@selector(baritemLeftTouch)];
//    self.navigationItem.rightBarButtonItem = baritemLeft;
    
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_FULL_WIDTH, (SCREEN_FULL_HEIGHT-64)/2)];
    _scrollview1 = scrollview;
    [self.view addSubview:scrollview];
    

    UIScrollView *scrollview2 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollview.frame), SCREEN_FULL_WIDTH, (SCREEN_FULL_HEIGHT-64)/2)];
    _scrollview2 = scrollview2;
    [self.view addSubview:scrollview2];
    

    
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

-(void)baritemLeftTouch
{
    
}

-(void)update
{
    
//    [[StatusView shared].viewController update];
    
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
            
            _arrData = array;
            
            [self ccc];
            
            [self aaaa:array];
            
            [[StatusView shared]dismiss];
            
        });
        
    });
}


//工具
-(void)gongju
{
    
    /*
     #define URL_1_XY @"http://www.pcdandanyuce.com/500/"
     #define URL_1_JND @"http://www.pc2820.com/jnd28"
     #define URL_1_HOST @"www.pcdandanyuce.com"
     
     //#define URL_2_XY @"http://www.262.hk"
     //#define URL_2_JND @"http://www.262.hk"
     //#define URL_2_HOST @"www.262.hk"
     
     #define URL_2_XY @"http://www.dandan28kai.com/index/trends"
     #define URL_2_JND @"http://www.dandan28kai.com/index/trends/type/2"
     #define URL_2_HOST @"www.dandan28kai.com"
     */
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请选择" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"http://www.pcdandanyuce.com/500/",@"http://www.dandan28kai.com/index/trends",@"http://www.dandan28kai.com/index/trends/type/2",@"http://www.pc0222.com/caipiao/jnd28",@"http://m.hbpc28.com/index.php?g=portal&m=index&a=jndtrend",nil];
    [alertView mc_handlerClickedButton:^(UIAlertView *alertView, NSInteger btnIndex) {

        if (btnIndex > 0) {
            NSString *title = [alertView buttonTitleAtIndex:btnIndex];
            [StatusView shared].url = title ;
            [self update];
        }
        
        
//        [[StatusView shared]selectBtnIndex:btnIndex];
        
    }];
    [alertView show];
    
}





//清除
-(void)ccc
{
    for (UIView *view  in _scrollview1.subviews) {
        if (view.tag == 38) {
            [view removeFromSuperview];
        }
    }
    for (UIView *view  in _scrollview2.subviews) {
        if (view.tag == 38) {
            [view removeFromSuperview];
        }
    }
}


-(void)aaaa:(NSArray *)array
{
    _miny = 0;
    _minx = 0;
    _miny2 = 0;
    _minx2 = 0;
    _maxHeight = 0;
    _maxHeight2 = 0;
    
    for (int i=0 ; i<array.count; i++) {
        NSString *string = [array objectAtIndex:i];
        
        if (i==0) {
            BOOL isb = [self asas:string];
            _isBig = isb;
            
            BOOL isd = [self sdsd:string];
            _isDoubel = isd;
        }else
        {
            BOOL isb = [self asas:string];
            if (isb == _isBig) {
                _miny += LabelWidth + interval;
            }else
            {
                _miny = 0;
                _minx += LabelWidth + interval;
                _isBig = isb;
            }
            
            
            BOOL isd = [self sdsd:string];
            if (isd == _isDoubel) {
                _miny2 += LabelWidth + interval;
            }else
            {
                _miny2 = 0;
                _minx2 += LabelWidth + interval;
                _isDoubel = isd;
            }
            
        }
        
        
        
        
        [self ddd:string ];
    }
    
    
    [_scrollview1 setContentOffset:CGPointMake(_scrollview1.contentSize.width-SCREEN_FULL_WIDTH, 0) animated:YES];
    [_scrollview2 setContentOffset:CGPointMake(_scrollview2.contentSize.width-SCREEN_FULL_WIDTH, 0) animated:YES];
}


-(void)ssss
{
    ViewController2 *vc = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)ddd:(NSString *)string
{
    BOOL isb = [self asas:string];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_minx,_miny, LabelWidth, LabelWidth)];
    label.tag = 38;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = LabelWidth/2;
    label.font = [UIFont systemFontOfSize:WIDTH_DYNAMIC(14)];
    label.text = string;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [_scrollview1 addSubview:label];
    
    if (isb) {
        label.backgroundColor = [UIColor redColor];
    }else
    {
        label.backgroundColor = [UIColor blueColor];
    }
    
    
    
    if (_maxHeight < CGRectGetMaxY(label.frame)) {
        _maxHeight = CGRectGetMaxY(label.frame);
    }
    _scrollview1.contentSize = CGSizeMake(CGRectGetMaxX(label.frame), _maxHeight);
    
    
    BOOL isd = [self sdsd:string];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(_minx2,_miny2, LabelWidth, LabelWidth)];
    label2.tag = 38;
    label2.layer.masksToBounds = YES;
    label2.layer.cornerRadius = LabelWidth/2;
    label2.font = [UIFont systemFontOfSize:WIDTH_DYNAMIC(14)];
    
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = NSTextAlignmentCenter;
    [_scrollview2 addSubview:label2];
    
    if (!isd) {
        label2.text = @"单";
        label2.backgroundColor = [UIColor redColor];
    }else
    {
        label2.text =@"双" ;
        label2.backgroundColor = [UIColor blueColor];
    }
    
    
    
    if (_maxHeight2 < CGRectGetMaxY(label2.frame)) {
        _maxHeight2 = CGRectGetMaxY(label2.frame);
    }
    _scrollview2.contentSize = CGSizeMake(CGRectGetMaxX(label2.frame), _maxHeight2);
    
}


-(BOOL)asas:(NSString *)numberStr
{
    int ddd = [numberStr intValue];
    

    BOOL isBig = NO;

    
    if (ddd<14) {
        
    }else
    {
        
        isBig = YES;
    }
    
    return isBig;
}

-(BOOL)sdsd:(NSString *)numberStr
{
    int ddd = [numberStr intValue];
    
    BOOL isDoubel = NO;
    
    if (ddd%2==0) {
        isDoubel = YES;
    }
    return isDoubel;
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
