var currentPage = 1;

$(document).ready(function() {
	var win = $(window);
	var bodyOffset = $('body').offset();

	getPost(currentPage);
	

	// 스크롤 시 이벤트 처리
	win.scroll(function() {
		// End of the document reached?
		// console.log($(document).height(), win.height(), win.scrollTop());
		const feedDiv = document.getElementById('posts');
		const posts = feedDiv.getElementsByClassName('balance_post');

		for (let post of posts) {

			
			
            const rect = post.getBoundingClientRect();
            let num1 = Number(post.getElementsByClassName("count_num1")[0].textContent);
            let num2 = Number(post.getElementsByClassName("count_num2")[0].textContent);
           	
            
			let left_count = post.getElementsByClassName("count_num1");
			let right_count = post.getElementsByClassName("count_num2");
            // 화면 중앙으로 게시글이 오면 애니메이션 효과를 주기 위한 처리
            if (rect.top >= 0 && rect.bottom <= window.innerHeight) {
                if (!post.classList.contains('animated')) {
                    post.classList.add('animated');
                    balanceAnimation2(post, num1, num2);
                }
            }
        }
		

		if ($(document).height() - win.height() == win.scrollTop()) {

			$('#loading').show();
			currentPage += 1;
			getPost(currentPage);
			$('#loading').hide();
		}

		if ($(document).scrollTop() > bodyOffset.top) {
			$('#video').addClass('scroll');
			$('.scroll').get(0).play();
		} else {
			$('.scroll').get(0).pause();
			$('#video').removeClass('scroll');
		}
	});

}); //document ready 끝나는 부분

function balanceLoad(left,right){
	
	const feedDiv = document.getElementById('posts');
        const posts = feedDiv.getElementsByClassName('balance_post');
		
		for (let post of posts) {
			
			
            const rect = post.getBoundingClientRect();
            let num1 = Number(post.getElementsByClassName("count_num1")[0].textContent);
            let num2 = Number(post.getElementsByClassName("count_num2")[0].textContent);
           	
            /*console.log(post);*/
			/*let left_count = post.getElementsByClassName("count_num1");
			let right_count = post.getElementsByClassName("count_num2");*/
            // 화면 중앙으로 게시글이 오면 애니메이션 효과를 주기 위한 처리
            /*if (rect.top >= 0 && rect.bottom <= window.innerHeight) {
                if (!post.classList.contains('animated')) {*/
                    post.classList.add('animated');
                    
                    balanceAnimation(post, num1, num2 , left, right);
            /*    }
            }*/
        }
}



// 숫자 3자리마다 ',' 추가해주는 함수
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function balanceAnimation(post, num1, num2, left, right) {
	
	
    // var num1 = 123456;  // 선택지 1 값
    // var num2 = 78910;   // 선택지 2 값
	left = Number(left);
	right = Number(right);
    const count_num = post.getElementsByClassName("count_num1");
    const content_select_1 = post.getElementsByClassName("content_select_1");
    const count_num2 = post.getElementsByClassName("count_num2");
    const content_select_2 = post.getElementsByClassName("content_select_2");
	
	
    // 투표 하기전 비율
	var left_ratio = Math.round((left / (left + right)) * 100);
    var right_ratio = Math.round((right / (left + right)) * 100);
    /*alert("num1 : "+num1);
  	
  	alert("num22 : "+num2);*/
    // 투표 후 비율
    var select_1_ratio = Math.round((num1 / (num1 + num2)) * 100);
    var select_2_ratio = Math.round((num2 / (num1 + num2)) * 100);
  	
  	if(isNaN(left_ratio) && isNaN(right_ratio)){
		  left_ratio = 50;
		  right_ratio = 50;
	}else if(isNaN(select_1_ratio) && isNaN(select_2_ratio)){
		select_1_ratio = 50;
		select_2_ratio = 50;
	}
	
    // 첫번째 선택지 숫자 증가 애니메이션
    $({ val: left }).animate({ val: num1 }, {
        duration: 1000,
        step: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num[0].textContent = num;
        },
        complete: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num[0].textContent = num;
        }
    });

    // 첫번째 선택지 비율 증감 애니메이션
    $({ val: left_ratio }).animate({ val: select_1_ratio }, {
        duration: 1000,
        step: function () {
            content_select_1[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_1[0].style.width = this.val + '%';
        }
    });

    // 두번째 선택지 숫자 증가 애니메이션
    $({ val: right }).animate({ val: num2 }, {
        duration: 1000,
        step: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num2[0].textContent = num;
        },
        complete: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num2[0].textContent = num;
        }
    });

    // 두번째 선택지 비율 증감 애니메이션
    $({ val: right_ratio }).animate({ val: select_2_ratio }, {
        duration: 1000,
        step: function () {
            content_select_2[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_2[0].style.width = this.val + '%';
        }
    });
}

