import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart';

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
      appBar: AppBar(
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
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('hello'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          localization.translate(_selection),
        ),
      ),
      floatingActionButton: _controller.index == 0
          ? FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              onPressed: () {},
              backgroundColor: Theme.of(context).accentColor,
            )
          : null,
    );
  }
}
