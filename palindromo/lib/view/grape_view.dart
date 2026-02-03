import 'package:flutter/material.dart';
import 'package:palindromo/controller/grape_controller.dart';
import 'package:palindromo/model/grape_model.dart';

class GrapeView extends StatefulWidget {
  @override
  State<GrapeView> createState() => _GrapeViewState();
}

class _GrapeViewState extends State<GrapeView> {
  final TextEditingController _priceController = TextEditingController();
  bool _isTypeA = true;
  bool _isSize1 = true;
  int _adjustment = 0;
  int _finalPrice = 0;
  bool _calculated = false;

  void _calculate() {
    if (_priceController.text.isEmpty) {
      return;
    }

    int initialPrice = int.tryParse(_priceController.text) ?? 0;
    GrapeModel grape = GrapeModel(kind: _isTypeA, size: _isSize1);
    int adjustment = GrapeController.getInitialPrice(grape);
    
    setState(() {
      _adjustment = adjustment;
      _finalPrice = initialPrice + adjustment;
      _calculated = true;
    });
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Precio de Uva')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Precio inicial',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Text('Tipo:'),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: _isTypeA,
                  onChanged: (value) => setState(() => _isTypeA = value!),
                ),
                Text('A'),
                Radio<bool>(
                  value: false,
                  groupValue: _isTypeA,
                  onChanged: (value) => setState(() => _isTypeA = value!),
                ),
                Text('B'),
              ],
            ),
            SizedBox(height: 16),
            Text('Tamaño:'),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: _isSize1,
                  onChanged: (value) => setState(() => _isSize1 = value!),
                ),
                Text('1'),
                Radio<bool>(
                  value: false,
                  groupValue: _isSize1,
                  onChanged: (value) => setState(() => _isSize1 = value!),
                ),
                Text('2'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            if (_calculated) ...[
              Text('Ajuste: ${_adjustment > 0 ? '+' : ''}$_adjustment¢'),
              Text('Precio final: $_finalPrice¢'),
            ],
          ],
        ),
      ),
    );
  }
}
