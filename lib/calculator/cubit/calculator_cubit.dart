import 'package:bloc/bloc.dart';
import 'package:calculator/calculator/model/calculator_button_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:meta/meta.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState.initial());

  void clearSession() {
    emit(state.copyWith(result: 0));
  }

  void compute(String val) {
    final result = val.interpret();
    emit(state.copyWith(result: result.toDouble()));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
