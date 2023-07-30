// 외부 스크립트에서 사용자 정의 속성(data-username)을 이용하여 username 값을 가져오기
var scriptTag = document.currentScript; // 현재 스크립트 태그를 가져옴
var mem_id = scriptTag.getAttribute("data-id");
var mem_img = scriptTag.getAttribute("data-img");

document.addEventListener('DOMContentLoaded', function () {
	    const sidebar = document.getElementById('sidebar');
	    const create_modal = document.getElementById('create_modal');

	    // 버튼 이벤트 위임
	    sidebar.addEventListener('click', function (event) {
	        if (event.target.classList.contains('create_post')) {
				
				if(mem_id == 'admin'){
					 var isAdmin = true;
				}else{
					var isAdmin = false;
				}
	            // 관리자계정 판별

	            if (isAdmin) {
	                create_balance();
	            } else {
	                create_post();
	            }
	            create_modal.style.display = "flex";
	            document.body.classList.add('modal-open');

	            // 모달 바깥 영역을 클릭하면 모달이 닫히도록 이벤트 리스너 추가
	            window.onclick = function (event) {
	                if (event.target === create_modal || event.target.classList.contains('cp_header_div1') || event.target.classList.contains('bx-arrow-back')) {
	                    closeModal();
	                    document.body.classList.remove('modal-open');
	                }
	            };
	        }
	    });

	    // 일반 게시글 작성 모달창
	    function create_post() {
	        create_modal.innerHTML = `
	        	<form action="BoardWriteCon.do" method="post" enctype="multipart/form-data" onsubmit="return test()">
	            <div class="create_modal-content">
	                    <div class="create_post">
	                        <div class="cp_header">
	                            <div class="cp_header_div1"><i class='bx bx-arrow-back'></i></div>
	                            <div class="cp_header_div2"><span>새 게시물 만들기</span></div>
	                            <div class="cp_header_div3"><input type="submit" value="공유하기"></div>
	                        </div>
	                        <div class="cp_content">
	                            <div class="cp_file">
	                                <img src="./image/files.png" alt="" class="mimg">
	                                <label for="file">
	                                    <div class="btn-upload">파일 올리기</div>
	                                </label>
	                            	<input type="file" id="file" name="board_img" onchange="setThumbnail(event);">
	                            </div>
	                            <div class="cp_text">
	                                <div class="cp_text_user">
	                                    <div><img src="./image/${mem_img}" alt=""></div>
	                                    <div>${mem_id}</div>
	                                </div>
	                                <div class="cp_text_area_normal">
	                                    <textarea name="board_content" id="cp_text_area" cols="30" rows="10" placeholder="문구 입력..."></textarea>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	            </div>
	            </form>`;
	    }

	    // 밸런스게임 작성 글 모달 창
	    function create_balance() {
	        create_modal.innerHTML = `
	        	<form action="BalBoardWriteCon.do" method="post" enctype="multipart/form-data" onsubmit="return test()">
	            <div class="create_modal-content">
	                <div class="create_post">
	                    <div class="cp_header">
	                        <div class="cp_header_div1"><i class='bx bx-arrow-back'></i></div>
	                        <div class="cp_header_div2"><span>새 밸런스게임 만들기</span></div>
	                        <div class="cp_header_div3"><input type="submit" value="공유하기"></div>
	                    </div>
	                    <div class="cp_content">
	                        <div class="cp_file">
	                            <img src="./image/files.png" alt="" class="mimg">
	                            <label for="file">
	                                <div class="btn-upload">파일 올리기</div>
	                            </label>
	                            <input type="file" id="file" name="bal_img" onchange="setThumbnail(event);">
	                        </div>
	                        <div class="cp_text">
	                            <div class="cp_text_user">
	                                <div><img src="./image/${mem_img}" alt=""></div>
	                                <div>${mem_id}</div>
	                            </div>
	                            <div class="cp_text_area">
	                                <textarea name="bal_content" id="cp_text_area" cols="30" rows="10"
	                                    placeholder="문구 입력..."></textarea>
	                            </div>
	                            <div class="cp_setting_area">
	                                <div class="select_1_div">
	                                    <label for="select_1">선택지 1</label>
	                                    <input name="bal_left" type="text" id="select_1" required maxlength="8">
	                                    <input type="color" name="select_1_color">
	                                </div>
	                                <div class="select_2_div">
	                                    <label for="select_2">선택지 2</label>
	                                    <input name="bal_right" type="text" id="select_2" required maxlength="8">
	                                    <input type="color" name="select_2_color">
	                                </div>
	                                <div class="end_time_div">
	                                    <label for="end_time">종료시간</label>
	                                    <input name="bal_time" type="datetime" id="end_time">
	                                </div>
	                                <div class="reward_div">
	                                    <label for="reward">리워드</label>
	                                    <input name="bal_reward" type="number" id="reward">
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>`;
	    }

	    // 상세화면 닫기 함수
	    function closeModal() {
	        create_modal.innerHTML = ''; // 상세화면 비움
	        create_modal.style.display = 'none';
	    }
	});
	
	// 미리보기 
	  function setThumbnail(event){
			var reader = new FileReader();
			
			//기존 이미지, 버튼 숨김
			$(".btn-upload").hide();
			$(".mimg").hide();
			
			reader.onload = function(event){

					var filetype = event.target.result;
					var result = filetype.substr(5,10).substr(0,5);
					var img;
					
					if(result =="video"){
						img = document.createElement("video");
						img.setAttribute("autoplay","true")
					}else if(result =="image"){
						img = document.createElement("img");
					}
					
				img.setAttribute("style", "max-width: 100%; max-height: 100%;");
				img.setAttribute("src", event.target.result);
				img.setAttribute("class", "col-lg-6");
				$('.cp_file').append(img);
			};
			
			reader.readAsDataURL(event.target.files[0]);
		}