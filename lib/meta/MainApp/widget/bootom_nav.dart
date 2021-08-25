import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/core/provider/global_providerl/global_provider.dart';

class BotoomNav extends ConsumerStatefulWidget {
  final PageController pageController;
  const BotoomNav({required this.pageController, Key? key}) : super(key: key);

  @override
  _BotoomNavState createState() => _BotoomNavState();
}

class _BotoomNavState extends ConsumerState<BotoomNav> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black54, blurRadius: 4)
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: ref.watch(cureentIndex).state,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) async {
                    await widget.pageController.animateToPage(value,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn);
                    ref.read(cureentIndex).state = value;
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.search),
                      label: 'Wishlist',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.circle),
                      label: 'Cart',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.check),
                      label: 'Dashboard',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.personBooth),
                      label: 'person',
                    )
                  ],
                )));
      },
    );
  }
}
