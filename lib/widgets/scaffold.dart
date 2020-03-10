import 'package:acs_upb_mobile/generated/l10n.dart';
import 'package:acs_upb_mobile/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final bool enableMenu;
  final IconData menuIcon;
  final String menuRoute;
  final String menuName;
  final Widget floatingActionButton;

  AppScaffold(
      {this.body,
      this.title,
      this.enableMenu = false,
      this.menuIcon = Icons.settings,
      this.menuRoute = Routes.settings,
      this.menuName,  // By default, S.of(context).navigationSettings
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: body ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Image(
                        image: AssetImage(
                            'assets/illustrations/undraw_under_construction.png')),
                  ),
                ),
                SizedBox(height: 10),
                Text('Under construction', style: Theme.of(context).textTheme.headline6,)
              ],
            ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text(title),
          centerTitle: true,
          toolbarOpacity: 0.8,
          actions: <Widget>[
            enableMenu
                ? Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Tooltip(
                      message: menuName ?? S.of(context).navigationSettings,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, menuRoute);
                        },
                        child: Icon(
                          menuIcon,
                          size: 26.0,
                        ),
                      ),
                    ))
                : Container(),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
