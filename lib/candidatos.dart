import 'package:signature/signature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Candidatos {
  String _nome;
  SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.blue,
  );
  int _pontuacao = 0;

  Candidatos(this._nome);

  String get nome => _nome;
  SignatureController get controller => _controller;
  int get pontuacao => _pontuacao;
}

class MeusCandidatos {
  List<Candidatos> _arr;

  MeusCandidatos(this._arr);

  List<Candidatos> get getListaCandidatos {
    return _arr;
  }
}

MeusCandidatos candidatos = new MeusCandidatos(
  [
    new Candidatos('Júnior Chaves Mendes'),
    new Candidatos('Nicolas Peres dos Santos'),
    new Candidatos('Samuel Chagas de Ávila')
  ],
);
