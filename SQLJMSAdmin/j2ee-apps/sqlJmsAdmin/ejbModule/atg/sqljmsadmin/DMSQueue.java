/*<ATGCOPYRIGHT>
 * Copyright (C) 1997-2011 Art Technology Group, Inc.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Art Technology Group.  This notice must be
 * included on all copies, modifications and derivatives of this
 * work.
 *
 * Art Technology Group (ATG) MAKES NO REPRESENTATIONS OR WARRANTIES 
 * ABOUT THE SUITABILITY OF THE SOFTWARE, EITHER EXPRESS OR IMPLIED, 
 * INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. ATG SHALL NOT BE
 * LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, 
 * MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
 *
 * "Dynamo" is a trademark of Art Technology Group, Inc.
 </ATGCOPYRIGHT>*/

package atg.sqljmsadmin;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

/****************************************
 * The remote interface for the DMSQueue entity bean.
 *
 * @author Stephen Abramson <stephena@atg.com>
 * @version $Id: //product/DAS/version/10.0.3/release/SQLJMSAdmin/j2ee-apps/sqlJmsAdmin/ejbModule/atg/sqljmsadmin/DMSQueue.java#2 $$Change: 651448 $
 * @updated $DateTime: 2011/06/07 13:55:45 $$Author: rbarbier $
 ****************************************/

public interface DMSQueue
    extends EJBObject
{
    //----------------------------------------
    /** Class version string */
    public static String CLASS_VERSION =
        "$Id: //product/DAS/version/10.0.3/release/SQLJMSAdmin/j2ee-apps/sqlJmsAdmin/ejbModule/atg/sqljmsadmin/DMSQueue.java#2 $$Change: 651448 $";

    //----------------------------------------
    // Id
    /**
     * get Id
     * @return the Id
     */
    public Long getId()
	throws RemoteException;

    //----------------------------------------
    // Name
    /**
     * get Name
     * @return the Name
     */
    public String getName()
	throws RemoteException;

    //----------------------------------------
    // TempId
    /**
     * get TempId
     * @return the TempId
     */
    public long getTempId()
	throws RemoteException;

    //----------------------------------------
    // QueueEntries
    /**
     * get QueueEntries
     * @return the QueueEntries
     */
    public DMSQueueEntry[] getQueueEntries()
	throws RemoteException, DMSAdminException;

    //----------------------------------------
    /**
     * get the pending messages in this queue
     */
    public DMSQueueEntry[] pendingMessages()
	throws RemoteException, DMSAdminException;

    //----------------------------------------
    /**
     * get the unhandled messages in this queue
     */
    public DMSQueueEntry[] unhandledMessages()
	throws RemoteException, DMSAdminException;

    //----------------------------------------
    /**
     * add some queue entries to this queue
     */
    public void addQueueEntries(Long[] pMessageIds, boolean pDuplicateMessages)
	throws RemoteException, DMSAdminException;

} // end of class