//
//  en-US.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/19/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation

let enMap : [String:String] = [
    "home_title" : "Home",
    "event_name": "10th CWGCF & 4th WCGOCY",
    "event_location": "Olympia Convention and Exhibition Centre, London",
    "event_dates": "18 Oct, 2020 - 20 Oct, 2020",
    
    "attendees_title": "Who's attending?",
    "attendees_subtitle": "See the full guest list",
    
    "photos_title": "Say cheese!",
    "photos_subtitle": "Check out our album",
    
    "contact_page_title": "Need more info?",
    "contact_page_subtitle": "Contact us at:"
]

var cacheProfiles : [Profile] = []

var tempSchedules : [[ScheduleEvent]] = [
    [
        ScheduleEvent(st: "09:00", et: "10:00", t: "Registration", desc: "Exhibition"),
        ScheduleEvent(st: "10:00", et: "11:00", t: "Exhibition Opening", desc: ""),
        ScheduleEvent(st: "15:00", et: "18:00", t: "Welcoming Banquet", desc: ""),
    ],
    [
        ScheduleEvent(st: "8:00", et: "9:00", t: "Registration", desc: "CWGCF"),
        ScheduleEvent(st: "9:00", et: "12:00", t: "CWGCF Opening Ceremony", desc: ""),
        ScheduleEvent(st: "12:30", et: "14:30", t: "Lunch", desc: ""),
        ScheduleEvent(st: "14:30", et: "15:30", t: "WCGOCY Opening Ceremony", desc: ""),
        ScheduleEvent(st: "15:30", et: "17:00", t: "Forums", desc: ""),
        ScheduleEvent(st: "18:30", et: "22:00", t: "Gala Dinner", desc: ""),
    ],
    [
        ScheduleEvent(st: "9:30", et: "11:00", t: "Closing Ceremony", desc: ""),
        ScheduleEvent(st: "11:00", et: "12:00", t: "Flag Exchange", desc: ""),
    ],
]

var tempSchedulesV2 : [[ScheduleEvent]] = [
    [
        ScheduleEvent(name: "Registration", startTime: "09:00", endTime: "10:00", location: "Main Hall", description: "Exhibition registration", colorHex: "#B93316", hostIds: [], attendeeIds: [], registered: true),
        ScheduleEvent(name: "Exhibition Opening", startTime: "10:00", endTime: "11:00", location: "Main Hall", description: "Opening ceremony of the exhibition", colorHex: "#B93316", hostIds: [], attendeeIds: [], registered: false),
        ScheduleEvent(name: "Welcoming Banquet", startTime: "15:00", endTime: "18:00", location: "Dining Hall", description: "Banquet for registered guests", colorHex: "#3D69DE", hostIds: [], attendeeIds: [], registered: true),
    ],
    [
        ScheduleEvent(name: "Registration", startTime: "08:00", endTime: "09:00", location: "Main Hall", description: "CWGCF registration", colorHex: "#jf43ikl", hostIds: [], attendeeIds: [], registered: true),
        ScheduleEvent(name: "CWGCF Opening Ceremony", startTime: "09:00", endTime: "12:00", location: "Main Hall", description: "", colorHex: "#B93316", hostIds: [], attendeeIds: [], registered: true),
        ScheduleEvent(name: "Lunch", startTime: "12:30", endTime: "14:30", location: "Dining Hall", description: "Lunch for registered guests", colorHex: "#3D69DE", hostIds: [], attendeeIds: [], registered: true),
        ScheduleEvent(name: "WCGOCY Opening Ceremony", startTime: "14:30", endTime: "15:30", location: "Main Hall", description: "", colorHex: "#B93316", hostIds: [], attendeeIds: [], registered: false),
        ScheduleEvent(name: "Forums", startTime: "15:30", endTime: "17:00", location: "Forum room", description: "", colorHex: "#B93316", hostIds: [], attendeeIds: [], registered: true),
        ScheduleEvent(name: "Gala Dinner", startTime: "18:30", endTime: "22:00", location: "Forum room", description: "", colorHex: "#3D69DE", hostIds: [], attendeeIds: [], registered: false),
    ],
    [
        ScheduleEvent(name: "Closing Ceremony", startTime: "09:30", endTime: "11:00", location: "Main Hall", description: "", colorHex: "#B93316", hostIds: [], attendeeIds: [], registered: true),
        ScheduleEvent(name: "Flag Exchange", startTime: "11:00", endTime: "12:00", location: "Outdoors", description: "", colorHex: "#B93316", hostIds: [], attendeeIds: [], registered: true),
        ScheduleEvent(name: "End", startTime: "12:00", endTime: "12:30", location: "", description: "", colorHex: "#3D69DE", hostIds: [], attendeeIds: [], registered: false),
    ],
]

