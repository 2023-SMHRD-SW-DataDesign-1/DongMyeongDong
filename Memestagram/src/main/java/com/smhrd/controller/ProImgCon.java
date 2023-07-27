package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.command;
import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileDTO;
import com.smhrd.model.ProfileImgDTO;

public class ProImgCon implements command {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
   
      
System.out.println("[ProImgCon연결 성공]");
      
      String savePath = request.getServletContext().getRealPath("image");  
      System.out.println(savePath);
      
      // 3. maxSize
      int maxSize = 100*1024*1024;
      
      // 4. encoding
      String encoding = "UTF-8";
      
      // 5. 중복제거
      DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
      
      // new MultipartRequest(request, savePath, maxSize, encoding, 중복제거)
      MultipartRequest multi 
         = new MultipartRequest(request, savePath, maxSize, encoding, rename);
         
      
      // 6. 데이터 받아오기
      String mem_img = multi.getFilesystemName("mem_img");
      String mem_id = multi.getParameter("member_id");
      
      // 데이터 잘 가져왔는지 콘솔창에 확인하기
      System.out.println("mem_img : " + mem_img);
      System.out.println("mem_id : " + mem_id);
      
      
      // uploadImg메소드 호출하기
      
      ProfileDAO pdao = new ProfileDAO();
      int row = pdao.uploadImg(new ProfileImgDTO(mem_id, mem_img));
   
      
      // 성공 or 실패
      if(row > 0) {
         System.out.println("프로필 이미지 변경 성공");
         // 성공 시 이미지 경로인 mem_img 저장
         request.setAttribute("member", mem_img);   
        
         
      } else {
         System.out.println("프로필 이미지 변경 실패");
      }
   
      return "./New_profile.jsp";   
      
      
      
      
      
      
   
   }

}