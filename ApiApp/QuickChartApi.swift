//
//  QuickChartApi.swift
//  ApiApp
//
//  Created by Вера Ксенофонтова on 13.01.2021.
//

struct QuickChartApi{
    let quickchart_url: String = "https://quickchart.io/chart?c="
    ///{type:'bar',
    ///data:
    /// {labels:['January','February', 'March','April', 'May'], datasets:[{label:'Dogs',data:[50,60,70,180,190]},{label:'Cats',data:[100,200,300,400,500]}]}}
    var post_data: String
    
    static func getPostDataString(_ pd: PostData) -> String {
//        let string: String
//        string = "{type:'\(pd.type)',data:{labels:[\(pd.labels)],datasets:[{label:'\(pd.datasets.label)',data:[\(pd.datasets.data)]}]}}"
//
        return "{type:'line',data:{labels:['January','February', 'March','April', 'May'], datasets:[{label:'Dogs', data: [50,60,70,180,190], fill:false,borderColor:'blue'},{label:'Cats', data:[100,200,300,400,500], fill:false,borderColor:'green'}]}}"
    }
}

struct PostData {
    var type: String
    var labels: String
    var datasets: Dataset
    
}

struct Dataset {
    var label: String
    var data: String
}
