function showRoom(tag) {
console.log(1)
	
		//TODO:從欄位取直 並取代初始化
		let postData;
		if(tag){
		   postData={};

		}else{

			let tmpStyle;
			if(document.getElementById("targetStlye")){
				tmpStyle	 = document.getElementById("targetStlye").innerText;	 
			}else{

				tmpStyle	 ="";
			}

			 let locationValue; // 新增變數來儲存位置值
                if (document.getElementById("targetLocation")) {
                    locationValue = document.getElementById("targetLocation").value; // 從用戶介面獲取位置值
                } else {
                    locationValue = ""; // 如果沒有設置位置，則預設為空字串
                }


			let startDate = document.getElementById("targetStartDate").value;
			let endDate = document.getElementById("targetEndDate").value;
            let adultCount = document.getElementById('adult').innerText;
		    let childCount = 0;
            let minPrice = document.getElementById("targetMinPrice").value;
			let maxPrice = document.getElementById("targetMaxPrice").value;

			console.log(tmpStyle);

			//TODO:組合POST值
            postData={
        	     "style":tmpStyle,
        	     "startDate":startDate,
        	     "endDate":endDate,
        	     "adult":parseInt(adultCount),
        	     "child":parseInt(childCount),
        	     "baby":0,
        	     "location":locationValue,
        	     "minPrice":parseInt(minPrice),
        	     "maxPrice":parseInt(maxPrice),
        	     "room":0,
        	     "bed":0,
        	     "bd":0, //bathroom
        	}
		}

		

        			
        $.ajax({
            type: 'POST',
            url: '/pillowSurfing/room/list',
            data: JSON.stringify(postData),
            contentType: "application/json; charset=utf-8",
            dataType:"json",
            success: function(res){
				let totalRoom = res.length;
				let roomhtml="";
          
                for (let k = 0; k < totalRoom; k++) {       
                    roomhtml=roomhtml+ showRoomInfoOneRow(res[k]);
                 }
    
                document.getElementById("houseList").innerHTML=roomhtml;
            },
            error:function(e){
                console.log(e);
            }
          });
    
				
          return ;

}

//
/**
 * 一定印n個為一行 
 * @param {*} tmpRooms [room1.info,room2.info]
 * @returns 
 */
function showRoomInfo(tmpRooms) {
     let showRoomStr = `<div class=" row d-flex justify-content-evenly">`;

     /**
      * roomDataInfo
      *   {
    "images": [image1,image2],
    "price": "$1200",
    "name": "舒適公寓"
  },
      */
     for (let i = 0; i < tmpRooms.length; i++) {
          let roomInfo = `<div class="col-12 col-xl-3">`;

          let roomDataInfo = tmpRooms[i];

          //init
          let roomName=roomDataInfo["name"];
          let price=roomDataInfo["price"];
          let id=roomDataInfo["roomId"];

          //處理房間圖片
          let roomImageHtml= "";
          let roomLiHtml="";
            
          // roomName =roomName+ "roomName"+i
            // releaseTime =releaseTime+" releaseTime"+i
            // price =price+"price"+i
            // roomLiHtml =roomLiHtml+"roomLiHtml"+i
          
    
          for(let j = 0; j < roomDataInfo["images"].length; j++){
            if(j==0){
                roomLiHtml=roomLiHtml+`<li data-target="#carouselExampleIndicators`+id+`" class="active "></li>`
            }else{
                roomLiHtml=roomLiHtml+`<li data-target='#carouselExampleIndicators`+id+`' data-slide-to="`+j+`"></li>`
            }
          }


          console.log(roomLiHtml)

          for(let j = 0; j < roomDataInfo["images"].length; j++){

            //carousel-item start
            if(j==0){
                roomImageHtml=roomImageHtml+`<div class="carousel-item active">`;
            }else{
                roomImageHtml=roomImageHtml+`<div class="carousel-item">`;
            }

            //image
            roomImageHtml=roomImageHtml+ `<img src="`+roomDataInfo["images"][j]+`" class="d-block" id="room`+id+"-"+j+`" style="border-radius: 20px;">`;
            
            //carousel-item end
            roomImageHtml+=`</div>`
         
          }


          
          roomInfo += `<div class="container" style="height: 384px;width: 340px; ">
                                  <div class="card">
                                      <div id="carouselExampleIndicators`+id+`" class="carousel slide">
                                          <ol class="carousel-indicators">`
                                            + roomLiHtml +
                                          `</ol>
                                          <div class="carousel-inner">`
                                             +roomImageHtml+                                          
                                             `</div>
                                          <a class="carousel-control-prev" href="#carouselExampleIndicators`+id+`" role="button" data-slide="prev">
                                              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                              <span class="sr-only">Previous</span>
                                          </a>
                                          <a class="carousel-control-next" href="#carouselExampleIndicators`+id+`" role="button" data-slide="next">
                                              <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                              <span class="sr-only">Next</span>
                                          </a>
                                      </div>
                                      <div class="card-body">
                                          <b class="card-text">`
                                             +roomName
                                             +`<br/>`
                                             +price+ `TWD 每晚
                                          </b>
                                      </div>
                                  </div>
                              </div>
                              `;
          //          showRoomStr = showRoomStr + "room" + i;
          // console.log("after=>" + showRoomStr);
          roomInfo += `</div>`;
          showRoomStr= showRoomStr+ roomInfo;
     }
     
     showRoomStr = showRoomStr + "</div>";
     return showRoomStr;
}


function showRoomInfoOneRow(roomInfo) {

    let result=`<div class="col-4">`
    result=result+`<div id="houseA" class="card  houseCard mx-auto mb-5">`
    result=result+`<img class="card-img-top" src="`+roomInfo.fileUrl+`"onclick="getRoomDetails(`+roomInfo.roomId+`)" />`
    result=result + `<div class="card-body">
            <h5 class="card-title ">`+roomInfo.name+`</h5>
            <span class="card-text">`+roomInfo.type+`</span><br> 
            <span class="card-text">`+roomInfo.price+`</span><br>
        </div>
    `
    result+=`</div>`
    result+=`</div>`
    return result;
}