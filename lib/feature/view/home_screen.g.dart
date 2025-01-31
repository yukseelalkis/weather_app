part of 'home_screen.dart';

class _Filter extends StatelessWidget {
  const _Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
      child: Container(),
    );
  }
}

class _TopContainer extends StatelessWidget {
  const _TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1.2),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
      ),
    );
  }
}

class _LeftContainer extends StatelessWidget {
  const _LeftContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-4, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xFF673AB7)),
      ),
    );
  }
}

class _RightContainer extends StatelessWidget {
  const _RightContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(3, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.deepPurple),
      ),
    );
  }
}

class NewIconWeather extends StatelessWidget {
  final String iconCode; // OpenWeather'dan gelen "icon" kodu

  const NewIconWeather({
    super.key,
    required this.iconCode,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.shadoeDecoration, // Gölge dekorasyonu
      child: Image.asset(
        'assets/newIcon/$iconCode.png',
        scale: 3,
      ),
    );
  }
}

class WeatherInfoRow extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;

  const WeatherInfoRow({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(iconPath, scale: 8),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
