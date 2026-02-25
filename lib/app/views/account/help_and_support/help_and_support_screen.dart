import 'package:dofix_technichian/app/views/account/help_and_support/faq_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'live_support_chat_screen.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  static const Color primaryColor = Color(0xff337ba1);

  @override
  Widget build(BuildContext context) {
    const supportNumber = "8383849293";
    const supportEmail = 'support@dofix.in';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            _supportHeaderCard(),
            const SizedBox(height: 14),
            _sectionCard(
              children: [
                _tile(
                  "FAQ",
                  subtitle: "Common questions & answers",
                  icon: const Icon(CupertinoIcons.question_circle,
                      color: primaryColor),
                  onTap: () {
                    Get.to(() => const PartnerFaqScreen());
                  },
                ),
                _divider(),
                _tile(
                  "Raise a Ticket",
                  subtitle: "Report an issue & track status",
                  icon: const Icon(CupertinoIcons.ticket, color: primaryColor),
                  onTap: () {
                    // Get.to(() => const RaiseTicketScreen());
                  },
                ),
                _divider(),
                _tile(
                  "Live Chat",
                  subtitle: "Chat with support team",
                  icon: const Icon(CupertinoIcons.chat_bubble_text,
                      color: primaryColor),
                  onTap: () {
                    Get.to(() => const SupportChatScreen());
                  },
                ),
              ],
            ),
            const SizedBox(height: 14),
            _sectionCard(
              children: [
                _tile(
                  "Call Support",
                  subtitle: "Talk to our support",
                  icon: const Icon(Icons.call, color: primaryColor),
                  onTap: () async {
                    final uri = Uri.parse("tel:+91$supportNumber");
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                ),
                _divider(),
                _tile(
                  "Email Support",
                  subtitle: "Write to us for help",
                  icon: const Icon(Icons.email_outlined, color: primaryColor),
                  onTap: () async {
                    final subject =
                        Uri.encodeComponent('Support Request - DoFix Partner');
                    final body = Uri.encodeComponent(
                      'Hello Support Team,\n\nI need help regarding:\n',
                    );

                    final uri = Uri.parse(
                        'mailto:$supportEmail?subject=$subject&body=$body');

                    final ok = await launchUrl(uri,
                        mode: LaunchMode.externalApplication);
                    if (!ok) {
                      Get.snackbar("Error", "Email app open nahi ho pa rahi");
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Widgets ----------

  Widget _supportHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryColor.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.support_agent, color: primaryColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Need help?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "We’re here to help you. Usually we respond quickly during working hours.",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _tile(
    String title, {
    required VoidCallback onTap,
    required Icon icon,
    String? subtitle,
  }) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle,
              style: const TextStyle(fontSize: 12.5, color: Colors.black54),
            ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      dense: true,
      visualDensity: const VisualDensity(vertical: -1),
    );
  }

  Widget _divider() => Divider(
        height: 1,
        thickness: 1,
        color: Colors.black.withOpacity(0.06),
      );
}
