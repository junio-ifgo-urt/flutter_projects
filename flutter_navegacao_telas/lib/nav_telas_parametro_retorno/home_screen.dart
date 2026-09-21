import 'package:flutter/material.dart';
import '../nav_telas_parametro_retorno/selection_screen.dart';

void main() {
  runApp(const MaterialApp(title: 'Returning Data', home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Returnando Dados entre Telas')),
      body: const Center(child: SelectionButton()),
    ); // Scaffold
  }
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: const Text('Clique aqui para irmos pra próxima tela!'),
    );
  }

  // Metodo que carrega SelectionScreen e espera o resultado do Navigator.pop.
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push retorna um Future que é concluído após
    // chamar Navigator.pop na tela SelectionScreen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute<String>(builder: (context) => const SelectionScreen()),
    );
    // Quando um BuildContext é usado em um StatefulWidget, a propriedade montada
    // deve ser verificada após um intervalo assíncrono.
    if (!context.mounted) return;

    // Depois que a tela SelectionScreen retorna um resultado, oculta
    // qualquer snackbars anterior e mostra o novo resultado
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

}