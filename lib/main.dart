// lib/main.dart

import 'package:flutter/material.dart';
import 'models/backend.dart';
import 'models/email.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Correo Electrónico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmailListScreen(),
    );
  }
}

class EmailListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backend = Backend(); // Obtener el backend para acceder a los correos
    final emails = backend.getEmails(); // Obtener todos los correos

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Correos'),
      ),
      body: ListView.builder(
        itemCount: emails.length, // Cantidad de correos
        itemBuilder: (context, index) {
          final email = emails[index];

          return ListTile(
            title: Text(
              email.subject,
            ),
            subtitle: Text(
              email.from,
            ),
            trailing: email.read
                ? Icon(Icons.mark_email_read, color: Colors.green)
                : Icon(Icons.mark_email_unread, color: Colors.red),
            onTap: () {
              // Marca el correo como leído cuando se toca
              backend.markEmailAsRead(email.id);
            },
          );
        },
      ),
    );
  }
}
