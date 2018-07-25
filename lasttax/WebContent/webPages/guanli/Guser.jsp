<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import ="java.util.*,com.tax.controller.*,com.tax.dao.*,com.tax.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username =(String)request.getSession().getAttribute("username");
boolean hasLogined = false;
if(username!=null){
	hasLogined = true;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>机构管理</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/icon.css" />
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/extends.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script>

$(function(){
	$('#userTable').datagrid({
		title:'用户列表', 				//标题
		method:'post',
		iconCls:'icon-tip', 			//图标
		singleSelect:false, 			//多选
		height:366, 					//高度
		fit:true,
		fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped: true, 					//奇偶行颜色不同                        
		collapsible:false,				//可折叠
		url:"user/queryList", 			//数据来源
		sortName: 'userId',				//排序的列
		sortOrder: 'asc', 				//倒序
		remoteSort: true, 				//服务器端排序
		idField:'userId', 				//主键字段 
		queryParams:{}, 				//查询条件
		pagination:true, 				//显示分页
		rownumbers:true, 				//显示行号
		columns:[[
				{field:'ck',checkbox:true,width:2}, //显示复选框 
				{field:'userAccount',title:'用户账号',width:20,sortable:true,                              
					formatter:function(value,row,index){return row.userAccount;} //需要formatter一下才能显示正确的数据                                
				},
				{field:'userPassword',title:'密码',width:20,sortable:false,hidden:true,	//密码隐藏
					formatter:function(value,row,index){return row.userPassword;}                          
				},
				{field:'userName',title:'用户姓名',width:20,sortable:true,                              
					formatter:function(value,row,index){return row.userName;}                          
				},
				{field:'userGender',title:'用户性别',width:20,sortable:false,hidden:true,
					formatter:function(value,row,index){return row.userGender == '1'?'男':'女';}
				},
				{field:'userBirthday',title:'出生日期',width:30,sortable:true,hidden:true,
					formatter:function(value,row,index){return row.userBirthday;}
				},
				{field:'userOrg',title:'机构代码',width:30,sortable:false,hidden:true, //机构代码隐藏
					formatter:function(value,row,index){return row.userOrg;}
				},
				{field:'orgId',title:'机构描述ID',width:30,sortable:false,hidden:true, //机构描述id隐藏
					formatter:function(value,row,index){return row.orgId;}
				},
				{field:'orgName',title:'所属机构',width:30,sortable:true,
					formatter:function(value,row,index){return row.orgName;}
				},
				{field:'userDuty',title:'职务',width:20,sortable:false,
					formatter:function(value,row,index){return row.userDuty;}
				},
				{field:'userTelephone',title:'联系电话',width:20,sortable:false,
					formatter:function(value,row,index){return row.userTelephone;}
				},
				{field:'mail',title:'邮件地址',width:30,sortable:false,
					formatter:function(value,row,index){return row.mail;}
				},
				{field:'qqWeixin',title:'QQ或微信',width:20,sortable:false,
					formatter:function(value,row,index){return row.qqWeixin;}
				},
				{field:'userDesc',title:'用户描述',width:20,sortable:false,
					formatter:function(value,row,index){return row.userDesc;}
				},
				{field:'enable',title:'用户状态',width:20,sortable:false,
					formatter:function(value,row,index){return row.enable == '0'?'禁用':'正常';}
				},
				{field:'isSys',title:'是否系统用户',width:20,sortable:false,
					formatter:function(value,row,index){return row.isSys == '0'?'否':'是';}
				}
				]],
		toolbar:'#tt_btn',  
        pagination:true,
	});
	
	//新增弹出框
	$("#save").on("click", function(){
		$parent("#parent_win").window({
			width:274,
			height:225,
			href:'webPages/guanli/addUser.jsp',
			title:'新增用户'
		});
	});
	//修改
	$("#update").on("click", function(){
		$parent.messager.alert("提示","update", "info");
	});
	//删除
	$("#delete").on("click", function(){
		$parent.messager.alert("提示","delete", "info");
	});
})

function viewDetail(date, id){
	$parent.messager.alert("提示","查询详细", "info");
}

//监听窗口大小变化
window.onresize = function(){
	setTimeout(domresize,300);
};
//改变表格宽高
function domresize(){
	$('#userTable').datagrid('resize',{  
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width()
	});
}
</script>
</head>
<body class="easyui-layout" >
<div id="body" region="center" > 
  <!-- 查询条件区域 -->
  <div id="search_area" >
    <div id="conditon">
      <table border="0">
       <tr>
							<td width="8%" align="right">账号：</td>
							<td width="17%" align="left"><input name="userAccount" class="easyui-textbox" style="width:90%;"></td>
							<td width="8%" align="right">姓名：</td>
							<td width="12%" align="left"><input name="userName" class="easyui-textbox" style="width:90%;"></td>
							<td width="8%" align="right">性别：</td>
							<td width="12%" align="left">
								<select class="easyui-combobox" name="userGender" style="width:90%;" data-options="editable:false">
				        			<option value="">请选择</option>
				        			<option value="1">男</option>
				        			<option value="2">女</option>
				    			</select>
							</td>
							<td width="35%" align="left">
								<a onclick="clearUserForm();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
							</td>                        
						</tr>
						<tr>
							<td align="right">所属机构：</td>
							<td align="left">
								<input id="userOrg" type="text" name="userOrg" class="easyui-textbox" style="width:90%;">
							</td>
							<td align="right">用户状态：</td>
							<td align="left">
								<select class="easyui-combobox" name="enable" style="width:90%;" data-options="editable:false">
									<option value="">全部</option>
				        			<option value="1">正常</option>
				        			<option value="0">禁用</option>
				    			</select>
							</td>
							<td align="right">出生日期：</td>
							<td align="left"><input name="userBirthday" class="Wdate" type="text" style="width:90%;" 
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
							<td align="left">
								<a  onclick="searchUser();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
							</td>
						</tr>
      </table>
    </div>
    <span id="openOrClose">111</span> 
  </div>
  <!-- 数据表格区域 -->
  <table id="userTable" style="table-layout:fixed;" ></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
      <a href="javascript:void(0)"  id="save" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
      <a href="javascript:void(0)"  id="update" class="easyui-linkbutton" iconCls="icon-edit" plain="true">更新</a> 
      <a href="javascript:void(0)"  id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
     </div>
</div>
</body>
</html>