function balanceAnimation2(post, num1, num2) {
	
	
    // var num1 = 123456;  // 선택지 1 값
    // var num2 = 78910;   // 선택지 2 값
	
    const count_num = post.getElementsByClassName("count_num1");
    const content_select_1 = post.getElementsByClassName("content_select_1");
    const count_num2 = post.getElementsByClassName("count_num2");
    const content_select_2 = post.getElementsByClassName("content_select_2");
	
    var select_1_ratio = Math.round((num1 / (num1 + num2)) * 100);
    var select_2_ratio = Math.round((num2 / (num1 + num2)) * 100);
	
	
    // 첫번째 선택지 숫자 증가 애니메이션
    $({ val: 0 }).animate({ val: num1 }, {
        duration: 1000,
        step: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num[0].textContent = num;
        },
        complete: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num[0].textContent = num;
        }
    });



    // 첫번째 선택지 비율 증감 애니메이션
    $({ val: 50 }).animate({ val: select_1_ratio }, {
        duration: 1000,
        step: function () {
            content_select_1[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_1[0].style.width = this.val + '%';
        }
    });



    // 두번째 선택지 숫자 증가 애니메이션
    $({ val: 0 }).animate({ val: num2 }, {
        duration: 1000,
        step: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num2[0].textContent = num;
        },
        complete: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num2[0].textContent = num;
        }
    });



    // 두번째 선택지 비율 증감 애니메이션
    $({ val: 50 }).animate({ val: select_2_ratio }, {
        duration: 1000,
        step: function () {
            content_select_2[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_2[0].style.width = this.val + '%';
        }
    });

}

function heartCheck(e) {
	let board_seq = $(e).children("img").attr('idx');

	if ($(e).children('img').attr('class') == "emptyheart") {
		console.log("빈하트 클릭" + board_seq);

		$.ajax({
			url: 'LikeSaveCon.do',
			type: 'post',
			data: {
				"board_seq": board_seq,
			},
			success: function(data) {
				let heart = data;

				$('.like_count' + board_seq).text(heart);

				console.log("좋아요 성공");

			},
			error: function() {
				alert('좋아요 실패');
			}
		});
		$("img[idx=" + board_seq + "]").attr("src", "./img/fullheart.png");

		//$(".emptyheart").attr("src", "./img/fullheart.png");
		$("img[idx=" + board_seq + "]").attr("class", "fullheart");
		//console.log("꽉찬하트로 바껴라!");




		// 꽉찬 하트를 눌렀을 때
	} else if (($(e).children('img').attr('class') == "fullheart")) {
		let board_seq = $(e).children("img").attr('idx');
		console.log("꽉찬하트 클릭" + board_seq);

		$.ajax({
			url: 'LikeDeleteCon.do',
			type: 'post',
			data: {
				"board_seq": board_seq,
			},
			success: function(data) {
				let heart = data;

				$('.like_count' + board_seq).text(heart);


			},
			error: function() {
				alert('좋아요 해제 실패');
			}
		});
		console.log("빈하트로 바껴라!")
		$("img[idx=" + board_seq + "]").attr("src", "./img/emptyheart.png");
		$("img[idx=" + board_seq + "]").attr("class", "emptyheart");

	}


}

