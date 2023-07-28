document.addEventListener('DOMContentLoaded', function() {
	const postPart = document.getElementById('postPart');
	const post_modal = document.getElementById('post_modal');

	// 버튼 이벤트 위임
	postPart.addEventListener('click', function(event) {
		if (event.target.classList.contains('post-image')) {
			const postId = event.target.dataset.postId;
			
			console.log(postId);

			showDetailView(postId);

			post_modal.style.display = "block";
			document.body.classList.add('modal-open');

			// 모달 바깥 영역을 클릭하면 모달이 닫히도록 이벤트 리스너 추가
			window.onclick = function(event) {
				if (event.target === post_modal) {
					stopBalanceAnimation();
					closeDetailView();
					document.body.classList.remove('modal-open');
				}
			};
		}
	});

	function showDetailView(postId) {
		let content = "";

		$.ajax({
			url: "BoardDetailShowCon.do",
			type: "post",
			data: { "board_seq": postId },
			success: function(data) {
				content += `
        <div class="post_modal_content_balance">
        <div class="show_post">
            <div class="sp_content">
                <div class="sp_file">`;
				var fileExtension = getExtension(data.board_img);
				console.log("dd");
				if (img.includes(fileExtension)) {
					content += '<img src="img/' + data.board_img + '">';
				} else {
					content += '<video id="video" src="img/' + data.board_img + '" controls autoplay muted playsinline></video>';
				}
				content += `</div>
                <div class="sp_detail">
                    <div class="sp_detail_user">
                        <div class="sp_detail_user_img_div"><img src="./image/${data.mem_img}" alt=""></div>
                        <div class="sp_detail_user_id_div">${data.mem_id}</div>
                        <div class="sp_detail_user_dots_div"><i class='bx bx-dots-horizontal-rounded' id='menu_dot' onclick="delete_board(${data.board_seq})"></i></div>
                    </div>
                    <div class="sp_content_area">
                        <div class="sp_comment">
							<div>
								<b>${data.mem_id}</b><span>${data.board_content}</span>
							</div>
						</div>
                    </div>
                    <div class="sp_comment_area">
                    
                    </div>
                    <div class="sp_button_area">
                        <div class="button">
                            <a idx=${data.board_seq} href="javascript:void(0)" class="heart" onclick="heartCheck(this)">`;

				if (data.checklike == 'Y') {
					content += '<img src="./img/fullheart.png" height="25px" width ="27px" class="fullheart" idx="' + data.board_seq + '">';
				} else {
					content += '<img src="./img/emptyheart.png" height="25px" width ="25px" class="emptyheart" idx="' + data.board_seq + '">';
				}
				content += `</a></div>
                        <div>
                        	<span>좋아요</span>
                			<span class="like_count${data.board_seq}">${data.board_likes}</span>
                			<span>개</span></div>
                    	</div>
                    <div class="sp_comment_input_area">
                        <input type="text" class="detail_input_reply${data.board_seq}" placeholder="댓글 달기...">
                		<button class="comments_btn" idx="${data.board_seq}" onclick="write_reply(this)" >게시</button>
                    </div>
                </div>
            </div>
        </div>
    </div>`;
				post_modal.innerHTML = content;
				allCmtList(data.board_seq, "d");
			},
			error: function() {
				alert("일반글 상세화면 불러오기 실패");
			}
		})

		// 상세화면 표시

	}

	// 밸런스게임글 상세화면
	function showDetailView_balance(postId) {

		let content = "";
		$.ajax({
			url: "BalDetailShowCon.do",
			type: "post",
			data: { "bal_seq": postId },
			success: function(data) {

				content += `
    <div class="post_modal_content_balance">
        <div class="show_post">
            <div class="sp_content">
                <div class="sp_balance">
                    <div class="sp_balance_content_div">`;

				var fileExtension = getExtension(data.bal_img);

				if (img.includes(fileExtension)) {
					content += '<img src="img/' + data.bal_img + '">';
				} else {
					content += '<video id="video" src="img/' + data.bal_vid + '" controls autoplay muted playsinline></video>';
				}
				content += `</div>
                    <div class="sp_balance_select_div">
                        <div class="sp_content_select_1">
                            <div class="sp_content_select_1_name">
                                <h2>${data.bal_left}</h2>
                            </div>
                            <div class="sp_content_select_1_count">
                                <h3 class="sp_count_num1">${data.bal_left_count}</h3>
                            </div>
                        </div>
                        <div class="sp_content_select_2">
                            <div class="sp_content_select_2_name">
                                <h2>${data.bal_right}</h2>
                            </div>
                            <div class="sp_content_select_2_count">
                                <h3 class="sp_count_num2">${data.bal_right_count}</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sp_detail">
                    <div class="sp_detail_balance">
                        <div class="sp_balance_title"></div>
                        <div class="sp_balance_time">
                            <i class='bx bx-time-five'></i>
                            <span><b>${data.bal_time}</b></span>
                        </div>
                        <div class="sp_balance_reward">
                            <i class='bx bx-coin'></i>
                            <span><b>${data.bal_reward}P</b></span>
                        </div>
                        <div class="sp_menu">
                            <i class='bx bx-dots-horizontal-rounded'></i>
                        </div>
                    </div>
                    <div class="sp_content_area">
                        <div class="sp_comment">
							
							<div>
								<b>${data.mem_id}</b><span>${data.bal_content}</span>
							</div>
						</div>
                    </div>
                    <div class="sp_comment_area">
                    
                    </div>
                    <div class="sp_button_area">
                        <div class="button">
                            <a idx=${data.bal_seq} href="javascript:void(0)" class="heart" onclick="balHeartCheck(this)">`;

				if (data.balCheckLike == 'Y') {
					content += '<img src="./img/fullheart.png" height="25px" width ="27px" class="fullheart" idx="bal' + data.bal_seq + '">';
				} else {
					content += '<img src="./img/emptyheart.png" height="25px" width ="25px" class="emptyheart" idx="bal' + data.bal_seq + '">';
				}
				content += `</a></div>
                        <div>
	                        <span>좋아요</span>
							<span class="ballike_count${data.bal_seq}">${data.bal_like}</span>
							<span>개</span>
						</div>
                    </div>
                    <div class="sp_comment_input_area">
                        <input type="text" class="detail_bal_input_reply${data.bal_seq}" placeholder="댓글 달기...">
						<button class="bal_comments_btn" idx="${data.bal_seq}" onclick="write_reply(this)">게시</button>
                    </div>
                </div>
            </div>
        </div>
    </div>`;

				detailView.innerHTML = content;
				allCmtList(data.bal_seq, "bal");
			},

			error: function() {
				alert("일반글 상세화면 불러오기 실패");
			}
		})


	}

	// 상세화면 닫기 함수
	function closeDetailView() {
		post_modal.innerHTML = ''; // 상세화면 비움
		post_modal.style.display = 'none';
	}

});

