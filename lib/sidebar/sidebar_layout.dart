import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebar_animation_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:sidebar_animation_flutter/pages/homepage.dart';
import 'package:sidebar_animation_flutter/pages/myaccountspage.dart';
import 'package:sidebar_animation_flutter/pages/myorderspage.dart';

import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                if (navigationState is MyAccountsPage) {
                  return MyAccountsPage();
                } else if (navigationState is HomePage) {
                  return HomePage();
                } else if (navigationState is MyOrdersPage) {
                  return MyOrdersPage();
                }
                return Container();
              },
            ),
            const SideBar(),
          ],
        ),
      ),
    );
  }
}