function balHeartCheck(e) {
	let bal_seq = $(e).attr('idx');

	if ($(e).children('img').attr('class') == "emptyheart") {
		console.log("빈하트 클릭" + bal_seq);

		$.ajax({
			url: 'BalLikeSaveCon.do',
			type: 'post',
			data: {
				"bal_seq": bal_seq,
			},
			success: function(data) {
				let heart = data;

				$('.ballike_count' + bal_seq).text(heart);

				console.log("좋아요 성공");

			},
			error: function() {
				alert('좋아요 실패');
			}
		});
		$("img[idx=bal" + bal_seq + "]").attr("src", "./img/fullheart.png");

		//$(".emptyheart").attr("src", "./img/fullheart.png");
		$("img[idx=bal" + bal_seq + "]").attr("class", "fullheart");
		//console.log("꽉찬하트로 바껴라!");




		// 꽉찬 하트를 눌렀을 때
	} else if (($(e).children('img').attr('class') == "fullheart")) {
		let bal_seq = $(e).attr('idx');
		console.log("꽉찬하트 클릭" + bal_seq);

		$.ajax({
			url: 'BalLikeDeleteCon.do',
			type: 'post',
			data: {
				"bal_seq": bal_seq,
			},
			success: function(data) {
				let heart = data;

				$('.ballike_count' + bal_seq).text(heart);


			},
			error: function() {
				alert('좋아요 해제 실패');
			}
		});
		console.log("빈하트로 바껴라!")
		$("img[idx=bal" + bal_seq + "]").attr("src", "./img/emptyheart.png");
		$("img[idx=bal" + bal_seq + "]").attr("class", "emptyheart");

	}


}

img = ["png", "PNG", "JPG", "jpg", "GIF", "gif", "TIFF", "tiff", "psd", "PSD", "AI", "ai", "SVG", "svg", "EPS", "eps", "JFIF", "jfif", "BPG", "bpg", "SVG", "svg", "CGM", "cgm", "BMP", "bmp", "Exif", "exif"];

function getExtension(filename) {

	var filelen = filename.length;
	var lastdot = filename.lastIndexOf('.');
	var fileExt = filename.substring(lastdot + 1, filelen).toLowerCase();

	return fileExt;

}

function cmtList(bseq, type) {
	// 밸런스 글일때

	if (type == 'bal') {
		$.ajax({
			url: "BalCmtListCon.do",
			type: "post",
			data: { "bseq": bseq },
			success: function(cmtList) {
				$(".bal_comments_list" + bseq).html("");
				$.each(cmtList, function(index, cmt) {

					$(".bal_comments_list" + bseq).append("<span id='cmt_seq" + cmt.bal_cmt_seq + "'>" + "<span><b>" + cmt.mem_id + "</b></span><span></span><span>  " + cmt.bal_cmt_content + "</span><br>");

					if (index == 0) {
						return false;
					}
				})
			},
			error: function() {
				alert("댓글 리스트 불러오기 실패");
			}
		})
		// 일반 글일때
	} else {
		$.ajax({
			url: "CmtListCon.do",
			type: "post",
			data: { "bseq": bseq },
			success: function(cmtList) {
				$(".comments_list" + bseq).html("");
				$.each(cmtList, function(index, cmt) {

					$(".comments_list" + bseq).append("<span id='cmt_seq" + cmt.board_cmt_seq + "'>" + "<span><b>" + cmt.mem_id + "</b></span><span></span><span>  " + cmt.board_cmt_content + "</span><br>");

					if (index == 0) {
						return false;
					}
				})
			},
			error: function() {
				alert("댓글 리스트 불러오기 실패");
			}
		})
	}


}

