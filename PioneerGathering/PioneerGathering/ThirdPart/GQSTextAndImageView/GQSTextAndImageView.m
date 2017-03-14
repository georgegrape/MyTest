//
//  TextAndImageView.m
//  TextImage
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "GQSTextAndImageView.h"
#import "Masonry.h"

@interface GQSTextAndImageView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) UIButton *clickButton;

@property (nonatomic, assign) NSInteger direction;

@property (nonatomic, assign) BOOL isButton;

@end

@implementation GQSTextAndImageView

- (instancetype)initWithFrame:(CGRect)frame Image:(UIImage *)image Text:(NSString  *)text andExhibitDirection:(NSInteger)direction isButton:(BOOL)isButton {
    if (self = [super init]) {
        [self setupViewWithImage:image Text:text andExhibitDirection:direction isButton:isButton];
    }
    return self;
}

- (void)setupViewWithImage:(UIImage *)image
                      Text:(NSString *)text
       andExhibitDirection:(NSInteger)direction
                  isButton:(BOOL)isButton {
    
    self.direction = direction;
    self.isButton = isButton;
    self.imageView.image = image;
    self.textLabel.text = text;
    if (isButton) {
        [self addSubview:self.clickButton];
    }
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        [self addSubview:_textLabel];
    }
    return _textLabel;
}

