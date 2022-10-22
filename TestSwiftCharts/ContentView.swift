//
//  ContentView.swift
//  TestSwiftCharts
//
//  Created by Elliot Knight on 22/10/2022.
//

import SwiftUI
import Charts

struct ContentView: View {
	@State private var data = [Trotinette]()
	let timer = Timer.publish(every: 1.0, on: .current, in: .common).autoconnect()

	@State private var temps = 0
	@State private var vitesse = 0

    var body: some View {
		VStack {
			Chart(data) { donne in
				LineMark(
					x: .value("Temps", donne.temps),

					y: .value("Vitesse", donne.vitesse))
			}
		}
		.onReceive(timer) { _ in
			temps += 1
			vitesse = Int.random(in: 5...15)

			data.append(Trotinette(temps: temps, vitesse: vitesse))
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Trotinette: Identifiable {
	var id = UUID()
	let temps: Int
	let vitesse: Int
}


var donnees: [Trotinette] = [
	Trotinette(temps: 1, vitesse: 10),
	Trotinette(temps: 5, vitesse: 25),
	Trotinette(temps: 10, vitesse: 30),
	Trotinette(temps: 15, vitesse: 25),
	Trotinette(temps: 20, vitesse: 20)
]
