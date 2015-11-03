<%@ page language="java" contentType="text/html;charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Struts ognl 演示</title>
</head>
<body>
		<h3>l访问OGNL上下文和action上下文</h3>
		
		<p>application.msg:<s:property value="#application.msg"/></p>
		<p>session.msg:<s:property value="#session.msg"/></p>
		<p>request.msg:<s:property value="#request.msg"/></p>
		<hr />
		
		<p>parameters.msg:<s:property value="#parameters.msg"/></p>	
		<p>attr.msg:<s:property value="attr.msg"/></p>
		<hr />
		
		<h3>过滤和投影集合</h3>
		<h5>所有元素</h5>
		<s:iterator value="persons">
				姓名:<s:property value="name"/>---年龄:<s:property value="age"/></br>
		</s:iterator>
		<hr />
		
		<h5>年龄大于25的元素</h5>
		<s:iterator value="persons.{?#this.age>25}">
				姓名:<s:property value="name"/>---年龄:<s:property value="age"/></br>
		</s:iterator>
		<hr />
		
		<h5>年龄等于25的元素的名字</h5>
		姓名:<s:property value="persons.{?#this.age==25}.{name}[0]"/>
		<hr />

		
		<h5>设置属性</h5>
		<% 
			application.setAttribute("appmsg","application msg.");
			session.setAttribute("sesmsg","session msg.");
			request.setAttribute("reqmsg","request msg");
		%>
		<p><s:property value="#application.appmsg"/></p>
		<p><s:property value="#session.sesmsg"/></p>
		<p><s:property value="#request.reqmsg"/></p>
		<hr />
		
		<h5>构造list,遍历list--s:property</h5>
		<s:set name="list" value="{'aaa','bbb','ccc','ddd','request msg'}"/>
		<s:iterator value="list" var="o">
			<p><s:property/></p>
		</s:iterator>
		<hr />
		
		<h5>构造list,遍历list--$符号{元素}</h5>
		<s:iterator value="list" var="s">
			<p>${s}</p>
		</s:iterator>
		<hr />
		
		<h5>数据过滤筛选</h5>
		<s:set name="list1" value="{1,2,3,4,5,6,7,8,9}"/>
		<s:iterator value="#list1.{?#this>2}" var="o">
			${o}<br />
		</s:iterator>
		<hr />
				
		<h5>构造map 取某key对应的value</h5>
		<s:set name="foobar" value="#{'foo1':'bar1','foo2':'car2'}"/>
		<s:property value="#foobar['foo1']"/>
		<hr />
		
		<h5>构造map</h5>
		<s:set name="map" value="#{'1':'aaa','2':'bbb','3':'ccc','4':'ddd','5':'eee','6':':'}"/>
		<s:iterator value="map" var="o">
			<s:property value="key"/><s:property value="#map['6']"/><s:property value="value"/>
		</s:iterator>
		<hr />
		
		<h5>逻辑判断</h5>
		<s:if test="'aa' in {'aa','bbb'}">
			'aa' 在集合{'aa','bbb'}中
		</s:if>
		<s:else>
			'aa' 不在集合{'aaa','bbb'}中
		</s:else>
		<hr />
		
		<h5>逻辑判断</h5>
		<s:if test="#request.reqmsg in #list">
			在
		</s:if>
		<s:else>
			不在
		</s:else>
		<hr />
		
		<!--  
		<h5>访问类的熟悉和方法</h5>
		<s:property value="@java.lang.Math@abs(-32.56)"/>
		<hr />
		-->
		
		<h5>遍历list</h5>
		<s:set name="list2" value="{'aa','bb','cc','dd','ee','ff','gg','hh','ii','jj','kk'}"/>
		<table width="800px" align=center border=1 style="border-collapse:collapse">
				<tr align=center style="font-weight:bold;color:red">
					<td>索引</td>
					<td>值</td>
					<td>奇</td>
					<td>偶</td>
					<td>首</td>
					<td>尾</td>
					<td>当前迭代数量</td>
				</tr>	
				<s:iterator value="list2" var="o" status="y">
				<s:if test="#y.odd">
				<tr bgcolor="#C1FFE4" align=center>	
						<td><s:property value="#y.getIndex()"/></td>
						<td><s:property /></td>
						<td><s:property value="#y.odd"/></td>
						<td><s:property value="#y.even"/></td>	
						<td><s:property value="#y.first"/></td>	
						<td><s:property value="#y.isLast()"/></td>	
						<td><s:property value="#y.getCount()"/></td>	
							
				</tr>
				</s:if>
				<s:else>
					<tr bgcolor="#F0F0F0" align=center>	
						<td><s:property value="#y.getIndex()"/></td>
						<td><s:property /></td>
						<td><s:property value="#y.odd"/></td>
						<td><s:property value="#y.even"/></td>	
						<td><s:property value="#y.first"/></td>	
						<td><br></td>	
						<td><br></td>	
							
					</tr>
				</s:else>
				</s:iterator>	
		</table>
		<hr />
		
		<h5>if elseif else</h5>
		<% request.setAttribute("aa",0); %>
		<s:if test="#request.aa>=0 && #request.aa<4">
				在0到4之间；
		</s:if>
		<s:elseif test="#request.aa>=4 && #request.aa<8">
				在4到8之间；
		</s:elseif>
		<s:else>
				大于8或者小于0；
		</s:else>
		<hr />
		
		<h5>url</h5>
		<s:url value="www.baidu.com"></s:url>
		<s:set name="myurl" value="www.sina.com"></s:set>
		<s:url value="#myurl"></s:url>
		<s:url value="%{#myurl}"></s:url>
		
		
		<% request.setAttribute("aa","sss"); %>
		<s:url action="ognlAction" namespace="/">
				<s:param name="aa" value="#request.aa"></s:param>
				<s:param name="id">12</s:param>
		</s:url>
		<hr />
		
		<h5>list checkbox</h5>
		<s:checkboxlist name="checkbox1" list="{'游戏','看书','编程','电影','音乐','旅行'}" value="{'看书','编程'}"></s:checkboxlist>
		<hr />
		
		<h5>map checkbox</h5>
		<s:checkboxlist name="checkbox2" list="#{1:'游戏',2:'看书',3:'编程',4:'电影',5:'音乐',6:'旅行'}" listkey="key" listvalue="value" value="{2,3}"></s:checkboxlist>
		<hr />
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>