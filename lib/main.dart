import 'package:doula/common/utils/app_routes.dart';
import 'package:doula/common/utils/environment.dart';
import 'package:doula/common/utils/kstrings.dart';
import 'package:doula/src/categories/controllers/category_notifier.dart';
import 'package:doula/src/entrypoint/controlers/botton_tab_notifier.dart';
import 'package:doula/src/home/controllers/home_tab_nortifier.dart';
import 'package:doula/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:doula/src/products/controllers/product_notifile.dart';
import 'package:doula/src/splashscreen/views/splashscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // load the cerlect envirloment
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();

  // Initialize the app

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardingNotifier()),
        ChangeNotifierProvider(create: (context) => TabIndexNotifier()),
        ChangeNotifierProvider(create: (context) => CategoryNotifier()),
        ChangeNotifierProvider(create: (context) => HomeTabNotifier()),
        ChangeNotifierProvider(create: (context) => ProductNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,

      builder: (context, child) {
        return MaterialApp.router(
          title: AppText.kAppName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,

          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
      child: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(Environment.apiKey),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
