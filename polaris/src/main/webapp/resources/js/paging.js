/**
 * 아휴 고달파 
 */

function paging(pageNo) {
 
let submitObj = new Object();
 
submitObj.pageIndex= pageNo;
submitObj.searchWrd= $("#searchWrd").val();
 
$.ajax({ 
url: "mypaging", 
type: "POST", 
contentType: "application/json;charset=UTF-8",
data:JSON.stringify(submitObj),
dataType : "json",
progress: true
}) 
.done(function(data) {
    
    let  result = new Array;
    result = data.resultList;
    let interestDTO = data.interestDTO;
    let realEnd = interestDTO.realEnd;
    let startPage = interestDTO.startPage;
    let startButtonDate = startPage - 1;
    let endPage = interestDTO.endPage;
    let endButtonDate = endPage + 1;
    let pageIndex = interestDTO.pageIndex;
    let resultCnt = data.resultCnt;
    let totalPageCnt = data.totalPageCnt;
    let recordCountPerPage = interestDTO.recordCountPerPage;
    
    
    let ii = (resultCnt - (pageIndex - 1) * recordCountPerPage);
    
    let content = '';
    let content2 = '';
    
    
    $(".mypage").html(content);    
    
    content2 = '<input type="hidden" id="pageIndex" name="pageIndex" value="1">';
    content2 +=    '<ol class="pagination" id="pagination">';
    
    if(InterestDTO.prev){
        content2 +=    '<li class="prev_end"><a href="javascript:void(0);" onclick="fn_go_page(1); return false;" ></a></li>';    
        content2 +=    '<li class="prev"><a href="javascript:void(0);"  onclick="fn_go_page(' + startButtonDate + '); return false;" ></a></li>';    
    }
    
    for (let num=startPage; num<=endPage; num++) {
         if (num == pageIndex) {
             content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '"  class="num on">' + num + '</a></li>';
         } else {
             content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '" class="num">' + num + '</a></li>';
         }
    }
    
    if(InterestDTO.next){
        content2 +=    '<li class="next"><a href="javascript:void(0);"  onclick="fn_go_page(' + endButtonDate + '); return false;" ></a></li>';    
        content2 +=    '<li class="next_end"><a href="javascript:void(0);" onclick="fn_go_page(' + interestDTO.realEnd +'); return false;"></a></li>';    
    }
    
    content2 +=    '</ol>';
    content2 +=    '</div>';
 
    $(".choi-jjim").html(content2);
    
 }) 

}
