/**
 * cart.js
 */
let cartEvent = document.querySelector('.zmdi-shopping-cart');
cartEvent.addEventListener('click', function () {
    fetch('cartForm.do')
        .then(result => result.json())
        .then(result => {
            let cartUl = document.querySelector('.header-cart-wrapitem');
            cartUl.innerHTML = '';
            for (let item of result) {
                cartUl.innerHTML += `
                    <li class="header-cart-item flex-w flex-t m-b-12">
                        <div class="header-cart-item-img" data-id="${item.cartNo}" data-prod="${item.prodNo}">
                            <img src="file/${item.image}" alt="IMG">
                        </div>
                        <div class="header-cart-item-txt p-t-8">
                            <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                ${item.prodName}
                            </a>
                            <span class="header-cart-item-info">
                                ${numberRender(item.price)}원
                            </span>
                        </div>
                    </li>`;
            }
            if (cartUl.children.length == 0) {
                cartUl.innerHTML = '<li>장바구니가 비어있습니다.</li>';
            }
            totalCnt();
        });
});

// 숫자 , 찍게 하는 함수
function numberRender(pay) {
    return pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 총 금액 체크
function totalCnt() {
    let totalPay = 0;
    let payItems = document.querySelectorAll('.header-cart-item-info');
    payItems.forEach(function (item) {
        let value = item.innerHTML.trim().replaceAll(',', '').replaceAll('원', '');
        totalPay += Number(value);
    });
    let total = document.querySelector('.header-cart-total');
    if (total) {
        total.innerText = 'Total: ' + numberRender(totalPay) + '원';
    }
}

// 장바구니 삭제
let ul = document.querySelector('.header-cart-wrapitem');
ul.addEventListener('click', function (e) {
    let target = e.target.closest('.header-cart-item-img');
    if (target && target.hasAttribute('data-id')) {
        let cartNo = target.getAttribute('data-id');
        fetch('cartDelete.do?cartNo=' + cartNo)
            .then(result => result.json())
            .then(result => {
                if (result.retCode === 'OK') {
                    target.parentNode.remove();
                    swal('장바구니', "삭제 성공", "success");
                    totalCnt();
                } else {
                    swal('에러', "삭제실패", "error");
                }
                if (ul.children.length === 0) {
                    ul.innerHTML = '<li>장바구니가 비어있습니다.</li>';
                }
            });
    }
});

// 장바구니 결제
document.querySelector('#cartBtn').addEventListener('click', function (e) {
    let cartItems = document.querySelectorAll('.header-cart-item-img');

    if (cartItems.length === 0) {
        swal('에러', "장바구니가 비워있습니다.", "error");
        return;
    }

    let requests = [];

    cartItems.forEach(function (item) {
        let payNo = item.getAttribute('data-id');
        let prodNo = item.getAttribute('data-prod');

        let request = fetch('cartTopay.do?payNo=' + payNo + '&prodNo=' + prodNo)
            .then(result => result.json())
            .then(result => {
                if (result.retCode !== 'OK') {
                    throw new Error("등록 실패");
                }
            });

        requests.push(request);
    });

    // 모든 요청이 끝나면 reset() 실행
    Promise.all(requests)
        .then(() => reset())
        .catch(() => swal('실패', "등록 실패", "error"));
});

// 결제 후 리셋
function reset() {
    let cartItems = document.querySelectorAll('.header-cart-item-img');
    
    let requests = [];

    cartItems.forEach(function (item) {
        let cartNo = item.getAttribute('data-id');
        let request = fetch('cartDelete.do?cartNo=' + cartNo)
            .then(result => result.json())
            .then(result => {
                if (result.retCode !== 'OK') {
                    throw new Error("삭제 실패");
                }
            });

        requests.push(request);
    });

    Promise.all(requests)
        .then(() => {
            swal('등록', "등록 성공", "success");
            location.href = 'paymentForm.do';
        })
        .catch(() => swal('에러', "일부 항목 삭제 실패", "error"));
}