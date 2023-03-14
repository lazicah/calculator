import 'package:calculator/calculator/cubit/calculator_cubit.dart';
import 'package:calculator/calculator/model/calculator_button_data.dart';
import 'package:calculator/calculator/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: const Scaffold(
        body: Center(
          child: CalculatorView(),
        ),
      ),
    );
  }
}

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  String _lastExpression = '';

  Size dimension = Size(1000, 700);

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    _textEditingController.addListener(_handleTextChanged);

    super.initState();
  }

  void _handleTextChanged() {}

  void _onButtonPressed(ButtonType type, {String? value}) {
    final calculatorCubit = context.read<CalculatorCubit>();
    _lastExpression = _textEditingController.text;
    switch (type) {
      case ButtonType.number:
        _lastExpression += value!;
        break;
      case ButtonType.clear:
        setState(() {
          _lastExpression = '';
        });
        break;
      case ButtonType.bracket:
        if (_lastExpression.isNotEmpty) {
          // Check if the last character is a number
          final lenght = _lastExpression.length;
          final lastChar = _lastExpression[lenght - 1];
        } else {
          _lastExpression += ' ( ';
        }

        break;
      case ButtonType.percentage:
        if (_lastExpression.isNotEmpty) _lastExpression += ' % ';
        break;
      case ButtonType.division:
        if (_lastExpression.isNotEmpty) _lastExpression += ' / ';
        break;
      case ButtonType.multiplication:
        if (_lastExpression.isNotEmpty) _lastExpression += ' * ';
        break;
      case ButtonType.subtraction:
        if (_lastExpression.isNotEmpty) _lastExpression += ' - ';
        break;
      case ButtonType.addition:
        if (_lastExpression.isNotEmpty) _lastExpression += ' + ';
        break;
      case ButtonType.decimal:
        if (_lastExpression.isEmpty) {
          _lastExpression += '0.';
        } else {
          _lastExpression += '.';
        }
        break;
      case ButtonType.negative:
        // TODO: Handle this case.
        break;
      case ButtonType.equalTo:
        calculatorCubit.compute(_lastExpression);
        return;
        break;
    }

    _textEditingController.text = _lastExpression;
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calculatorCubit = context.read<CalculatorCubit>();
    final theme = Theme.of(context);
    return BlocListener<CalculatorCubit, CalculatorState>(
      listenWhen: (previous, current) => previous.result != current.result,
      listener: (context, state) {},
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Top Section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextField(
                            controller: _textEditingController,
                            focusNode: _focusNode,
                            autofocus: true,
                            showCursor: true,
                            textAlign: TextAlign.end,
                            readOnly: true,
                            minLines: 1,
                            maxLines: 3,
                            style: theme.textTheme.displayMedium!
                                .copyWith(fontSize: 32),
                            decoration: InputDecoration.collapsed(hintText: ''),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          BlocBuilder<CalculatorCubit, CalculatorState>(
                            builder: (context, state) {
                              return Text(
                                _lastExpression.isNotEmpty
                                    ? '${state.result}'
                                    : '',
                                style: theme.textTheme.headlineLarge!
                                    .copyWith(color: Colors.black),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // NumberPad
                GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(24),
                  shrinkWrap: true,
                  children: List.generate(
                    buttons.length,
                    (index) {
                      final button = buttons[index];
                      return TextButton(
                        onPressed: () {
                          _onButtonPressed(
                            button.buttonType,
                            value: button.value,
                          );
                        },
                        style: TextButton.styleFrom(
                          textStyle: theme.textTheme.displaySmall!.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 32),
                          backgroundColor:
                              getBgColorByButtonType(button.buttonType),
                          foregroundColor:
                              getTextColorByButtonType(button.buttonType),
                        ),
                        child: FittedBox(child: button.sybmol),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
