var priceRangeSlider =
            document.getElementById('priceRangeSlider');
                noUiSlider.create(priceRangeSlider, {
                    start: [500, 20000],
                        connect: true,
                        range: {
                        'min': 500,
                        'max': 20000
                        },
                    format: {
                        to: function (value) {
                        return value.toFixed(0);
                        },
                        from: function (value) {
                        return Number(value);
                        }
                    }
        });

// Update the input text
priceRangeSlider.noUiSlider.on('update', function (values, handle) {
        var value = values[handle];

        if (handle) { // handle 1
            $('#priceRangeMax').text('$' + value);
            document.getElementById("targetMaxPrice").value = value;
        
        } else { // handle 0
            
            $('#priceRangeMin').text('$' + value);
            document.getElementById("targetMinPrice").value = value;
        
        }
        });
// JavaScript代碼來實現選取框框的提示
$('.button-pillow').on('click', function() {
  var group = $(this).data('group'); // 獲取按鈕所屬的組名
  $('.button-pillow[data-group="' + group + '"]').removeClass('active'); // 清除同組其他按鈕的選取狀態
  $(this).addClass('active'); // 添加選取狀態到點擊的按鈕
});





//這裡是地區篩選的功能
function scrollaaa() {
    var wrapper = document.querySelector('.wrapper');
    wrapper.scrollBy({ left: -190, behavior: 'smooth' });
}
function scrollRight() {
    var wrapper = document.querySelector('.wrapper');
    wrapper.scrollBy({ left: 190, behavior: 'smooth' });
}





$('.button-pillow').on('click', function() {
    var group = $(this).data('group'); // 獲取按鈕所屬的組名
    $('.button-pillow[data-group="' + group + '"]').removeClass('active'); // 清除同組其他按鈕的選取狀態
    $(this).addClass('active'); // 添加選取狀態到點擊的按鈕
});



var selectedDates = [];



function managePopups() {
        var popups = {
            'button1': 'popupWindow',
            'button2': 'secondPopupWindow',
            'button2': 'thirdPopupWindow',
            
            
        };

 return function(clickedButtonId) {
                
    // 對每個按鈕進行遍歷
                
    Object.keys(popups).forEach(function(buttonId) {
        var popupId = popups[buttonId];
        var popup = document.getElementById(popupId);
        if (buttonId === clickedButtonId) {
            popup.style.display = 'block';
        } else {
            popup.style.display = 'none';
        }
                });
            };
        }
        
        var squareButtons = document.querySelectorAll('.square-button');
            squareButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                
            var popupWindow = document.getElementById('popupWindow');
            popupWindow.style.display = 'none'; // 隱藏彈出窗口
        });
    });

    document.getElementById('button2').addEventListener('click', function() {
        var secondPopupWindow = document.getElementById('secondPopupWindow');
        secondPopupWindow.style.display = 'block'; // 顯示 secondPopupWindow
    });

    document.addEventListener('DOMContentLoaded', function() {
    var secondPopupClickCount = 0;

    // 獲取日曆數字元素並為它們添加點擊事件監聽器
    var calendarDays = document.querySelectorAll('#secondPopupWindow .calendar_content');
    calendarDays.forEach(function(day) {
        day.addEventListener('click', function() {
            secondPopupClickCount++;

            // 如果日曆數字被點擊了兩次，則隱藏 secondPopupWindow 並重置計數器
            if (secondPopupClickCount === 2) {
                var secondPopupWindow = document.getElementById('secondPopupWindow');
                secondPopupWindow.style.display = 'none';
                secondPopupClickCount = 0;
                const month1=document.querySelector("#month1").textContent
                const month2=document.querySelector("#month2").textContent
                const regex = /(\w+) (\d{4})/;
                const match1 = month1.match(regex);
                const match2 = month2.match(regex);

                const onlyMonth1 = match1[1];
                const onlyMonth2 = match2[1];
                
                console.log( onlyMonth1)
                console.log( onlyMonth2)

                const selectedDate=document.querySelectorAll(".selected")
                const inDate=selectedDate[0].textContent
                const outDate=selectedDate[selectedDate.length-1].textContent

                const nowInDate=`${onlyMonth1} ${inDate}`
                const nowOutDate=`${onlyMonth2} ${outDate}`

                updateButton2Text(nowInDate,nowOutDate)
                console.log(nowInDate)
       
            }


        });
    });
});






    
    document.getElementById('button3').addEventListener('click', function() {
        var thirdPopupWindow = document.getElementById('thirdPopupWindow');
        thirdPopupWindow.style.display = 'block'; // 顯示 thirdPopupWindow
    });

    document.getElementById('button3').addEventListener('click', function(event) {
        event.stopPropagation();  // 防止事件冒泡到document
        var thirdPopupWindow = document.getElementById('thirdPopupWindow');
        thirdPopupWindow.style.display = 'block'; // 顯示 thirdPopupWindow
    });







