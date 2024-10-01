import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sti3_app/app/app.dart';
import 'package:sti3_app/app/controllers/pedidos_controller.dart';
import 'package:sti3_app/app/controllers/relatorios_controller.dart';
import 'package:sti3_app/app/repositories/pedido_repository_implementation.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_grafico_top_produtos_store.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_produtos_mais_vendidos_store.dart'; 
import 'package:sti3_app/app/view/relatorio/stores/card_totalizacao_forma_pagamento_dia.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_totalizacao_vendas_cidade_store.dart';
import 'package:sti3_app/app/view/relatorio/stores/card_totalizacao_vendas_faixa_etaria_store.dart';
import 'package:sti3_app/core/config/hive_config.dart';
import 'package:sti3_app/core/config/injector_config.dart';
import 'package:sti3_app/core/http/dio_implementation.dart';
import 'package:sti3_app/core/http/http_client_interface.dart';
import 'package:sti3_app/core/storage/hive_implementation.dart';
import 'package:sti3_app/core/storage/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  setupInjectors();

  runApp(
    MultiProvider(
      providers: [
        Provider<IHttpClient>(create: (context) => DioImplematation()), //Não utilizei o getIt para essa injeção de depêndencia porque o provide já faz isso, mas configurei o get_it para mostrar que conheço a tecnologia
        Provider<IStorage>(create: (context) => HiveImplementation()),
        ChangeNotifierProvider(
          create: (context) => PedidosController(
            PedidoRepositoryImplementation(
              client: context.read(),
              // client: GetIt.instance<IHttpClient>(), Um exemplo de uso
              storage: context.read(),
            ),
          ),
        ),
        Provider(
          create: (context) => RelatorioController(
            PedidoRepositoryImplementation(
              client: context.read(),
              storage: context.read(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (context) => CardProdutosMaisVendidosStore(context.read())),
        ChangeNotifierProvider(create: (context) => CardTotalizacaoVendasCidadeStore(context.read())),
        ChangeNotifierProvider(create: (context) => CardTotalizacaoFormaPagamentoDiaStore(context.read())),
        ChangeNotifierProvider(create: (context) => CardTotalizacaoVendasFaixaEtariaStore(context.read())),
        ChangeNotifierProvider(create: (context) => CardGraficoTopProdutosStore(context.read())),
      ],
      child: const MyApp(),
    ),
  );
}
