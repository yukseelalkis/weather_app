part of '../view/widget/drop_down_widget/drop_down_widget.dart';

class _DropdownHeaderWidget extends StatelessWidget {
  _DropdownHeaderWidget({
    required this.selectedCity,
  });

  final String? selectedCity;

  // BoxDecoration boxDecorationDark = BoxDecoration(
  //   // arka plan theme ayari yapilacak
  //   color: Colors.black, // Arka planı siyah yap
  //   borderRadius: BorderRadius.circular(12), // Kenarları yuvarlat
  //   border: Border.all(color: Colors.white, width: 1), // Beyaz çerçeve
  //   boxShadow: [
  //     BoxShadow(
  //       color: Colors.white.withOpacity(0.1), // Hafif gölge efekti
  //       spreadRadius: 1,
  //       blurRadius: 8,
  //     ),
  //   ],
  // );
  // BoxDecoration boxDecorationLigth = BoxDecoration(
  //   // arka plan theme ayari yapilacak
  //   color: Colors.white, // Arka planı siyah yap
  //   borderRadius: BorderRadius.circular(12), // Kenarları yuvarlat
  //   border: Border.all(color: Colors.black, width: 1), // Beyaz çerçeve
  //   boxShadow: [
  //     BoxShadow(
  //       color: Colors.white.withOpacity(0.1), // Hafif gölge efekti
  //       spreadRadius: 1,
  //       blurRadius: 8,
  //     ),
  //   ],
  // );

  ///
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.symetric(),
      child: Container(
        width: 200,
        padding: const PagePadding.symetric(),
        decoration: BoxDecoration(
          // arka plan theme ayari yapilacak
          color: context.watch<ThemeNotifer>().isLighTheme
              ? Colors.black
              : Colors.white, // Arka planı siyah yap
          borderRadius: BorderRadius.circular(12), // Kenarları yuvarlat
          border: Border.all(color: Colors.black, width: 1), // Beyaz çerçeve
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1), // Hafif gölge efekti
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedCity ?? ProjectStringItems.selectCity,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.watch<ThemeNotifer>().isLighTheme
                          ? Colors.white
                          : Colors.black,
                    )),
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
      width: 200,
      padding: const PagePadding.symetric(),
      decoration: BoxDecoration(
        color: context.watch<ThemeNotifer>().isLighTheme
            ? Colors.black
            : Colors.white, //, // Arka planı siyah yap
        borderRadius: BorderRadius.circular(12), // Kenarları yuvarlat
        border: Border.all(color: Colors.white, width: 1), // Beyaz çerçeve
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1), // Hafif gölge efekti
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
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
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: context.watch<ThemeNotifer>().isLighTheme
                                ? Colors.white
                                : Colors.black,
                          ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
