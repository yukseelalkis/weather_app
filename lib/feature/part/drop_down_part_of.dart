part of '../view/widget/drop_down_widget/view/drop_down_widget.dart';

class _DropdownHeaderWidget extends StatelessWidget {
  const _DropdownHeaderWidget({
    required this.selectedCity,
  });

  final String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.halfAll(),
      child: Container(
        padding: const PagePadding.symetric(),
        decoration: AppStyle.getDropdownBoxDecoration(
          context.watch<ThemeNotifer>().isLighTheme,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedCity ?? ProjectStringItems.selectCity,
                style: Theme.of(context).textTheme.bodyMedium
                // const TextStyle(
                //   fontSize: AppStyle.textBodyMediumSize,
                //   color: ProjectItemColors.textColor, // Daha okunaklı renk
                //   fontWeight: FontWeight.w500,
                // ),
                ),
            const Icon(
              Icons.arrow_drop_down,
              color: ProjectItemColors.textColor, // İkon için de renk ayarı
            ),
          ],
        ),
      ),
    );
  }
}

class _DropdownListWidget extends StatelessWidget {
  final CitiesModel? cities;
  final Function(String) onCitySelected;
  final Function() closeDropdown;

  const _DropdownListWidget({
    required this.cities,
    required this.onCitySelected,
    required this.closeDropdown,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const PagePadding.top(),
      padding: const PagePadding.symetric(),
      decoration:
          AppStyle.getGradientBoxDecoration(context.watch<ThemeNotifer>().isLighTheme),
      height: AppStyle.dropdownContainer,
      child: cities == null
          ? const Center(
              child: CircularProgressIndicator(
                color: ProjectItemColors.accentColor, // Vurgu rengi
              ),
            )
          : ListView.builder(
              itemCount: cities?.data?.length ?? 0,
              itemBuilder: (context, index) {
                final city = cities!.data![index];
                return GestureDetector(
                  onTap: () {
                    onCitySelected(city.name ?? ProjectStringItems.baseCity);
                    closeDropdown(); // Dropdown'ı kapatmak için çağrılır.
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      city.name ?? ProjectStringItems.unknow,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
