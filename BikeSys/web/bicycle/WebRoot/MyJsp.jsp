<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title>角色授权页</title>
	</head>
	<body>
		<s:form action="changeRf">
			<table width="700" height="400" border="0" align="center">
				<tr>
					<td valign="top">
						<TABLE height=28 cellSpacing=0 cellPadding=0 width="90%"
							align=center
							background="<%=request.getContextPath()%>/image/border/border1/topcenter.gif"
							border=0>
							<TBODY>
								<TR id=cat>
									<TD vAlign=top align=left width=28 height=28>
										<IMG height=28
											src="<%=request.getContextPath()%>/image/border/border1/topleft.gif"
											width=28 border=0>
									</TD>

									<TD width="189" height="28" align="left" vAlign="center"
										background="<%=request.getContextPath()%>/image/border/border1/topbg.gif">
										&nbsp;
									</TD>

									<TD vAlign=center align=left width=28>
										<IMG height=28
											src="<%=request.getContextPath()%>/image/border/border1/topend.gif"
											width=19 border=0>
									</TD>

									<TD vAlign=top align=right width="157"></TD>

									<TD vAlign=top align=right width=296 height=28>
										<IMG height=28
											src="<%=request.getContextPath()%>/image/border/border1/topright.gif"
											width=296 border=0>
									</TD>

								</TR>
							</TBODY>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center
							bgColor=#89959b border=0>
							<TBODY>
								<TR>
									<TD>
										<TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
											<TBODY>
												<TR vAlign="bottom" align="middle">
													<TD
														background="<%=request.getContextPath()%>
													/image/border/border1/greenbarbg.gif"
														width="10%">
														<div align="center">
															<FONT face="verdana, arial, helvetica,宋体" color=#ffffff><B>模块</B>
															</FONT>
														</div>
													</TD>

													<TD
														background="<%=request.getContextPath()%>
													/image/border/border1/greenbarbg.gif"
														width="18%">
														<div align="center">
															<FONT face="verdana, arial, helvetica,宋体" color=#ffffff><B>功能</B>
															</FONT>
														</div>
													</TD>
												</TR>
												<s:iterator value="lf">
													<TR align=center>
														<TD onmouseover="this.bgColor='#ffffff'"
															onmouseout="this.bgColor='#f5f5f5'" align=left
															bgColor=#f5f5f5>
															<FONT face="verdana, arial, helvetica,宋体"><s:property
																	value="module.modulename" />
														</TD>
														<TD onmouseover="this.bgColor='#ffffff'"
															onmouseout="this.bgColor='#f5f5f5'" align=left
															bgColor=#f5f5f5>
															<s:if test="id in #request.had">
																<s:checkbox theme="simple" name="fid" fieldValue="%{id}"
																	value="true">
																</s:checkbox>
																<s:property value="%{functionname}" />
															</s:if>
															<s:else>
																<s:checkbox theme="simple" name="fid" fieldValue="%{id}"
																	value="false">
																</s:checkbox>
																<s:property value="%{functionname}" />
															</s:else>
														</TD>
													</TR>
												</s:iterator>

												<TR id=cat>
													<TD align="middle"
														background="<%=request.getContextPath()%>/image/border/border1/greenbarbg.gif"
														colSpan=6>
														<div align="right">
															<s:submit value="授权" theme="simple" />
															<s:reset value="重置" theme="simple" />
														</div>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
						</TABLE>
						<TABLE width="90%" height=23 border=0 align="center" cellPadding=0
							cellSpacing=0>
							<TBODY>
								<TR>
									<TD vAlign=top align=left width=100 height=23>
										<IMG height=23
											src="<%=request.getContextPath()%>/image/border/border1/bottomleft.gif"
											width=100>
									</TD>
									<TD width="100%"
										background="<%=request.getContextPath()%>/image/border/border1/bottomcenter.gif"
										height=23>
										<IMG height=1
											src="<%=request.getContextPath()%>/image/border/border1/clear.gif"
											width="100%">
									</TD>
									<TD vAlign=top align=right width=100 height=23>
										<IMG height=23
											src="<%=request.getContextPath()%>/image/border/border1/bottomright.gif"
											width=100 border=0>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>