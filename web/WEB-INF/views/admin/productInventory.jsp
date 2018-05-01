<%@include file="/WEB-INF/views/admin/template/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    var img = '<img class="img-thumbnail" style="cursor:pointer" src="/resources/imageUpload/'+product.productId+'.png" width="50"/>';
                    html += '<tr>';
                    html += '<td>' + img + '</td>'
                    html += '<td>' + product.productName + '</td>';
                    html += '<td>' + product.productCategory + '</td>';
                    html += '<td>' + product.productCondition + '</td>';
                    html += '<td>' + product.productPrice + ' USD' + '</td>';
                    html += '<td>' +
                        ' <a  class="btn btn-danger" href="/product/viewProduct/'+product.productId+'">Chi tiết</a>' +
                        ' | <a class="btn btn-warning" href="/admin/product/deleteProduct/'+product.productId+'">Xóa</a>' +
                        ' | <a class="btn btn-info" href="/admin/product/editProduct/'+product.productId+'">Sửa</a>' +
                        '</td>';
                    html += '</tr>';
                });
                $('.tbody').html(html);
                paging(result.total, function () {
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
<%@include file="/WEB-INF/views/admin/template/footer.jsp" %>
