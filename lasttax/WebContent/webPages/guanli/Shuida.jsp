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
	$('#bussinessAdminAnswerTable').datagrid({
		title:'回答审核列表', 								//标题
		method:'post',
		iconCls:'icon-tip', 							//图标
		singleSelect:false, 							//多选
		height:366, 									//高度
		fit:true,
		fitColumns: false, 								//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped: true, 									//奇偶行颜色不同                        
		collapsible:false,								//可折叠
		url:"admin/examine/answer/answerQueryList",		//数据来源
		sortName: 'id',									//排序的列
		sortOrder: 'asc', 								//倒序
		remoteSort: true, 								//服务器端排序
		idField:'id', 									//主键字段 
		queryParams:{}, 								//查询条件
		pagination:true, 								//显示分页
		rownumbers:true, 								//显示行号
		columns:[[
			{field:'ck',checkbox:true,width:2}, //显示复选框 
			{field:'id',title:'ID',sortable:true, hidden:true,width:100,                             
				formatter:function(value,row,index){return row.id;}                                
			},
			{field:'userName',title:'回复人',sortable:true, hidden:false,width:80,                             
				formatter:function(value,row,index){return row.userName;}                                
			},
			{field:'title',title:'回复的问题',sortable:true, hidden:false,width:90,                             
				formatter:function(value,row,index){return row.title;}                                
			},
			{field:'content',title:'内容',sortable:true, hidden:false,width:250,                             
				formatter:function(value,row,index)
				{
					var url="<a href=javascript:contentDetails()>"+row.content+"</a>"
					return url;
				}                                
			},
			{field:'createdTime',title:'创建时间',sortable:true, hidden:false,width:80,                             
				formatter:function(value,row,index){return row.createdTime;}                                
			},
			{field:'status',title:'审核状态',sortable:true, hidden:false,width:80,                             
				formatter:function(value,row,index){
						if(row.status=='0'){
							return row.status='审核中';
						}else if(row.status=='1'){
							return row.status='审核通过';
						}else{
							return row.status='审核未通过';
						}
					}                                
			},
			{field:'browseCount',title:'浏览数',sortable:true, hidden:false,width:80,                             
				formatter:function(value,row,index){return row.browseCount;}                                
			},
			{field:'likeCount',title:'点赞数',sortable:true, hidden:false,width:80,                             
				formatter:function(value,row,index){return row.likeCount;}                                
			},
			{field:'starCount',title:'收藏数',sortable:true, hidden:false,width:100,                             
				formatter:function(value,row,index){return row.starCount;}                                
			},
			{field:'enabled',title:'是否可用',sortable:true, hidden:false,width:80,                             
				formatter:function(value,row,index){return row.enabled == '0'?'不可用':'可用';}
			},
		]],
		toolbar:'#tt_btn',  
        pagination:true,
	});
	
	//通过
	$("#pass").on("click", function(){
		$parent.messager.alert("提示","审核通过", "info");
	});
	//不通过
	$("#unpass").on("click", function(){
		$parent.messager.alert("提示","审核不通过", "info");
	});
	//删除
	$("#delete").on("click", function(){
		$parent.messager.alert("提示","已删除", "info");
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
	$('#bussinessAdminAnswerTable').datagrid('resize',{  
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
								<td width="10%" align="right">回复内容：</td>
								<td width="15%" align="left">
									<input name="content" class="easyui-textbox" style="width:90%;">
								</td>
								<td width="10%" align="right">回复人：</td>
								<td width="15%" align="left">
									<input name="user.userName" class="easyui-textbox" style="width:90%;">
								</td>
								<td width="50%" align="center" >
									<a onclick="searchAnswer();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a onclick="clearAnswer();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
								</td>
							</tr>
      </table>
    </div>
    <span id="openOrClose">111</span> 
  </div>
  <!-- 数据表格区域 -->
  <table id="bussinessAdminAnswerTable" style="table-layout:fixed;" ></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">

	<a href="javascript:void(0)"  id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
      <a href="javascript:void(0)"  id="pass" class="easyui-linkbutton" iconCls="icon-add" plain="true">审核通过</a>
      <a href="javascript:void(0)"  id="unpass" class="easyui-linkbutton" iconCls="icon-edit" plain="true">审核不通过</a> 
      
   </div>
</div>
</body>
</html>
