//
//  BARoundCornerCell.m
//  demoTest
//
//  Created by 博爱 on 16/4/8.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BARoundCornerCell.h"

#define BARoundCornerCellReuseId @"BAKRoundCornerCellID"

typedef NS_ENUM(NSInteger, BARoundCornerCellType) {
    BARoundCornerCellTypeTop,
    BARoundCornerCellTypeCenter,
    BARoundCornerCellTypeBootom,
    BARoundCornerCellTypeAll,
};

@interface BARoundCornerCell ()

@property (nonatomic, strong) NSIndexPath            *indexPath;
@property (nonatomic, weak  ) UITableView            *tableView;
@property (nonatomic, assign) CGFloat                 radius;
@property (nonatomic, strong) UIColor                *fillColor;
@property (nonatomic, assign) BARoundCornerCellType   cellType;

@property (nonatomic, strong) CAShapeLayer           *strokeLayer;

@end

@implementation BARoundCornerCell

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [super setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style radius:(CGFloat)radius indexPath:(NSIndexPath *)indexPath {
    return [self cellWithTableView:tableView style:style radius:radius indexPath:indexPath strokeLineWidth:0 strokeColor:nil];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style radius:(CGFloat)radius indexPath:(NSIndexPath *)indexPath strokeLineWidth:(CGFloat)lineWidth strokeColor:(UIColor *)strokeColor {
    BARoundCornerCell *cell = [tableView dequeueReusableCellWithIdentifier:BARoundCornerCellReuseId];
    if (!cell) {
        cell = [[BARoundCornerCell alloc] initWithStyle:style reuseIdentifier:BARoundCornerCellReuseId];
        cell.radius = radius;
        cell.tableView = tableView;
        
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        
        // cell默认颜色为白色
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    if (lineWidth > 0) {
        cell.strokeLayer.lineWidth = lineWidth;
        cell.strokeLayer.strokeColor = strokeColor ? strokeColor.CGColor : [UIColor grayColor].CGColor;
    }
    
    cell.indexPath = indexPath;
    return cell;
}

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:frame];
    CAShapeLayer *shapeLayer = ((CAShapeLayer *)(self.layer));
    shapeLayer.path = [self bezierPathWithCellType:[self cellType] width:frame.size.width height:frame.size.height].CGPath;
    self.strokeLayer.path = [self strokePathWithCellType:[self cellType] width:frame.size.width height:frame.size.height].CGPath;
    
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    if (_indexPath != indexPath) {
        _indexPath = indexPath;
        
        [self autoSetCellType];
    }
    
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    
    if (_fillColor != backgroundColor) {
        _fillColor = backgroundColor;
        ((CAShapeLayer *)(self.layer)).fillColor = _fillColor.CGColor;
    }
}

- (UIColor *)backgroundColor {
    return _fillColor;
}

- (UIColor *)fillColor {
    if (!_fillColor) {
        // 默认cell背景色为白色
        _fillColor = [UIColor whiteColor];
    }
    return _fillColor;
}


- (void)autoSetCellType {
    if ([_tableView numberOfRowsInSection:self.indexPath.section] == 1) {
        self.cellType = BARoundCornerCellTypeAll;
    } else if (self.indexPath.row == 0) {
        self.cellType = BARoundCornerCellTypeTop;
    } else if (self.indexPath.row == [_tableView numberOfRowsInSection:self.indexPath.section] - 1) {
        self.cellType = BARoundCornerCellTypeBootom;
    } else {
        self.cellType = BARoundCornerCellTypeCenter;
    }
}

#pragma mark - BezierPath

- (UIBezierPath *)bezierPathWithCellType:(BARoundCornerCellType)cellType width:(CGFloat)width height:(CGFloat)height {
    UIBezierPath *bezierPath;
    switch (self.cellType) {
        case BARoundCornerCellTypeAll: {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, width, height) cornerRadius:self.radius];
            
            break;
        }
        case BARoundCornerCellTypeTop: {
            bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint:CGPointMake(0, self.radius)];
            [bezierPath addArcWithCenter:CGPointMake(self.radius, self.radius) radius:self.radius startAngle:M_PI endAngle:-M_PI_2 clockwise:YES];
            [bezierPath addLineToPoint:CGPointMake(width - self.radius, 0)];
            [bezierPath addArcWithCenter:CGPointMake(width - self.radius, self.radius) radius:self.radius startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [bezierPath addLineToPoint:CGPointMake(width, height)];
            [bezierPath addLineToPoint:CGPointMake(0, height)];
            [bezierPath addLineToPoint:CGPointMake(0, self.radius)];
            [bezierPath closePath];
            break;
        }
        case BARoundCornerCellTypeBootom: {
            bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint:CGPointMake(0, height - self.radius)];
            [bezierPath addArcWithCenter:CGPointMake(self.radius, height - self.radius) radius:self.radius startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
            [bezierPath addLineToPoint:CGPointMake(width - self.radius, height)];
            [bezierPath addArcWithCenter:CGPointMake(width - self.radius, height - self.radius) radius:self.radius startAngle:M_PI_2 endAngle:0 clockwise:NO];
            [bezierPath addLineToPoint:CGPointMake(width, 0)];
            [bezierPath addLineToPoint:CGPointMake(0, 0)];
            [bezierPath addLineToPoint:CGPointMake(0, height - self.radius)];
            [bezierPath closePath];
            break;
        }
        case BARoundCornerCellTypeCenter: {
            bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, width, height)];
            break;
        }
        default:
            break;
    }
    return bezierPath;
}

