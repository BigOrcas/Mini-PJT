package com.model2.mvc.web.wish;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Wish;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.wish.WishService;



@Controller
@RequestMapping("/wish/*")
public class WishController {
	
	///Field
	@Autowired
	@Qualifier("wishServiceImpl")
	private WishService wishService;
	
		
	public WishController(){
		System.out.println(this.getClass());
	}
	
	
	
	@RequestMapping("addWish")
	public String addWishlist( @ModelAttribute("wish") Wish wish) throws Exception {

		System.out.println("/addWish");
		System.out.println("userId : "+wish.getUserId());
		System.out.println("prodNo : "+wish.getProdNo());
		
		wishService.addWish(wish);
		
		return "redirect:/product/getProduct?menu=search&prodNo="+wish.getProdNo();
	}
	
	
	@RequestMapping("getWish")
	public String getWish( @RequestParam("userId") String userId, Model model) throws Exception{
		
		System.out.println("/getWish");
		
		List<Wish> list = wishService.getWish(userId);
		
		
		
		model.addAttribute("wish", list);
		
		return "forward:/wish/listWish.jsp";
	}
	
	@RequestMapping("updateWish")
	public String updateWish( @RequestParam("wishNo") int wishNo, @RequestParam("buy") int buy, Model model, HttpSession session) throws Exception{
		
		System.out.println("/updateWish");
		
		User user = (User) session.getAttribute("user");
		wishService.updateWish(wishNo,buy);
		
		
		return "redirect:/wish/getWish?userId="+user.getUserId();
	}
	
	@RequestMapping("deleteWish")
	public String deleteWish( @RequestParam("wishNo") int wishNo, Model model, HttpSession session) throws Exception{
		
		System.out.println("/deleteWish");
		
		User user = (User) session.getAttribute("user");
		wishService.deleteWish(wishNo);
		
		
		return "redirect:/wish/getWish?userId="+user.getUserId();
	}

}