package com.sentinel.android.checkservice;

import android.app.Application;
import android.os.ServiceManager;
import android.util.Log;
import com.sentinel.android.services.check.ICheckService;

public class CheckServiceApp extends Application {
  private static final String TAG = "CheckServiceApp";
  //private static final String REMOTE_SERVICE_NAME = ICheckService.class.getName();
  private static final String REMOTE_SERVICE_NAME = "sentinel";
  private ICheckServiceImpl serviceImpl;

  public void onCreate() {
    super.onCreate();
    this.serviceImpl = new ICheckServiceImpl(this);
    ServiceManager.addService(REMOTE_SERVICE_NAME, this.serviceImpl);
    Log.d(TAG, "Registered [" + serviceImpl.getClass().getName() + "] as [" + REMOTE_SERVICE_NAME + "]");
  }

  public void onTerminate() {
    super.onTerminate();
    Log.d(TAG, "Terminated");
  }
}