function allCmtList(bseq, type) {
	if (type == 'bal') {
		$.ajax({
			url: "BalAllCmtListCon.do",
			type: "post",
			data: { "bal_seq": bseq },
			success: function(cmtList) {

				$(".sp_comment_area").html("");
				$.each(cmtList, function(index, cmt) {

					$(".sp_comment_area").append(`<div class="sp_comment${cmt.bal_cmt_seq}">
													
														<img src="./image/${cmt.mem_img}" alt="">
													
													
														<b>${cmt.mem_id}</b><span>${cmt.bal_cmt_content}</span>
													
												  </div>`);


				})
			},
			error: function() {
				alert("댓글 리스트 불러오기 실패");
			}
		})
		// 일반 글일때
	} else {
		$.ajax({
			url: "BoardAllCmtListCon.do",
			type: "post",
			data: { "board_seq": bseq },
			success: function(cmtList) {
				$(".sp_comment_area").html("");
				$.each(cmtList, function(index, cmt) {

					$(".sp_comment_area").append(`<div class="sp_comment${cmt.board_cmt_seq}">
													
														<img src="./image/${cmt.mem_img}" alt="">
													
													
														<b>${cmt.mem_id}</b><span>${cmt.board_cmt_content}</span>
													
												  </div>`);

				})
			},
			error: function() {
				alert("댓글 리스트 불러오기 실패");
			}
		})
	}
}


// DB에서 데이터를 받아서 새로운 글을 만들어 주는 부분
var count = 1;

function write_reply(e) {
	let bseq = $(e).attr("idx");
	let className = $(e).attr('class');
	
	// 밸런스 글일때
	if (className == 'bal_comments_btn') {
		let content = $('.bal_input_reply' + bseq).val();
		let detail = $('.detail_bal_input_reply' + bseq).val();

		if (content == "" && detail == "") {
			alert("댓글을 입력하세요");
		} else {

			if (content != "") {
				$('.bal_input_reply' + bseq).val("");
			} else if (detail != "") {
				$('.detail_bal_input_reply' + bseq).val("");
				content = detail;
			}

			$.ajax({
				url: "BalCmtWriteCon.do",
				type: "get",
				data: { "balSeq": bseq, "content": content },
				success: function(cmtCount) {
					alert("댓글 작성 성공");

					$(".show_allbal" + bseq).text("댓글 " + cmtCount + "개 모두 보기");
					cmtList(bseq, "bal");
					allCmtList(bseq, "bal");
				},
				fail: function() {
					alert("댓글 작성 실패");
				}

			});
		}
		// 일반 글일 때
	} else {
		let content = $('.input_reply' + bseq).val();
		let detail = $('.detail_input_reply' + bseq).val();
		if (content == "" && detail == "") {
			alert("댓글을 입력하세요");
		} else {

			if (content != "") {
				$('.input_reply' + bseq).val("");
			} else if (detail != "") {
				$('.detail_input_reply' + bseq).val("");
				content = detail;
			}



			$.ajax({
				url: "CmtWriteCon.do",
				type: "get",
				data: { "bseq": bseq, "content": content },
				success: function(cmtCount) {
					alert("댓글 작성 성공");

					$(".show_all" + bseq).text("댓글 " + cmtCount + "개 모두 보기");
					cmtList(bseq, "board");
					allCmtList(bseq, "board");
				},
				fail: function() {
					alert("댓글 작성 실패");
				}

			});
		}
	}

}

function follow(e) {
	let follow_id = $(e).data('id');

	
	
	if($(e).text()=="팔로우"){

		$.ajax({
			url: "FollowCon.do",
			type: "post",
			data: { "follow_id": follow_id },
			success: function() {
				$(e).text("언팔로우");
			},
			error: function() {
				alert("팔로우 실패");
			}

		})
	} else if ($(e).text() == "언팔로우") {
		$.ajax({
			url: "UnFollowCon.do",
			type: "post",
			data: { "follow_id": follow_id },
			success: function() {
				$(e).text("팔로우");
			},
			error: function() {
				alert("팔로우 실패");
			}

		})
	}
}