let enUserDB : [String:Profile] = [
    "000": Profile("000", name: "Steve Jobs", title: "Founder of Apple Inc", avatarUrl: "steve_jobs", description: "Steven Paul Jobs (/dʒɒbz/; February 24, 1955 – October 5, 2011) was an American business magnate, industrial designer, investor, and media proprietor. He was the chairman, chief executive officer (CEO), and co-founder of Apple Inc., the chairman and majority shareholder of Pixar, a member of The Walt Disney Company's board of directors following its acquisition of Pixar, and the founder, chairman, and CEO of NeXT. Jobs is widely recognized as a pioneer of the personal computer revolution of the 1970s and 1980s, along with Apple co-founder Steve Wozniak. Jobs's design aesthetic was influenced by philosophies of Zen and Buddhism. In India, he experienced Buddhism while on his seven-month spiritual journey,[235] and his sense of intuition was influenced by the spiritual people with whom he studied.[235] He also learned from many references and sources, such as modernist architectural style of Joseph Eichler,[citation needed] and the industrial designs of Richard Sapper[236] and Dieter Rams. According to Apple co-founder Steve Wozniak, \"Steve didn't ever code. He wasn't an engineer and he didn't do any original design...\"[237][238] Daniel Kottke, one of Apple's earliest employees and a college friend of Jobs's, stated: \"Between Woz and Jobs, Woz was the innovator, the inventor. Steve Jobs was the marketing person."),
    "001": Profile("001", name: "John Doe", title: "", avatarUrl: "", description: ""),
    "002": Profile("002", name: "Zhang Yiming", title: "Founder of ByteDance", avatarUrl: "zhang_yiming", description: "Zhang Yiming (simplified Chinese: 张一鸣; traditional Chinese: 張一鳴; born April 1983) is a Chinese internet entrepreneur. He founded ByteDance and developed the news aggregator Toutiao and the video sharing platform TikTok (Douyin) – all three of which were launched in 2012. As of 2019, with more than 1 billion monthly users, ByteDance is valued at US$75 billion, making it the most valuable startup in the world. Zhang's personal wealth is estimated at $13 billion, making him the ninth richest person in China."),
    "003": Profile("003", name: "Dara Khosrowshahi", title: "CEO of Uber Technologies", avatarUrl: "dara_k", description: "Dara Khosrowshahi (Persian: دارا خسروشاهی‎, Persian pronunciation: [dɑː'ɾɑː xosɾo'ʃɑːhiː]; born May 28, 1969) is an Iranian-American businessman and the chief executive officer of Uber. Khosrowshahi was previously CEO of Expedia Group, a company that owns several travel fare aggregators. He is also a member of the board of directors of BET.com, and Hotels.com,[2], and previously served on the board of The New York Times Company[3]."),
    "004": Profile("004", name: "Bill Gates", title: "Founder of Microsoft", avatarUrl: "bill_gates", description: "William Henry Gates III (born October 28, 1955) is an American business magnate, software developer, investor, and philanthropist. He is best known as the co-founder of Microsoft Corporation.[2][3] During his career at Microsoft, Gates held the positions of chairman, chief executive officer (CEO), president and chief software architect, while also being the largest individual shareholder until May 2014. He is one of the best-known entrepreneurs and pioneers of the microcomputer revolution of the 1970s and 1980s."),
    "005": Profile("005", name: "", title: "", avatarUrl: "", description: ""),
    "006": Profile("006", name: "Darth Vader", title: "Sith Lord", avatarUrl: "darth_vader", description: "Darth Vader (Anakin Skywalker) is a fictional character in the Star Wars franchise. He is a major antagonist in the original trilogy, but, as Skywalker, is the main protagonist of the prequel trilogy. In the third film of the prequel trilogy, he becomes the secondary antagonist (following his rebirth as Darth Vader) alongside Palpatine. Star Wars creator George Lucas has collectively referred to the first six episodic films of the franchise as \"the tragedy of Darth Vader\"."),
    "007": Profile("007", name: "Jane Doe", title: "", avatarUrl: "", description: ""),
]

//forumContents = [
//    ForumContent("0", _userID: "5e047d14fb6ea844a32628b8", _title: "First forum here!", _content: "Steven Paul Jobs (/dʒɒbz/; February 24, 1955 – October 5, 2011) was an American business magnate, industrial designer, investor, and media proprietor. He was the chairman, chief executive officer (CEO), and co-founder of Apple Inc., the chairman and majority shareholder of Pixar, a member of The Walt Disney Company's board of directors following its acquisition of Pixar, and the founder, chairman, and CEO of NeXT. Jobs is widely recognized as a pioneer of the personal computer revolution of the 1970s and 1980s, along with Apple co-founder Steve Wozniak. Jobs's design aesthetic was influenced by philosophies of Zen and Buddhism. In India, he experienced Buddhism while on his seven-month spiritual journey,[235] and his sense of intuition was influenced by the spiritual people with whom he studied.[235] He also learned from many references and sources, such as modernist architectural style of Joseph Eichler,[citation needed] and the industrial designs of Richard Sapper[236] and Dieter Rams. According to Apple co-founder Steve Wozniak, \"Steve didn't ever code. He wasn't an engineer and he didn't do any original design...\"[237][238] Daniel Kottke, one of Apple's earliest employees and a college friend of Jobs's, stated: \"Between Woz and Jobs, Woz was the innovator, the inventor. Steve Jobs was the marketing person.", _imgs: []),
//    ForumContent("1", _userID: "5e0486285fba501555c8fd6d", _title: "Speechless", _content: "......", _imgs: []),
//    ForumContent("2", _userID: "5e0486a85fba501555c8fd6f", _title: "Uber today", _content: "Dara Khosrowshahi (Persian pronunciation: [dɑː'ɾɑː xosɾo'ʃɑːhiː]; born May 28, 1969) is an Iranian-American businessman and the chief executive officer of Uber. Khosrowshahi was previously CEO of Expedia Group, a company that owns several travel fare aggregators. He is also a member of the board of directors of BET.com, and Hotels.com,[2], and previously served on the board of The New York Times Company[3].", _imgs: []),
//]
