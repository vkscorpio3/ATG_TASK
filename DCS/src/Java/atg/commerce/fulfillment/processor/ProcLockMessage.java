/*<ATGCOPYRIGHT>
 * Copyright (C) 1999-2011 Art Technology Group, Inc.
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

package atg.commerce.fulfillment.processor;

import atg.service.pipeline.*;
import atg.core.util.ResourceUtils;
import atg.commerce.fulfillment.*;
import atg.commerce.messaging.*;
import atg.commerce.order.InvalidParameterException;
import atg.service.lockmanager.*;

import java.util.*;
import javax.jms.*;

/**
 * This processor uses the ClientLockManager to guarrantee that only one thread 
 * dealing with a message for a given key is running through the system at any
 * moment in time.  The key used to acquire the lock is returned by the method
 * getKeyForMessage().
 *
 * @author Michael Traskunov
 * @version $Id: //product/DCS/version/10.0.3/Java/atg/commerce/fulfillment/processor/ProcLockMessage.java#2 $$Change: 651448 $
 * @updated $DateTime: 2011/06/07 13:55:45 $$Author: rbarbier $
 */
public class ProcLockMessage implements PipelineProcessor {
  /** Class version string */
  public static String CLASS_VERSION = "$Id: //product/DCS/version/10.0.3/Java/atg/commerce/fulfillment/processor/ProcLockMessage.java#2 $$Change: 651448 $";

  static final String MY_RESOURCE_NAME = "atg.commerce.fulfillment.FulfillmentResources";

  /** Resource Bundle **/
  private static java.util.ResourceBundle sResourceBundle = java.util.ResourceBundle.getBundle(MY_RESOURCE_NAME, atg.service.dynamo.LangLicense.getLicensedDefault());
  
  private final int SUCCESS = 1;
  
  //-----------------------------------------------
  public ProcLockMessage() {
  }

  //-----------------------------------------------
  /**
   * Returns the valid return codes
   * 1 - The processor completed
   * @return an integer array of the valid return codes.
   */
  public int[] getRetCodes()
  {
    int[] ret = {SUCCESS};
    return ret;
  } 

  //-----------------------------------------------
  /**
   * This method gets a message received by a Fulfiller router and locks it by
   * calling the getKeyForMessage routine.
   *
   * This method requires that a JMS message and OrderFulfiller object be supplied
   * in pParam in a HashMap. Use the PipelineConstants class' static members to key
   * the objects in the HashMap.
   *
   * @param pParam a HashMap which must contain a JMS message and OrderFulfiller object
   * @param pResult a PipelineResult object which stores any information which must
   *                be returned from this method invokation
   * @return an integer specifying the processor's return code
   * @exception Exception throws any exception back to the caller
   * @see atg.service.pipeline.PipelineProcessor#runProcess(Object, PipelineResult)
   */
  public int runProcess(Object pParam, PipelineResult pResult) throws Exception
  {
    HashMap map = (HashMap) pParam;
    FulfillerSystem of = (FulfillerSystem) map.get(PipelineConstants.ORDERFULFILLER);
    String orderId = (String) map.get(PipelineConstants.ORDERID);
    
    if (of == null)
        throw new InvalidParameterException(ResourceUtils.getMsgResource("InvalidOrderFulfillerParameter",
                                                                         MY_RESOURCE_NAME, sResourceBundle));

    if (orderId == null)
        throw new InvalidParameterException(ResourceUtils.getMsgResource("InvalidOrderIdParameter",
                                                                        MY_RESOURCE_NAME, sResourceBundle));
    
    try {
      of.getClientLockManager().acquireWriteLock(orderId);
      LockReleaser lr = new LockReleaser(of.getClientLockManager(),
                                         of.getTransactionManager().getTransaction());
    
      lr.addWriteLock(orderId);
    }
    catch(LockManagerException lme) {  
      try {
        of.getClientLockManager().releaseWriteLock(orderId);
      }
      catch(LockManagerException le) {
        pResult.addError("InternalLockManagerException", le);
      }
      pResult.addError("LockManagerException", lme);
      return STOP_CHAIN_EXECUTION_AND_ROLLBACK;
    }

    return SUCCESS;
  }

}
