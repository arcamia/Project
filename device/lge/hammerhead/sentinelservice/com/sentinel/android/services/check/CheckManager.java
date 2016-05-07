package com.sentinel.android.services.check;

import android.os.IBinder;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.Process;
import android.util.Log;

import android.widget.Toast;
import android.app.Activity;

import java.util.*;
import java.lang.*;

import android.content.Intent;
import android.app.PendingIntent;
import android.location.Location;

public class CheckManager {
    private static final String TAG = "CheckManager";
    private static final String REMOTE_SERVICE_NAME = ICheckService.class.getName();
    private final ICheckService service;

    public static CheckManager getInstance() {
        return new CheckManager();
    }

    private CheckManager() {
        Log.d(TAG, "Connecting to ICheckService by name [" + REMOTE_SERVICE_NAME + "]");
        this.service = ICheckService.Stub.asInterface(ServiceManager.getService(REMOTE_SERVICE_NAME));
        if (this.service == null) {
	        throw new IllegalStateException("Failed to find ICheckService by name [" + REMOTE_SERVICE_NAME + "]");
        }
    }   

    public void flushLog() {
        try {
            Log.d(TAG, "Flushing logs");
            this.service.flushLog();
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to flush log", e);
        }
    }

    /**
     * Returns true if the Uid of thecalling process belongs to the monitoring list.
     * Return false if the Uid not on the monitoring list.
     */
    public boolean compareUid(int callingUid) {
        try {
            Log.d(TAG, "Comparing Uids");
            return this.service.compareUid(callingUid);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to compare Uids", e);
        }
    }

    /**
     * Display the message in an activity.
     * 
     */
    public void displayNotice(String msg) {
        try {
            Log.d(TAG, "Display a message");
            this.service.displayNotice(msg);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to display notice", e);
        }
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
        try {
            Log.d(TAG, "Send a outgoing call broadcast");
            this.service.sendFakeOutgoingCallIntent(appUid, callIntent);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to send a outgoing call broadcast", e);
        }
    }

    /**
     * Block the components of a blacklisted app that associate
     * with the given intent.
     *
     * @param the intent that we don't want the blacklisted components to know
     */
    public void blockIntentReceiver(Intent callIntent) {
        try {
            Log.d(TAG, "Block the receivers associate with the intent");
            this.service.blockIntentReceiver(callIntent);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to block the receivers associate with the intent", e);
        }
    }

    /**
     * Send fake phone call notification to the destination application.The function
     * sends a seri of notifications that tells the app that there is an ongoing/missed
     * phone call, while it does not happen.
     * 
     * @param The name of the package that we want to notify
     * @param The type of call we want to notify (incoming/outgoing)
     * @param The phone number that associate with the fake call
     * @param The time duration of the fake call (leave as 0 for missed call)
     * measure in seconds
     */
    public void sendFakeCallNotification(String packageName, String callType, String phoneNumber, int duration) {
        try {
            Log.d(TAG, "Send fake phone call notifications");
            this.service.sendFakeCallNotification(packageName, callType, phoneNumber, duration);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to send fake phone call notifications", e);
        }
    }

    /**
     * Get the UID of the calling appication
     */
    public int getCallingAppUid() {
        try {
            Log.d(TAG, "Get the calling uid");
            return this.service.getCallingAppUid();
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to get the calling uid", e);
        }
    }

    /**
     * Check if the intent is for asking to make a phone call
     *
     * @param the intent that we want to examine
     */
    public boolean isRequestingCall(Intent callIntent) {
        try {
            Log.d(TAG, "Get the calling uid");
            return this.service.isRequestingCall(callIntent);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to get the calling uid", e);
        }
    }

    /**
     * Check if the intent is for asking to send sms message
     *
     * @param the intent that we want to examine
     */
    public boolean isRequestingSendSms(Intent callIntent) {
        try {
            Log.d(TAG, "Get the calling uid");
            return this.service.isRequestingSendSms(callIntent);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to get the calling uid", e);
        }
    }

    /**
     * Send fake notification to the application that uses the SmsManager 
     * utility to send text message
     *
     * @param the UID of the application that we want to send fake notification
     */
    public void processSendTextMessageUtility(int Uid, String destAddress, String srcAddress, String text,
		 PendingIntent sentIntent, PendingIntent deliveryIntent) {
        try {
            Log.d(TAG, "Process the send text message request");
            this.service.processSendTextMessageUtility(Uid, destAddress, srcAddress, text,
		 sentIntent, deliveryIntent);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to process the send text message request", e);
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
    public void processIndirectIntent(int Uid, Intent deliveryIntent, int requestCode) {
        try {
            Log.d(TAG, "Process the indirect intent");
            this.service.processIndirectIntent(Uid, deliveryIntent, requestCode);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to process the indirect intent", e);
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
        try {
            Log.d(TAG, "Process the indirect intent");
             return this.service.answerWithFakeLocation(provider);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to process the indirect intent", e);
        }
    }

    /**
     * Check if the intent is for asking to take a photo from camera
     *
     * @param the intent that we want to examine
     */
    public boolean isRequestingCameraPhoto(Intent callIntent) {
        try {
            Log.d(TAG, "Check if intent photo");
            return this.service.isRequestingCameraPhoto(callIntent);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to check if intent photo", e);
        }
    }

    /**
     * Create an intent that contain a fake photo for the requesting app
     *
     * @param none
     */
    public Intent getFakePhotoByIntent() {
        try {
            Log.d(TAG, "Get intent photo");
            return this.service.getFakePhotoByIntent();
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to get intent photo", e);
        }
    }

    /**
     * Make a copy of the captured photo into our own service
     * directory for later inspection
     *
     * @param the uid of the blacklisted app that used the camera
     * @param the captured image photo
     */
    public void saveCapturedPhotoFromCamera(int uid, byte[] bytes) {
        try {
            Log.d(TAG, "Save photo");
            this.service.saveCapturedPhotoFromCamera(uid, bytes);
        } catch (RemoteException e) {
            throw new RuntimeException("Failed to save photo", e);
        }
    }

}
