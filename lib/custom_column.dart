import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomColumnParentData extends ContainerBoxParentData<RenderBox> {
  int? flex;
}

class RenderCustomColumn extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, CustomColumnParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, CustomColumnParentData> {
  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! CustomColumnParentData) {
      child.parentData = CustomColumnParentData();
    }
  }
}

class CustomColumn extends MultiChildRenderObjectWidget {
  CustomColumn({
    Key? key,
    List<Widget> children = const [],
  }) : super(
          key: key,
          children: children,
        );

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomColumn();
  }
}
