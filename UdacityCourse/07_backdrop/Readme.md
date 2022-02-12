In this exercise, you'll use a Backdrop widget to make navigation feel smoother.

- Goal

Use a Backdrop widget to make navigation feel smoother.

- Steps

Take a look at the provided Backdrop widget in the starter code. You should pass in the objects and widgets needed in its constructor. Note that we've renamed the ConverterRoute to UnitConverter, since we do not use a Navigator and routes, when using a Backdrop. For Category, we've also separated the logic between the data and the UI widget itself, into Category, and CategoryTile. The UnitConverter now takes in a Category in its constructor rather than a name, color, and icon.
Fill out the TODOs in category_route.dart. Specifically, you'll be using the provided Backdrop widget.
Fill out the TODO in category_tile.dart. You'll remove the Navigator code since the Backdrop is now responsible for showing and hiding the unit conversion view. The CategoryTile widget takes in an onTap function, and you should use it to bring up the unit conversion view.
Note that with the Backdrop, the units never change in the Dropdowns, when you switch Categories. This is because the DropdownMenuItems are only being set in initState(), which is only being called once per app start. You'll want to also set the DropdownMenuItems, and the defaults, each time the user switches Categories. Resolve this within unit_converter.dart.
You may see some black and yellow overflow lines, accompanied by a message regarding RenderFlex. This is fine, as we'll resolve this in the next coding exercise.

- Specs

The default Category is 'Length'; when you open the app, the unit converter for 'Length' will already be showing.
The front panel should show the unit converter for the currently-selected Category. While the front panel is up, the text at the top of the app (title) should say 'Unit Converter'.
Tapping on the 'clear' icon in the top right corner should bring you to the list of Categories. When in this list, the text at the top of the app (title) should say 'Select a Category'.
The back panel color depends on the color from the Category.
The bottom padding for the back panel should be 48.0, to give it space for the bottom tab.
If a user types in an input value, the value should not be cleared when the user closes and re-opens the front panel.