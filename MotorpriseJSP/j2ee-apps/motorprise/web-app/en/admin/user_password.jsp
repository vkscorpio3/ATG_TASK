<%@ taglib uri="dsp" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/MultiUserUpdateFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value="  Change User Password"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
    <dsp:a href="business_units.jsp">Company Admin</dsp:a> &gt;
    <dsp:a href="company_admin.jsp"><dsp:valueof bean="Profile.currentOrganization.name"/></dsp:a> &gt;
    <dsp:a href="users.jsp">View Users</dsp:a> &gt;
    <dsp:a href="user.jsp">User Account</dsp:a> &gt;
    Change User Password 
    </span></td>
  </tr>
  

  <tr valign=top> 
    <td width=55><dsp:img src="../images/d.gif"/></td>

    <!-- main content area -->
    <td valign="top" width=745>
    <dsp:form action="user.jsp" method="post">
      <dsp:input bean="MultiUserUpdateFormHandler.repositoryIds" beanvalue="Profile.currentUser.id" type="hidden"/>
      <dsp:input bean="MultiUserUpdateFormHandler.confirmPassword" type="hidden" value="true"/>
      <dsp:input bean="MultiUserUpdateFormHandler.UpdateSuccessURL" type="hidden" value="user.jsp"/>
      <dsp:input bean="MultiUserUpdateFormHandler.UpdateErrorURL" type="hidden" value="user_password.jsp"/>
 
     <tr>
      <td colspan=2>

      <dsp:include page="../common/FormError.jsp"></dsp:include>


      </td>
      </tr>

      
      
    <table border=0 cellpadding=4 width=80%>
      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr valign=top>
        <td colspan=2><span class=big>Company Administration</span><br><span class=little><dsp:valueof bean="Profile.currentOrganization.name" /></span></td>
      </tr>

      <!-- vertical space -->
      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>

      <tr valign=top>
        <td colspan=2>
        <table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;Change User Password</td></tr></table>
        </td>
      </tr>

      <!-- vertical space -->
      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>

      <tr>
        <td align=right><span class=smallb>User</span></td>
        <td><dsp:valueof bean="Profile.currentUser.firstName"/>&nbsp;<dsp:valueof bean="Profile.currentUser.lastName"/></td>
      </tr>
      <tr>
        <td align=right><span class=smallb>Login</span></td>
        <td><dsp:valueof bean="Profile.currentUser.login"/></td>
      </tr>
      
      <tr>
        <td align=right><span class=smallb>New password</span></td>
        <td width=75%><dsp:input bean="MultiUserUpdateFormHandler.value.Password" size="30" type="password" value=""/>
      </tr>
      <tr>
        <td align=right><span class=smallb>Confirm password</span></td>
        <td><dsp:input bean="MultiUserUpdateFormHandler.value.CONFIRMPASSWORD" size="30" type="password" value=""/></td>
      </tr>

      <tr>
      <td><dsp:img src="../images/d.gif"/></td>
        <td>
       
          <dsp:input bean="MultiUserUpdateFormHandler.update" type="submit" value=" Save "/> &nbsp;
          <!--    <dsp:form action="user.jsp" method="post">
               <dsp:input bean="MultiUserUpdateFormHandler.UpdateErrorURL" type="hidden" value="submitme"/> -->
                <dsp:input bean="MultiUserUpdateFormHandler.cancel" type="submit" value=" Cancel "/>
              <!-- </dsp:form> -->
        </td>
      </tr>

      <!-- vertical space -->
      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
   
    </table>
    </dsp:form>
    </td>
  </tr>

</table>
</div>
</body>
</html>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/en/admin/user_password.jsp#2 $$Change: 651448 $--%>