function balanceVote(e){
	let bal_seq = $(e).attr('idx');
	let className = $(e).attr('class');
	let vote;
	if(className == 'content_select_1' || className == 'sp_content_select_1'){
		vote = 'L';
	}else if(className == 'content_select_2' || className == 'sp_content_select_2'){
		vote = 'R';
	}
	let left = $(e).parent().find('.count_num1').text();
	let right =$(e).parent().find('.count_num2').text();
	
	
	$.ajax({
		url : "BalVoteCon.do",
		type : "post",
		data : {"bal_seq" : bal_seq, "vote" : vote},
		success : function(vote){
			$(e).parent().find('.count_num1').text(vote.bal_left_count);
			$(e).parent().find('.count_num2').text(vote.bal_right_count);
			if(className == 'sp_content_select_1' || className == 'sp_content_select_2'){
				
				/*$("img[idx=bal"+bal_seq+"]")*/
				$('[data-id="'+bal_seq+'"]').parent().find('.count_num1').text(vote.bal_left_count);
				$('[data-id="'+bal_seq+'"]').parent().find('.count_num2').text(vote.bal_right_count);
				let bal_left = $(e).parent().find('.sp_count_num1').text();
				let bal_right = $(e).parent().find('.sp_count_num2').text();
				$(e).parent().find('.sp_count_num1').text(vote.bal_left_count);
				$(e).parent().find('.sp_count_num2').text(vote.bal_right_count);
				
				detailBalanceLoad(bal_left,bal_right);
			}else{
				
			}
			
			
			balanceLoad(left,right);
			
		},
		error : function(){
			alert("balanceVote 실패");
		}
	})
}

