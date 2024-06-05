package com.jieun.dto;

public class ProductVO {
	private Integer code;
	private String productname;
	private Integer price;
	private String description;
	private String pictureUrl;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	@Override
	public String toString() {
		return "ProductVO [code=" + code + ", productname=" + productname + ", price=" + price + ", description="
				+ description + ", pictureUrl=" + pictureUrl + "]";
	}

}
