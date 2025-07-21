import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class PlatformWidgets {
  // Platform-aware app bar
  static PreferredSizeWidget platformAppBar({
    required String title,
    List<Widget>? actions,
    Widget? leading,
    Color? backgroundColor,
    required BuildContext context,
  }) {
    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: Text(title),
        backgroundColor: backgroundColor ?? CupertinoColors.systemBackground,
        trailing: actions != null && actions.isNotEmpty ? actions.first : null,
        leading: leading,
      );
    } else {
      return AppBar(
        title: Text(title),
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.inversePrimary,
        actions: actions,
        leading: leading,
      );
    }
  }

  // Platform-aware page scaffold
  static Widget platformPageScaffold({
    required Widget child,
    PreferredSizeWidget? appBar,
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: appBar as CupertinoNavigationBar? ?? const CupertinoNavigationBar(),
        child: SafeArea(
          child: child,
        ),
      );
    } else {
      return Scaffold(
        appBar: appBar,
        body: child,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      );
    }
  }

  // Platform-aware text field
  static Widget platformTextField({
    required TextEditingController controller,
    String? hintText,
    String? placeholder,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    int? maxLines,
    EdgeInsetsGeometry? padding,
    BoxDecoration? decoration,
  }) {
    if (Platform.isIOS) {
      return CupertinoTextField(
        controller: controller,
        placeholder: placeholder ?? hintText,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        maxLines: maxLines,
        padding: padding ?? const EdgeInsets.all(0),
        decoration: decoration,
      );
    } else {
      return TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: padding,
        ),
      );
    }
  }

  // Platform-aware button
  static Widget platformButton({
    required VoidCallback onPressed,
    required Widget child,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    double? borderRadius,
  }) {
    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: padding,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        child: child,
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        child: child,
      );
    }
  }

  // Platform-aware icon
  static IconData platformIcon({
    required IconData iosIcon,
    required IconData androidIcon,
  }) {
    return Platform.isIOS ? iosIcon : androidIcon;
  }

  // Platform-aware color
  static Color platformColor({
    required Color iosColor,
    required Color androidColor,
  }) {
    return Platform.isIOS ? iosColor : androidColor;
  }

  // Platform-aware loading indicator
  static Widget platformLoadingIndicator({
    double? size,
    Color? color,
  }) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        radius: (size ?? 16) / 2,
        color: color,
      );
    } else {
      return SizedBox(
        width: size ?? 16,
        height: size ?? 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.green),
        ),
      );
    }
  }

  // Platform-aware alert dialog
  static Future<void> platformAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            if (cancelText != null)
              CupertinoDialogAction(
                child: Text(cancelText),
                onPressed: () {
                  Navigator.pop(context);
                  onCancel?.call();
                },
              ),
            CupertinoDialogAction(
              child: Text(confirmText ?? 'OK'),
              onPressed: () {
                Navigator.pop(context);
                onConfirm?.call();
              },
            ),
          ],
        ),
      );
    } else {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            if (cancelText != null)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onCancel?.call();
                },
                child: Text(cancelText),
              ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm?.call();
              },
              child: Text(confirmText ?? 'OK'),
            ),
          ],
        ),
      );
    }
  }
} 