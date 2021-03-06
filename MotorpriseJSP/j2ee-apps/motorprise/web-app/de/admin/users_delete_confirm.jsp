<%@ taglib uri="dsp" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/projects/b2bstore/userprofiling/DeleteProfileFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/projects/b2bstore/userdirectory/ProfileLookUp"/>

<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value=" Benutzer l�schen"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
        <dsp:a href="business_units.jsp">Unternehmensverwaltung</dsp:a> &gt; 
        <dsp:a href="company_admin.jsp"><dsp:valueof bean="Profile.currentOrganization.name"/></dsp:a> &gt;Benutzer l�schen</span></td>
  </tr>
  

  <tr valign=top> 
    <td width=55><dsp:img src="../images/d.gif"/></td>

    <% /*  main content area */ %>
    <td valign="top" width=745>  
    <table border=0 cellpadding=4 width=80%>
      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr valign=top>
        <td colspan=2><span class=big>Unternehmensverwaltung</span><br><span class=little><dsp:valueof bean="Profile.currentOrganization.name" /></span></td>
      </tr>

      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>

      <tr valign=top>
        <td colspan=2>
        <table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;Benutzer l�schen</td></tr></table>
        </td>
      </tr>

      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      
      <tr> 
        <td><b>Die folgenden Benutzer l�schen?</b></td>
      </tr>
	  <tr>
        <td>
        <dsp:form action="company_admin.jsp" method="post">
     
        <dsp:droplet name="ForEach">
        <dsp:param bean="DeleteProfileFormHandler.repositoryIds" name="array"/>
        <dsp:param name="elementName" value="userId"/>
        <dsp:oparam name="output">
        	<dsp:droplet name="ProfileLookUp">
		<dsp:param name="id" param="userId"/>
		<dsp:param name="elementName" value="user"/>
		<dsp:oparam name="output">
			<dsp:valueof param="user.firstName"/>
			&nbsp;
			<dsp:valueof param="user.lastName"/><br>
             	</dsp:oparam>
             	</dsp:droplet>
         </dsp:oparam>
         </dsp:droplet>
            
            <br>
            <dsp:input bean="DeleteProfileFormHandler.delete" type="submit" value="L�schen"/> &nbsp;
            <dsp:input bean="DeleteProfileFormHandler.cancel" type="submit" value="Abbrechen"/>
            </dsp:form>
         </td>      
      </tr>
    </table>

    </td>
  </tr>

</table>

</body>
</html>



</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/de/admin/users_delete_confirm.jsp#2 $$Change: 651448 $--%>
