import 'package:flutter/material.dart';

class CustomExpanded extends ParentDataWidget {
  const CustomExpanded({
    Key? key,
    this.flex = 1,
    required Widget child,
  })  : assert(flex > 0),
        super(key: key, child: child);

  final int flex;

  @override
  void applyParentData(RenderObject renderObject) {
    // TODO: implement applyParentData
  }

  @override
  // TODO: implement debugTypicalAncestorWidgetClass
  Type get debugTypicalAncestorWidgetClass => throw UnimplementedError();
}
