import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/repository/posts_repository.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/repository/user_repository.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/account_view.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/home_view.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/app_drawer.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/new_post_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
      appBar: AppBar(
        elevation: 10,
        title: Text(
          localization.translate(_selection),
          style: AppTextStyles.appTitleStyle,
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.only(bottom: 17, top: 12),
          controller: _controller,
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
        controller: _controller,
        children: <Widget>[
          HomeView(
            posts: PostsRepository.getPosts(),
          ),
          AccountView(
            user: UserRepository.getUser(),
          ),
        ],
      ),
      floatingActionButton:
          _controller.index == 0 && !_controller.indexIsChanging
              ? FloatingActionButton(
                  child: Icon(
                    Icons.add,
                  ),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (ctx) => NewPostDialog(),
                  ),
                  backgroundColor: Theme.of(context).accentColor,
                )
              : null,
    );
  }
}
