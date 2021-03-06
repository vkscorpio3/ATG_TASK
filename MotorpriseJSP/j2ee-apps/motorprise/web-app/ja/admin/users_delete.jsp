<%@ taglib uri="dsp" prefix="dsp" %>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<dsp:page>


<% /* This page displays all the users in the current organization except the user who's logged in (if he's in the same organization) */ %>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/projects/b2bstore/userprofiling/DeleteProfileFormHandler"/>
<dsp:importbean bean="/atg/userdirectory/droplet/UserList"/>
<dsp:importbean bean="/atg/dynamo/droplet/Range"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>


<dsp:include page="../common/HeadBody.jsp"><dsp:param name="pagetitle" value=" ユーザの削除"/></dsp:include>

<table border=0 cellpadding=0 cellspacing=0 width=800>
  <tr>
    <td colspan=2><dsp:include page="../common/BrandNav.jsp"></dsp:include></td>
  </tr>
  <tr bgcolor="#DBDBDB" > 
    <td colspan=2 height=18> &nbsp; <span class=small>
      <dsp:a href="business_units.jsp">会社管理</dsp:a> &gt; 
      <dsp:a href="company_admin.jsp"><dsp:valueof bean="Profile.currentOrganization.name"/></dsp:a> &gt; ユーザの削除</span></td>
  </tr>
  
  <tr valign=top> 
    <td width=55><dsp:img src="../images/d.gif"/></td>

  
    <td valign="top" width=745>
    <table border=0 cellpadding=4 width=80%>
      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
      <tr valign=top>
        <td colspan=2><span class=big>会社管理</span><br><span class=little><dsp:valueof bean="Profile.currentOrganization.name" /></span></td>
      </tr>

      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>

      <tr valign=top>
        <td colspan=2>
        <table width=100% cellpadding=3 cellspacing=0 border=0>
        <tr><td class=box-top>&nbsp;ユーザの削除</td></tr></table>
        </td>
      </tr>

      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>

      <tr>
        <td> 
     
        <dsp:droplet name="UserList">
      	<dsp:param bean="Profile.currentOrganization.repositoryid" name="organizationId"/>
        <dsp:param bean="Profile.id" name="excludeId"/>
	      <dsp:oparam name="output">
          <dsp:form formid="delete" action="users_delete_confirm.jsp" method="post">
	        <dsp:input bean="DeleteProfileFormHandler.itemDescriptorName" type="hidden" value="user"/>
          <dsp:droplet name="Range">
            <dsp:param name="array" param="users"/>
            <dsp:param name="start" param="startIndex"/>
            <dsp:param name="howMany" value="10"/>
            <dsp:param name="sortProperties" value="+name"/>
            <dsp:oparam name="output">
                <dsp:input bean="DeleteProfileFormHandler.repositoryIds" paramvalue="element.repositoryItem.id" type="checkbox"/>
		            <dsp:valueof param="element.repositoryItem.lastName"/>&nbsp;<dsp:valueof param="element.repositoryItem.firstName"/><BR>
            </dsp:oparam>
 
        <dsp:oparam name="outputEnd">
              <dsp:droplet name="IsEmpty">
                <dsp:param name="value" param="nextHowMany"/>
                <dsp:oparam name="false"><BR>
                  <dsp:a href="users_delete.jsp">  次の 10 件 <dsp:param name="startIndex" param="nextStart"/></dsp:a>
                </dsp:oparam>
              </dsp:droplet>
          </dsp:oparam>
          
          </dsp:droplet>

           <p>
          <table>
          <tr>
          <td>
          <input type="submit" value="削除"> &nbsp;
        </dsp:form>
          </td>
          <td>
        <dsp:form formid="cancel" action="company_admin.jsp" method="post">
            <input type="submit" value="キャンセル" name="submit">
          </dsp:form>
           </td>
          </tr>
          </table>

          </dsp:oparam>
          <dsp:oparam name="error"> エラー：削除するユーザはありません。ID: <dsp:valueof bean="Profile.currentOrganization"/>
          </dsp:oparam>
          <dsp:oparam name="empty"> 削除するユーザはありません。
          </dsp:oparam>
          
        </dsp:droplet>
         

        <p>
     
        </td>      
      </tr>
     
      <tr><td colspan=2><dsp:img src="../images/d.gif" vspace="0"/></td></tr>
  
    </table>

    </td>
  </tr>

</table>
</div>
</body>
</html>



</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/10.0.3/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/ja/admin/users_delete.jsp#2 $$Change: 651448 $--%>
