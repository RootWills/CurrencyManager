import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tc/controllers/money_provider.dart';
import 'package:tc/controllers/theme_provider.dart';
import 'package:tc/views/pages/home/home.dart';
import 'package:tc/views/pages/home/transactions/transactions_view.dart';
import 'package:tc/views/pages/home/widgets/bottom_menu.dart';
import 'package:tc/views/pages/settings/settings.dart';
import 'package:tc/views/pages/wallet/wallet.dart';

class MyApp extends StatefulWidget {
  final ThemeProvider theme;
  final MoneyProvider money;
  MyApp({required this.theme, required this.money});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Índice para guiar entre as páginas principais. Começa na Home
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget _body(int index) {
      // Decide qual tela mostrar com base no índice
      switch (index) {
        case 0:
          return Home(theme: widget.theme, money: widget.money);
        case 1:
          return Wallet(theme: widget.theme, money: widget.money);
        case 2:
          return TransactionsView(widget.theme);
        case 3:
          return Settings(widget.theme);
        default:
          return Home(theme: widget.theme, money: widget.money);
      }
    }

    // Os filhos desse widget (praticamente tudo) serão notificados
    // quando o value tema for alterado.
    return Consumer<ThemeProvider>(
      builder: (context, theme, __) {
        return Consumer<MoneyProvider>(
          builder: (context, money, __) {
            return Scaffold(
              body: _body(pageIndex),
              bottomNavigationBar: BottomMenu(
                theme: widget.theme,
                money: widget.money,
                onPressed: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
            );
          },
        );
      },
    );
  }
}
