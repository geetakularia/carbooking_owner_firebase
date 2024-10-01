package com.carbooking.own;

import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.carbooking.own/settings";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL)
      .setMethodCallHandler(
        (call, result) -> {
          if (call.method.equals("openNotificationSettings")) {
            Intent intent = new Intent();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
              intent.setAction(Settings.ACTION_APP_NOTIFICATION_SETTINGS);
              intent.putExtra(Settings.EXTRA_APP_PACKAGE, getPackageName());
            } else {
              intent.setAction(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
              Uri uri = Uri.fromParts("package", getPackageName(), null);
              intent.setData(uri);
            }
            startActivity(intent);
            result.success(null);
          } else {
            result.notImplemented();
          }
        }
      );
  }
}
