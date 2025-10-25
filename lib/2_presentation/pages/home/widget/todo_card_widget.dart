import 'package:flutter/material.dart';

class TodoCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool completed;
  final ValueChanged<bool?>? onCheckChanged;
  final ValueChanged<String?>? onSelected;

  const TodoCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.completed,
    this.onCheckChanged,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: completed,
          onChanged: onCheckChanged,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: PopupMenuButton<String>(
          onSelected: onSelected,
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'details', child: Text('جزئیات')),
            PopupMenuItem(value: 'edit', child: Text('ویرایش')),
            PopupMenuItem(value: 'delete', child: Text('حذف')),
          ],
        ),
      ),
    );
  }
}
