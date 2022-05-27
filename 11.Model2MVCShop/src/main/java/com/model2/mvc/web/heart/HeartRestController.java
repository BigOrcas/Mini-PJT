package com.model2.mvc.web.heart;

import java.util.HashMap;
import java.util.Map;

import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Heart;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.heart.HeartService;


@RestController
@RequestMapping("/heart/*")
public class HeartRestController {
	
	/// Field
	@Autowired
	@Qualifier("heartServiceImpl")
	private HeartService heartService;

	public HeartRestController() {
		System.out.println(this.getClass());
	}

		
		@RequestMapping( value="json/updateHeart", method=RequestMethod.POST )
		public int updateHeart(@ModelAttribute("heart") Heart heart,
				@RequestParam("prodNo") int prodNo,
				@RequestParam("userId") String userId
				
				
				) throws Exception {

			System.out.println(prodNo);
			System.out.println(userId);
			int heartCheck = heartService.heartCheck(prodNo, userId);
			System.out.println(heartCheck);
			if(heartCheck == 0) {
				//ÁÁ¾Æ¿ä Ã³À½´©¸§
				heartService.insertHeart(prodNo, userId); //heartÅ×ÀÌºí »ðÀÔ
				heartService.updateHeart(prodNo);	//ÁÁ¾Æ¿ä +1
				heartService.updateHeartCheck(prodNo, userId);//ÁÁ¾Æ¿ä check 1
				System.out.println("»ç¶ûÇØ");
				System.out.println("»ç¶ûÇØ");
				System.out.println("»ç¶ûÇØ");
				System.out.println("»ç¶ûÇØ");
				System.out.println("»ç¶ûÇØ");
				System.out.println("»ç¶ûÇØ");
				
			}else  {
				System.out.println("!!!!!!!!!!!!!!!!!!!!!");
				System.out.println("!!!!!!!!!!!!!!!!!!!!!");
				System.out.println("!!!!!!!!!!!!!!!!!!!!!");
				System.out.println("!!!!!!!!!!!!!!!!!!!!!");
				heartService.updateHeartCheckCancel(prodNo, userId); //heart check0
				heartService.updateHeartCancel(prodNo); //ÁÁ¾Æ¿ä - 1
				heartService.deleteHeart(prodNo, userId); //ÁÁ¾Æ¿ä »èÁ¦
				System.out.println("½È¾îÇØ");
				System.out.println("½È¾îÇØ");
				System.out.println("½È¾îÇØ");
				System.out.println("½È¾îÇØ");
				System.out.println("½È¾îÇØ");
				System.out.println("½È¾îÇØ");
			
			}
			return heartCheck;
		
		}
		
		
}

