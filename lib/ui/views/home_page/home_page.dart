import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/locale_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/repository/posts_repository.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;
import 'package:kortobaa_mobile_flutter_task/ui/views/home_page/account_view.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/home_page/posts_view.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/app_drawer.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/new_post_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  String _selection;

  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
    _selection = "homepage";
    _controller.addListener(_handleSelection);
  }

  void _handleSelection() {
    setState(() {
      _selection = _controller.index == 0 ? "homepage" : "account";
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 10,
        title: Text(
          localization.translate(_selection),
          style: textStyles.appbarTitleStyle,
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.only(bottom: 17, top: 12),
          controller: _controller,
          tabs: <Widget>[
            Text(
              localization.translate('homepage'),
              style: textStyles.tabsTextStyle,
            ),
            Text(
              localization.translate('account'),
              style: textStyles.tabsTextStyle,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          PostsView(
            posts: PostsRepository.fetchPosts(),
          ),
          AccountView(),
        ],
      ),
      floatingActionButton: _controller.index == 0
          ? Padding(
              padding: EdgeInsets.only(
                  right: Provider.of<LocaleProvider>(context).locale ==
                          Locale('ar', 'EG')
                      ? 28
                      : 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.add,
                  ),
                  onPressed: () => showDialog(
                      context: context, builder: (context) => NewPostDialog()),
                  backgroundColor: Theme.of(context).accentColor,
                ),
              ),
            )
          : SizedBox(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
