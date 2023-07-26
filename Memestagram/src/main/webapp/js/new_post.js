document.addEventListener('DOMContentLoaded', function () {
    const sidebar = document.getElementById('sidebar');
    const create_modal = document.getElementById('create_modal');

    // 버튼 이벤트 위임
    sidebar.addEventListener('click', function (event) {
        if (event.target.classList.contains('create_post')) {

            var isAdmin = true; // 관리자계정 판별

            if (isAdmin) {
                create_balance();
            } else {
                create_post();
            }
            create_modal.style.display = "block";
            document.body.classList.add('modal-open');

            // 모달 바깥 영역을 클릭하면 모달이 닫히도록 이벤트 리스너 추가
            window.onclick = function (event) {
                if (event.target === create_modal) {
                    closeModal();
                    document.body.classList.remove('modal-open');
                }
            };
        }
    });

    // 일반 게시글 모달 창
    function create_post() {
        create_modal.innerHTML = `
        <div class="create_modal-content">
                <div class="create_post">
                    <div class="cp_header">
                        <div class="cp_header_div1"><i class='bx bx-arrow-back'></i></div>
                        <div class="cp_header_div2"><span>새 게시물 만들기</span></div>
                        <div class="cp_header_div3"><span>공유하기</span></div>
                    </div>
                    <div class="cp_content">
                        <div class="cp_file">
                            <img src="./image/files.png" alt="">
                            <label for="file">
                                <div class="btn-upload">파일 올리기</div>
                              </label>
                            <input type="file" id="file"></input>
                        </div>
                        <div class="cp_text">
                            <div class="cp_text_user">
                                <div><img src="./image/user.png" alt=""></div>
                                <div>user_name</div>
                            </div>
                            <div class="cp_text_area_normal">
                                <textarea name="cp_ta" id="cp_text_area" cols="30" rows="10" placeholder="문구 입력..."></textarea>
                            </div>
                        </div>
                    </div>
                </div>
        </div>`;
    }

    // 밸런스게임 글 모달 창
    function create_balance() {
        create_modal.innerHTML = `<div class="create_modal-content">
            <div class="create_post">
                <div class="cp_header">
                    <div class="cp_header_div1"><i class='bx bx-arrow-back'></i></div>
                    <div class="cp_header_div2"><span>새 밸런스게임 만들기</span></div>
                    <div class="cp_header_div3"><span>공유하기</span></div>
                </div>
                <div class="cp_content">
                    <div class="cp_file">
                        <img src="./image/files.png" alt="">
                        <label for="file">
                            <div class="btn-upload">파일 올리기</div>
                        </label>
                        <input type="file" id="file"></input>
                    </div>
                    <div class="cp_text">
                        <div class="cp_text_user">
                            <div><img src="./image/user.png" alt=""></div>
                            <div>user_name</div>
                        </div>
                        <div class="cp_text_area">
                            <textarea name="cp_ta" id="cp_text_area" cols="30" rows="10" placeholder="문구 입력..."></textarea>
                        </div>
                        <div class="cp_setting_area">
                            <div class="select_1_div">
                                <label for="select_1">선택지 1</label>
                                <input type="text" id="select_1" required
                                minlength="4" maxlength="8>
                                <input type="color" name="select_1_color">
                            </div>
                            <div class="select_2_div">
                                <label for="select_2">선택지 2</label>
                                <input type="text" id="select_2" required
                                minlength="4" maxlength="8>
                                <input type="color" name="select_2_color">
                            </div>
                            <div class="end_time_div">
                                <label for="end_time">종료시간</label>
                                <input type="datetime" id="end_time">
                            </div>
                            <div class="reward_div">
                                <label for="reward">리워드</label>
                                <input type="number" id="reward">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>`;
    }

    // 상세화면 닫기 함수
    function closeModal() {
        create_modal.innerHTML = ''; // 상세화면 비움
        create_modal.style.display = 'none';
    }
});