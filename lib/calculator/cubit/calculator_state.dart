part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {
  const CalculatorState({
    required this.result,
    required this.history,
  });

  CalculatorState.initial() : this(history: {}, result: 0);
  final double result;
  final Map<double, String> history;

  @override
  List<Object?> get props => [result, history];

  CalculatorState copyWith({
    double? result,
    Map<double, String>? history,
  }) {
    return CalculatorState(
      result: result ?? this.result,
      history: history ?? this.history,
    );
  }
}
