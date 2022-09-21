Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157653237
	for <linux-coco@lists.linux.dev>; Wed, 21 Sep 2022 17:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izVQ+u0vzKrFogUfDmeAy/cZ0M2+CC7UNG8VHQmUAnaDWMqzmuvZ3B2tIb6r5o0RsnG+uqindPgapUS+muhWocdot5il1f9b5S46nYGYM6OaHcebkMkVn5Xs5f8V6TovBhkd2pJyA8TBi2dPjGiUXlVHsEBRfA+fZTVSmKY55Ij4S1uYp09XaWL4bn+S9rwXqG7WRo/h85HeIOzTooxmLiaRZRaop7zTqJrMwKh61KOxTEFJBuooBeeDD0Z7ILXxYh/Zs9wqIFIKxQmYjUkc9uk6ZBRIuBv5ePl5OJOBWna8n/huNzBcGbfF9jUCS5Jjm+iq834VYYHUzRYPan4EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JdmnMUHo6VAN0DIPLA8ndAUPgJOxwBTxBzgUJ0ASW8=;
 b=DXV1PD+Br4bbXg4Kk4HTE211Fsgn3FaHJXxG9LM53Rn+vfWk1q4miC68rs0wRrtHK3LttZrVFi8OAorrLIsTZe6OgZC1w5DTnGjC4s2GuhF3UYkxjBB8HRO7MQpf6fmSxh6BhvpXFv4woTN1PlXrE3qmBRk/RQxbNcxh7Ssje4rEf8QfypquyxPrg6N8HBQxUgxBThwGxp4iUNzlLQgqC8fVXwWWJZRueELVsiOIMX6/CFvk4oFshD+blVqp+tN8WLcVYvlv1H/tBfnB35jJsB/Dp2jemHHYGGzZ8QPVhDgjOwkUJrms3UMhCxPplA4UPvyKqW5vqtOec5YJh6bbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JdmnMUHo6VAN0DIPLA8ndAUPgJOxwBTxBzgUJ0ASW8=;
 b=p5C+nbRSYDrllxdgtKszRifu76c6MlJ6XlKH7G8kBAdxe6e9fPEwOtlv+DgZAN6I9Tdv6cDaR0Vz2VEArxlcj43RgxUoWqT89LidOub/SV67TsSIgL4HaF78/O4fzTHwHvAAwAebyEk22YT9RTiTCIPcCen3E/lqzbkkqCwniHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by IA0PR12MB7532.namprd12.prod.outlook.com (2603:10b6:208:43e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 17:14:00 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::c175:4c:c0d:1396]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::c175:4c:c0d:1396%4]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 17:14:00 +0000
