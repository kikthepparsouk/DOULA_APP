import 'package:doula/src/home/controllers/home_tab_nortifier.dart';
import 'package:doula/src/home/widgets/categories_list.dart';
import 'package:doula/src/home/widgets/custom_app_bar.dart';
import 'package:doula/src/home/widgets/home_header.dart';
import 'package:doula/src/home/widgets/home_slider.dart';
import 'package:doula/src/home/widgets/home_tab.dart';
import 'package:doula/src/products/widgets/explore_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:doula/common/utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  // late final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  // @override
  // void initState() {
  //   _tabController = TabController(length: homeTaps.length, vsync: this);
  //   // super.initState();
  //   _tabController.addListener((_handleSelectedTab));
  //   {
  //     super.initState();
  //     // _pageController.jumpToPage(_currentIndex);
  //   }
  //   ;
  // }

  void _handleSelectedTab() {
    final controller = Provider.of<HomeTabNotifier>(context, listen: false);

    if (_tabController.indexIsChanging) {
      setState(() {
        _currentIndex = _tabController.index;
      });
      controller.setIndex(homeTaps[_currentIndex]);
    }
  }

  @override
void initState() {
  super.initState();
  _tabController = TabController(length: homeTaps.length, vsync: this);
  // _pageController = PageController(initialPage: 0);
  
  // Access the provider like this:
  final homeTabNotifier = Provider.of<HomeTabNotifier>(context, listen: false);
  
  _tabController.addListener(() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentIndex = _tabController.index;
      });
      // _pageController.jumpToPage(_currentIndex);
      homeTabNotifier.setIndex(homeTaps[_currentIndex]);
    }
  });
}

  @override
  void dispose() {
    _tabController.removeListener(_handleSelectedTab);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: HomeSlider(),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: HomeHeader(),
                ),
                // SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: HomeCategoriesList(),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: HomeTabs(tabController: _tabController),
                ),
                SizedBox(height: 15.h),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: ExploreProducts(),
                ),
                // Add other widgets here as needed
                // Example:
                // SectionTitle(title: 'Featured Services'),
                // ServicesGrid(),
                // SectionTitle(title: 'Testimonials'),
                // TestimonialsCarousel(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> homeTaps = ['All', 'Popular', 'Unisex', 'Men', 'Women', 'Kids'];
