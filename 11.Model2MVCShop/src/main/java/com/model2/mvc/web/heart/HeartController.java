package com.model2.mvc.web.heart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Heart;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.heart.HeartService;
import com.model2.mvc.service.purchase.PurchaseService;


@Controller
@RequestMapping("/heart/*")
public class HeartController {
	
	/// Field
	@Autowired
	@Qualifier("heartServiceImpl")
	private HeartService heartService;

	public HeartController() {
		System.out.println(this.getClass());
	}
	
	@ResponseBody
	@RequestMapping( value="updateHeart", method=RequestMethod.POST )
	public int updateHeart(@ModelAttribute("heart") Heart heart,
			@RequestParam("prodNo") int prodNo,
			@RequestParam("userId") String userId
			
			
			) throws Exception {

		int heartCheck = heartService.heartCheck(prodNo, userId);
		if(heartCheck == 0) {
			//���ƿ� ó������
			heartService.insertHeart(prodNo, userId); //heart���̺� ����
			heartService.updateHeart(prodNo);	//���ƿ� +1
			heartService.updateHeartCheck(prodNo, userId);//���ƿ� check 1
			System.out.println("��Ʈ�� �����Ƕ�");
			
		}else if(heartCheck == 1) {
			heartService.updateHeartCheckCancel(prodNo, userId); //heart check0
			heartService.updateHeartCancel(prodNo); //���ƿ� - 1
			heartService.deleteHeart(prodNo, userId); //���ƿ� ����
			System.out.println("��Ʈ�� �����Ƕ�");
		
		}
		return heartCheck;
	
	}
	
	

}
