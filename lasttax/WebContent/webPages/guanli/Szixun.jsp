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
	$('#bussinessAdminQuestionTable').datagrid({
		title:'咨询审核列表', 								//标题
		method:'post',
		iconCls:'icon-tip', 							//图标
		singleSelect:false, 							//多选
		height:366, 									//高度
		fit:true,
		fitColumns: false, 								//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped: true, 									//奇偶行颜色不同                        
		collapsible:false,								//可折叠
		url:"admin/examine/question/questionQueryList", //数据来源
		sortName: 'id',									//排序的列
		sortOrder: 'asc', 								//倒序
		remoteSort: true, 								//服务器端排序
		idField:'id', 									//主键字段 
		queryParams:{}, 								//查询条件
		pagination:true, 								//显示分页
		rownumbers:true, 								//显示行号
		columns:[[
				{field:'ck',checkbox:true,width:2}, //显示复选框 
				{field:'id',title:'id',sortable:true, hidden:true,width:100,                             
					formatter:function(value,row,index){return row.id;}                                
				},
				{field:'userId',title:'提问者',sortable:true, hidden:false,width:80,                             
					formatter:function(value,row,index){return row.userName;}                                
				},
				{field:'category',title:'提问类别',sortable:true, hidden:false,width:80,                             
					formatter:function(value,row,index){return row.category == '0'?'普通提问':'悬赏提问';}                     
				},
				{field:'rewardAmount',title:'悬赏金额',sortable:true, hidden:false,width:80,                             
					formatter:function(value,row,index){return row.rewardAmount;}                                
				},
				{field:'maj',title:'专业类别',sortable:true, hidden:false,width:90,                             
					formatter:function(value,row,index){return row.maj;}                                
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
				{field:'createdTime',title:'审核创建时间',sortable:true, hidden:false,width:100,                             
					formatter:function(value,row,index){return row.createdTime;}                                
				},
				{field:'title',title:'提问标题',sortable:true, hidden:false,width:150,                             
					formatter:function(value,row,index){return row.title;}                                
				},
				{field:'content',title:'提问内容',sortable:true, hidden:false,width:200,                             
					formatter:function(value,row,index){
						var url="<a href=javascript:contentDetails()>"+row.content+"</a>"
						return url;
						}                                  
				},
				{field:'browseCount',title:'浏览次数',sortable:true, hidden:false,width:100,                             
					formatter:function(value,row,index){return row.browseCount;}                                
				},
				{field:'answerId',title:'提问者采纳的答案',sortable:true, hidden:false,width:150,                             
					formatter:function(value,row,index){return row.answerContent;}                                
				},
				{field:'answerCount',title:'答案个数',sortable:true, hidden:false,width:100,                             
					formatter:function(value,row,index){return row.answerCount;}                                
				},
				{field:'starCount',title:'收藏个数',sortable:true, hidden:false,width:100,                             
					formatter:function(value,row,index){return row.starCount;}                                
				},
				{field:'enabled',title:'是否可用',sortable:true, hidden:false,width:100,                             
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
	$('#bussinessAdminQuestionTable').datagrid('resize',{  
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
								<td width="10%" align="right">提问标题：</td>
								<td width="15%" align="left">
									<input name="title" class="easyui-textbox" style="width:90%;">
								</td>
								<td width="10%" align="right">提问者：</td>
								<td width="15%" align="left">
									<input name="user.userName" class="easyui-textbox" style="width:90%;">
								</td>
								<td width="50%" align="center" >
									<a onclick="searchQuestion();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a onclick="clearQuestion();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
								</td>
							</tr>
      </table>
    </div>
    <span id="openOrClose">111</span> 
  </div>
  <!-- 数据表格区域 -->
  <table id="bussinessAdminQuestionTable" style="table-layout:fixed;" ></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
  <a href="javascript:void(0)"  id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
      <a href="javascript:void(0)"  id="pass" class="easyui-linkbutton" iconCls="icon-add" plain="true">审核通过</a>
      <a href="javascript:void(0)"  id="unpass" class="easyui-linkbutton" iconCls="icon-edit" plain="true">审核不通过</a> 
      </div>
</div>
</body>
</html>
