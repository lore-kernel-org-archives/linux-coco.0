Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2045.outbound.protection.outlook.com [40.92.98.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C467B
	for <linux-coco@lists.linux.dev>; Mon, 26 Sep 2022 10:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX+DA7/+KVKbc38+pX5kYYCFyv8Wc8FAaH14KXTes5zw3VkZgR1vt/L9PWg3EYj/VTevUTxfMywgNzTzTZQ3/LgOW05AuaZtGwcsHsEEaSktWOO350rQcuzC6xYMDWan9SAoHJyXDul6jeMuFuG1XQO9itUmjvaIXvB1gGlJOOK1m/XRuvWEAEI5/MKEEZLU+DNYMucVfuPrAdLfBfnXpNo4qcrgp09pdBLN++/1DebNwA1j7o/K+VZGc7Hd7h09lJ+Ku8XMW4cktTj0fCgx2TCsvcsqbJ9BfdA++C3TOSPW71dM2khamhHWc2PJhOpYpSZNZD6ozGtXGpB698+llA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDY4+LTi0PDN2TuCGruIoEHyLEOW7nAW2UV/QpdiK5A=;
 b=EAyeeO+NjAhYS3T+l2YArtS6EVSQI0UkWvmPuEUu5daNePVf4l2gUk2CPsoStL3Y3i131rte6j6coe7l9fdj15bEdTwCPHcNdo7rClq4Qq/aLHROhV4LLA6mqmBujyM8Ejb/IEBVloLzvnr2hdJvr6Bgd/UqDvMvy4pwb52DQU+MAYxUU/58vUSFTcWtV4UqSpVSEbBVljheLKeSQaUPtrVO4OTce8GBt0smOpX6Rm6r8eGh6yE19TufoCUszOAlIE0eyNSiME78aYdkg+JA4ijHQdWuY0Zl4XDH5cuqIC27wpymVoJxYUOsM6E9EMPM4smgYMp8JMno6hiq+DRV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDY4+LTi0PDN2TuCGruIoEHyLEOW7nAW2UV/QpdiK5A=;
 b=cynjm7gINTWgQMlPawXrquiAV7I7PNKhIs4zMjgBPqX/+8lLqrtVije5cLk+/FzBwuT+q9CBX/pneYC4xjJGfw4IWtPc+nP4lv3cNtNs9C6NRLfu1OAggv5Teoe6+WBKyUoJ/EWkFTW+Tfhov2SDe9Ngfa75EMwiUH8UZbmBZDmbebitW92f+SfrXZMqtfub30cV0oPgkhp9lcW9ch+IYUFN0NInbm8RGCN3zmsMTjE2uyQJHFVT7ENRfJmgSyiU4NbjLqtJwG7CbVWBCDF8WoQ0xxNSzoCWspdtqzCG1eGffkrqGclQB+fos63Wqw69gG7gVcx8B5eaoV6KBD5i1Q==
Received: from OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:83::12)
 by OS3P286MB1640.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:161::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Mon, 26 Sep
 2022 10:52:18 +0000
Received: from OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8b83:8fb9:2676:a925]) by OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8b83:8fb9:2676:a925%9]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 10:52:18 +0000
From: =?gb2312?B?1cUg1PPT7g==?= <zeyuzhang07@outlook.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject:
Thread-Index: AQHY0ZYIAT3oPckznUGJpAOPrOUHzw==
Date: Mon, 26 Sep 2022 10:52:18 +0000
Message-ID:
 <OSYP286MB0103938E452BF5018D4EF780B2529@OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-tmn: [+TifF/VSwqPRk0l95zSIQx9E16pybyaL]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSYP286MB0103:EE_|OS3P286MB1640:EE_