document.getElementById("show").addEventListener("click", function() {
    var gayab = document.getElementById("gayab");
    if (gayab.style.height === "162px") {
        gayab.style.height = "0";
    } else {
        gayab.style.height = "162px";
    }
});







document.addEventListener("click", function(event) {
    var gayab = document.getElementById("gayab");
    var isClickInsideGayab = gayab.contains(event.target);
    var isShowButtonClicked = event.target.id === "show";

    if (!isClickInsideGayab && !isShowButtonClicked) {
        gayab.style.height = "0";
    }
});



document.getElementById('button1').addEventListener('click', function() {
    var popup = document.getElementById('popupWindow');
    popup.style.display = 'block';
});



function changeCount(id, change) {
            var element = document.getElementById(id);
            var currentValue = parseInt(element.innerText, 10);
            currentValue += change;
            if (currentValue < 0) currentValue = 0;
            element.innerText = currentValue.toString();
        }


        document.getElementById('button4').addEventListener('click', function() {
            // 隱藏所有彈出窗口
            document.getElementById('popupWindow').style.display = 'none';
            document.getElementById('secondPopupWindow').style.display = 'none';
            document.getElementById('thirdPopupWindow').style.display = 'none';
            
            // 將 .side 元素恢復到初始狀態
            var gayab = document.getElementById('gayab');
            gayab.style.height = "0";

            // 隱藏遮罩層
            var overlay = document.querySelector('.overlay');
            overlay.style.display = 'none';
            showRoom(false);
        });

document.querySelector('.confirm').addEventListener('click', function() {
    document.getElementById('thirdPopupWindow').style.display = 'none';
});


document.getElementById("show").addEventListener("click", function() {
    var gayab = document.getElementById("gayab");
    var overlay = document.querySelector('.overlay');
    if (gayab.style.height === "0px") {
        overlay.style.display = 'none'; // 隱藏遮罩
    } else {
        gayab.style.height = "162px";
        overlay.style.display = 'block'; // 顯示遮罩
    }
});









document.addEventListener("click", function(event) {
    var gayab = document.getElementById("gayab");
    var overlay = document.querySelector('.overlay');
    var isClickInsideGayab = gayab.contains(event.target);
    var isShowButtonClicked = event.target.id === "show";

    if (!isClickInsideGayab && !isShowButtonClicked) {
        gayab.style.height = "0";
        overlay.style.display = 'none'; // 當點擊外部收起 .side，同時隱藏遮罩
    }
});

document.getElementById('style1').addEventListener('click', function() {
    var button1 = document.getElementById('button1');
    button1.innerHTML = '<span style="font-size: 17px;" id="targetStlye">古典風</span>';
});

document.getElementById('style2').addEventListener('click', function() {
    var button1 = document.getElementById('button1');
    button1.innerHTML = '<span style="font-size: 17px;" id="targetStlye">小木屋</span>';
});

document.getElementById('style3').addEventListener('click', function() {
    var button1 = document.getElementById('button1');
    button1.innerHTML = '<span style="font-size: 17px;" id="targetStlye">時尚風</span>';
});

