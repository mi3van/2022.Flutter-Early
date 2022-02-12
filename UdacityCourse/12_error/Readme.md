In this exercise, you'll add code to show error UI when the API can't be reached.

- Goal

Show error UI when the API can't be reached.

- Steps

Fill out the TODOs in unit_converter.dart,category_route.dart, and category_tile.dart using the specs below.
It's time to celebrate, because you're done.

- Specs

When the device is not connected to the internet (e.g. if using an emulator, turn off the Wi-Fi), and the user is viewing the Currency UnitConverter, show an error UI when they type in a number.
Even though the unit converter doesn't work for the Currency category when there is no Wi-Fi, it should still work for the other Categories.
When the device is not connected to the internet and the user is in the Category list view, tapping on the Currency CategoryTile should not take them to the UnitConverter.