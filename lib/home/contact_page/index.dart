import 'package:flutter/material.dart';

import './widgets/contact_item.dart';

import '../../modal/contact.dart' show Contact, ContactPageData;

class ContactsPage extends StatefulWidget {
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contact> _contacts = ContactPageData.mock().contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Contact _contact = _contacts[index];
        return ContactItem(avatar: _contact.avatar, title: _contact.name);
      },
      itemCount: _contacts.length,
    );
  }
}
