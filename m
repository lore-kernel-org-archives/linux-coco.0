Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD67063D1
	for <linux-coco@lists.linux.dev>; Mon, 20 Feb 2023 15:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMMH2ji/0zAzLXC1SSXIELegRPUYb4zm0o0La7FQLajpFwct+t6fexQ3qRd5KteO4La4k6a1Ul+E6u7IfHy+PPd00epqrPCU7T/s915c9OUlbqDOei0dnO0bb+6FxU6gBZw8PY4fsqnmBsWBvv5ZEVHyHaTNFndvawleP0HMKaoW/xxLRS7BrCIpp51hnlHrrF+NxZOlw6DV3O1qOWTboWLE9N50R+ou33l/GS0cANvrzdk8ILeGl/oCJ//XOnUMGcvMtInrqlOIW5Nr/8PE0IGLuvJb8EnzUiK5XrlPYFy5KihxqQx8vS5Ag0oz90sSw/Ql+bE1gUJRx/jHf8Ii9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdXF1NlqxJxPYCed8OpxkdrXRReRnRx4KfN1MQlmHFI=;
 b=Fsb9+g/ZrLJtloFK3SI35cPM/ZUc3P/Z/HLcq0uqZpZ293PlQo9/LfQZemCmOzq2z6Vhj0rpjXWP9t7SoqPpnKskCiUlD2yWlJSQkFyhUcdTXXEbri54Mw75acb1kuNNvk/ZZfQWIifI/wGv2O43TtM1hV/t3bRgNJgUwsR1V5GRDEa3zMkYSJy6y/14Avd2pS9rFHC69Jz4j6YCaXXSYPYgfTIscyf+yGo7K2uWkBMkgkpBIu9F39MS/YJG0WcOHojkt3MbWAZyNmxlRjrKmckcyUZb2eZQJpTd3O+EJBAKRIPd7SstVYCcqcklkABQC6o3K2+SSsCZucJFui9Kmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdXF1NlqxJxPYCed8OpxkdrXRReRnRx4KfN1MQlmHFI=;
 b=mg1CH25l50DMuQqGZNpwa325nBOxnR8v/7KbARD+cCLiOdFGudA6HO0nlo/AnOlWJejtWDJ1tSwP2OyYEIEuEKtz4KXiWG3KCssRhffIGyPWgqbMLb9d47IlA94EYlxW9cvlJjVBCaTRRWwHn6/6ULwxd+FJKti4frpJY4yuK60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by BL1PR12MB5079.namprd12.prod.outlook.com (2603:10b6:208:31a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 15:10:32 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%6]) with mapi id 15.20.6111.020; Mon, 20 Feb 2023
 15:10:32 +0000