document.getElementById('style4').addEventListener('click', function() {
    var button1 = document.getElementById('button1');
    button1.innerHTML = '<span style="font-size: 17px;" id="targetStlye">溫馨風</span>';
});

document.getElementById('style5').addEventListener('click', function() {
    var button1 = document.getElementById('button1');
    button1.innerHTML = '<span style="font-size: 17px;" id="targetStlye">背包客</span>';
});

document.getElementById('style6').addEventListener('click', function() {
    var button1 = document.getElementById('button1');
    button1.innerHTML = '<span style="font-size: 17px;" id="targetStlye">質感風</span>';
});

document.querySelector('.confirm').addEventListener('click', function() {
        // 獲取成人、兒童、嬰幼兒的數量
        var adultCount = document.getElementById('adult').innerText;
        // var childCount = document.getElementById('child').innerText;
        // var infantCount = document.getElementById('infant').innerText;

        // 更新button3的內容
        var button3 = document.getElementById('button3');
        button3.innerHTML = '<span style="font-size: 17px;">旅客: ' + adultCount + '</span>';

        // 隱藏彈出窗口
        document.getElementById('thirdPopupWindow').style.display = 'none';
    });
    
    
    var checkInDate = null;
    var checkOutDate = null;

    // 日曆選擇觸發此函數
    function onDateSelect(date) {
        if (!checkInDate) {
            checkInDate = date;
        } else if (!checkOutDate) {
            checkOutDate = date;

    // 當兩個日期都選擇後，更新按鈕內容並隱藏彈出窗口
        updateButton2Text();
    document.getElementById('secondPopupWindow').style.display = 'none';
        }
    }

    // 更新 button2 內容
    function updateButton2Text(nowInDate,nowOutDate) {
        var button2 = document.getElementById('button2');
        button2.innerHTML = `入住: ${nowInDate} - 退房: ${nowOutDate}`;
    }

    // 格式化日期顯示
    function formatDate(date) {
        // 您可以根據需要調整日期格式
        return date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate();
    }

    document.addEventListener('click', function(event) {
        // 定義彈出窗口元素
        var popupWindow = document.getElementById('popupWindow');
        var secondPopupWindow = document.getElementById('secondPopupWindow');
        var thirdPopupWindow = document.getElementById('thirdPopupWindow');

        // 檢查點擊是否發生在 popupWindow 元素內或其觸發按鈕上
        var isInsidePopupWindow = popupWindow.contains(event.target) || event.target.id === 'button1';
        
        // 檢查點擊是否發生在 secondPopupWindow 元素內或其觸發按鈕上
        var isInsideSecondPopupWindow = secondPopupWindow.contains(event.target) || event.target.id === 'button2';

        // 檢查點擊是否發生在 thirdPopupWindow 元素內或其觸發按鈕上
        var isInsideThirdPopupWindow = thirdPopupWindow.contains(event.target) || event.target.id === 'button3';

        // 如果點擊發生在彈出窗口之外，則隱藏彈出窗口
        if (!isInsidePopupWindow && popupWindow.style.display === 'block') {
            popupWindow.style.display = 'none';
        }

        // 如果點擊發生在第二個彈出窗口之外，則隱藏它
        if (!isInsideSecondPopupWindow && secondPopupWindow.style.display === 'block') {
            secondPopupWindow.style.display = 'none';
        }

        // 如果點擊發生在第三個彈出窗口之外，則隱藏它
        if (!isInsideThirdPopupWindow && thirdPopupWindow.style.display === 'block') {
            thirdPopupWindow.style.display = 'none';
        }
        });



document.getElementById('button3').addEventListener('click', function(event) {
// 防止事件冒泡到 document
event.stopPropagation();

var secondPopupWindow = document.getElementById('secondPopupWindow');
var thirdPopupWindow = document.getElementById('thirdPopupWindow');

// 檢查 secondPopupWindow 是否顯示
if (secondPopupWindow.style.display === 'block') {
// 如果顯示，則隱藏它
secondPopupWindow.style.display = 'none';
}

});

function getLocation(location){
    document.getElementById("targetLocation").value = location;
    showRoom(false);
}