- (UIBezierPath *)strokePathWithCellType:(BARoundCornerCellType)cellType width:(CGFloat)width height:(CGFloat)height {
    UIBezierPath *bezierPath;
    
    CGFloat lineWidth = self.strokeLayer.lineWidth;
    if (lineWidth <= 0) {
        return nil;
    }
    
    switch (self.cellType) {
        case BARoundCornerCellTypeAll: {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(lineWidth / 2.f, lineWidth / 2.f, width - lineWidth, height - lineWidth) cornerRadius:(self.radius - lineWidth / 2.f)];
            
            break;
        }
        case BARoundCornerCellTypeTop: {
            bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint:CGPointMake(lineWidth / 2.f, height)];
            [bezierPath addLineToPoint:CGPointMake(lineWidth / 2.f, self.radius)];
            [bezierPath addArcWithCenter:CGPointMake(self.radius, self.radius) radius:(self.radius - lineWidth / 2.f) startAngle:M_PI endAngle:-M_PI_2 clockwise:YES];
            [bezierPath addLineToPoint:CGPointMake(width - self.radius, lineWidth / 2.f)];
            [bezierPath addArcWithCenter:CGPointMake(width - self.radius, self.radius) radius:(self.radius - lineWidth / 2.f) startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [bezierPath addLineToPoint:CGPointMake(width - lineWidth / 2.f, height)];
            
            break;
        }
        case BARoundCornerCellTypeBootom: {
            bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint:CGPointMake(lineWidth / 2.f, 0)];
            [bezierPath addLineToPoint:CGPointMake(lineWidth / 2.f, height - self.radius)];
            [bezierPath addArcWithCenter:CGPointMake(self.radius, height - self.radius) radius:(self.radius - lineWidth / 2.f) startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
            [bezierPath addLineToPoint:CGPointMake(width - self.radius, height - lineWidth / 2.f)];
            [bezierPath addArcWithCenter:CGPointMake(width - self.radius, height - self.radius) radius:(self.radius - lineWidth / 2.f) startAngle:M_PI_2 endAngle:0 clockwise:NO];
            [bezierPath addLineToPoint:CGPointMake(width - lineWidth / 2.f, 0)];
            break;
        }
        case BARoundCornerCellTypeCenter: {
            bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint:CGPointMake(lineWidth / 2.f, 0)];
            [bezierPath addLineToPoint:CGPointMake(lineWidth / 2.f, height)];
            
            [bezierPath moveToPoint:CGPointMake(width - lineWidth / 2.f, 0)];
            [bezierPath addLineToPoint:CGPointMake(width - lineWidth / 2.f, height)];
            break;
        }
        default:
            break;
    }
    return bezierPath;

}


- (CAShapeLayer *)strokeLayer {
    if (!_strokeLayer) {
        _strokeLayer = [CAShapeLayer layer];
        _strokeLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:_strokeLayer];
    }
    return _strokeLayer;
}

@end
