//
//  GBFDrawFilletView.m
//  GBFDrawFillet
//
//  Created by pc-D2015097 on 2021/1/13.
//

#import "GBFDrawFilletView.h"

#define kwidth  [UIScreen mainScreen].bounds.size.width
#define Kheight  [UIScreen mainScreen].bounds.size.height
#define BioColor16(s)  [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]
@implementation GBFDrawFilletView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineColor = BioColor16(0xdddddd);
        self.titleClor = BioColor16(0x999999);
        self.titleStr = @"这里是标题";
        self.titleFont = 13.f;
        self.titleTop = 5;
        self.titleHeight = 20;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self drawView];
}


- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
}

- (void)setTitleClor:(UIColor *)titleClor{
    _titleClor = titleClor;
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
}

- (void)setTitleFont:(CGFloat)titleFont{
    _titleFont = titleFont;
}

-(void)drawView{
    
    CGFloat titleWidth = [self resultWidthWith:self.titleStr fontSize:self.titleFont height:20]+30;
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor =  self.lineColor.CGColor;      //虚线的颜色
    border.fillColor = [UIColor clearColor].CGColor;      //填充的颜色
    CGRect bound11 = (CGRect){self.bounds.origin.x+1,self.bounds.origin.y+20,self.bounds.size.width-2,self.bounds.size.height-21};
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bound11 cornerRadius:20];  //设置路径
    border.path = path.CGPath;
    border.frame = self.bounds;
    //虚线的宽度
    border.lineWidth = 2.2f;
    //虚线的间隔
    border.lineDashPattern = @[@9, @3];
    self.layer.cornerRadius = 20.f;
    self.layer.masksToBounds = YES;
    [self.layer addSublayer:border];
    
    CGRect boundsLeft = (CGRect){self.bounds.origin.x+30,self.bounds.origin.y+15,10,10};
    CGFloat radius = 10; // 圆角大小
    UIBezierPath * pathleft = [UIBezierPath bezierPathWithRoundedRect:boundsLeft byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.strokeColor =  self.lineColor.CGColor;
    maskLayer.fillColor = self.lineColor.CGColor;
    maskLayer.path = pathleft.CGPath;
    [self.layer addSublayer:maskLayer];
    
    CGRect boundsRight = (CGRect){self.bounds.origin.x+titleWidth+40,self.bounds.origin.y+15,10,10};
    UIBezierPath * pathRight = [UIBezierPath bezierPathWithRoundedRect:boundsRight byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayerR = [[CAShapeLayer alloc] init];
    maskLayerR.frame = self.bounds;
    maskLayerR.strokeColor =  self.lineColor.CGColor;
    maskLayerR.fillColor = self.lineColor.CGColor;
    maskLayerR.path = pathRight.CGPath;
    [self.layer addSublayer:maskLayerR];
  
//
    CATextLayer *textlayer = [CATextLayer layer];
    textlayer.frame = (CGRect){boundsLeft.origin.x+10,boundsLeft.origin.y-self.titleTop,titleWidth,self.titleHeight};
    textlayer.foregroundColor = self.titleClor.CGColor;

    textlayer.fontSize = self.titleFont;
    textlayer.string = self.titleStr;
    textlayer.backgroundColor = [UIColor whiteColor].CGColor;
    textlayer.alignmentMode = kCAAlignmentCenter;
    [self.layer addSublayer:textlayer];
}

- (CGFloat)resultWidthWith:(NSString *)string fontSize:(NSInteger)fontSize height:(CGFloat)height{
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:self.titleFont]};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

@end