Message-ID: <e7eb4ed9-4cdb-2231-25df-43a85974cf8f@amd.com>
Date: Mon, 20 Feb 2023 09:10:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+mdnCrn7sNCcMt@suse.de> <Y9pEBGWl/xJyIgYS@suse.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <Y9pEBGWl/xJyIgYS@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0030.namprd14.prod.outlook.com
 (2603:10b6:610:60::40) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|BL1PR12MB5079:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ce40f1-d616-4554-e33e-08db13549c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nNKUKMdndu9Bjg4gDUDWUw4T1Z2ZB3BopSwDH74i7tfoHcQIjuDKnaqpkyQ1BSjDYY6kg3WzzUsXeiGrX6CtwdZFpxuSVYqyjUDvYVJo3NjMZ6EQZYMgcL4NoyF0hAQvkp/5+96bm5mJz8nkuEP0aVh3cF9Z6Q86Q31cEfmLs5i3II5VkKU1mwXF2DcN9cDkz1y2XDkia/y/eNTJk5juiqQCDtC1+j894yeD9znojzakCemsuVdTb2j3GIcREenjbvF+2yXzAoAl+0SUS+jmoVqAjH/XgvHADecgOcorPFE1Ljq3nsuKJuOFOE0PCWTlKE9afrzdZRYWTzGsq8PRMeZOhR8VcpFzlN6TJfIvNRmyIGkLhO3zmFJ8+7iRnulgP9woyCNZHM7bNTxmPHalyApJod5qR4Zchx6TixVIyXHuyDAFWf5njOnnGUwN/E6z3Ao9DZ477shjrBewyM+H2V8hZ5ds7JrhIC3iaGKau/59mpP1sS+xwqJ3duasXFh7cll6v5r/KV1aBkAf+MEDfUHvbcil54bxWGvlOq/xV4dcAccbh/n1MkWtl9a5vHk0VwF5z1+B5r81/jzWLTcyw43r1Mu1xjBpmESaPyDHaRNu1/IuRyQHZ2b9OXtld/u2pYL7BuJ9Roe1pf0veOceMAQNsqq9JxhNUxKYL4CCY5qu8Ldn/GU5SdI7W1w+Z7Jo84VUwUEhRpHjeIBbl33Y6q8eLvgExDL5+W65UZ1H7fw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199018)(8936002)(2616005)(5660300002)(31696002)(4326008)(8676002)(6916009)(86362001)(66556008)(66946007)(66476007)(36756003)(83380400001)(54906003)(66574015)(316002)(478600001)(6486002)(41300700001)(186003)(26005)(6512007)(2906002)(38100700002)(31686004)(53546011)(6506007)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3J5N015Nk5sNWFqS09OVVFkVkpwOW5BeW56ZFdzMkhsQ0lHZFJPOCtxSnMv?=
 =?utf-8?B?WWZyM05pVXpZTTlYSVhPZWlpM2YzUVJIZEVVSitiRXFRUUZUdmc2T3M0bzhT?=
 =?utf-8?B?Z2NlYi9ZdGlncElwT0xwM2x5eUVSODV1NFpRZ280MnR3dmZoelk1YmI1czQz?=
 =?utf-8?B?RXJYOWJ2eWk0dW1ETHg3aFA5SmtoSGhwb25NR2xxVXRJQWdkb09zZXd4T0dS?=
 =?utf-8?B?N1IzTDV6ZlpqemFjNHdydTZHLyttL01icVhZOWpLTTJNNjBPeWFFbmNjWXpn?=
 =?utf-8?B?bVYvMTM2ODJTUEhLVzVqd24vM2xjSUVLY2VyQTlGc2NVZ1BrNlNaV0dFTTh1?=
 =?utf-8?B?bW1qOUY0RnZteW9SSkpCRDYzcE4xWk5tN2tQbElMUzdUWStKOW1HOXp2YW96?=
 =?utf-8?B?S2N2NUFJdjdLQ2o0SUZjUTQzdlhqZGRoU29rTmhacFBGZ2J4b0JsMFNGbkNX?=
 =?utf-8?B?aVpZVm1YcWIrY1RwbXVGZ0xRNmQrTUNTVE53dHlRQVQ4VXBPM1FJeFlGdEpC?=
 =?utf-8?B?Y2dQaytTek1qTEgxNFBqSm5CSlMrSkgrSlVQaThEZVNRdzhGbnp4YTJtditI?=
 =?utf-8?B?bkIxanplZVRCbzdPeGtFeXVlSUFwVkRmNmNYMGtQYU04WTJjb3VKV05VSEgr?=
 =?utf-8?B?UWpWOFh3dGVIZEliRE1wTmwxUk4yMlNWMWROMUxqakczVjVBS1c1d2ZRVjF6?=
 =?utf-8?B?ZUx4Ym5GSkJsbHJlU211S2phSEhST0NmdEJuWU5GWnoxVWpwUXh4SFNSQ25s?=
 =?utf-8?B?V3lLQzZBTDFQd2hQWE9hM25ZM0Q2ejY2RnFMVVdQSXRZWWFKcUJEcFBmeUVN?=
 =?utf-8?B?UTRzenhEN3NjZWV3K1ZXSmRmeCtYc1BSL3ZHd0dpODl5WWZYbmZ4ZUFJcFFV?=
 =?utf-8?B?RkVMQkJLNnBkUVNCZFJuV3c4aTZiZTRGWjN3a0N1TDZOR0VHT3ZxeFpOcGRQ?=
 =?utf-8?B?K3BJekkwbHRMM2pNcFIySnVxQ00zSUNvaXdjcllybUh3MWhxUHdJUzJtemFK?=
 =?utf-8?B?ZDRHRGdLN2trMVNLM2ZOeHpDY2JMNWJ3VU5BOS9zc0g1WGhCVjBQQytEdC84?=
 =?utf-8?B?Z2kram41emVlRU4yVWJFTXhncXZkM1Y0N3loaUxLTDIzK3djOGdtU2JTSndw?=
 =?utf-8?B?NTNWcHRORDc4Q2ovNGswZGEwU2RqRmpaYmlkcG5qNS9pQ0Y4N1ZBc29ILzJk?=
 =?utf-8?B?OWJhaEdVdHI1ZEJNakhRWmJSbDRvaTFGNHdiN2F6ZXRoRjU5eSs3RlE0S1Bv?=
 =?utf-8?B?RDEzaXBtQjZOUlZXZnBvS2wyamlOUHh2QmkvUmVvVXpxYTJQTTBhV3hTV3JS?=
 =?utf-8?B?RTMzNUIrckh5WHR5ek9Kdk84cytIMXRhbmpOUkR4RHRkK2M0RkRsZHNuRGNy?=
 =?utf-8?B?Sk9zOTcxWFJveEVub1QyaUlCYkJMd1JwUkNiN2pCNkgyZFNaTHVwa0xtUFM0?=
 =?utf-8?B?TE1MQnlqSGI3RmcwM3l3ZlAyQWRsTUdwbmljemxQSWlIaTl6eFROaHF2Z0Zv?=
 =?utf-8?B?MjVxZFhQRTdUcnlTQlpqd25tRTNGQlY0TVd3MDZkR1NiamN4c0crWWZsZTRZ?=
 =?utf-8?B?RW1HVUd5UmhNSlowQ1JJdk5GOUN0RzYrNWJFZjZJYUh0ekZ2bjBGbDAwc0pJ?=
 =?utf-8?B?VlRvTXVJTEdvZW5VeEJJVUdRRjRBaTRLaDhkb0crWnJ3YkE2aFlzMTRJa1VO?=
 =?utf-8?B?czlGb3cxdTAvZmYya3BEWmtxTUxwN1ZFMlhnZWRLNGZGUE9BVzRJMjJCak1j?=
 =?utf-8?B?R1FqbERQMGtONTJ4YkhWRmI5aG4yNy9ETGppb01WS1N5S2RGZ0V4UHh5RUJU?=
 =?utf-8?B?WEMwQzdpOUVCTkg2WjcxQmJNZG00MmI4MVk4VlRIZDJybzYycmJmZENSaTR0?=
 =?utf-8?B?NnVCZ1lUMHR0eDA1aEJaSFRWRlE0QkhMbEoxWDJTUTJNOFovNXY0WGsyMmJ1?=
 =?utf-8?B?MElWczZTdkJRb0JFRWc4M09YM0g1eEFQN1pHTlJZWk9UZWY3QTFieGQxTGdF?=
 =?utf-8?B?bnZFYzRIY1I2OFV4Sno3S2k0cmp5TXpXRkwzMXI2RDVmVEdaV0FyMW1xVGhI?=
 =?utf-8?B?dnZmdmdnVjlrSWM2L3NuNkNNZlhPbUFWSm1kMVhWbTZMM0hUcG1iSUs3aks3?=
 =?utf-8?Q?+rQwoWAwDFzZ2mKDSYZ2XY6ol?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ce40f1-d616-4554-e33e-08db13549c49
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 15:10:32.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83t1I9HdHKsqO07Zjy16ZVNH6oVEeZUsEdJ+Oe0FHQG5Me0hP27K/ritqYfxRgncVH97Vg2HcN2ukTJ/cGlIWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5079



On 2/1/23 04:50, Jörg Rödel wrote:
> On Tue, Jan 24, 2023 at 10:35:50AM +0100, Jörg Rödel wrote:
>> It would be great if we have an equivalent to EBUSY in the return codes
>> to the guest. Something like SVSM_ERR_BUSY or SVSM_ERR_AGAIN, which
>> tells the guest that some resources needed to fulfill the request are
>> currently in-use and that the guest should try again later.
> 
> On a related issue, do we need an extra return code for the case that
> the SVSM got a fault when trying to access VMPL1 memory? Request
> processing can fault for various reasons when accessing addresses passed
> in via requests, should this be reported a SVSM_ERR_INVALID_ADDRESS or
> is another code needed?

I think using SVSM_ERR_INVALID_ADDRESS should be ok. I'll add something to 
the specification to state that any faults that occur when accessing guest 
memory should return SVSM_ERR_INVALID_ADDRESS.

Thanks,
Tom

> 
> Regards,
> 
