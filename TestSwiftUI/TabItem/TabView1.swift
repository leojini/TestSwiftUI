//
//  TabView1.swift
//  TestSwiftUI
//
//  Created by Leojin on 2024/01/29.
//

import SwiftUI

struct MessageItem: Hashable, Identifiable {
    var id: Int?
    let imageName: String
    var imageColor: Color = Color.black
    let name: String
    let desc: String
    let time: String
}

struct TabView1: View {
    @State private var messageItems: [MessageItem]
    
    init() {
        // 보여줄 아이템 정의
        let msgItems: [MessageItem] = [
            MessageItem(imageName: "heart", imageColor: .red, name: "한국평생학습진흥원", desc: "[한국평생학습진흥원]-한국평생교육원...", time: "오전 10:50"),
            MessageItem(imageName: "envelope", imageColor: .green, name: "LG 전자", desc: "(광고)[D-2]~46% 엘라쇼 할인매장 시계..", time: "오전 10:50"),
            MessageItem(imageName: "heart.fill", imageColor: .red, name: "지오다노", desc: "(광고)40종 특별할인 진행. 금일 오후 4시 마감", time: "오전 10:50"),
            MessageItem(imageName: "figure.walk", imageColor: .brown, name: "카카오페이", desc: "오늘 상장하는 공모주가 있어요.\n지금 바로 종목을 확인할 수 있어요.", time: "오전 10:50"),
            MessageItem(imageName: "location", name: "카카오톡", desc: "카카오 계정 로그인 알림\n일시: 13시 30분", time: "오전 10:50"),
            MessageItem(imageName: "car.circle", name: "인프런", desc: "메시지가 도착했습니다.", time: "오전 10:50"),
            MessageItem(imageName: "bus", name: "크몽", desc: "(광고)딱 한번만 더~", time: "오전 10:50"),
            MessageItem(imageName: "bicycle", name: "원티드 WANTED", desc: "개발자 구인/구직", time: "오전 10:50"),
            MessageItem(imageName: "tram.circle", name: "한국평생학습진흥원", desc: "[한국평생학습진흥원]-한국평생교육원...", time: "오전 10:50"),
            MessageItem(imageName: "binoculars", name: "한국평생학습진흥원", desc: "[한국평생학습진흥원]-한국평생교육원...", time: "오전 10:50"),
        ]
        
        // id를 설정한다.
        let realMsgItems: [MessageItem] = msgItems.enumerated().map { (index, item) in
            var item2 = item
            item2.id = index
            return item2
        }
        _messageItems = State(initialValue: realMsgItems)
    }
    
    var body: some View {
        NavigationView {
            List (messageItems) { item in
                NavigationLink {
                    
                } label: {
                    MessageItemView(item: item)
                }
                .padding(.trailing, -28) // 오른쪽 화살표 없애기 위해 padding을 준다.
            }
        }
    }
}

struct MessageItemView: View {
    @State var item: MessageItem
    var body: some View {
        HStack {
            Image(systemName: item.imageName)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundColor(item.imageColor)
            VStack {
                HStack {
                    Text(item.name)
                        .font(.headline)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text(item.desc)
                        .font(.body)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            Spacer(minLength: 1)
            VStack {
                Text(item.time)
                    .font(.caption)
                    .frame(alignment: .top)
                    .foregroundColor(.gray)
            }
            
        }
    }
}

struct TabView1_Previews: PreviewProvider {
    static var previews: some View {
        TabView1()
    }
}
