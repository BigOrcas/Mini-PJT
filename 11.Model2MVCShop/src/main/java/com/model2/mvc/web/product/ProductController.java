package com.model2.mvc.web.product;

import java.util.Map;

import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.domain.Heart;
import com.model2.mvc.service.heart.HeartService;


@Controller
@RequestMapping("/product/*")


public class ProductController {
	
	
	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	/// Field
		@Autowired
		@Qualifier("heartServiceImpl")
		private HeartService heartService;
	

	


	public ProductController() {
		System.out.println(this.getClass());
	}


	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;


	@RequestMapping( value="addProduct	", method=RequestMethod.GET )
	public String addProduct() throws Exception {

		System.out.println("/product/addProduct : GET");

		return "redirect:/product/addProductView.jsp";
	}


	

	@RequestMapping( value="addProduct", method=RequestMethod.POST )

	public String addProduct(@ModelAttribute("product") Product product,Model model
	,@RequestParam("uploadfile") MultipartFile[] fileArray
			
			) throws Exception {
		
		
	String fileName = "";
	String FILE_SERVER_PATH = "C:\\Users\\bitcamp\\git\\Mini-PJT-Refactoring\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
		
		for(int i=0; i<fileArray.length;i++) {
		
			if(!fileArray[i].getOriginalFilename().isEmpty()) {
				fileArray[i].transferTo(new File(FILE_SERVER_PATH, fileArray[i].getOriginalFilename()));
				model.addAttribute("msg", "File uploaded successfully.");
				
			}else {
				model.addAttribute("msg", "Please select a valid mediaFile..");
			}
		
			fileName+=fileArray[i].getOriginalFilename()+"/";
			
			
		}
		
		//취소는 초기 상태값을 0으로 준다
		
		
		product.setCancel("0");
		product.setFileName(fileName);
		product.setManuDate(product.getManuDate().replace("-", ""));
		
		productService.addProduct(product);
		model.addAttribute(product);
				
		return "forward:/product/readProduct.jsp";
	}


	@RequestMapping("getProduct")
	public ModelAndView getProduct( @RequestParam("prodNo") int prodNo ,
		@CookieValue(value="history", required=false) Cookie cookie,
		HttpServletResponse response) throws Exception {
		
		System.out.println("getProduct");
		
		Product product = productService.getProduct(prodNo);
		
		
		String history = "/"+prodNo;
		
		
		if(cookie != null) {
			cookie.setValue(cookie.getValue()+history);
		}else {
			cookie = new Cookie("history", history);
		}
		cookie.setPath("/");
		cookie.setMaxAge(3600);
		response.addCookie(cookie);						
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/product/getProduct.jsp");
		modelAndView.addObject("product", product);
		return modelAndView;
	}


	
	@RequestMapping( value="updateProduct", method=RequestMethod.GET )
	public String updateProduct(@RequestParam("prodNo") int prodNo, Model model
			) throws Exception {


		Product product = productService.getProduct(prodNo);
		
		
	
		model.addAttribute("product", product);

		return "forward:/product/updateProductView.jsp";
	}

	
	@RequestMapping( value="updateProduct", method=RequestMethod.POST )
	public String updateProduct(@ModelAttribute("product") Product product, Model model, HttpSession session,
			@RequestParam("uploadfile") MultipartFile[] fileArray  )
			throws Exception {
		
		String fileName = "";
		String FILE_SERVER_PATH = "C:\\Users\\bitcamp\\git\\Mini-PJT-Refactoring\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
		
		for(int i=0; i<fileArray.length;i++) {
			
			if(!fileArray[i].getOriginalFilename().isEmpty()) {
				fileArray[i].transferTo(new File(FILE_SERVER_PATH, fileArray[i].getOriginalFilename()));
				model.addAttribute("msg", "File uploaded successfully.");
				
			}else {
				model.addAttribute("msg", "Please select a valid mediaFile..");
			}
		
			fileName+=fileArray[i].getOriginalFilename()+"/";
			
			
		}
			
			

			product.setFileName(fileName);
	
		product.setManuDate(product.getManuDate().replace("-", ""));

		productService.updateProduct(product);

		return "forward:/product/getProduct.jsp?prodNo=" + product.getProdNo();
	}

	
	@RequestMapping( value="listProduct" )
	public String listProduct(@ModelAttribute("search") Search search	,
		
			
			@RequestParam("menu") String menu, Model model, HttpServletRequest request)
			throws Exception {

		
	

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
	
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String, Object> map = productService.getProductList(search);
		
	
				

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		

		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		
		model.addAttribute("list", map.get("list"));
		System.out.println(map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("user",user);
		
	

		return "forward:/product/listProduct.jsp?menu="+menu;
	}
}