// 상세화면을 보여주는 함수


// 숫자 3자리마다 ',' 추가해주는 함수
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

let animation1, animation2, animation3, animation4; // 애니메이션 객체를 저장할 변수들

function balanceDetailAnimation(post, num1, num2) {

	// var num1 = 123456;  // 선택지 1 값
	// var num2 = 78910;   // 선택지 2 값

	const count_num = post.getElementsByClassName("sp_count_num1");
	const content_select_1 = post.getElementsByClassName("sp_content_select_1");
	const count_num2 = post.getElementsByClassName("sp_count_num2");
	const content_select_2 = post.getElementsByClassName("sp_content_select_2");

	var select_1_ratio = Math.round((num1 / (num1 + num2)) * 100);
	var select_2_ratio = Math.round((num2 / (num1 + num2)) * 100);


	// 첫번째 선택지 숫자 증가 애니메이션
	animation1 = $({ val: 0 }).animate({ val: num1 }, {
		duration: 1500,
		step: function() {
			var num = numberWithCommas(Math.floor(this.val));
			count_num[0].textContent = num;
		},
		complete: function() {
			var num = numberWithCommas(Math.floor(this.val));
			count_num[0].textContent = num;
		}
	});

	// 첫번째 선택지 비율 증감 애니메이션
	animation2 = $({ val: 50 }).animate({ val: select_1_ratio }, {
		duration: 1500,
		step: function() {
			content_select_1[0].style.width = this.val + '%';
		},
		complete: function() {
			content_select_1[0].style.width = this.val + '%';
		}
	});

	// 두번째 선택지 숫자 증가 애니메이션
	animation3 = $({ val: 0 }).animate({ val: num2 }, {
		duration: 1500,
		step: function() {
			var num = numberWithCommas(Math.floor(this.val));
			count_num2[0].textContent = num;
		},
		complete: function() {
			var num = numberWithCommas(Math.floor(this.val));
			count_num2[0].textContent = num;
		}
	});

	// 두번째 선택지 비율 증감 애니메이션
	animation4 = $({ val: 50 }).animate({ val: select_2_ratio }, {
		duration: 1500,
		step: function() {
			content_select_2[0].style.width = this.val + '%';
		},
		complete: function() {
			content_select_2[0].style.width = this.val + '%';
		}
	});
}