x-ms-office365-filtering-correlation-id: fb3868e9-ebad-4b0c-fc96-08da9fad2e7d
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oGScoPVeO51y65H8GFxefCSNhw1XaskOWCB6UWCJ5ea7p0u8QUz2EHdSZCtug7t12UtNPrA3Zg034wcUPb2NMJYvIVJfBsjDv/yhSo0ZkBmkJLPnKvAXda4cdZxp1CaaqKzCEzk/aGdqm7hP777V/9aoyL6D16yJY8iyxufTV5/S9XX1blDCp3aPL6+zWtzK2ep3Ph3d7LWGA5JFRjvI4QDw3u8pgGa3rGF1jRXET2zwhiTcUuQq0JVbQFANdWTRMjxC1qfzaRJehiEPpw1yA2rXDJ5uVSBLuyKztUu06Bi9HZus8YQZ/AvrTPU1VLpiLxkOfKVIaqemEJ7ensa+ZyGTUCM9XtqCeha/M54ECB6Pw/i7zjGg9474l1dfkGr+4yLI/UpMTAp9POhEWz108WtdsE6sP5FxV2BuZ+5STaTCjVgFD/AulApkXJih4pd1a7ezsISj3svfifi1FqHNcQ5BepbAccwVP8bhcuA4pioExVaWM4pDKYlj7ekcF41NAOSd95Pf7MtIbwOUjGqOlZtGGbMNQO6PH1CxYpzF8IN42kc92LNYIl2CV2xuV1wFK8HP67//wEBHG5DIEqX46gRXWTzs6aPQD1z9LONj4aauwR33RFcQJFzv8b98QR8nZwp40xLQ9GekcC7YU1YCyg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MnZkS1E2ZkZxcE1ZMFBpaitxQjFZTEJseGFXbE16Y3ZlQUFNViswYkU2TExV?=
 =?gb2312?B?TEtoWE1zOUJwbm1tSVFHSmdmY01iVHp0czBFNDhINGp0MmJqQ3dzcXpndkwr?=
 =?gb2312?B?azd1aDN0bFBvWktEK3JkQ0poMjJlTmJzNWFhZ3RrREZuSFVscEdQSE9zQkdJ?=
 =?gb2312?B?T0kzTkpjSmVnTkQyUEpaejUrUTA1QU9GMzdVb0FTdW90WDJDbnlrWUpKWWk1?=
 =?gb2312?B?clJmQnVxUzNtTWVQS3ZVZXBYM3hEdzJsdFA1bjhiTzgvdGZjL2hSL3pIN1d4?=
 =?gb2312?B?Y3R4WE11UEF2b2JuUUl6VnptYXZrSmd6cGlEei9NNnE4eXNmZWJONjlBTnJN?=
 =?gb2312?B?RUtvNVkyY3pSN2V6UG1KRXdFMVIxRTVQVUxVcWJSVDBBaXgrSjc2NGVZaUpi?=
 =?gb2312?B?WUtzbEVKa2MyOGdsaFcvUGJ2eEdXTEFpdEhVVExHSUoxcE5RQlA3MWlBYy92?=
 =?gb2312?B?SkRBdFBnQ1lUT3pscHhpZzlielRpR2ltRmd4SkpmRm1GcEo0ZHhpckI2RDFN?=
 =?gb2312?B?TFZwQURXR2loc1JiQ0VVOHFVaHJsYmxUVlVCUFgyZFYyclRYQm1pOUZ5WVNX?=
 =?gb2312?B?enl0N3RPK1RoaFhLeDVKbmZUcS9VZ2JLMTdxOCszc2tvVUZKNEFUTjlhVWtZ?=
 =?gb2312?B?MlNGTmNRVi9qb0ZRdHNLK2lBdGJBQlFTaWcxdnRMalJIYzh5OGlpcGRzNlpF?=
 =?gb2312?B?UytQTnRZNlRMTnRoY084cGEzQ0t4ZHpVallqeEkrcWlXMG1qNFVFTWJXWUZn?=
 =?gb2312?B?ZDZ4V3dVcGRNQXV1VSt0c2F5emwrZS94QnpQMHZxUEFRSWpPR1A0enFqN3hw?=
 =?gb2312?B?Ny9RVGdYbVNWSlREZHVsc3k0NytIamQ4Y3ZBMzZTRDdxSUZZS1oxZ29ObXZq?=
 =?gb2312?B?WXF2UTFBcy9VNlA1OGxEYzRGK3FmRFJOVFJIRmw2TzF3OFAxTG9zYkxqZTNw?=
 =?gb2312?B?dHMrQ1I5aVNWek1UR1p2SG0rRmUvQThodDRkRk0xK2lZQ3JiTjIxaTR4VU5G?=
 =?gb2312?B?WkU5MXZGdGx5ZzBTb003SkJJeVdFQ0pKemliVzJnTWdnTXMwaklTYkZJTGts?=
 =?gb2312?B?aitKYXdXS2NoUXZmM0VINHo1bXJFbjExU3lDOGp2cEQ4RGJQT3c3NWlGOGpR?=
 =?gb2312?B?M04yVXRpWTlIMHVQZTM2ekx1SkxXQ3dqYUhSbHlLYWdOUGlJTDBZZWdmUXVI?=
 =?gb2312?B?MytCUEtVNkN0VjVyK0xEK0FnM25YckE5UFlFZTdyMUtlclhQOWI5UnpQVnk2?=
 =?gb2312?B?SUJkd3NYTTlobHVOTVFxRDBzZ3dpaWw2a3ZMLzllUDJGZWJtaVJ2dlQyT2s3?=
 =?gb2312?B?S2pWbzc4dmV2RmRJK2ZoeGlvTWNmOEVEcUhTVklNMkVURmp4dGJVL2kyeHZZ?=
 =?gb2312?B?OGR1M2VoVmJtbFlnRWprUHZPd01MdWl3UjJkRkxRMlIyVjBZMm91M0pYa2c4?=
 =?gb2312?B?bGsrNmFndm1EVDhxU1JvQ1NXOVRpS3NMTHh2K2VWZDlyR0hwZ3FQNjQvd1ha?=
 =?gb2312?B?MXFQY1VWVUplVVhQWHVRRFRNQ1NkQjhFRTVQU2xBWkk3Q2NNTnRTci9LVVRs?=
 =?gb2312?B?TTBicnRKMmlPUHNyTnpxUE1sb0pUOWlkbHlEN0pkcnZkdmozOWFGQS9BL0Ev?=
 =?gb2312?B?NVBNdHlRM0tSSDk4MFNXdVZZZHRGYnRBR2h6d3JVVVJZeWl3WHdsdk11SjVx?=
 =?gb2312?B?L1VyVURUQ1d5QTdNUk9BQzhFNGRlWEI2QWVDT01MSVhZZ2tDVWpDcElnPT0=?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3868e9-ebad-4b0c-fc96-08da9fad2e7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 10:52:18.3888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1640

dW5zdWJzY3JpYmU=
