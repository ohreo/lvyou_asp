 <!--#include file="../inc/utf.asp"-->
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/users.asp"-->
<!--#include file="../inc/category.asp"-->
<!--#include file="../inc/sys.asp"-->
<!--#include file="../inc/tfunction.asp"-->
<%
Dim Action,login,register
Action = Request.QueryString("Action")
Select Case Action
	Case "FromBBsAct"
		RealName = Replace(Request.Form("RealName"),"'","''")
		Email = Replace(Request.Form("Email"),"'","''")
		sex = Replace(Request.Form("sex"),"'","''")
		phone = Replace(Request.Form("phone"),"'","''")
		idcard = Replace(Request.Form("idcard"),"'","''")
		set u=new Users
		if userName <> "" and RealName <> "" and password <> "" and sex <> "" and phone <> "" and idcard <> "" then
			u.siteout()
			u.userName = userName
			u.RealName = RealName
			u.password = password
			u.sex = sex
			u.phone = phone
			u.idcard = idcard
			u.jifen = "1"
			u.joinTime = now()
			u.adduser()
			isUserLogin = true
			Tourl("./Index.asp")
		end if
	Case "RegAction"
		userName = Replace(Request.Form("userName"),"'","''")
		RealName = Replace(Request.Form("RealName"),"'","''")
		password = Replace(Request.Form("password"),"'","''")
		Email = Replace(Request.Form("Email"),"'","''")
		sex = Replace(Request.Form("sex"),"'","''")
		phone = Replace(Request.Form("phone"),"'","''")
		idcard = Replace(Request.Form("idcard"),"'","''")
		set u=new Users
		if userName <> "" and RealName <> "" and password <> "" and sex <> "" and phone <> "" and idcard <> "" then
			u.getuser(userName)
			if not u.rs.eof then die "<script>alert('-_-! Mingzi ChongFu!');history.go(-1);</script>"
			'register = uc_user_register(userName,password,Email,"","")
			Response.cookies(CookieName)("UserName") = userName
			Response.cookies(CookieName)("password") = MD5(password)
			Response.cookies(CookieName)("Uid") = register
			Response.cookies(CookieName)("isUserLogin") = "True"
			'u.siteout()
			'If register > "0" Then
	    	'	echo "ע��ɹ�" 
			'ElseIf register = "-1" Then 
			'    echo "�û������Ϸ�" 
			'ElseIf register = "-2" Then 
			'    echo "����Ҫ����ע��Ĵ���" 
			'ElseIf register = "-3" Then 
			'    echo "�û����Ѿ�����" 
			'ElseIf register = "-4" Then 
			'    echo "Email ��ʽ����" 
			'ElseIf register = "-5" Then 
			'    echo "Email ������ע��" 
			'ElseIf register = "-6" Then 
			'    echo "�� Email �Ѿ���ע��" 
			'ElseIf register = "-7" Then 
			'    echo "ע����Ϣ��д��ȫ" 
			'Else
			'    echo "δ����" 
			'End If
			u.userName = userName
			u.RealName = RealName
			u.password = MD5(password)
			u.sex = sex
			u.phone = phone
			u.idcard = idcard
			u.jifen = ChushiJifen
			u.joinTime = now()
			u.adduser()

			isUserLogin = true
			Tourl("./Index.asp")
		else
			echo "��Ǹ������ѱ����д�������ܼ���ע��! <a href='javascript:history.go(-1);'>����</a>"
		end if
'		u.rs.close
		set u.rs = nothing
		set u = nothing
	Case Else
		echo userReg_temp
end Select
%>