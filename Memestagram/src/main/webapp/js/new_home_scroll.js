$(document).ready(function () {
    var win = $(window);
    var bodyOffset = $('body').offset();
    // Each time the user scrolls
    win.scroll(function () {
        // End of the document reached?
        // 밸런스 게임 글 애니메이션 처리
        const feedDiv = document.getElementById('posts');
        const posts = feedDiv.getElementsByClassName('balance_post');

        for (let post of posts) {
            const rect = post.getBoundingClientRect();

            // 화면 중앙으로 게시글이 오면 애니메이션 효과를 주기 위한 처리
            if (rect.top >= 0 && rect.bottom <= window.innerHeight) {
                if (!post.classList.contains('animated')) {
                    post.classList.add('animated');
                    balanceAnimation(post, 123456, 78910);
                }
            }
        }

        // 스크롤이 바닥에 닿으면 새로운 글 추가
        if ($(document).height() - win.height() == win.scrollTop()) {
            $('#loading').show();
            $('#posts').append(getBalancePost());
            $('#loading').hide();
        }
        
        // 비디오 자동재생
        var videoElement = $('.scroll').get(0);

        if ($(document).scrollTop() > bodyOffset.top) {
            if (videoElement) {
                $('#video').addClass('scroll');
                videoElement.play();
            } else {
                // 비디오 요소를 찾지 못한 경우에 대한 처리
            }
        } else {
            if (videoElement) {
                videoElement.pause();
                $('#video').removeClass('scroll');
            }
        }
    });
});
// 좋아요
function heartCheck(e){
				let board_seq = $(e).children("img").attr('idx');

				if ($(e).children('img').attr('class') == "emptyheart") {
					console.log("빈하트 클릭" + board_seq);

					$.ajax({
						url: 'LikeSaveCon.do',
						type: 'post',
						data: {
							board_seq: board_seq,
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
					$("img[idx="+board_seq+"]").attr("src", "./img/fullheart.png");
					
										//$(".emptyheart").attr("src", "./img/fullheart.png");
										$("img[idx="+board_seq+"]").attr("class", "fullheart");
										//console.log("꽉찬하트로 바껴라!");




					// 꽉찬 하트를 눌렀을 때
				} else if (($(e).children('img').attr('class') == "fullheart")) {
					let board_seq = $(e).children("img").attr('idx');
					console.log("꽉찬하트 클릭" + board_seq);

					$.ajax({
						url: 'LikeDeleteCon.do',
						type: 'post',
						data: {
							board_seq: board_seq,
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
					$("img[idx="+board_seq+"]").attr("src", "./img/emptyheart.png");
					$("img[idx="+board_seq+"]").attr("class", "emptyheart");
				}
}

//미리보기 타입 구별
function getExtension(filename) {

	var filelen = filename.length;
	var lastdot = filename.lastIndexOf('.');
	var fileExt = filename.substring(lastdot + 1, filelen).toLowerCase();

	return fileExt;
}

//댓글 불러오기
function cmtList(bseq){
	$.ajax({
		url : "CmtListCon.do",
		type : "post",
		data : {"bseq" : bseq},
		success : function(cmtList){
			$(".comments_list"+bseq).html("");
			$.each(cmtList,function(index,cmt){
				
				$(".comments_list"+bseq).append("<span id='cmt_seq"+cmt.board_cmt_seq+"'>"+"<span><b>"+cmt.mem_id+"</b></span><span></span><span>  "+cmt.board_cmt_content+"</span><br>");
				
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
function write_reply(e) {
	let bseq = $(e).attr("idx");

	let content = $('.input_reply' + bseq).val();

	if (content == "") {
		alert("댓글을 입력하세요");
	} else {

		$('.input_reply' + bseq).val("");


		$.ajax({
			url: "CmtWriteCon.do",
			type: "get",
			data: { "bseq": bseq, "content": content },
			success: function(cmtCount) {
				alert("댓글 작성 성공");

				$(".show_all" + bseq).text("댓글 " + cmtCount + "개 모두 보기");
				cmtList(bseq);
			},
			fail: function() {
				alert("댓글 작성 실패");
			}

		});
	}
}

//팔로우
function follow(e){
	let follow_id = $(e).data('id');
	alert(follow_id);
	
	if($(e).text()=="팔로우"){
		$.ajax({
			url: "FollowCon.do",
			type : "post",
			data : {"follow_id" : follow_id},
			success : function(){
				$(e).text("언팔로우");
			},
			error : function(){
				alert("팔로우 실패");
			}
			
		})
	}else if($(e).text()=="언팔로우"){
		$.ajax({
			url: "UnFollowCon.do",
			type : "post",
			data : {"follow_id" : follow_id},
			success : function(){
				$(e).text("팔로우");
			},
			error : function(){
				alert("팔로우 실패");
			}
			
		})
	}
}

// DB에서 데이터를 받아서 새로운 글을 만들어 주는 부분
function getPost(page) {
	
	var content = "";
	$.ajax({
		url: "BoardShowCon.do",
		type: "post",
		data: { "page": page },
		datatype: "json",
		success: function(data) {
			
			$.each(data, function(index, data) {
				console.log(data);
				content += `<div class="post">
            <div class="header">
                <div class="profile_icon">
                <p class="board_seq" data-no="${data.board_seq}">${data.board_seq}</p>   
                </div>
                <div class="id"> ${data.mem_id}</div>
                <div class="follow${data.mem_id}">`;
                if(data.checkFollow == 'Y'){
					content += '<button data-id="'+data.mem_id+'" onclick="follow(this)">언팔로우</button>';
				}else if(data.checkFollow == 'N'){
					content += '<button data-id="'+data.mem_id+'" onclick="follow(this)">팔로우</button>';
				}else if(data.checkFollow == 'E'){
					
				}
                	
                
                content += `</div>
                <div class="menu">
                    <i class='bx bx-dots-horizontal-rounded'></i>
                </div>
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
                    <i class="bx bx-comment icon"></i>
                </div>
                <div class="button">
                    <i class="bx bx-navigation icon"></i>
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
                <span class="show_all${data.board_seq}">댓글 ${data.board_cmt_cnt}개 모두 보기</span>
            </div>
            
            <div class="comments_list${data.board_seq} comments_list">
                
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
			});
			


		$('#posts').append(content);
		},
		
		// success 닫히는 곳
		fail: function() {
			alert("통신 실패");
		}

	});
}

function getBalancePost() {

    var content = ` <div class="balance_post">
    <div class="header">
    <div class="balance_title"></div>
    <div class="balance_time">
        <i class='bx bx-time-five'></i>
        <span><b>12:30</b></span>
    </div>
    <div class="balance_reward">
        <i class='bx bx-coin'></i>
        <span><b>120P</b></span>
    </div>
    <div class="menu">
        <i class='bx bx-dots-horizontal-rounded'></i>
    </div>
    </div>
    <!-- 게시물 컨텐츠 영역 -->
    <div class="balance_content">
        <div class="balance_content_div">
            <img src="./image/balance_01.png" alt="">
        </div>
        <div class="balance_select_div">
            <div class="content_select_1">
                <div class="content_select_1_name">
                    <h3>월 200 백수</h3>
                </div>
                <div class="content_select_1_count">
                    <h4 class="count_num1">0</h4>
                </div>
            </div>
            <div class="content_select_2">
                <div class="content_select_2_name">
                    <h3>월 500 직장인</h3>
                </div>
                <div class="content_select_2_count">
                    <h4 class="count_num2">0</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="buttons">
        <div class="button">
            <i class="bx bx-heart icon"></i>
        </div>
        <div class="button">
            <i class="bx bx-comment icon" data-post-id="${count++}"></i>
        </div>
        <div class="button">
            <i class="bx bx-navigation icon"></i>
        </div>
    </div>
    <div class="like">
        <span>좋아요</span>
        <span class="like_count">10.8만</span>
        <span>개</span>
    </div>
    <div class="comments">
        <span><b>작성자</b></span>
        <span> </span>
        <span>댓글 내용입니다.</span> <br>
        <span class="show_more">더 보기</span>
    </div>
    <div class="comments_show">
        <span class="show_all">댓글 1004개 모두 보기</span>
    </div>
    <div class="comments_input">
        <input type="text" placeholder="댓글 달기...">
        <button id="comments_btn">게시</button>
    </div>
    <hr>
</div>`;

    return content;
}


// 숫자 3자리마다 ',' 추가해주는 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function balanceAnimation(post, num1, num2) {

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
        duration: 1500,
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
        duration: 1500,
        step: function () {
            content_select_1[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_1[0].style.width = this.val + '%';
        }
    });

    // 두번째 선택지 숫자 증가 애니메이션
    $({ val: 0 }).animate({ val: num2 }, {
        duration: 1500,
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
        duration: 1500,
        step: function () {
            content_select_2[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_2[0].style.width = this.val + '%';
        }
    });
}