function getPost(page) {

	var content = "";
	$.ajax({
		url: "BoardShowCon.do",
		type: "post",
		data: { "page": page },
		datatype: "json",
		async: false,
		success: function(data) {

			$.each(data, function(index, data) {
				console.log(data);
				content += `<div class="post">
            <div class="header">
                <div class="profile_icon">
               
                	<img src="./image/${data.mem_img}" alt="">
                </div>
                <div class="id"> ${data.mem_id}</div>
                <div class="follow${data.mem_id}">`;
				if (data.checkFollow == 'Y') {
					content += '<button class="btn_follow" data-id="' + data.mem_id + '" onclick="follow(this)">언팔로우</button>';
				} else if (data.checkFollow == 'N') {
					content += '<button class="btn_follow" data-id="' + data.mem_id + '" onclick="follow(this)">팔로우</button>';
				} else if (data.checkFollow == 'E') {

				}


				content += `</div>
            </div>
            <div class="content">`;
				var fileExtension = getExtension(data.board_img);
				console.log("dd");
				if (img.includes(fileExtension)) {
					content += '<img src="img/' + data.board_img + '">';
				} else {
					content += '<video id="video" src="img/' + data.board_img + '" controls autoplay muted playsinline></video>';
				}
				content += `</div>
            <div class="buttons">

                <div class="button">
                <a idx=${data.board_seq} href="javascript:void(0)" class="heart" onclick="heartCheck(this)">`;

				if (data.checklike == 'Y') {
					content += '<img src="./img/fullheart.png" height="25px" width ="27px" class="fullheart" idx="' + data.board_seq + '">';
				} else {
					content += '<img src="./img/emptyheart.png" height="25px" width ="25px" class="emptyheart" idx="' + data.board_seq + '">';
				}


				content += `</a></div>

                <div class="button">
                    <i class="bx bx-comment icon board" data-post-id=${data.board_seq}></i>
                </div>
            </div>
            <div class="like">
                <span>좋아요</span>
                <span class="like_count${data.board_seq}">${data.board_likes}</span>
                <span>개</span>
            </div>
            <div class="comments">
                <span><b>${data.mem_id}</b></span>
                <span> </span>
                <span>${data.board_content}</span> <br>
                <span class="show_more">더 보기</span>
            </div>
            <div class="comments_show">
                <span class="show_all${data.board_seq} show_all" data-post-id=${data.board_seq} >댓글 ${data.board_cmt_cnt}개 모두 보기</span>
            </div>
            
            <div class="comments_list${data.board_seq} comments_list">
                
            </div>
          
            <div class="comments_input">
                <input type="text" class="input_reply${data.board_seq}" placeholder="댓글 달기...">
                <button class="comments_btn" idx="${data.board_seq}" onclick="write_reply(this)" >게시</button>
            </div>

            <hr>
        </div>`;


				/*let button = document.querySelector('.write_reply'+data.board_seq);*/

				/*button.addEventListener('click',function(){
					write_reply();
				})*/

				cmtList(data.board_seq, "d");
			});


		},

		// success 닫히는 곳
		fail: function() {
			alert("통신 실패");
		}

	});

	$.ajax({

		url: "balBoardShowCon.do",
		type: "post",
		data: { "page": page },
		async: false,
		success: function(data) {

			$.each(data, function(index, data) {
				content += ` <div class="balance_post">
							    <div class="header">
							    <div class="balance_title"></div>
							    <div class="balance_time">
							        <i class='bx bx-time-five'></i>
							        <span id="countdown"></span>
							    </div>
							    <div class="balance_reward">
							        <i class='bx bx-coin'></i>
							        <span><b>${data.bal_reward}P</b></span>
							    </div>
							    </div>
							    <!-- 게시물 컨텐츠 영역 -->
							    <div class="balance_content">
							        <div class="balance_content_div">`;
				var fileExtension = getExtension(data.bal_img);
				console.log("dd");
				if (img.includes(fileExtension)) {
					content += '<img src="img/' + data.bal_img + '">';
				} else {
					content += '<video id="video" src="img/' + data.bal_vid + '" controls autoplay muted playsinline></video>';
				}

				content += `</div>
							        <div class="balance_select_div">


							            <div class="content_select_1" style="background-color: ${data.bal_left_color}" idx="${data.bal_seq}" data-id="${data.bal_seq}" onclick="balanceVote(this)">

							                <div class="content_select_1_name">
							                    <h3 >${data.bal_left}</h3>
							                </div>
							                <div class="content_select_1_count">
							                    <h4 class="count_num1" >${data.bal_left_count}</h4>
							                </div>
							            </div>


							            <div class="content_select_2" style="background-color: ${data.bal_right_color}" idx="${data.bal_seq}" onclick="balanceVote(this)">

							                <div class="content_select_2_name">
							                    <h3>${data.bal_right}</h3>
							                </div>
							                <div class="content_select_2_count">
							                    <h4 class="count_num2">${data.bal_right_count}</h4>
							                </div>
							            </div>
							        </div>
							    </div>
							    <div class="buttons">
							        <div class="button">
							            <a idx=${data.bal_seq} href="javascript:void(0)" class="heart" onclick="balHeartCheck(this)">`;

				if (data.balCheckLike == 'Y') {
					content += '<img src="./img/fullheart.png" height="25px" width ="27px" class="fullheart" idx="bal' + data.bal_seq + '">';
				} else {
					content += '<img src="./img/emptyheart.png" height="25px" width ="25px" class="emptyheart" idx="bal' + data.bal_seq + '">';
				}

				content += `</a></div>
							        <div class="button">
							            <i class="bx bx-comment icon balance" data-post-id="${data.bal_seq}"></i>
							        </div>
							    </div>
							    <div class="like">
							        <span>좋아요</span>
							        <span class="ballike_count${data.bal_seq}">${data.bal_like}</span>
							        <span>개</span>
							    </div>
							    <div class="comments">
							        <span><b>${data.mem_id}</b></span>
							        <span> </span>
							        <span>${data.bal_content}</span> <br>
							        <span class="show_more">더 보기</span>
							    </div>
							    <div class="bal_comments_show">
							        <span class="show_allbal${data.bal_seq} bal_show_all" data-post-id="${data.bal_seq}">댓글 ${data.bal_cmt_cnt}개 모두 보기</span>
							    </div>
							    <div class="bal_comments_list${data.bal_seq} comments_list">
                
            					</div>
							    <div class="comments_input">
							        <input type="text" class="bal_input_reply${data.bal_seq}" placeholder="댓글 달기...">
							        <button class="bal_comments_btn" idx="${data.bal_seq}" onclick="write_reply(this)">게시</button>
							    </div>
							    <hr>
							</div>`;

				cmtList(data.bal_seq, "bal");
			})

			$('#posts').append(content);
		},
		error: function() {
			alert("balshowcon fail");
		}
	})

}

	

