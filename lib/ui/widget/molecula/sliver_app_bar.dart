import 'package:flutter/material.dart';

class SliverAppBarComponent extends StatefulWidget {
  final Widget hiddenChild;
  final Widget expandedChild;

  const SliverAppBarComponent({
    Key key,
    @required this.hiddenChild,
    @required this.expandedChild,
  }) : super(key: key);

  @override
  _SliverAppBarComponentState createState() => _SliverAppBarComponentState();
}

class _SliverAppBarComponentState extends State<SliverAppBarComponent> {
  ScrollPosition _position;
  bool _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType();
    var visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      _visible ? widget.hiddenChild : widget.expandedChild;
}
