//
//  ViewController.swift
//  FlyGuy
//
//  Created by Dominic Danborn on 10/27/21.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var textBox: UILabel!
    @IBOutlet weak var speedBox: UIView!
    @IBOutlet weak var altitudeBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let data = [5, 6, 2, 4 ,8, 3, 7, 8, 1 , 2, 8, 12, 1, 11, 10 ,11, 6]
                graphLineChart(dataArray: data)
    }

    func graphLineChart(dataArray: [Int]) {
            lineChart.frame = CGRect(x: 0, y: 0,
                                        width: self.view.frame.size.width - 20,
                                        height: self.view.frame.size.width / 2)
            
            lineChart.center.x = self.view.center.x
            lineChart.center.y = self.view.center.y - 200
                
            lineChart.noDataText = "No data available"
            lineChart.noDataTextColor = UIColor.black
            
            var entries = [ChartDataEntry]()
            
            for i in 0..<dataArray.count {
                let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]) )
                entries.append(value)
            }
            
            let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
            dataSet.colors = ChartColorTemplates.liberty()
            
            let data = LineChartData(dataSet: dataSet)
            lineChart.data = data
                
            lineChart.chartDescription?.text = "Pi Values"
            
            lineChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        }

}

