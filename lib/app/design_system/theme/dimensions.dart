import 'package:flutter/material.dart';

/// Global grid spacer value
double gridSpacer = 8.0;

///
/// This is the global dimensions class
///
/// which incudes manipulation of the sides
/// [left], [right], [top], [bottom]
/// [x] - left & right, [y] - top & bottom
/// [all] - left, right, top & bottom
class Dimension {
  final double spacerValue;
  final BuildContext context;
  late DimensionSide _left;
  late DimensionSide _top;
  late DimensionSide _right;
  late DimensionSide _bottom;
  late DimensionSide _x;
  late DimensionSide _y;
  late DimensionSide _all;
  late DimensionValue _value;

  Dimension(this.context, this.spacerValue) {
    _left = DimensionSide(context, spacerValue, SidesFlag(1, 0, 0, 0));
    _top = DimensionSide(context, spacerValue, SidesFlag(0, 1, 0, 0));
    _right = DimensionSide(context, spacerValue, SidesFlag(0, 0, 1, 0));
    _bottom = DimensionSide(context, spacerValue, SidesFlag(0, 0, 0, 1));
    _x = DimensionSide(context, spacerValue, SidesFlag(1, 0, 1, 0));
    _y = DimensionSide(context, spacerValue, SidesFlag(0, 1, 0, 1));
    _all = DimensionSide(context, spacerValue, SidesFlag(1, 1, 1, 1));
    _all = DimensionSide(context, spacerValue, SidesFlag(1, 1, 1, 1));
    _value = DimensionValue(context, spacerValue);
  }

  DimensionSide get left => _left;
  DimensionSide get top => _top;
  DimensionSide get right => _right;
  DimensionSide get bottom => _bottom;
  DimensionSide get x => _x;
  DimensionSide get y => _y;
  DimensionSide get all => _all;
  DimensionValue get value => _value;
  DimensionSide only({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
  }) {
    return DimensionSide(
      context,
      spacerValue,
      SidesFlag(
        left ? 1 : 0,
        top ? 1 : 0,
        right ? 1 : 0,
        bottom ? 1 : 0,
      ),
    );
  }
}

///
/// This gets us the actual side and manipulate it according to the size
///
/// this gets to
/// [spacer] - grid spacer value,
/// [sidesFlag] - left, right, top & bottom (all 4)
class DimensionSide {
  BuildContext context;
  double spacer;
  SidesFlag sidesFlag;

  DimensionSide(this.context, this.spacer, this.sidesFlag);

  EdgeInsets get none {
    return DimensionSize(spacer, sidesFlag, _Helper(context).none).data;
  }

  EdgeInsets get xxxs {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xxxs).data;
  }

  EdgeInsets get xxs {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xxs).data;
  }

  EdgeInsets get xs {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xs).data;
  }

  EdgeInsets get sm {
    return DimensionSize(spacer, sidesFlag, _Helper(context).sm).data;
  }

  EdgeInsets get md {
    return DimensionSize(spacer, sidesFlag, _Helper(context).md).data;
  }

  EdgeInsets get lg {
    return DimensionSize(spacer, sidesFlag, _Helper(context).lg).data;
  }

  EdgeInsets get xl {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xl).data;
  }

  EdgeInsets get xxl {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xxl).data;
  }

  EdgeInsets get xxxl {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xxxl).data;
  }

  EdgeInsets get xg {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xg).data;
  }

  EdgeInsets get xxg {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xxg).data;
  }

  EdgeInsets get xxxg {
    return DimensionSize(spacer, sidesFlag, _Helper(context).xxxg).data;
  }
}

///
/// This gets us the actual side and manipulate it according to the size
///
/// this gets to
/// [spacer] - grid spacer value,
/// [sidesFlag] - left, right, top & bottom (all 4)
class DimensionValue {
  BuildContext context;
  double spacer;

  DimensionValue(this.context, this.spacer);

  double get none {
    return spacer * _Helper(context).none;
  }

  double get xxxs {
    return spacer * _Helper(context).xxxs;
  }

  double get xxs {
    return spacer * _Helper(context).xxs;
  }

  double get xs {
    return spacer * _Helper(context).xs;
  }

  double get sm {
    return spacer * _Helper(context).sm;
  }

  double get md {
    return spacer * _Helper(context).md;
  }

  double get lg {
    return spacer * _Helper(context).lg;
  }

  double get xl {
    return spacer * _Helper(context).xl;
  }

  double get xxl {
    return spacer * _Helper(context).xxl;
  }

  double get xxxl {
    return spacer * _Helper(context).xxxl;
  }

  double get xg {
    return spacer * _Helper(context).xg;
  }

  double get xxg {
    return spacer * _Helper(context).xxg;
  }

  double get xxxg {
    return spacer * _Helper(context).xxxg;
  }
}

///
/// This actually does the calculation according to the spacer, sides & factor
///
/// this gets to
/// [spacer] - grid spacer value,
/// [sidesFlag] - left, right, top & bottom (all 4)
/// [factor] - (Helper class)
class DimensionSize {
  double spacer;
  SidesFlag sidesFlag;
  double factor;

  DimensionSize(this.spacer, this.sidesFlag, this.factor);

  get data => EdgeInsets.fromLTRB(
        sidesFlag.leftFlag * spacer * factor,
        sidesFlag.topFlag * spacer * factor,
        sidesFlag.rightFlag * spacer * factor,
        sidesFlag.bottomFlag * spacer * factor,
      );
}

///
/// This sets the value of the sides
///
/// this includes:
/// [left], [right], [top] & [bottom]
class SidesFlag {
  double leftFlag = 0;
  double topFlag = 0;
  double rightFlag = 0;
  double bottomFlag = 0;

  SidesFlag(this.leftFlag, this.topFlag, this.rightFlag, this.bottomFlag);
}

///
/// This helps in getting the factor for each of the specification
///
/// this gets to
/// [none] - *0,
/// [xxxs] - *0.5,
/// [xxs] - *1,
/// [xs] - *2,
/// [sm] - *3,
/// [md] - *4,
/// [lg] - *5,
/// [xl] - *6,
/// [xxl] - *7
/// [xxxl] - *8
/// [xg] - *9
/// [xxg] - *10
/// [xxxg] - *11
class _Helper {
  final BuildContext context;
  _Helper(this.context);

  double none = 0;
  double xxxs = 0.5;
  double xxs = 1;
  double xs = 2;
  double sm = 3;
  double md = 4;
  double lg = 5;
  double xl = 6;
  double xxl = 7;
  double xxxl = 8;
  double xg = 9;
  double xxg = 10;
  double xxxg = 11;
}

@Deprecated(
  'Não utilize mais este componente.'
  'Utilize CCTheme.spacer',
)
late Dimension spacer;