Message-ID: <3aa30eef-408e-33ba-b0d6-c3ecac7ad27e@amd.com>
Date: Wed, 21 Sep 2022 12:13:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: SVSM draft specification now available
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:610:20::23) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|IA0PR12MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: b280dce2-34ae-4635-f7dd-08da9bf4ad0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+AJH3PZwpJupdTOwMLV/ScCTDvGGeXoAaapjizKaP8Sn/U4GsALhJR3fvnw74OHfasIPJi1Ue9HaEDTZ0nifS6eG1fVqeXazfLwl4qUAhrpUVj4aFdnKRAUEp6BnkRZ+DornT2uSYii3/aILrjIJIEkYwJ+gTIf8Q+E/2l+mHb5YaE7P48y0wQmND2X0pswtnu+48FAVTmorNs19kWLhunEGZBo9Dx/gwWglffZxjFZCKXAAq2Z/EXLKEe50yfsI8mFMgdX1W/jkqwapghG7tw/BBZ2wRmWagDguTPAC5XyBseIyaGzNgarIWLgp6aHwT1AcmS90y4bt8g8vF8UbArGGqsSLgEacvzCO4ke60zWczsv5BXe2+DA/rO6OheJuSLPhZJF7FsGk3hmQH/jsBMtzs10JNdxETHozyxPefKRry8ZswK05xUBXv6p5omTS3v+P4d55vjujNEY6iJdG0FFSBihFn7vRLs0qJ7lD77cwB6AQv/B1vw+7A/aOHiV5+326zn1tHX8x8kIglOZsLYmKAwAvUOxoN2zoWC+21r0d0oW0C42rP5uwYxdtv71qILWIAGX0lZgYIUKjmqDQ3csx9ESNrGBmT24e+g7N5Kxw6qQ8jWVqMRn2BXOYR3YPoT+Zm6OybzF4r/g2BZhir2ZnaFnDJidc/Jr+7boJxwH/z0ZlOLJ36OKx3GNSV1WmYT2pkljZY8BrExUX5G0diA1wT8YR1cnSVFtvUQ+7FvDzrNHUcdT9Woj7Ic9aKiliCgeL1IyeK40nrtD+MXJgCzEzWjc9QoswycHs3XQ/9W6qKAqpd0NFV3RY5F8jduVVHn3E5+GBLQNLR30y5O7meD/+TMQ0vxH1il+7Z/CmSpJXZpcIlXiUmuxHFQo4jPo3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199015)(186003)(4744005)(31686004)(66946007)(26005)(8936002)(6512007)(41300700001)(66556008)(66476007)(8676002)(5660300002)(38100700002)(86362001)(966005)(36756003)(31696002)(2616005)(2906002)(6506007)(6486002)(478600001)(316002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eSt6OHF1blBaWEFyWlp2NEhJUlFSOVZuTVl0NkJ4bFErd2k5aFpyS2I4SFY1?=
 =?utf-8?B?TjlsYndmakErc2YrMjY1bWNsY2J6V0ErajdHam9IdXlQWnY4SzdOakUyMjlW?=
 =?utf-8?B?NzhIQWRTcncxNllreXoxU3FXd3JkaGtKQWNvV3E5TC9mb25SQzUrbFZYRGNo?=
 =?utf-8?B?aFMzV0N1RHVFdDZKVEVJRmlySEdra1RMeUFqZW50UTc0NjhnRXVsdXVlS2dO?=
 =?utf-8?B?dmVEL25MMUZpa1ArZDF1QjFlK0tMTC9lQlFZVVQvYUpLY25DTDBhallvU2VT?=
 =?utf-8?B?RmhibjVwUzIwcU90dFhLcy9aNU5PYlJaaEtER3llYXh0WTlIamZhZ3ZZc0M2?=
 =?utf-8?B?d252RmxCaEdtaStQRzFyWWh2NXhaREpIUkxXbVo0TGd4UW5XeHhRUXBZNDh2?=
 =?utf-8?B?SEFMTXVyUEpNanU5OXMxYTJub25pelN0QTE0RUdEcjZxeWt6a3ZhQ0lVQW9i?=
 =?utf-8?B?N0NVSWpGMXc0d3B0REwzSW1kK0lhN1AvcTdFR3ZrTUJ1SnY1ODJ4Y1A5VXBa?=
 =?utf-8?B?Q1E2azkyeFMyRHp6OEZ1bVNycEZRMXo2alBYRm9TcUpWVkduWlNiNitPRnI0?=
 =?utf-8?B?dmVGZEpTVW5PcGFQQ0pQSFkrNHVlRHdXV1BIWDRQR2lFU1lOamZkeDI4VlJI?=
 =?utf-8?B?Q0h1UGZuNlQ1UjdXaStoZWNQNnpPeTg2MHdmQTBLOWU4bWdwR1RKM25tdVFr?=
 =?utf-8?B?eWFRWlZ6T0kyNEZKYmtVMnFCOGpUaWVIdGtIQ1JpS0t4SnZqUGJ6OVR3OHZ5?=
 =?utf-8?B?Q3N0WTFQTmZ3YnorNVFqb2NQSXpkZkNXam9qY3V6aFFXSlh2UlVDNlowUkRy?=
 =?utf-8?B?Vmd1Q2lvR05JZzFvNkN2bFRPK2N5UU9LalhwY0tvNUtrZVJ4MjhvVnQ2Wm5p?=
 =?utf-8?B?TVdaREV0SXVwWkpyNVdKc053c3lGZ1ZsWG94QmQ2WS96UE5nSVRQazdsL3ov?=
 =?utf-8?B?aUwvQUpWV0F5UHV2KzVkZ3g3WXYxT3BrT3pZWWVaNUdiMWg5c0U5QWlhZkNJ?=
 =?utf-8?B?RDlGMitEditLN2FXZ2F2M2FremFsOTlDcjJDQnJKT3BsSFVnSzFYclR3dXJh?=
 =?utf-8?B?U1cySDNGZWRsYWtPNnF3a21oN2dLY1BIYmFhNmZjMVlvN1ZjcjM2U09Lc2ox?=
 =?utf-8?B?a2x4VER6bjVBWDRMZzdTTWFVK3RXTEkySmo4N1dLNTlFSmxXMUxuUkcwZlM2?=
 =?utf-8?B?TGlhdStKanBHK3lWYTRXMHp2cmNCdzJLSWFLblJNaXNJcXNjMGcrT2NOejBR?=
 =?utf-8?B?WnBLVVNNNXVGNXZTb3RwbFNUSkpDN1c2TXk5UmxFWUFpWFNublN5bW5LelpL?=
 =?utf-8?B?ZDRZa1BVWHhnNmRvUXRUa3RxZjk5dEMrMDF1VVNTTkc0TjZwcVZFSGFjdllQ?=
 =?utf-8?B?bXRaWHNsN1YxVlBMdzJMNmVTK0JjTnF1dWtOQWpaKzhaZEJxck1FTHpYeE1R?=
 =?utf-8?B?ZVpOektiRzBEdGhnYWtjQ3VXa2tDQVNpVUNNV0tvcGdwZjY1UEMwMXVRc1FL?=
 =?utf-8?B?YmZrSnpwNGUxNU05Z2ZhNjVMZ3cxLzE0dXM0cVNDNmxwWFdPS09wbVBrZnk0?=
 =?utf-8?B?VHhFd2grYzgvbEtDNzdETHR5YzQ4Sm9ZTnJLZGNORXhwaFI0RVcrWG8wbCtK?=
 =?utf-8?B?ZytzdU5QeUszSE83UGFST3NYYUZwQlVLRDFybHpCYUhBTk05ZCtyNDhNNTBh?=
 =?utf-8?B?alR6N09ld3AzQndpcWt1RXpCbEV6UVR1d2RjcXFxRHUvdVpTWmVLTG9oaEJ5?=
 =?utf-8?B?dVRocDc5YUVhRXR0WGt2MjNBeHJ0dE9vT2xFT2w4WjE3YmNDUHQrRnpROXpq?=
 =?utf-8?B?eFlIUnJONmVBU3N0ajBXNk5IZ2VzWEhFMkpubWdYdEM2a3lHQnZIUXFDVUth?=
 =?utf-8?B?VWRrOW5KKzVKNWFORUEwRFRlclY5VkpVZDJsNHdkVWh6cUJRMjhrTWg0eE5M?=
 =?utf-8?B?Skd2YXNudUx6R256SndyZnQ1dWJmcGJBSzlnWm9GN2lOakRjN3BvZGFtVzZL?=
 =?utf-8?B?bHc4cW9qOUVhcmgyMU0vRXlUWXA0Nm5Ja2hhc3pERWRoVEh0ai9BejUvRDNB?=
 =?utf-8?B?WCthZGtXSjQxdkhvOVlYd2xDZ0dCbUdEVTAwVEF0M3VaRVFTVjBXeTlkbDl5?=
 =?utf-8?Q?qZedEFj6Srd7IMbAQdrJrQwfu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b280dce2-34ae-4635-f7dd-08da9bf4ad0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 17:14:00.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjZ1Bj7cgoBUAnLNAAC10eizCCmQWcmSeDLe0Oa/lIOcFfn7yjkMSEh4KtuUtbDS0i06tGCKVsRp1IRs79YgmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7532

All,

A link to the draft SVSM specification can be found at 
https://developer.amd.com/sev/ or you can find it directly at 
https://developer.amd.com/wp-content/resources/58019.pdf.

Please read through it and lets start discussing it and what changes might 
be required for the first version (which could include additional 
protocols and/or functions, e.g. vTPM support).

Thanks,
Tom
