package com.sentinel.android.checkservice;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.RemoteException;
import android.util.Log;
import com.sentinel.android.services.check.ICheckService;

import android.content.Intent;
import android.os.Process;
import android.content.ComponentName;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import java.lang.String;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;

class ICheckServiceImpl extends ICheckService.Stub {
  private static final String TAG = "ICheckServiceImpl";
  private final Context context;

  ICheckServiceImpl(Context context) {
	this.context = context;
  }

  public void flushLog() throws RemoteException {
	if (this.context.checkCallingOrSelfPermission(Manifest.permission.CHECK_UID) != 
	    PackageManager.PERMISSION_GRANTED) {
      throw new SecurityException("Requires CHECK_UID permission");
    }
    Log.d(TAG, "Flushing Logs");
  }

  /**
   * Returns true if the Uid of thecalling process belongs to the monitoring list.
   * Return false if the Uid not on the monitoring list.
   */
  public boolean compareUid(int callingUid) {

	String result;
	//mock up for monitoring list - need to change
	PackageInfo pInfo = null;
	try {
		pInfo = context.getPackageManager().getPackageInfo("com.example.retrievephoneinfoapplication", 0);
	} catch (NameNotFoundException e) {
		e.printStackTrace();
	}
	int checkUid = pInfo.applicationInfo.uid;

	// send and intent to activity
        Intent intent = new Intent(context, NoticeActivity.class);
	intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        String pkg = "com.sentinel.android.checkservice";
        String cls = "com.sentinel.android.checkservice.NoticeActivity";
        intent.setComponent(new ComponentName(pkg, cls));
	result = String.format("The calling uid is %d and the checking uid is %d", callingUid, checkUid);
	intent.putExtra("result", result);
        context.startActivity(intent);	

	if (callingUid == checkUid)        
		return true;
	else
		return false;
  }

}
