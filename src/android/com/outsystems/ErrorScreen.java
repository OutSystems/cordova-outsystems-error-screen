/**
 */
package com.example;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import android.util.Log;

import java.util.Date;

public class ErrorScreen extends CordovaPlugin {
  private static final String TAG = "ErrorScreen";

  private static Dialog screenDialog;
  private String backgroundColor;
  private int orientation;


  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);

    orientation = cordova.getActivity().getResources().getConfiguration().orientation;
    backgroundColor = preferences.getInteger("backgroundColor", "#FFFFFF");

    Log.d(TAG, "Initializing ErrorScreen Plugin");
  }

  public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
    if(action.equals("show")) {
      cordova.getActivity().runOnUiThread(new Runnable() {
        public void run() {
          webView.postMessage("errorscreen", "show");
        }
      });
    } else if(action.equals("hide")) {
      cordova.getActivity().runOnUiThread(new Runnable() {
        public void run() {
          webView.postMessage("errorscreen", "hide");
        }
      });
    }

    return true;
  }

  @Override
  public Object onMessage(String id, Object data) {
    if ("errormessage".equals(id)) {
      if ("show".equals(data.toString())) {
        this.showErrorScreen();
      } else if ("hide".equals(data.toString())) {
        this.hideErrorScreen();
      }
    }

    return null;
  }

  @SuppressWarnings("deprecation")
  private void showErrorScreen() {
    // If the screen dialog is showing don't try to show it again
    if (screenDialog != null && screenDialog.isShowing()) {
      return;
    }

    cordova.getActivity().runOnUiThread(new Runnable() {
      public void run() {

        screenDialog = new Dialog(webView.getContext();, android.R.style.Theme_Translucent_NoTitleBar);
        screenDialog.setContentView(R.layout.network_error);
        screenDialog.setCancelable(false);
        screenDialog.show();
        
        Button button_try_again = (Button) screenDialog.findViewById(R.id.networkErrorButtonRetry);
        button_try_again.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                screenDialog.dismiss();
            }
        });

      }
    });
  }

  @SuppressWarnings("deprecation")
  private void hideErrorScreen() {
    // If the splash dialog is showing don't try to show it again
    if (splashDialog == null && !screenDialog.isShowing()) {
      return;
    }

    screenDialog.dismiss();
    screenDialog = null;
  }
}
