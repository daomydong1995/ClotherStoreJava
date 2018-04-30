<%--
  Created by IntelliJ IDEA.
  User: daomy
  Date: 4/30/2018
  Time: 5:24 CH
  To change this template use File | Settings | File Templates.
--%>

<%@include file="/WEB-INF/views/admin/template/header.jsp" %>
<html>
<head>
  <title>Title</title>
</head>
<body>


  <%--<div class="row">--%>
  <!-- Welcome -->
  <div class="col-md-12">
        <div class="page-header">
          <h1>Administrator page</h1>

          <p class="lead">This is the administrator page!</p>
        </div>
        <h3>
          <a href="<c:url value="/admin/productInventory"/>">Product Inventory</a>
        </h3>

        <p>Here you can view, check and modify the product inventory!</p>

        <h3>
          <a href="<c:url value="/admin/customer" />">Customer Management</a>
        </h3>

        <p>Here you can manage customer information!</p>
  </div>
  <!--end  Welcome -->
</div>
<%--</div>--%>
<!-- end page-wrapper -->
</body>
</html>
<%@include file="/WEB-INF/views/admin/template/footer.jsp" %>