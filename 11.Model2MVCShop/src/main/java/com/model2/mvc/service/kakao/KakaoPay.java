package com.model2.mvc.service.kakao;

import com.model2.mvc.service.domain.kakao.KakaoPayApprovalVO;

public interface KakaoPay {

public String kakaoPayReady();
	
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token);
}
