// lib/models/backend.dart

import 'email.dart';

class Backend {
  /// Singleton pattern used here.
  static final Backend _backend = Backend._internal();

  factory Backend() {
    return _backend;
  }

  Backend._internal();

  /// Lista privada de correos electrónicos (hardcoded para propósitos de prueba).
  final _emails = [
    Email(
      id: 631,
      from: 'functional@programming.com',
      subject: 'Functional programming',
      dateTime: DateTime(2020, 10, 03, 19, 43),
      body:
          'In computer science, functional programming is a programming paradigm where programs are constructed by applying and composing functions. It is a declarative programming paradigm in which function definitions are trees of expressions that each return a value, rather than a sequence of imperative statements which change the state of the program.',
    ),
    Email(
      id: 522,
      from: 'declarative@programming.com',
      subject: 'Declarative programming',
      dateTime: DateTime(2020, 10, 07, 03, 05),
      body:
          'Many languages that apply this style attempt to minimize or eliminate side effects by describing what the program must accomplish in terms of the problem domain, rather than describe how to accomplish it as a sequence of the programming language primitives (the how being left up to the language\'s implementation). This is in contrast with imperative programming, which implements algorithms in explicit steps.',
    ),
    Email(
      id: 963,
      from: 'imperative@programming.com',
      subject: 'Imperative programming',
      dateTime: DateTime(2020, 10, 09, 13, 48),
      body:
          'In computer science, imperative programming is a programming paradigm that uses statements that change a program\'s state. In much the same way that the imperative mood in natural languages expresses commands, an imperative program consists of commands for the computer to perform. Imperative programming focuses on describing how a program operates.',
    ),
    Email(
      id: 164,
      read: true,
      from: 'machine@code.com',
      subject: 'Machine code',
      dateTime: DateTime(2020, 10, 11, 16, 14),
      body:
          'In computer programming, machine code, consisting of machine language instructions, is a low-level programming language used to directly control a computer\'s central processing unit (CPU). Each instruction causes the CPU to perform a very specific task, such as a load, a store, a jump, or an arithmetic logic unit (ALU) operation on one or more units of data in the CPU\'s registers or memory.',
    ),
    // Continúa agregando los correos restantes de la misma forma...
    Email(
      id: 835,
      from: 'high-level@programminglanguage.com',
      subject: 'High-level programming language',
      dateTime: DateTime(2020, 10, 13, 20, 25),
      body:
          'In computer science, a high-level programming language is a programming language with strong abstraction from the details of the computer. In contrast to low-level programming languages, it may use natural language elements, be easier to use, or may automate (or even hide entirely) significant areas of computing systems (e.g. memory management), making the process of developing a program simpler and more understandable than when using a lower-level language. The amount of abstraction provided defines how "high-level" a programming language is.',
    ),
    // Continúa con todos los demás correos...
  ];

  /// Public API starts here :)

  /// Retorna todos los correos electrónicos.
  List<Email> getEmails() {
    return _emails;
  }

  /// Marca el correo identificado por su id como leído.
  void markEmailAsRead(int id) {
    final index = _emails.indexWhere((email) => email.id == id);
    if (index != -1) {
      _emails[index].read = true;
    }
  }

  /// Elimina el correo identificado por su id.
  void deleteEmail(int id) {
    _emails.removeWhere((email) => email.id == id);
  }
}
