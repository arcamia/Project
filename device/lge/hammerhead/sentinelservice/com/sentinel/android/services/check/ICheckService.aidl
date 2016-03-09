package com.sentinel.android.services.check;

/**
 * System-private API for talking to the LogService.
 *
 * {@hide}
 */
interface ICheckService {
	void flushLog();

    	/**
     	* Compare the two given Uids. This function tells if the
     	* calling process belongs to the monitoring list.
     	* @param the Uid of the calling process.
     	*/
	boolean compareUid(int callingUid);
}
