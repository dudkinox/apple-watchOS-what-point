import SwiftUI

struct ContentView: View {
    @State private var leftScore = 0
    @State private var rightScore = 0
    @State private var runtime = ExtendedRuntimeManager()

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Color.blue.opacity(0.85)
                Color.red.opacity(0.85)
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button {
                        leftScore = 0
                        rightScore = 0
                    } label: {
                        Text("Reset")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(.plain)
                    Spacer()
                }
                .padding(.top, 6)

                Spacer()

                HStack(spacing: 0) {
                    VStack(spacing: 6) {
                        Text("ฉัน")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.95))

                        Text("\(leftScore)")
                            .font(.system(size: 56, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)

                        Image(systemName: "chevron.down")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture { leftScore += 1 }
                    .onLongPressGesture { if leftScore > 0 { leftScore -= 1 } }

                    VStack(spacing: 6) {
                        Text("มัน")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.95))

                        Text("\(rightScore)")
                            .font(.system(size: 56, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)

                        Image(systemName: "chevron.down")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture { rightScore += 1 }
                    .onLongPressGesture { if rightScore > 0 { rightScore -= 1 } }
                }
                .padding(.horizontal, 10)

                Spacer()

                Text("Create by Guitar! v0.0.3")
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.7))
                    .padding(.bottom, 6)
            }
        }
        .onAppear { runtime.start() }
        .onDisappear { runtime.stop() }
    }
}

#Preview {
    ContentView()
}
