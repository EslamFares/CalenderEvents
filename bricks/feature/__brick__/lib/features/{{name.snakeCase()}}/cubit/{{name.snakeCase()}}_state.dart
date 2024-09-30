part of '{{name.snakeCase()}}_cubit.dart';

abstract class {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Sucess extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Error extends {{name.pascalCase()}}State {
    final String errorMessage;
  {{name.pascalCase()}}Error(this.errorMessage);
}