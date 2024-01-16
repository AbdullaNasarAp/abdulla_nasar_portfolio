import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HoverZoomWidget extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;

  HoverZoomWidget({required this.imagePath, required this.onTap});

  @override
  _HoverZoomWidgetState createState() => _HoverZoomWidgetState();
}

class _HoverZoomWidgetState extends State<HoverZoomWidget> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_scale),
          child: SvgPicture.asset(
            widget.imagePath,
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _scale = isHovered ? 1.2 : 1.0;
    });
  }
}

class HoverZoomWidgetForMobile extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;

  const HoverZoomWidgetForMobile(
      {super.key, required this.imagePath, required this.onTap});

  @override
  _HoverZoomWidgetForMobileState createState() =>
      _HoverZoomWidgetForMobileState();
}

class _HoverZoomWidgetForMobileState extends State<HoverZoomWidgetForMobile> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_scale),
          child: SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              widget.imagePath,
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _scale = isHovered ? 0.9 : 0.8;
    });
  }
}

class HoverZoomWidgetForMobilevery extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;

  const HoverZoomWidgetForMobilevery(
      {super.key, required this.imagePath, required this.onTap});

  @override
  _HoverZoomWidgetForMobileveryState createState() =>
      _HoverZoomWidgetForMobileveryState();
}

class _HoverZoomWidgetForMobileveryState
    extends State<HoverZoomWidgetForMobilevery> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_scale),
          child: SizedBox(
            height: 15,
            width: 15,
            child: SvgPicture.asset(
              widget.imagePath,
              width: 15,
              height: 15,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _scale = isHovered ? 0.9 : 0.8;
    });
  }
}

class HoverZoom extends StatefulWidget {
  final Widget hover;

  const HoverZoom({
    super.key,
    required this.hover,
  });

  @override
  _HoverZoomState createState() => _HoverZoomState();
}

class _HoverZoomState extends State<HoverZoom> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.identity()..scale(_scale),
            child: widget.hover),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _scale = isHovered ? 1.0 : 0.95;
    });
  }
}

class Skill {
  final String name;
  final double progress;

  Skill({required this.name, required this.progress});
}
