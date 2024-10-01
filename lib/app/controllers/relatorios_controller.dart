import 'package:intl/intl.dart';
import 'package:sti3_app/app/models/pedido_model.dart';
import 'package:sti3_app/app/models/produto_model.dart';
import 'package:sti3_app/app/repositories/pedido_repository.dart';

class RelatorioController {
  final IPedidoRepository repository;
  RelatorioController(this.repository);

  List<Map> fetchlistagemProdutoMaisVendidos() {
    final List<Pedido> pedidos = repository.getPedidos();
    //Obtenho os produtos de todos os produtos/items em uma lista única.
    final List<Produto> produtos =
        pedidos.expand((pedido) => pedido.produtos).toList();
    //Buscando todos os nomes e armazenando em uma estrutura de dados set para o nome não sair repetido
    final Set<String> nomesProduto =
        produtos.map((pedido) => pedido.nome).toSet();

    return nomesProduto.map((nome) {
      //Vai buscar somente os produtos com um determinado nome.
      var produtosPorNome =
          produtos.where((produto) => produto.nome == nome).toList();
      //Quantidade de produtos por nome
      int quantidade = produtosPorNome.length;
      //Somar o valor dos pedidos.
      double valorMedio = produtosPorNome.fold(
              0.0, (soma, pedido) => soma + pedido.valorUnitario) /
          produtosPorNome.length;

      return {
        'nome': nome,
        'quantidade': quantidade,
        'valorMedio': valorMedio,
      };
    }).toList();
  }

  List<Map> totalizacaoFormaPagamentoPorDia() {
    final List<Pedido> pedidos = repository.getPedidos();
    return pedidos.map((pedido) {
      //Vai buscar somente os produtos com um determinado nome.
      double valor = pedido.pagamentos
          .fold(0.0, (soma, pagamento) => soma + pagamento.valor);

      return {
        'data': DateFormat('dd/MM/yyyy').format(pedido.dataCriacao),
        'formaPagamento': pedido.pagamentos[0].nome,
        'valor': valor,
      };
    }).toList();
  }

  List<Map> totalizacaoVendasPorCidade() {
    final List<Pedido> pedidos = repository.getPedidos();
    //Buscar as cidades, utilizo a estrutura de dados Set para não deixar vir valores repetidos.
    final Set<String> cidades =
        pedidos.map((pedido) => pedido.enderecoEntrega.cidade).toSet();
    return cidades.map((cidade) {
      //Vai buscar somente os pedidos por cidade.
      var pedidosCidade = pedidos
          .where((pedido) => pedido.enderecoEntrega.cidade == cidade)
          .toList();
      //Pega a quantidade de pedidos por cidade.
      int quantidade = pedidosCidade.length;
      //Somar o valor dos pedidos.
      double valorTotal =
          pedidosCidade.fold(0.0, (soma, pedido) => soma + pedido.valorTotal);

      return {
        'cidade': cidade,
        'quantidade': quantidade,
        'valorTotal': valorTotal,
      };
    }).toList();
  }

  List<Map> totalizacaoVendasPorFaixaEtaria() {
    final List<Pedido> pedidos = repository.getPedidos();
    // Define as faixas etárias e suas condições
    final Map<String, Function> faixasEtarias = {
      "Jovens": (int idade) => idade <= 19,
      "Adultos": (int idade) => idade > 19 && idade < 60,
      "Idosos": (int idade) => idade >= 60,
    };

    // Função para calcular a idade
    int calcularIdade(DateTime dataNascimento) {
      DateTime hoje = DateTime.now();
      int idade = hoje.year - dataNascimento.year;
      if (hoje.month < dataNascimento.month ||
          (hoje.month == dataNascimento.month &&
              hoje.day < dataNascimento.day)) {
        idade--;
      }
      return idade;
    }

    // Função para filtrar pedidos por faixa etária
    Map<String, dynamic> calcularFaixa(String faixaEtaria) {
      final pedidosFiltrados = pedidos.where((pedido) {
        final dataNascimento = DateTime.parse(pedido.cliente.dataNascimento);
        int idade = calcularIdade(dataNascimento);
        return faixasEtarias[faixaEtaria]!(idade);
      }).toList();

      return {
        "faixaEtaria": faixaEtaria,
        "quantidadePedidos": pedidosFiltrados.length,
        "valorTotal": pedidosFiltrados.fold(
            0.0, (soma, pedido) => soma + pedido.valorTotal),
      };
    }

    // Mapeia as faixas etárias e calcula as informações
    return faixasEtarias.keys.map(calcularFaixa).toList();
  }
}
