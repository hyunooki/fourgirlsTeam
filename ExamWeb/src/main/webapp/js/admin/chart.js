/**
 * chart.js
 */
    //Pie 차트 데이터
/*    let pieChartData = {
            series: []
    };
    // 선 차트 데이터
    const lineChartData = {
        categories: [],
        series: []
    };
 // 막대 차트 데이터
     let columnChartData = {
    categories: [],
    series: [
        {
            name: '자재발주량',
            data: [],
            color: '#FF5733' 
        }
    ]
};
 // 막대 차트 데이터
     let columnChartDataCopy= {
        categories: [],
        series: [
        	{ name: '자재소모량',
              data: [],
              color: '#FF5733'
              }
        ]
    };
 //파이옵션
    const barOptions = {
            chart: {
                width: 600,
                height: 400
            },
            series: {
                showLabel: true, 
                dataLabels: {
                    visible: true,
                    anchor: 'outer'
                },
                radiusRange: {
                    inner: '40%',
                    outer: '100%',
                  }
            },
            resizeAdaptation: true
        };

    //공통 옵션
    const commonOptions = {
        chart: { 
         width: 750,
         height: 400 
       },
        series: {
            column: {
                colorByCategories: true, 
            }
        },
        resizeAdaptation: true
    };
    
    //원형 차트 생성 및 렌더링
    function pieStart(){
    const pieChartContainer = document.getElementById('pieChart');
    const pieChart = new toastui.Chart.pieChart({ 
    	el: pieChartContainer,
    	data: pieChartData,
    	options: barOptions });
    }
    // 수직 막대형 차트 생성 및 렌더링
    function start() {
    const columnChartContainer = document.getElementById('columnChart');
    const columnChart = new toastui.Chart.columnChart({ 
    	el: columnChartContainer,
    	data: columnChartData,
    	options: commonOptions });
    }
    // 수직 막대형 차트 생성 및 렌더링
    function usedStart(){
    const columnChartContainerCopy = document.getElementById('columnChartCopy');
    const columnChartCopy = new toastui.Chart.columnChart({
    	el: columnChartContainerCopy,
    	data: columnChartDataCopy,
    	options: commonOptions });
    }
 // 선 차트 생성
    const lineChart = new toastui.Chart.lineChart({
        el: document.getElementById('lineChart'),
        data: lineChartData,
        options: commonOptions
    });

    function orderChrt() {
         $.ajax({
            url: "/main/orderChart",
            method: "POST",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
          //추가해야 하는 부분
            beforeSend : function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(list) {
            	orderRendering(list);
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    }
    
function orderRendering(list){
	 
	 let seriesData = list.map(item => ({
         name: item.prodName,
         data: parseFloat(item.percentage)
     }));
	
	 pieChartData={
         series: seriesData
     };
	 pieStart();
}
function matChrt() {
    $.ajax({
       url: "/main/matChart",
       method: "POST",
       dataType: "json",
       contentType: "application/json; charset=UTF-8",
     //추가해야 하는 부분
       beforeSend : function(xhr) {
           xhr.setRequestHeader(header, token);
       },
       success: function(list) {
       		matRendering(list);
       },
       error: function(xhr, status, error) {
           console.error(xhr.responseText);
       }
   });
}
function matRendering(list){
	let categories = list.map(item => item.matName);
	 let come = list.map(item => item.come);
	 const seriesData = [
		    {
		        name: '자재발주량',
		        data: come,
		        colorByCategories: true,
		    }
		];
	 columnChartData={
		    categories: categories, 
		    series: seriesData,
		    
		    
		};
	 start();
}
function orderLineChart() {
    $.ajax({
       url: "/main/orderLine",
       method: "POST",
       dataType: "json",
       contentType: "application/json; charset=UTF-8",
     //추가해야 하는 부분
       beforeSend : function(xhr) {
           xhr.setRequestHeader(header, token);
       },
       success: function(list) {
    	 orderLineRendering(list);
       },
       error: function(xhr, status, error) {
           console.error(xhr.responseText);
       }
   });
}
function orderLineRendering(list){
	let categories = list.map(item => item.day);
	 let sumOrderQuantity = list.map(item => parseFloat(item.orderQuantity));
	 lineChart.setData({
    	 categories: categories,
    	 series:[
    		 { name: '요일별 주문수량',
    		   data: sumOrderQuantity
    		 }
    	   ], 
    }); 
} 

function matUsedChrt() {
    $.ajax({
       url: "/main/matUsedChart",
       method: "POST",
       dataType: "json",
       contentType: "application/json; charset=UTF-8",
     //추가해야 하는 부분
       beforeSend : function(xhr) {
           xhr.setRequestHeader(header, token);
       },
       success: function(list) {
       		matUsedRendering(list);
       },
       error: function(xhr, status, error) {
           console.error(xhr.responseText);
       }
   });
}
function matUsedRendering(list){
	let categories = list.map(item => item.matNamed);
	 let matUsed = list.map(item => item.matUsed);
	 const seriesData = [
		    {
		        name: '자재소모량',
		        data: matUsed,
		        colorByCategories: true,
		    }
		];
	 columnChartDataCopy={
		    categories: categories, 
		    series: seriesData,
		    
		    };
	 usedStart();
}

$(document).ready(function(){
	orderChrt();
	matChrt();
	orderLineChart();
	matUsedChrt();
});*/