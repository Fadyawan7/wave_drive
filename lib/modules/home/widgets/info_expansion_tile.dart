import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
// res

class InfoExpansionTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;

  const InfoExpansionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  State<InfoExpansionTile> createState() => _InfoExpansionTileState();
}

class _InfoExpansionTileState extends State<InfoExpansionTile> {
  bool isExpanded = false; // local expansion state

  @override
  void didUpdateWidget(InfoExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Rebuild when widget properties change
    if (oldWidget.icon != widget.icon ||
        oldWidget.title != widget.title ||
        oldWidget.content != widget.content) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppColors.whitecolor,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              isExpanded = expanded;
            });
          },
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.boxbgcolor,
            child: Center(
              child: Icon(widget.icon, color: AppColors.primarycolor),
            ),
          ),
          title: Text(widget.title, style: AppTextStyles.text10),
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            size: 28,
            color: AppColors.graycolor,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.content,
                style: AppTextStyles.text10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
