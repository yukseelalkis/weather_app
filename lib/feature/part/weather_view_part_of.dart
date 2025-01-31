part of '../view/weather_view.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({
    super.key,
    required this.lottiePath,
    this.size = 75.0,
  });

  final String lottiePath;
  final double size;

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isLightTheme = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await controller.animateTo(isLightTheme ? 0.5 : 1);
        setState(() {
          isLightTheme = !isLightTheme;
        });
        context.read<ThemeNotifer>().changeTheme();
      },
      child: Lottie.asset(
        widget.lottiePath,
        repeat: false,
        controller: controller,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.contain,
      ),
    );
  }
}
