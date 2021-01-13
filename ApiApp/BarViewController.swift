//
//  BarViewController.swift
//  ApiApp
//
//  Created by Вера Ксенофонтова on 13.01.2021.
//

import UIKit

class BarViewController: UIViewController {
    
    @IBOutlet weak var labelstextField: UITextField!
    @IBOutlet weak var labelTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var chartImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func generateChart(_ sender: Any) {
        spinner.startAnimating()
        fetchChart()
    }
    
    private func fetchChart() {
        let dataset = Dataset(label: labelTextField.text!, data: dataTextField.text!)
        let postData = PostData(type: "bar", labels: labelstextField.text!, datasets: dataset)
        
        let api = QuickChartApi(post_data: QuickChartApi.getPostDataString(postData))
        
        guard let url = URL(string: api.post_data) else { return }
        
        guard let testUrl = URL(string: "https://quickchart.io/chart?c={type:'line',data:{labels:['January','February', 'March','April', 'May'], datasets:[{label:'Dogs', data: [50,60,70,180,190], fill:false,borderColor:'blue'},{label:'Cats', data:[100,200,300,400,500], fill:false,borderColor:'green'}]}}") else { return }
        
        URLSession.shared.dataTask(with: testUrl) { (data, respones, error) in
            if let error = error {
                print(error)}
            if let respones = respones {
                print (respones)
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.chartImage.image = image
                    self.spinner.stopAnimating()
                }
            }
        }.resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Bar Chart"
    }
}
