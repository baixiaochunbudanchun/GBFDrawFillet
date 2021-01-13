//
//  ViewController.m
//  GBFDrawFillet
//
//  Created by pc-D2015097 on 2021/1/13.
//

#import "ViewController.h"
#import "GBFDrawFilletView.h"
#define kwidth  [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (nonatomic, strong) GBFDrawFilletView * bgView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.bgView];
    self.bgView.frame = (CGRect){100,130,kwidth- 200,600};
    

    

}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [GBFDrawFilletView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.titleStr = @"这是标题";
        _bgView.titleFont = 18.7;
        _bgView.lineColor = [UIColor redColor];
        _bgView.titleClor = [UIColor orangeColor];
        _bgView.titleHeight = 30;
        _bgView.titleTop = 10;
    }
    return _bgView;
}

@end
