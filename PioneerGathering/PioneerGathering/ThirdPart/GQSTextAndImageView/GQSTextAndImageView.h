//
//  TextAndImageView.h
//  TextImage
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    ///字上图下
    GQSTextUpImageDown = 1,
    ///字下图上
    GQSTextDownImageUp = 2,
    ///字左图右
    GQSTextLeftImageRight = 3,
    ///字右图左
    GQSTextRightImageLeft = 4,
} GQSTextAndImageDirection;///图文排布方式

@interface GQSTextAndImageView : UIView

///图片尺寸，如果不赋值，则为原图大小
@property (nonatomic, assign) CGSize imageSize;
///图片文字之间的距离，若不设置，则默认为5
@property (nonatomic, assign) CGFloat padding;
///文字颜色
@property (nonatomic, assign) UIColor *textColor;
///文字字体大小
@property (nonatomic, strong) UIFont *textFont;

@property (nonatomic, strong) NSString *titleText;

@property (nonatomic, strong) NSAttributedString *attributeText;
///如果为按钮则使用此点击事件
@property (nonatomic, copy) void (^clickAction) (void);

- (instancetype)initWithFrame:(CGRect)frame Image:(UIImage *)image Text:(NSString  *)text andExhibitDirection:(NSInteger)direction isButton:(BOOL)isButton;

@end
