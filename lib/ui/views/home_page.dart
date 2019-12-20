import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/home_page_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/repository/posts_repository.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/repository/user_repository.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/account_view.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/home_view.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/app_drawer.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/new_post_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
          create: (_) => HomePageProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        HomePageProvider homePageProvider =
            Provider.of<HomePageProvider>(context);
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              elevation: 10,
              title: Text(
                localization.translate(
                  homePageProvider.selection[homePageProvider.index],
                ),
                style: AppTextStyles.appTitleStyle,
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                onTap: (index) {
                  homePageProvider.index = index;
                },
                labelPadding: EdgeInsets.only(bottom: 17, top: 12),
                tabs: <Widget>[
                  Text(
                    localization.translate('homepage'),
                    style: AppTextStyles.navigationTextStyle,
                  ),
                  Text(
                    localization.translate('account'),
                    style: AppTextStyles.navigationTextStyle,
                  ),
                ],
              ),
            ),
            drawer: Drawer(
              child: AppDrawer(user: UserRepository.getUser()),
            ),
            body: TabBarView(
              children: <Widget>[
                HomeView(
                  posts: PostsRepository.getPosts(),
                ),
                AccountView(
                  user: UserRepository.getUser(),
                ),
              ],
            ),
            floatingActionButton: homePageProvider.index == 0
                ? Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        child: Icon(
                          Icons.add,
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (ctx) => NewPostDialog(),
                        ),
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                    ),
                  )
                : null,
          ),
        );
      }),
    );
  }
}
