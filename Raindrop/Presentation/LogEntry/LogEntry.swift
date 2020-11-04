//
//  LogEntry.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/30/20.
//

import SwiftUI

struct LogEntry: View {
    @State private var date: Date?
    @State private var description: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ComputedValueItem(title: "Log #", value: "1")
                DateItem(date: $date, title: "Date")
                StringEntryItem(title: "Description", value: $description)
            }
        }
        .font(.system(size: 18, weight: .heavy, design: .rounded))
    }
}

struct LogEntry_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.primary)
            LogEntry()
                .colorScheme(.dark)
        }
    }
}

struct DateItem: View {
    @Binding var date: Date?
    let title: String
    
    var body: some View {
        let dateBinding = Binding(
            get: { self.date ?? Date.today },
            set: { self.date = $0 }
        )
        return DatePicker(selection: dateBinding, label: { Text(title) })
            .cellStyle()
    }
}

struct ComputedValueItem: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
        .cellStyle()
    }
}
