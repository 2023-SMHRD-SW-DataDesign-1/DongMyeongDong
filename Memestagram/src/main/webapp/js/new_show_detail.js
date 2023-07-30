document.addEventListener('DOMContentLoaded', function () {
    const postList = document.getElementById('posts');
    const detailView = document.getElementById('balance_post_modal');
    const show_post = document.getElementsByClassName('show_post');

    // 버튼 이벤트 위임
    postList.addEventListener('click', function (event) {
        if(event.target.classList.contains('board') || event.target.classList.contains('show_all')) {
            const postId = event.target.dataset.postId;

            showDetailView(postId);
            
            detailView.style.display = "block";
            document.body.classList.add('modal-open');

            // 모달 바깥 영역을 클릭하면 모달이 닫히도록 이벤트 리스너 추가
            window.onclick = function (event) {
                if (event.target === detailView) {
					stopBalanceAnimation();
                    closeDetailView();
                    document.body.classList.remove('modal-open');
                }
            };
        }else if(event.target.classList.contains('balance') || event.target.classList.contains('bal_show_all')) {
			const postId = event.target.dataset.postId;
			
			showDetailView_balance(postId);
			
			/*let num1 = Number(detailView.getElementsByClassName('sp_count_num1')[0].textContent);
			let num2 = Number(detailView.getElementsByClassName('sp_count_num2')[0].textContent);*/
			/*alert(detailView.getElementsByClassName('sp_count_num2')[0].innerHTML);
			alert(num2);*/
            
            
            detailView.style.display = "block";
            document.body.classList.add('modal-open');
            
			
            // 모달 바깥 영역을 클릭하면 모달이 닫히도록 이벤트 리스너 추가
            window.onclick = function (event) {
				
                if (event.target === detailView) {
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
			url : "BoardDetailShowCon.do",
			type: "post",
			data : {"board_seq" : postId},
			success : function(data){
				content += `
        <div class="post_modal_content_balance">
        <div class="show_post">
            <div class="sp_content">
                <div class="sp_file">`;
                    var fileExtension = getExtension(data.board_img);
				
				if (img.includes(fileExtension)) {
					content += '<img src="img/' + data.board_img + '">';
				} else {
					content += '<video id="video" src="img/' + data.board_img + '" controls autoplay muted playsinline></video>';
				}
                content += `</div>
                <div class="sp_detail">
                    <div class="sp_detail_user">
                        <div><img src="./image/${data.mem_img}" alt=""></div>
                        <div>${data.mem_id}</div>
                    </div>
                    <div class="sp_content_area">
                        <div class="sp_comment">
							<div>
								<img src="./image/${data.mem_img}" alt="">
								<b>${data.mem_id}</b>
								<span>${data.board_content}</span>
							</div>
						</div>
                    </div>
                    <div class="sp_comment_area" id="${data.board_seq}">
                    
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
    detailView.innerHTML = content;
    allCmtList(data.board_seq,"d");
			},
			error : function(){
				alert("일반글 상세화면 불러오기 실패");
			}
		})
		
        // 상세화면 표시
        
    }

    // 밸런스게임글 상세화면
    function showDetailView_balance(postId){
		
		let content = "";
		$.ajax({
			url : "BalDetailShowCon.do",
			type: "post",
			data : {"bal_seq" : postId},
			success : function(data){
				
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
                        <div class="sp_content_select_1" idx="${data.bal_seq}" data-id="${data.bal_seq}" data-reward="${data.bal_reward}" onclick="balanceVote(this)" style="background-color: ${data.bal_left_color};">
                            <div class="sp_content_select_1_name">
                                <h2>${data.bal_left}</h2>
                            </div>
                            <div class="sp_content_select_1_count">
                                <h3 class="sp_count_num1">${data.bal_left_count}</h3>
                            </div>
                        </div>
                        <div class="sp_content_select_2" idx="${data.bal_seq}" data-id="${data.bal_seq}" data-reward="${data.bal_reward}" onclick="balanceVote(this)" style="background-color: ${data.bal_right_color};">
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
                        <div class="sp_balance_time" id='countdown_detail_${data.bal_seq}'>
                            <i class='bx bx-time-five'></i>
                        </div>
                        <div class="sp_balance_reward">
                            <i class='bx bx-coin'></i>
                            <span><b>${data.bal_reward}P</b></span>
                        </div>
                    </div>
                    <div class="sp_content_area">
                        <div class="sp_comment">
							<div>
							    <img src="./image/${data.mem_img}" alt="">
								<b>${data.mem_id}</b>
								<span>${data.bal_content}</span>
							</div>
						</div>
                    </div>
                    <div class="sp_comment_area" id="${data.bal_seq}">
                    
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
    addSpan('countdown_detail_' + data.bal_seq, data.bal_time);
    balanceDetailAnimation2(detailView);
    allCmtList(data.bal_seq,"bal");
    
			},
			
			error : function(){
				alert("일반글 상세화면 불러오기 실패");
			}
		})
		
        
    }

    // 상세화면 닫기 함수
    function closeDetailView() {
        detailView.innerHTML = ''; // 상세화면 비움
        detailView.style.display = 'none';
    }
    
});

function sleep(ms) {
  const wakeUpTime = Date.now() + ms;
  while (Date.now() < wakeUpTime) {}
}

// 투표후 애니메이션 처리 전 함수
function detailBalanceLoad(left,right){
	const detailView = document.getElementById('balance_post_modal');
	
	let num1 = Number(detailView.getElementsByClassName('sp_count_num1')[0].textContent);
	let num2 = Number(detailView.getElementsByClassName('sp_count_num2')[0].textContent);
	
	
	balanceDetailAnimation(detailView,num1,num2,left,right);
}

// 숫자 3자리마다 ',' 추가해주는 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

let animation1, animation2, animation3, animation4; // 애니메이션 객체를 저장할 변수들

function balanceDetailAnimation(post, num1, num2, left, right) {

    // var num1 = 123456;  // 선택지 1 값
    // var num2 = 78910;   // 선택지 2 값
	left = Number(left);
	right = Number(right);
    const count_num = post.getElementsByClassName("sp_count_num1");
    const content_select_1 = post.getElementsByClassName("sp_content_select_1");
    const count_num2 = post.getElementsByClassName("sp_count_num2");
    const content_select_2 = post.getElementsByClassName("sp_content_select_2");

	/*alert(num1);
	alert(num2);
	alert(left);
	alert(num1);*/
	// 투표 하기전 비율
	var left_ratio = Math.round((left / (left + right)) * 100);
    var right_ratio = Math.round((right / (left + right)) * 100);
    
    var select_1_ratio = Math.round((num1 / (num1 + num2)) * 100);
    var select_2_ratio = Math.round((num2 / (num1 + num2)) * 100);

	if(isNaN(left_ratio) && isNaN(right_ratio)){
		  left_ratio = 50;
		  right_ratio = 50;
	}else if(isNaN(select_1_ratio) && isNaN(select_2_ratio)){
		select_1_ratio = 50;
		select_2_ratio = 50;
	}
	/*alert(left_ratio);
	alert(right_ratio);
	alert(select_1_ratio);
	alert(select_2_ratio);*/
    // 첫번째 선택지 숫자 증가 애니메이션
    animation1 = $({ val: left }).animate({ val: num1 }, {
        duration: 500,
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
    animation2 = $({ val: left_ratio }).animate({ val: select_1_ratio }, {
        duration: 500,
        step: function () {
            content_select_1[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_1[0].style.width = this.val + '%';
        }
    });

    // 두번째 선택지 숫자 증가 애니메이션
    animation3 = $({ val: right }).animate({ val: num2 }, {
        duration: 500,
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
    animation4 = $({ val: right_ratio }).animate({ val: select_2_ratio }, {
        duration: 500,
        step: function () {
            content_select_2[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_2[0].style.width = this.val + '%';
        }
    });
}

function balanceDetailAnimation2(post) {

    // var num1 = 123456;  // 선택지 1 값
    // var num2 = 78910;   // 선택지 2 값
    
    const detailView2 = document.getElementById('balance_post_modal');
	
	let num1 = Number(detailView2.getElementsByClassName('sp_count_num1')[0].textContent);
	let num2 = Number(detailView2.getElementsByClassName('sp_count_num2')[0].textContent);
    const count_num = post.getElementsByClassName("sp_count_num1");
    const content_select_1 = post.getElementsByClassName("sp_content_select_1");
    const count_num2 = post.getElementsByClassName("sp_count_num2");
    const content_select_2 = post.getElementsByClassName("sp_content_select_2");

    var select_1_ratio = Math.round((num1 / (num1 + num2)) * 100);
    var select_2_ratio = Math.round((num2 / (num1 + num2)) * 100);


    // 첫번째 선택지 숫자 증가 애니메이션
    animation1 = $({ val: 0 }).animate({ val: num1 }, {
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
    animation2 = $({ val: 50 }).animate({ val: select_1_ratio }, {
        duration: 1000,
        step: function () {
            content_select_1[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_1[0].style.width = this.val + '%';
        }
    });

    // 두번째 선택지 숫자 증가 애니메이션
    animation3 = $({ val: 0 }).animate({ val: num2 }, {
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
    animation4 = $({ val: 50 }).animate({ val: select_2_ratio }, {
        duration: 1000,
        step: function () {
            content_select_2[0].style.width = this.val + '%';
        },
        complete: function () {
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

// 카운트 다운 span 추가
function addSpan(id, time) {
	const spanContainer = document.getElementById(id);
	const newSpan = document.createElement("span");
	spanContainer.appendChild(newSpan);

	startCountdown(newSpan, time);
}

// 카운트 다운 함수
function startCountdown(spanElement, targetDate) {

	// 타깃 날짜와 시간
	let targetTime = new Date(targetDate).getTime();
	// 남은 시간 계산 (초단위)
	let now = new Date().getTime();
	let remainingSeconds = Math.floor((targetTime - now) / 1000);


	let countdownInterval = setInterval(function() {

		if (remainingSeconds <= 0) {
			clearInterval(countdownInterval);
			spanElement.textContent = "종료";
		} else {
			// 일, 시간, 분, 초 계산
			let days = Math.floor(remainingSeconds / (60 * 60 * 24));
			let hours = Math.floor(remainingSeconds % (60 * 60 * 24) / (60 * 60));
			let minutes = Math.floor(remainingSeconds % (60 * 60 * 24) % (60 * 60) / 60);
			let seconds = remainingSeconds % (60 * 60 * 24) % (60 * 60) % 60 % 60;

			let countdownString = `${days}일 ${hours}시간 ${minutes}분 ${seconds}초`;

			spanElement.textContent = countdownString;
		}
		remainingSeconds--;
	}, 1000);
}
