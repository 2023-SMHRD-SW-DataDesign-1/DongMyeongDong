document.addEventListener('DOMContentLoaded', function () {
    const postList = document.getElementById('posts');
    const detailView = document.getElementById('balance_post_modal');

    // 버튼 이벤트 위임
    postList.addEventListener('click', function (event) {
        if (event.target.classList.contains('bx-comment') || event.target.classList.contains('show_all')) {
            const postId = event.target.dataset.postId;
            
            var isBalance = true;

            if(isBalance){
                showDetailView_balance(postId);
                balanceDetailAnimation(detailView, 123456, 78910);
            }else{
                showDetailView(postId);
            }
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

    // 상세화면을 보여주는 함수
    function showDetailView(postId) {
        // 상세화면 표시
        detailView.innerHTML = `
        <div class="post_modal_content_balance">
        <div class="show_post">
            <div class="sp_content">
                <div class="sp_file">
                    <img src="./image/astronaut-8061095_1280.png" alt="">
                </div>
                <div class="sp_detail">
                    <div class="sp_detail_user">
                        <div><img src="./image/user.png" alt=""></div>
                        <div>user_name</div>
                    </div>
                    <div class="sp_comment_area">
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name1</b><span>게시글 내용이 엄청 길어지면 어떻게 되지 2줄로 내려가서 공간을 차지하나 아니면 한줄로 쭉 작성되나?</span></div>
                        </div>
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name2</b><span>댓글 내용입니다.</span></div>
                        </div>
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name3</b><span>댓글 내용입니다.</span></div>
                        </div>
                    </div>
                    <div class="sp_button_area">
                        <div class="button">
                            <i class="bx bx-heart icon"></i>
                        </div>
                        <div>좋아요 88.5만개</div>
                    </div>
                    <div class="sp_comment_input_area">
                        <input type="text" placeholder="댓글 달기...">
                        <button id="sp_comments_btn">게시</button>
                    </div>
                </div>
            </div>
        </div>
    </div>`;
    }

    // 밸런스게임글 상세화면
    function showDetailView_balance(postId){
        detailView.innerHTML = `
    <div class="post_modal_content_balance">
        <div class="show_post">
            <div class="sp_content">
                <div class="sp_balance">
                    <div class="sp_balance_content_div">
                        <img src="./image/balance_01.png" alt="">
                    </div>
                    <div class="sp_balance_select_div">
                        <div class="sp_content_select_1">
                            <div class="sp_content_select_1_name">
                                <h2>월 200 백수</h2>
                            </div>
                            <div class="sp_content_select_1_count">
                                <h3 class="sp_count_num1">0</h3>
                            </div>
                        </div>
                        <div class="sp_content_select_2">
                            <div class="sp_content_select_2_name">
                                <h2>월 500 직장인</h2>
                            </div>
                            <div class="sp_content_select_2_count">
                                <h3 class="sp_count_num2">0</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sp_detail">
                    <div class="sp_detail_balance">
                        <div class="sp_balance_title"></div>
                        <div class="sp_balance_time">
                            <i class='bx bx-time-five'></i>
                            <span><b>12:30</b></span>
                        </div>
                        <div class="sp_balance_reward">
                            <i class='bx bx-coin'></i>
                            <span><b>120P</b></span>
                        </div>
                        <div class="sp_menu">
                            <i class='bx bx-dots-horizontal-rounded'></i>
                        </div>
                    </div>
                    <div class="sp_comment_area">
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name1</b><span>게시글 내용이 엄청 길어지면 어떻게 되지 2줄로 내려가서 공간을 차지하나 아니면 한줄로 쭉 작성되나?</span></div>
                        </div>
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name2</b><span>댓글 내용입니다.</span></div>
                        </div>
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name3</b><span>댓글 내용입니다.</span></div>
                        </div>
                    </div>
                    <div class="sp_button_area">
                        <div class="button">
                            <i class="bx bx-heart icon"></i>
                        </div>
                        <div>좋아요 88.5만개</div>
                    </div>
                    <div class="sp_comment_input_area">
                        <input type="text" placeholder="댓글 달기...">
                        <button id="sp_comments_btn">게시</button>
                    </div>
                </div>
            </div>
        </div>
    </div>`;
    }

    // 상세화면 닫기 함수
    function closeDetailView() {
        detailView.innerHTML = ''; // 상세화면 비움
        detailView.style.display = 'none';
    }
});

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
        duration: 1500,
        step: function () {
            content_select_1[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_1[0].style.width = this.val + '%';
        }
    });

    // 두번째 선택지 숫자 증가 애니메이션
    animation3 = $({ val: 0 }).animate({ val: num2 }, {
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
    animation4 = $({ val: 50 }).animate({ val: select_2_ratio }, {
        duration: 1500,
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