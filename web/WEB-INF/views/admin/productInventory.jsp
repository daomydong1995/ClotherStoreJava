<%@include file="/WEB-INF/views/admin/template/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Table CSS -->
<%--<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet">--%>

<div class="page-header">
  <h1>Danh sách sản phẩm</h1>
</div>
<a href="<spring:url value="/admin/product/addProduct" />" class="btn btn-primary">Thêm</a>
<table class="table table-hover table-bordered">
  <thead>
  <tr class="bg-success">
    <th>Sản phẩm</th>
    <th>Tên sản phẩm</th>
    <th>Thể loại</th>
    <th>HOT</th>
    <th>Giá</th>
    <th>Công cụ</th>
  </tr>
  </thead>
  <c:forEach items="${products}" var="product" varStatus="itr">
    <tr>
      <td><img class="img-thumbnail" width="100" src="<c:url value="/resources/imageUpload/${product.productId}.png"/> "
               alt="image"/></td>
      <td>${product.productName}</td>
      <td>${product.productCategory}</td>
      <td>${product.productCondition}</td>
      <td>${product.productPrice} USD</td>
      <td>
        <a  class="btn btn-danger" href="<spring:url value="/product/viewProduct/${product.productId}" />">Chi tiết</a> |
        <a class="btn btn-warning" href="<spring:url value="/admin/product/deleteProduct/${product.productId}"/>">Xóa</a> |
        <a class="btn btn-info" href="<spring:url value="/admin/product/editProduct/${product.productId}" />">Sửa</a>
      </td>
    </tr>
  </c:forEach>
</table>

<%@include file="/WEB-INF/views/admin/template/footer.jsp" %>
