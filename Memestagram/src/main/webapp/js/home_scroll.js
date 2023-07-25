var currentPage = 1;

$(document).ready(function () {
		    var win = $(window);
		    var bodyOffset = $('body').offset();
		    
		    getPost(currentPage);
		    
		    // Each time the user scrolls
		    win.scroll(function () {
		        // End of the document reached?
		        // console.log($(document).height(), win.height(), win.scrollTop());
		        
		        
		        if ($(document).height() - win.height() == win.scrollTop()) {
					
		            $('#loading').show();
		            currentPage += 1;
		            getPost(currentPage);
		            //$('#posts').append(getPost(currentPage));// getpost메소드에 매개변수로 마지막 글의 seq를 넘겨줘야 됨
		            $('#loading').hide();
		        }
	
		       /*  if ($(document).scrollTop() > bodyOffset.top) {
		            $('#video').addClass('scroll');
		            $('.scroll').get(0).play();
		        } else {
		            $('.scroll').get(0).pause();
		            $('#video').removeClass('scroll');
		        }*/
		    });
		    
}); //document ready 끝나는 부분

function write_reply(e){
						let bseq = $(e).attr("idx");
						alert(bseq);
						let content = $('.input_reply'+bseq).val();
						
						if(content == ""){
							alert("댓글을 입력하세요");
						}else{
							
							$('.input_reply'+bseq).val("");
							
							
							$.ajax({
								url : "CmtWriteCon.do",
								type : "get",
								data : {"bseq":bseq, "content" : content},
								success : function(cmtCount){
									alert("댓글 작성 성공");
									
									$(".show_all"+bseq).text("댓글 "+cmtCount+"개 모두 보기");
									cmtList(bseq);
								},
								fail : function(){
									alert("댓글 작성 실패");
								}
							
							});
						}
						
						
					}
		img = ["png","PNG","JPG","jpg","GIF","gif","TIFF","tiff","psd","PSD","AI","ai","SVG","svg","EPS","eps","JFIF","jfif","BPG","bpg","SVG","svg","CGM","cgm","BMP","bmp","Exif","exif"];
		
		function  getExtension(filename){
			
			var filelen = filename.length;
			var lastdot = filename.lastIndexOf('.');
			var fileExt = filename.substring(lastdot+1, filelen).toLowerCase();
			
			return fileExt;
		}
		
		function cmtList(bseq){
			$.ajax({
				url : "CmtListCon.do",
				type : "post",
				data : {"bseq" : bseq},
				success : function(cmtList){
					$(".comments_list"+bseq).html("");
					$.each(cmtList,function(index,cmt){
						
						$(".comments_list"+bseq).append("<p id='cmt_seq'"+cmt.board_cmt_seq+">"+cmt.board_cmt_content+"</p>");
						
						if(index == 2){
							return false;
						}
					})
				},
				error:function(){
					alert("댓글 리스트 불러오기 실패");
				}
			})
			
		}
		// DB에서 데이터를 받아서 새로운 글을 만들어 주는 부분
		var count = 1;
		
		function getPost(page) {
			var content = "";
			$.ajax({
				url : "BoardShowCon.do",
				type : "post",
				data : {"page" : page},
				datatype : "json",
				success : function(data){
					function write_reply (){
						let bseq = $(this).attr("idx");
						
						let content = $('.input_reply'+bseq).val();
						
						if(content == ""){
							alert("댓글을 입력하세요");
						}else{
							
							$('.input_reply'+bseq).val("");
							
							
							$.ajax({
								url : "CmtWriteCon.do",
								type : "get",
								data : {"bseq":bseq, "content" : content},
								success : function(cmtCount){
									alert("댓글 작성 성공");
									
									$(".show_all"+bseq).text("댓글 "+cmtCount+"개 모두 보기");
									cmtList(bseq);
								},
								fail : function(){
									alert("댓글 작성 실패");
								}
							
							});
						}
						
						
					}	
					$.each(data, function(index, data) {
						content += `<div class="post">
            <div class="header">
            	
                <div class="profile_icon">
                
                </div>
                <div class="id"> ${data.mem_id}</div>
                <div class="menu">
                    <i class='bx bx-dots-horizontal-rounded'></i>
                </div>
            </div>
            <div class="content">`;
            //var fileExtension = getExtension(data.board_img);
            
            /*if (img.includes(fileExtension)){
				//content+= '<img src="img/'+data.board_img+'">';
			}else{
				//content+= '<video id="video" src="img/'+data.board_img+'" controls autoplay muted playsinline></video>';
			}*/
            	content += `</div>
            <div class="buttons">
                <div class="button">
                    <i id="heart" class="bx bx-heart icon"></i>
                </div>
                <div class="button">
                    <i class="bx bx-comment icon"></i>
                </div>
                <div class="button">
                    <i class="bx bx-navigation icon"></i>
                </div>
            </div>
            <div class="like">
                <span>좋아요</span>
                <span class="like_count">${data.board_likes}</span>
                <span>개</span>
            </div>
            <div class="comments">
                <span><b>${data.mem_id}</b></span>
                <span> </span>
                <span>${data.board_content}</span> <br>
                <span class="show_more">더 보기</span>
            </div>
            <div class="comments_show">
                <span class="show_all${data.board_seq}">댓글 ${data.board_cmt_cnt}개 모두 보기</span>
            </div>
            <div class="comments_list${data.board_seq}">
                
            </div>
            <div class="comments_input">
                <input type="text" class="input_reply${data.board_seq}" placeholder="댓글 달기...">
                
            </div>
            <button class="write_reply" idx="${data.board_seq}" onclick="write_reply(this)" >댓글달기</button>
            <hr>
        </div>`;
        
        		/*let button = document.querySelector('.write_reply'+data.board_seq);*/
        		
        		/*button.addEventListener('click',function(){
					write_reply();
				})*/
						
				cmtList(data.board_seq);
					})
					$('#posts').append(content);
					
					/*$('.write_reply').on('click',function(){*/
					
				/*	})*/
					
				},// success 닫히는 곳
				fail : function(){
					alert("통신 실패");
				}
			});
			
		   
		    
		    
		    
	
		    
		}
