//
//  HomeFetchableUsecaseMock.swift
//  RoutinusTests
//
//  Created by 박상우 on 2021/11/08.
//

import XCTest
@testable import Routinus

class HomeFetchUsecaseMock: HomeFetchableUsecase {
    init() {}

    func fetchUserInfo(completion: @escaping (User) -> Void) {
        let user = User(name: "testName",
                        continuityDay: 2,
                        userImageCategoryID: "1",
                        grade: 2)
        completion(user)
    }

    func fetchTodayRoutine(completion: @escaping ([TodayRoutine]) -> Void) {
        let todayRoutine = [TodayRoutine(challengeID: "mockChallengeID",
                                         category: .exercise,
                                         title: "30분 운동하기",
                                         authCount: 2,
                                         totalCount: 4)]
        completion(todayRoutine)
    }

    func fetchAcheivementInfo(yearMonth: String, completion: @escaping ([AchievementInfo]) -> Void) {
        let achievementInfo = [AchievementInfo(yearMonth: "202111",
                                               day: "06",
                                               achievementCount: 1,
                                               totalCount: 2)]
        completion(achievementInfo)
    }
}
