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
}
