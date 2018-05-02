<%@include file="/WEB-INF/views/admin/template/header.jsp" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Table CSS -->
<%--<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet">--%>

<div class="page-header">
  <h1>Danh sách sản phẩm</h1>
</div>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Thêm mới</button>
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
  <tbody class="tbody">
  </tbody>
</table>
<ul id="pagination-demo" class="pagination-sm"></ul>
<script type="text/javascript">
    $(document).ready(function () {
        loadData();
    });

    // load Json form productList
    function loadData(pageIndex) {
        if (pageIndex == null) pageIndex = 1;
        $.ajax({
            url: "/admin/productList",
            type: "GET",
            contentType: "application/json;charset=utf-8",
            data: {page: pageIndex},
            dataType: "json",
            success: function (result) {
                var html = '';
                var data = result.data;
                $.each(data, function (key, product) {
                    var img = '<img class="img-thumbnail" style="cursor:pointer" src="/resources/imageUpload/' + product.productId + '.png" width="50"/>';
                    html += '<tr>';
                    html += '<td>' + img + '</td>'
                    html += '<td>' + product.productName + '</td>';
                    html += '<td>' + product.productCategory + '</td>';
                    html += '<td>' + product.productCondition + '</td>';
                    html += '<td>' + product.productPrice + ' USD' + '</td>';
                    html += '<td>' +
                        ' <a  class="btn btn-danger" href="/product/viewProduct/' + product.productId + '">Chi tiết</a>' +
                        ' | <a class="btn btn-warning" href="/admin/product/deleteProduct/' + product.productId + '">Xóa</a>' +
                        ' | <a class="btn btn-info" href="/admin/product/editProduct/' + product.productId + '">Sửa</a>' +
                        '</td>';
                    html += '</tr>';
                });
                $('.tbody').html(html);
                var total = result.total
                if (total == null || total == 0) {
                    total = 1;
                }
                paging(total, function () {
                    loadData();
                })
            },
            error: function (errormessase) {
                alert(errormessase.responseText);
            }
        });
    }

    // Phân trang
    function paging(totalRow, callback) {
        var totalPage = Math.ceil(totalRow / 5)
        $('#pagination-demo').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            onPageClick: function (event, page) {
                loadData(page);
            }
        });
    }
</script>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">

  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" data-dismiss="modal" class="close">&times;</button>
      </div>
      <div class="modal-body">
        <form:form action="${pageContext.request.contextPath}/admin/product/addProduct" method="post"
                   commandName="product" enctype="multipart/form-data">
          <div class="form-group">
            <label for="name">Name</label> <form:errors path="productName" cssStyle="color: #ff0000;"/>
            <form:input path="productName" id="name" class="form-Control"/>
          </div>

          <div class="form-group">
            <label for="category">Category</label>
            <label class="checkbox-inline"><form:radiobutton path="productCategory" id="category"
                                                             value="instrument"/>Áo</label>
            <label class="checkbox-inline"><form:radiobutton path="productCategory" id="category"
                                                             value="record"/>Quần</label>
            <label class="checkbox-inline"><form:radiobutton path="productCategory" id="category"
                                                             value="accessory"/>Túi</label>
            <label class="checkbox-inline"><form:radiobutton path="productCategory" id="category"
                                                             value="accessory"/>Giày</label>
          </div>

          <div class="form-group">
            <label for="description">Description</label>
            <form:textarea path="productDescription" id="description" class="form-Control"/>
          </div>

          <div class="form-group">
            <label for="price">Price</label> <form:errors path="productPrice" cssStyle="color: #ff0000;"/>
            <form:input path="productPrice" id="price" class="form-Control"/>
          </div>

          <div class="form-group">
            <label for="condition">Condition</label>
            <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                             value="New"/>New</label>
            <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                             value="Old"/>Used</label>
          </div>

          <div class="form-group">
            <label for="status">Status</label>
            <label class="checkbox-inline"><form:radiobutton path="productStatus" id="status"
                                                             value="active"/>Active</label>
            <label class="checkbox-inline"><form:radiobutton path="productStatus" id="status"
                                                             value="inactive"/>Inactive</label>
          </div>

          <div class="form-group">
            <label for="unitInStock">Unit In Stock</label> <form:errors path="unitInStock"
                                                                        cssStyle="color: #ff0000;"/>
            <form:input path="unitInStock" id="unitInStock" class="form-Control"/>
          </div>

          <div class="form-group">
            <label for="manufacturer">Manufacturer</label>
            <form:input path="productManufacturer" id="manufacturer" class="form-Control"/>
          </div>

          <div class="form-group">
            <label class="control-label" for="productImage">Upload Picture</label>
            <form:input id="productImage" path="productImage" type="file" class="form:input-large"/>
          </div>

          <br><br>
          <input type="submit" value="submit" class="btn btn-default">
          <a href="<c:url value="/admin/productInventory" />" class="btn btn-default">Cancel</a>
        </form:form>
      </div>
    </div>
  </div>
</div>
<%--end-Modal--%>

<%@include file="/WEB-INF/views/admin/template/footer.jsp" %>
