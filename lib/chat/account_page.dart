import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Settings")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(title: "Settings"),
          const SettingsTile(icon: Icons.language, title: "Language"),
          const SettingsTile(icon: Icons.color_lens, title: "Theme"),
          const SettingsTile(icon: Icons.notifications, title: "Notifications"),
          const SettingsTile(
            icon: Icons.privacy_tip,
            title: "Privacy & Security",
          ),
          const SettingsTile(
            icon: Icons.delete_forever,
            title: "Delete Data",
            isDestructive: true,
          ),
          const SizedBox(height: 24),

          const SectionTitle(title: "Help & Feedback"),
          const SettingsTile(icon: Icons.help_outline, title: "FAQ"),
          const SettingsTile(icon: Icons.contact_mail, title: "Contact"),
          const SettingsTile(icon: Icons.star_rate, title: "Rate App"),
          const SettingsTile(icon: Icons.info_outline, title: "About"),

          const SizedBox(height: 24),

          const SectionTitle(title: ""),
          const SettingsTile(
            icon: Icons.logout,
            title: "Logout",
            isDestructive: true,
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------
// Reusable Tile Widget
// ----------------------------------------------
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDestructive;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.primary.withOpacity(0.1),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isDestructive ? Colors.red : Colors.black,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // TODO: Handle navigation or action
        },
      ),
    );
  }
}

// ----------------------------------------------
// Section Title Widget
// ----------------------------------------------
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    if (title.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