// 애니메이션 종료 메소드
function stopBalanceAnimation() {
	if (animation1) animation1.finish();
	if (animation2) animation2.finish();
	if (animation3) animation3.finish();
	if (animation4) animation4.finish();
}

// 추가

img = ["png", "PNG", "JPG", "jpg", "GIF", "gif", "TIFF", "tiff", "psd", "PSD", "AI", "ai", "SVG", "svg", "EPS", "eps", "JFIF", "jfif", "BPG", "bpg", "SVG", "svg", "CGM", "cgm", "BMP", "bmp", "Exif", "exif"];

function getExtension(filename) {

	var filelen = filename.length;
	var lastdot = filename.lastIndexOf('.');
	var fileExt = filename.substring(lastdot + 1, filelen).toLowerCase();

	return fileExt;

}

function allCmtList(bseq,type){
	if(type == 'bal'){
		$.ajax({
			url : "BalAllCmtListCon.do",
			type : "post",
			data : {"bal_seq" : bseq},
			success : function(cmtList){
				
				$(".sp_comment_area").html("");
				$.each(cmtList,function(index,cmt){
					
					$(".sp_comment_area").append(`<div class="sp_comment${cmt.bal_cmt_seq}">
													
														<img src="./image/${cmt.mem_img}" alt="">
													
													
														<b>${cmt.mem_id}</b><span>${cmt.bal_cmt_content}</span>
													
												  </div>`);
					
					
				})
			},
			error:function(){
				alert("댓글 리스트 불러오기 실패");
			}
		})
	// 일반 글일때
	}else{
		$.ajax({
			url : "BoardAllCmtListCon.do",
			type : "post",
			data : {"board_seq" : bseq},
			success : function(cmtList){
				$(".sp_comment_area").html("");
				$.each(cmtList,function(index,cmt){
					
					$(".sp_comment_area").append(`<div class="sp_comment${cmt.board_cmt_seq}">
													
														<img src="./image/${cmt.mem_img}" alt="">
													
													
														<b>${cmt.mem_id}</b><span>${cmt.board_cmt_content}</span>
													
												  </div>`);
					
				})
			},
			error:function(){
				alert("댓글 리스트 불러오기 실패");
			}
		})
	}
}

function delete_board(board_seq){
	const result = confirm("게시글을 삭제하시겠습니까? 글 번호 : " + board_seq);
    var board_seq = document.querySelector('.post-image').getAttribute('data-post-id');
    console.log('board_seq값', board_seq);
    
    if (result) {
      // 사용자가 "예"를 선택한 경우
      alert("게시글 삭제 합니다.");
      // 여기에 추가적인 작업을 수행하는 코드를 작성할 수 있습니다.
      $.ajax({
		  type: "POST",
		  url: "BoardDeleteCon.do",
		  data: {board_seq, board_seq},
		  success : function(response) {
			 console.log(response);
			 window.location.href="./New_profile.jsp"
		  },
		  error : function(xhr, status, error) {
			  console.log("게시물삭제실패"+error)
		  }
	  })
	  
    } else {
      // 사용자가 "아니오"를 선택한 경우 또는 팝업을 닫은 경우
      alert("작업을 취소했습니다.");
      // 여기에 다른 처리를 수행하는 코드를 작성할 수 있습니다.
    }
}