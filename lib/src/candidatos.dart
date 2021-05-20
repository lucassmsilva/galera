import 'package:signature/signature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Candidates extends StatefulWidget {
  final String nome;
  final SignatureController controller;
  final int pontuacao;

  const Candidates({Key key, this.nome, this.controller, this.pontuacao})
      : super(key: key);
  @override
  _CandidatesState createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
