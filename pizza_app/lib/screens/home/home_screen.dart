import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/controllers/home_controller.dart';
import 'package:pizza_app/models/product.dart';
import 'package:pizza_app/screens/deatils/details_screen.dart';
import 'package:pizza_app/screens/home/components/cart_detail_view.dart';
import 'package:pizza_app/screens/home/components/home_header.dart';
import 'package:pizza_app/screens/home/components/product_card.dart';

import 'components/cart_short_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    void onVerticalGestor(DragUpdateDetails details) {
      if (details.primaryDelta! < -0.7) {
        controller.changeHomeState(HomeState.cart);
      } else if (details.primaryDelta! > 12) {
        controller.changeHomeState(HomeState.normal);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      /*   AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -headerHeight,
                        right: 0,
                        left: 0,
                        height: headerHeight,
                        child: const HomeHeader(),
                      ),*/
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? headerHeight
                            : -(constraints.maxHeight -
                                carteBarHeight * 2 -
                                headerHeight),
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight -
                            headerHeight -
                            carteBarHeight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(defaultPadding * 1.5),
                              bottomRight:
                                  Radius.circular(defaultPadding * 1.5),
                            ),
                          ),
                          child: GridView.builder(
                            itemCount: demoProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: defaultPadding,
                              crossAxisSpacing: defaultPadding,
                            ),
                            itemBuilder: (context, index) => ProductCard(
                              product: demoProducts[index],
                              press: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 500),
                                    pageBuilder: ((context, animation,
                                            secondaryAnimation) =>
                                        FadeTransition(
                                          opacity: animation,
                                          child: DetailsScreen(
                                            product: demoProducts[index],
                                            onProductAdd: () {
                                              controller.addProductToCart(
                                                  demoProducts[index]);
                                            },
                                          ),
                                        )),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      //Card Panel
                      AnimatedPositioned(
                        duration: panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: controller.homeState == HomeState.normal
                            ? carteBarHeight
                            : (constraints.maxHeight - carteBarHeight),
                        child: GestureDetector(
                          onVerticalDragUpdate: onVerticalGestor,
                          child: controller.homeState == HomeState.normal
                              ? CartShortView(controller: controller)
                              : CartDetailsView(controller: controller),
                        ),
                      ),
                      //Header
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -headerHeight,
                        right: 0,
                        left: 0,
                        height: headerHeight,
                        child: const HomeHeader(),
                      ),
                    ],
                  );
                });
              }),
        ),
      ),
    );
  }
}
