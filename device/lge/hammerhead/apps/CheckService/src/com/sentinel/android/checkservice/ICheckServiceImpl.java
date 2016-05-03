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
import android.net.Uri;
import android.content.Context;

import android.content.pm.PackageManager;
import java.util.List;
import android.content.pm.ResolveInfo;
import android.content.pm.ActivityInfo;
import android.content.IntentFilter;
import android.content.pm.ServiceInfo;
import android.content.pm.ProviderInfo;
import android.telephony.SubscriptionManager;
import com.android.internal.telephony.PhoneConstants;
import com.android.internal.telephony.DefaultPhoneNotifier;
import android.telephony.TelephonyManager;
import android.os.Binder;
import android.app.PendingIntent;

import android.location.Location;
import android.location.LocationManager;
import android.os.SystemClock;
import android.os.Bundle;

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
	
	//displayNotice(String.format("The calling uid is %d and the checking uid is %d", callingUid, checkUid));	

	if (callingUid == checkUid)        
		return true;
	else
		return false;
  }

  /**
   * Display the message in an activity.
   * 
   */
  public void displayNotice(String msg) {

	String result;
	// send and intent to activity
        Intent intent = new Intent(context, NoticeActivity.class);
	intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        String pkg = "com.sentinel.android.checkservice";
        String cls = "com.sentinel.android.checkservice.NoticeActivity";
        intent.setComponent(new ComponentName(pkg, cls));
	result = String.format(msg);
	intent.putExtra("result", result);
        context.startActivity(intent);
  }

  /**
   * Send an intent that tells the app that the system
   * is trying to intialize the call. 
   * 
   * @param the UID of the the app we want to notice
   * 
   * @param the intent to extract the data of the calling phone number
   */
  public void sendFakeOutgoingCallIntent(int appUid, Intent callIntent) {

	// get the phone number of the outgoing call
        Uri handle = callIntent.getData();
        String scheme = handle.getScheme();
        String uriString = handle.getSchemeSpecificPart();

	// make a forged an intent to send to the blacklisted app
        Intent broadcastIntent = new Intent(Intent.ACTION_NEW_OUTGOING_CALL);
        if (uriString != null) {
            broadcastIntent.putExtra(Intent.EXTRA_PHONE_NUMBER, uriString);
        }	

        // Force receivers of this broadcast intent to run at foreground priority because we
        // want to finish processing the broadcast intent as soon as possible.
        broadcastIntent.addFlags(Intent.FLAG_RECEIVER_FOREGROUND);
		
	// send the fake intent to every app in the blacklist
	PackageManager mPackageManager = context.getPackageManager();
	String[] pkgs = mPackageManager.getPackagesForUid(appUid); 
	for(int i=0;i<pkgs.length;i++){
		broadcastIntent.setPackage(pkgs[i]);
		context.sendBroadcast(broadcastIntent, android.Manifest.permission.PROCESS_OUTGOING_CALLS);
	}
	//displayNotice(String.format("Trying to call " + uriString));
  }

  /**
   * Block the components of a blacklisted app that associate
   * with the given intent.
   * 
   * @param the intent that we don't want the blacklisted components to know
   */
  public void blockIntentReceiver(Intent callIntent) {

	String s = "The list of components associate with intent:";
	PackageManager manager = context.getPackageManager();

	// list all the activites that associate with the intent
	List<ResolveInfo> infosActivities = manager.queryIntentActivities (callIntent,
                                   PackageManager.GET_RESOLVED_FILTER);
	for (ResolveInfo infoActivities : infosActivities) {
        	ActivityInfo activityInfo = infoActivities.activityInfo;
        	IntentFilter filter = infoActivities.filter;
        	if (filter != null && filter.hasAction(callIntent.getAction())) {
        	    // This activity resolves my Intent with the filter I'm looking for
        	    String activityPackageName = activityInfo.packageName;
        	    String activityName = activityInfo.name;
        	    s = s.concat("\n Activity "+ activityPackageName + "/" + activityName);
        	}
    	}

	// list all the services that associate with the intent
	List<ResolveInfo> infosServices = manager.queryIntentServices (callIntent,
                                   PackageManager.GET_RESOLVED_FILTER);
	for (ResolveInfo infoServices : infosServices) {
        	ServiceInfo serviceInfo = infoServices.serviceInfo;
        	IntentFilter filter = infoServices.filter;
        	if (filter != null && filter.hasAction(callIntent.getAction())) {
        	    // This service resolves my Intent with the filter I'm looking for
        	    String servicePackageName = serviceInfo.packageName;
        	    String serviceName = serviceInfo.name;
        	    s = s.concat("\n Service "+ servicePackageName + "/" + serviceName);
        	}
    	}

	// list all the content providers that associate with the intent
	List<ResolveInfo> infosProviders = manager.queryIntentContentProviders (callIntent,
                                   PackageManager.GET_RESOLVED_FILTER);
	for (ResolveInfo infoProviders : infosProviders) {
        	ProviderInfo providerInfo = infoProviders.providerInfo;
        	IntentFilter filter = infoProviders.filter;
        	if (filter != null && filter.hasAction(callIntent.getAction())) {
        	    // This service resolves my Intent with the filter I'm looking for
        	    String providerPackageName = providerInfo.packageName;
        	    String providerName = providerInfo.name;
        	    s = s.concat("\n Provider "+ providerPackageName + "/" + providerName);
        	}
    	}	

	// list all the broadcast receivers that associate with the intent
	List<ResolveInfo> infosBroadcastReceivers = manager.queryBroadcastReceivers (callIntent,
                                   PackageManager.GET_RESOLVED_FILTER);
	for (ResolveInfo infoBroadcastReceivers : infosBroadcastReceivers) {
        	ActivityInfo broadcastreceiverInfo = infoBroadcastReceivers.activityInfo;
        	IntentFilter filter = infoBroadcastReceivers.filter;
        	if (filter != null && filter.hasAction(callIntent.getAction())) {
        	    // This service resolves my Intent with the filter I'm looking for
        	    String broadcastreceiverPackageName = broadcastreceiverInfo.packageName;
        	    String broadcastreceiverName = broadcastreceiverInfo.name;
        	    s = s.concat("\n Broadcast receiver "+ broadcastreceiverPackageName + "/" + broadcastreceiverName);
        	}
    	}	

	//ComponentName componentName = new ComponentName("com.example.retrievephoneinfoapplication","com.example.retrievephoneinfoapplication.the_receiver");
	//manager.setComponentEnabledSetting(componentName,PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);	

	displayNotice(String.format(s));
  }

  /**
   * Send fake phone call notification to the destination application.The function
   * sends a seri of notifications that tells the app that there is an ongoing/missed
   * phone call, while it does not happen.
   * 
   * @param The name of the package that we want to notify
   * 
   * @param The type of call we want to notify (incoming/outgoing) 
   * 
   * @param The phone number that associate with the fake call
   * 
   * @param The time duration of the fake call (leave as 0 for missed call)
   * measure in seconds
   */
  public void sendFakeCallNotification(String packageName, String callType, String phoneNumber, int duration) {
	
	Thread thread;
	final int mDuration = duration;

	// if the callType is unknown, we will stop executing
	if (!callType.equals("fake_incoming_call") && !callType.equals("fake_outgoing_call") )
		return;

	// Set up the intent for NEW_OUTGOING_CALL
	final Intent outgoingIntent = new Intent(Intent.ACTION_NEW_OUTGOING_CALL);
	outgoingIntent.putExtra(Intent.EXTRA_PHONE_NUMBER, phoneNumber);
	outgoingIntent.setPackage(packageName);

	// Set up the intent for CALL_STATE_IDLE
	final Intent idleIntent = new Intent(TelephonyManager.ACTION_PHONE_STATE_CHANGED);
	idleIntent.putExtra(PhoneConstants.STATE_KEY, DefaultPhoneNotifier.convertCallState(TelephonyManager.CALL_STATE_IDLE).toString());
	idleIntent.putExtra(TelephonyManager.EXTRA_INCOMING_NUMBER, phoneNumber);
	idleIntent.putExtra(PhoneConstants.SUBSCRIPTION_KEY, SubscriptionManager.DEFAULT_SUBSCRIPTION_ID);
	idleIntent.setPackage(packageName);		

	// Set up the intent for CALL_STATE_RINGING
	final Intent ringingIntent = new Intent(TelephonyManager.ACTION_PHONE_STATE_CHANGED);
	ringingIntent.putExtra(PhoneConstants.STATE_KEY, DefaultPhoneNotifier.convertCallState(TelephonyManager.CALL_STATE_RINGING).toString());
	ringingIntent.putExtra(TelephonyManager.EXTRA_INCOMING_NUMBER, phoneNumber);
	ringingIntent.putExtra(PhoneConstants.SUBSCRIPTION_KEY, SubscriptionManager.DEFAULT_SUBSCRIPTION_ID);
	ringingIntent.setPackage(packageName);	
	
	// Set up the intent for CALL_STATE_OFFHOOK
	final Intent offhookIntent = new Intent(TelephonyManager.ACTION_PHONE_STATE_CHANGED);
	offhookIntent.putExtra(PhoneConstants.STATE_KEY, DefaultPhoneNotifier.convertCallState(TelephonyManager.CALL_STATE_OFFHOOK).toString());
	offhookIntent.putExtra(TelephonyManager.EXTRA_INCOMING_NUMBER, phoneNumber);
	offhookIntent.putExtra(PhoneConstants.SUBSCRIPTION_KEY, SubscriptionManager.DEFAULT_SUBSCRIPTION_ID);
	offhookIntent.setPackage(packageName);		

	// if it is fake outgoing call process that we want to perform
	if (callType.equals("fake_outgoing_call")) {
		thread = new Thread() {
			@Override
			public void run () {
				try {
					sleep(5000);
					// Starting the sequence by telling the app that the phone is available for calling
					context.sendBroadcast(idleIntent, android.Manifest.permission.READ_PHONE_STATE);
					sleep(3000);
					// The next step is faking that we are processing a outgoing call request
					context.sendBroadcast(outgoingIntent, android.Manifest.permission.PROCESS_OUTGOING_CALLS);
					//Next, if the input duration is 0, we simulate missed outgoing call
					// else, we simulate the connected call, after the duration ends, broadcast end call state
					if (mDuration == 0) {
						context.sendBroadcast(idleIntent, android.Manifest.permission.READ_PHONE_STATE);
					} else {
						context.sendBroadcast(offhookIntent, android.Manifest.permission.READ_PHONE_STATE);
						sleep(mDuration * 1000);
						context.sendBroadcast(idleIntent, android.Manifest.permission.READ_PHONE_STATE);
					}
					
				} catch (InterruptedException e) {
					Log.e("Fake outgoing call: ", "Thread interrupted");
				}
			}
		};
		thread.start();
	} else if (callType.equals("fake_incoming_call")) {
		thread = new Thread() {
			@Override
			public void run () {
				try {
					sleep(5000);
					// Starting the sequence by telling the app that the phone is available for calling
					context.sendBroadcast(idleIntent, android.Manifest.permission.READ_PHONE_STATE);
					sleep(3000);
					// The next step is faking that we are processing a incoming call request
					context.sendBroadcast(ringingIntent, android.Manifest.permission.READ_PHONE_STATE);
					//Next, if the input duration is 0, we simulate missed incoming call
					// else, we simulate the connected call, after the duration ends, broadcasts end call state
					if (mDuration == 0) {
						context.sendBroadcast(idleIntent, android.Manifest.permission.READ_PHONE_STATE);
					} else {
						context.sendBroadcast(offhookIntent, android.Manifest.permission.READ_PHONE_STATE);
						sleep(mDuration * 1000);
						context.sendBroadcast(idleIntent, android.Manifest.permission.READ_PHONE_STATE);
					}
					
				} catch (InterruptedException e) {
					Log.e("Fake outgoing call: ", "Thread interrupted");
				}
			}
		};
		thread.start();
	} 
  }

  /**
   * Get the UID of the calling application
   * 
   */
  public int getCallingAppUid() {

	int uid;
	// get uid
        uid = Binder.getCallingUid();
	return uid;
  }

  /**
   * Check if the intent is for asking to make a phone call
   * 
   * @param the intent that we want to examine
   */
  public boolean isRequestingCall(Intent callIntent) {

	boolean result = false;
	String data = null;

	// get the intent action
	String intentAction = callIntent.getAction();
	// get uri content
	if (callIntent.getData() != null)
        	data = callIntent.getData().toString();

	// if we get nothing then this is not the intent of interest
	if (intentAction == null || data == null)
		return result;

	// if the action is ACTION_DIAL or ACTION_CALL and the uri contains the word "tel"
	// then it is requesting a call
	if ((intentAction.equals(Intent.ACTION_CALL) || intentAction.equals(Intent.ACTION_DIAL)) && (data.startsWith("tel:")))
		result = true;
	displayNotice(String.format(intentAction+data));
	return result;
  }

  /**
   * Check if the intent is for asking to make a phone call
   * 
   * @param the intent that we want to examine
   */
  public boolean isRequestingSendSms(Intent callIntent) {

	boolean result = false;
	String data = null;

	// get the type of the intent
	String intentType = callIntent.getType();
	// get uri content
	if (callIntent.getData() != null)
        	data = callIntent.getData().toString();

	// if we get nothing then this is not the intent of interest
	if (intentType == null || data == null)
		return result;

	// if the type has certain string or the uri contains the word "smsto"
	// then it is requesting a call
	if (intentType.equals("vnd.android-dir/mms-sms") || data.startsWith("smsto:") || data.startsWith("sms:"))
		result = true;
	displayNotice(String.format(intentType+data));
	return result;
  }

  /**
   * Send fake notification to the application that uses the SmsManager 
   * utility to send text message
   * 
   * @param the UID of the application that we want to send fake notification
   */
  public void processSendTextMessageUtility(int Uid, String destAddress, String srcAddress, String text,
		 PendingIntent sentIntent, PendingIntent deliveryIntent) {

	//TODO: save text message to fake database
	boolean result = false;

	//if the caller asks to know if the sms is sent through sentIntent
	if (sentIntent != null)
		try {
		sentIntent.send(Activity.RESULT_OK);
		} catch (PendingIntent.CanceledException ex) {
		}
	//if the caller asks to know if the sms is delivered through deliveryIntent
	if (deliveryIntent != null)
		try {
		deliveryIntent.send(Activity.RESULT_OK);	
		} catch (PendingIntent.CanceledException ex) {
		}	
  }

  /**
   * Determine the purpose of the Intent, if it is to access the built-in apps 
   * or the buit-in provider then acts upon the result.
   * 
   * For example: if the Intent were to use the built-in SMS to send message facility
   * and it comes from a blacklisted app then the Intent will not go through
   * instead a new entry will appears that indicates the request was successful
   *
   * @param the UID of the application that we want to send fake notification
   * @param the Intent comes from that application
   */
  public void processIndirectIntent(int Uid, Intent deliveryIntent) {

	//TODO: save text message to fake database, save fake calllog to fake database

	// get the package name of the calling app
	PackageManager mPackageManager = context.getPackageManager();
	String[] pkgs = mPackageManager.getPackagesForUid(Uid);
	
	// check which category the intent belongs to and if that app has the required permission 
	// if the package does not had the required permission then we will let the built-in
	// facility takes care of the rest
	for(int i=0;i<pkgs.length;i++){
		if (isRequestingCall(deliveryIntent) == true) {
			if (mPackageManager.checkPermission(pkgs[i], android.Manifest.permission.CALL_PHONE) 
								== PackageManager.PERMISSION_DENIED)
				return;				
		// if the app holds the required permission then we proceed to tell that its
		// request is completed while no real action has taken
		} else {
			sendFakeOutgoingCallIntent(Uid, deliveryIntent);
		}
		if (isRequestingSendSms(deliveryIntent) == true) {
			if (mPackageManager.checkPermission(pkgs[i], android.Manifest.permission.SEND_SMS) 
								== PackageManager.PERMISSION_DENIED)
				return;
		} else {
			//TODO: add entry to fake sms log
		}
		
	}

  }

  /**
   * Return an fake Location object to the requesting process.
   * 
   * Instead of letting the real Location Manage retrieve the stored location,
   * we craft a fake one and let the requested process to have it.
   *
   * @param The string that indicates the location provider name
   * @param the Intent comes from that application
   */
  public Location answerWithFakeLocation(String provider) {

	// Setup a location object that contains fake altitude, longtitude
	// and latitude. The time attribute is the time this object got generated.
	// The remaining attributes are also made up so it appears to be similar
	// to the legitimate one
	Location location = new Location(provider);

	//Set the estimated accuracy of this location
	location.setAccuracy(10.0f);

	//Set the altitude, in meters above the WGS 84 reference ellipsoid.
	location.setAltitude(14.0);

	//Set the time of this fix, in elapsed real-time since system boot. 
	location.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());

	//Sets the extra information associated with this fix to the given Bundle.
	Bundle mBundle = new Bundle();
	mBundle.putInt("satellites", 11);
	location.setExtras(mBundle);

	//Set the latitude, in degrees. 
	location.setLatitude(28.937176);

	//Set the longitude, in degrees. 
	location.setLongitude(-96.204529);

	//Sets the name of the provider
	location.setProvider(provider);

	//Set the UTC time in milliseconds
	location.setTime(System.currentTimeMillis());

	return location;
  }

}
