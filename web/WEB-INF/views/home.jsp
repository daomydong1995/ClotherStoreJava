<%@include file="/WEB-INF/views/template/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--Conten--%>
<div class="form-group col-md-12">
  <ul class="resp-tabs-list">
    <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"> Men's</li>
    <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"> Women's</li>
    <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"> Bags</li>
    <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"> Footwear</li>
  </ul>
  <div class="resp-tabs-container">
    <div class="tab1">
      <c:forEach items="${ProductsMen}" var="product" varStatus="itr">
        <div class="col-md-3 product-men">
          <div class="men-pro-item simpleCart_shelfItem">
            <div class="men-thumb-item">
              <img src="/resources/imageUpload/${product.productId}.png" alt="" class="pro-image-front">
              <img src="/resources/imageUpload/${product.productId}.png" alt="" class="pro-image-back">
              <div class="men-cart-pro">
                <div class="inner-men-cart-pro" >
                  <a href="@Url.Action(" Details","HomeProduct",new { id = item.idPro })"
                  class="link-product-add-cart">Quick View</a>
                </div>
              </div>
              <span class="product-new-top">New</span>
            </div>
            <div class="item-info-product ">
              <h4><a href="single.html">${product.productName}</a></h4>
              <div class="info-product-price">
                <span class="item_price">${product.productPrice}</span>
                <del>$</del>
              </div>
              <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
                <form action="#" method="post">
                  <fieldset>
                    <input type="button" name="submit" onclick="AddToCart(${product.productId})" value="Add to cart"
                           class="button">
                  </fieldset>
                </form>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
      <div class="clearfix"></div>
    </div>
    <div class="tab2">
      <c:forEach items="${ProductsWomen}" var="product" varStatus="itr">
        <div class="col-md-3 product-men">
          <div class="men-pro-item simpleCart_shelfItem">
            <div class="men-thumb-item">
              <img src="/resources/imageUpload/${product.productId}.png" alt="" class="pro-image-front">
              <img src="/resources/imageUpload/${product.productId}.png" alt="" class="pro-image-back">
              <div class="men-cart-pro">
                <div class="inner-men-cart-pro">
                  <a href="@Url.Action(" Details","HomeProduct",new { id = item.idPro })"
                  class="link-product-add-cart">Quick View</a>
                </div>
              </div>
              <span class="product-new-top">New</span>

            </div>
            <div class="item-info-product ">
              <h4><a href="single.html">${product.productName}</a></h4>
              <div class="info-product-price">
                <span class="item_price">${product.productPrice}</span>
                <del>$</del>
              </div>
              <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
                <form action="#" method="post">
                  <fieldset>
                    <input type="button" name="submit" onclick="AddToCart(${product.productId})" value="Add to cart"
                           class="button">
                  </fieldset>
                </form>
              </div>

            </div>
          </div>
        </div>
      </c:forEach>
      <div class="clearfix"></div>
    </div>
    <div class="tab3">
      <c:forEach items="${ProductsBag}" var="product" varStatus="itr">
        <div class="col-md-3 product-men">
          <div class="men-pro-item simpleCart_shelfItem">
            <div class="men-thumb-item">
              <img src="/resources/imageUpload/${product.productId}.png" alt="" class="pro-image-front">
              <img src="/resources/imageUpload/${product.productId}.png" alt="" class="pro-image-back">
              <div class="men-cart-pro">
                <div class="inner-men-cart-pro" >
                  <a href="@Url.Action(" Details","HomeProduct",new { id = item.idPro })"
                  class="link-product-add-cart">Quick View</a>
                </div>
              </div>
              <span class="product-new-top">New</span>

            </div>
            <div class="item-info-product ">
              <h4><a href="single.html">${product.productName}</a></h4>
              <div class="info-product-price">
                <span class="item_price">${product.productPrice}</span>
                <del>$</del>
              </div>
              <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
                <form action="#" method="post">
                  <fieldset>
                    <input type="button" name="submit" onclick="AddToCart(${product.productId})" value="Add to cart"
                           class="button">
                  </fieldset>
                </form>
              </div>

            </div>
          </div>
        </div>
      </c:forEach>
      <div class="clearfix"></div>
    </div>
    <div class="tab4">
      <c:forEach items="${ProductsFootwear}" var="product" varStatus="itr">
        <div class="col-md-3 product-men">
          <div class="men-pro-item simpleCart_shelfItem">
            <div class="men-thumb-item">
              <img src="/resources/imageUpload/${product.productId}.png" alt="" class="pro-image-front">
              <img src="/resources/imageUpload/${product.productId}.png" alt="" class="pro-image-back" >
              <div class="men-cart-pro">
                <div class="inner-men-cart-pro">
                  <a href="@Url.Action(" Details","HomeProduct",new { id = item.idPro })"
                  class="link-product-add-cart">Quick View</a>
                </div>
              </div>
              <span class="product-new-top">New</span>

            </div>
            <div class="item-info-product ">
              <h4><a href="single.html">${product.productName}</a></h4>
              <div class="info-product-price">
                <span class="item_price">${product.productPrice}</span>
                <del>$</del>
              </div>
              <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
                <form action="#" method="post">
                  <fieldset>
                    <input type="button" name="submit" onclick="AddToCart(${product.productId})" value="Add to cart"
                           class="button">
                  </fieldset>
                </form>
              </div>

            </div>
          </div>
        </div>
      </c:forEach>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<%--endConten--%>
<%@include file="/WEB-INF/views/template/footer.jsp" %>