- (UIButton *)clickButton {
    if (!_clickButton) {
        _clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _clickButton.backgroundColor = [UIColor clearColor];
        [_clickButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    switch (self.direction) {
        case GQSTextUpImageDown:///字上图下
        {
            [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.mas_centerX);
                make.top.equalTo(self.mas_top);
            }];
            
            if (self.padding == 0) {
                if (self.imageSize.width != 0 && self.imageSize.height != 0) {
                    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(self.textLabel.mas_bottom).offset(5);
                        make.centerX.equalTo(self.mas_centerX);
                        make.width.mas_equalTo(self.imageSize.width);
                        make.height.mas_equalTo(self.imageSize.height);
                    }];
                } else {
                    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(self.textLabel.mas_bottom).offset(5);
                        make.centerX.equalTo(self.mas_centerX);
                    }];
                }
                
                [self.textLabel layoutIfNeeded];
                [self.imageView layoutIfNeeded];
                
                if (self.textLabel.frame.size.width > self.imageView.frame.size.width) {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.textLabel.frame.size.width);
                        make.height.mas_equalTo(self.textLabel.frame.size.height + self.imageView.frame.size.height + 5);
                    }];
                } else {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.imageView.frame.size.width);
                        make.height.mas_equalTo(self.textLabel.frame.size.height + self.imageView.frame.size.height + 5);
                    }];
                }
                
            } else {
                if (self.imageSize.width != 0 && self.imageSize.height != 0) {
                    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(self.textLabel.mas_bottom).offset(self.padding);
                        make.centerX.equalTo(self.mas_centerX);
                        make.width.mas_equalTo(self.imageSize.width);
                        make.height.mas_equalTo(self.imageSize.height);
                    }];
                } else {
                    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(self.textLabel.mas_bottom).offset(self.padding);
                        make.centerX.equalTo(self.mas_centerX);
                    }];
                }
                
                [self.textLabel layoutIfNeeded];
                [self.imageView layoutIfNeeded];
                
                if (self.textLabel.frame.size.width > self.imageView.frame.size.width) {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.textLabel.frame.size.width);
                        make.height.mas_equalTo(self.textLabel.frame.size.height + self.imageView.frame.size.height + self.padding);
                    }];
                } else {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.imageView.frame.size.width);
                        make.height.mas_equalTo(self.textLabel.frame.size.height + self.imageView.frame.size.height + self.padding);
                    }];
                }
            }
            
        }
        break;
        
        case GQSTextDownImageUp:///字下图上
        {
            [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.mas_centerX);
                make.bottom.equalTo(self.mas_bottom);
            }];
            
            if (self.padding == 0) {
                if (self.imageSize.width != 0 && self.imageSize.height != 0) {
                    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.equalTo(self.textLabel.mas_top).offset(-5);
                        make.centerX.equalTo(self.mas_centerX);
                        make.width.mas_equalTo(self.imageSize.width);
                        make.height.mas_equalTo(self.imageSize.height);
                    }];
                } else {
                    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.equalTo(self.textLabel.mas_top).offset(-5);
                        make.centerX.equalTo(self.mas_centerX);
                    }];
                }
                
                [self.textLabel layoutIfNeeded];
                [self.imageView layoutIfNeeded];
                
                if (self.textLabel.frame.size.width > self.imageView.frame.size.width) {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.textLabel.frame.size.width);
                        make.height.mas_equalTo(self.textLabel.frame.size.height + self.imageView.frame.size.height + 5);
                    }];
                } else {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.imageView.frame.size.width);
                        make.height.mas_equalTo(self.textLabel.frame.size.height + self.imageView.frame.size.height + 5);
                    }];
                }
                
            } else {
                if (self.imageSize.width != 0 && self.imageSize.height != 0) {
                    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.equalTo(self.textLabel.mas_top).offset(-self.padding);
                        make.centerX.equalTo(self.mas_centerX);
                        make.width.mas_equalTo(self.imageSize.width);
                        make.height.mas_equalTo(self.imageSize.height);
                    }];
                } else {
                    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.equalTo(self.textLabel.mas_top).offset(self.padding);
                        make.centerX.equalTo(self.mas_centerX);
                    }];
                }
                
                [self.textLabel layoutIfNeeded];
                [self.imageView layoutIfNeeded];
                
                if (self.textLabel.frame.size.width > self.imageView.frame.size.width) {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.textLabel.frame.size.width);
                        make.height.mas_equalTo(self.textLabel.frame.size.height + self.imageView.frame.size.height + self.padding);
                    }];
                } else {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.imageView.frame.size.width);
                        make.height.mas_equalTo(self.textLabel.frame.size.height + self.imageView.frame.size.height + self.padding);
                    }];
                }
            }
        }
        break;
        
        case GQSTextLeftImageRight:///字左图右
        {
            if (self.imageSize.width != 0 && self.imageSize.height != 0) {
                [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.mas_centerY);
                    make.right.equalTo(self.mas_right);
                    make.width.mas_equalTo(self.imageSize.width);
                    make.height.mas_equalTo(self.imageSize.height);
                }];
            } else {
                [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.mas_centerY);
                    make.right.equalTo(self.mas_right);
                }];
            }
            
            if (self.padding == 0) {
                [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.mas_centerY);
                    make.right.equalTo(self.imageView.mas_left).offset(-5);
                }];
                
                [self.textLabel layoutIfNeeded];
                [self.imageView layoutIfNeeded];
                
                if (self.textLabel.frame.size.height > self.imageView.frame.size.height) {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.textLabel.frame.size.width + self.imageView.frame.size.width + 5);
                        make.height.mas_equalTo(self.textLabel.frame.size.height);
                    }];
                } else {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.imageView.frame.size.width + self.textLabel.frame.size.width + 5);
                        make.height.mas_equalTo(self.imageView.frame.size.height);
                    }];
                }
                
            } else {
                [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.mas_centerY);
                    make.right.equalTo(self.imageView.mas_left).offset(-self.padding);
                }];
                
                [self.textLabel layoutIfNeeded];
                [self.imageView layoutIfNeeded];
                
                if (self.textLabel.frame.size.height > self.imageView.frame.size.height) {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.textLabel.frame.size.width + self.imageView.frame.size.width + self.padding);
                        make.height.mas_equalTo(self.textLabel.frame.size.height);
                    }];
                } else {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.imageView.frame.size.width + self.textLabel.frame.size.width + self.padding);
                        make.height.mas_equalTo(self.imageView.frame.size.height);
                    }];
                }
            }
            
        }
        break;
        
        case GQSTextRightImageLeft:///字右图左
        {
            if (self.imageSize.width != 0 && self.imageSize.height != 0) {
                [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.mas_centerY);
                    make.left.equalTo(self.mas_left);
                    make.width.mas_equalTo(self.imageSize.width);
                    make.height.mas_equalTo(self.imageSize.height);
                }];
            } else {
                [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.mas_centerY);
                    make.left.equalTo(self.mas_left);
                }];
            }
            
            if (self.padding == 0) {
                [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.mas_centerY);
                    make.left.equalTo(self.imageView.mas_right).offset(5);
                }];
                
                [self.textLabel layoutIfNeeded];
                [self.imageView layoutIfNeeded];
                
                if (self.textLabel.frame.size.height > self.imageView.frame.size.height) {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.textLabel.frame.size.width + self.imageView.frame.size.width + 5);
                        make.height.mas_equalTo(self.textLabel.frame.size.height);
                    }];
                } else {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.imageView.frame.size.width + self.textLabel.frame.size.width + 5);
                        make.height.mas_equalTo(self.imageView.frame.size.height);
                    }];
                }
                
            } else {
                [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.mas_centerY);
                    make.left.equalTo(self.imageView.mas_right).offset(self.padding);
                }];
                
                [self.textLabel layoutIfNeeded];
                [self.imageView layoutIfNeeded];
                
                if (self.textLabel.frame.size.height > self.imageView.frame.size.height) {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.textLabel.frame.size.width + self.imageView.frame.size.width + self.padding);
                        make.height.mas_equalTo(self.textLabel.frame.size.height);
                    }];
                } else {
                    [self mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(self.imageView.frame.size.width + self.textLabel.frame.size.width + self.padding);
                        make.height.mas_equalTo(self.imageView.frame.size.height);
                    }];
                }
                
            }
        }
        break;
        
        default:
        break;
    }
    
    if (self.isButton) {
        [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self);
        }];
    }
}

- (void)buttonClicked {
    if (self.clickAction) {
        self.clickAction();
    }
}

- (void)setImageSize:(CGSize)imageSize {
    _imageSize = imageSize;
}

- (void)setPadding:(CGFloat)padding {
    _padding = padding;
}

- (void)setTextColor:(UIColor *)textColor {
    self.textLabel.textColor = textColor;
}

- (void)setTextFont:(UIFont *)textFont {
    self.textLabel.font = textFont;
}

- (void)setTitleText:(NSString *)titleText {
    self.textLabel.text = titleText;
}

- (void)setAttributeText:(NSAttributedString *)attributeText {
    self.textLabel.attributedText = attributeText;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
