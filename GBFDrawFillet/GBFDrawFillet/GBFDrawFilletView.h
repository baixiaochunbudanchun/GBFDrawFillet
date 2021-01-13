//
//  GBFDrawFilletView.h
//  GBFDrawFillet
//
//  Created by pc-D2015097 on 2021/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GBFDrawFilletView : UIView
@property (nonatomic, strong) UIColor * lineColor; //线的颜色

@property (nonatomic, strong) UIColor * titleClor; //标题的颜色
@property (nonatomic, strong) NSString * titleStr;  //标题
@property (nonatomic, assign) CGFloat  titleFont;  //标题文字大小
@property (nonatomic, assign) CGFloat  titleHeight; //文本高度，字体大小超过16需要调整
@property (nonatomic, assign) CGFloat  titleTop;  //文本高度，字体大小超过16需要调整
@end

NS_ASSUME_NONNULL_END
