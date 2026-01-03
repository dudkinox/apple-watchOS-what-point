import SwiftUI

struct ContentView: View {
    @State private var leftScore: Int = 0
    @State private var rightScore: Int = 0

    var body: some View {
        VStack(spacing: 10) {
            // Score area (tap to +1)
            HStack(spacing: 8) {
                ScoreSideView(
                    title: "ฉัน",
                    score: leftScore,
                    background: .green,
                    onTap: { leftScore += 1 }
                )

                ScoreSideView(
                    title: "มัน",
                    score: rightScore,
                    background: .red,
                    onTap: { rightScore += 1 }
                )
            }
            .frame(maxHeight: .infinity)

            // Controls
            HStack(spacing: 8) {
                Button {
                    if leftScore > 0 { leftScore -= 1 }
                } label: {
                    Text("- ซ้าย")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Button(role: .destructive) {
                    leftScore = 0
                    rightScore = 0
                } label: {
                    Text("เริ่มใหม่")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Button {
                    if rightScore > 0 { rightScore -= 1 }
                } label: {
                    Text("- ขวา")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }

            // Footer
            Text("Create by Guitar v0.0.1")
                .font(.caption2)
                .foregroundStyle(.green)
                .opacity(0.9)
                .padding(.top, 2)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 8)
    }
}

private struct ScoreSideView: View {
    let title: String
    let score: Int
    let background: Color
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 2) {
                Text(title)
                    .font(.caption2)
                    .opacity(0.9)

                Text("\(score)")
                    .font(.system(size: 42, weight: .heavy, design: .rounded))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(.plain)
        .padding(.vertical, 10)
        .background(background.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

#Preview {
    ContentView()
}
