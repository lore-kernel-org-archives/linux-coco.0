Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3611D1B599
	for <linux-coco@lists.linux.dev>; Fri, 26 Jan 2024 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706276434; cv=fail; b=Ne7ld1yvFnlAF6kQJIu0QCVpiP7X2pSGdO69QQFlvn+gz1yvhCTlcSrvjSjSYSs5Daccm3t6MygIa33t7Sk7lpUt46Tc960Z3QsLeG91E08WGnA/CjXQpZovLHWW3K85PXJTFdHopmeApkavuSASIWSdjcLdB1MH0ThfhJmqUHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706276434; c=relaxed/simple;
	bh=uvv+XmdEzjdxNvVzX6P+ACOl5ReJCAfb6+vIDZlvisk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rqpyOV++8D9I6cufm0b4nVwJJ1D2PZucgoX4+SZv/mZuPSwfn1WC8oAx3PouNTCLj+F/o4ynpFaQ9LpnWAhIMGIvsqlKmvqpkW04RdH6wO7h4lvBAf7xFFe5TOgnwFclFbc2Gbf30J5dY//601XQoL7l+1baOJrVeyAlInPtwO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=maoWR+lS; arc=fail smtp.client-ip=40.107.102.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="maoWR+lS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTvuJSjUHr/ZbQCCxFEqYlkyEXKpv8dmTVqfBkgUCmMdgDozi4Iu/m9To4cmfOrtqeYzCc88tmvMt2UW0CTAsda/AcKp8C4M1ewIFMfWMyB8hK9KqBKn09fjRX1/z7MCmNW1S+DfZCMmMoEQQrvM2Ow77okJqFufhonUyTlufIRgqcxaku8hiMW124iuWzKja7IYhmVamjKvBnUCWnWRgWCOu/01sF56ETuoBL66R5HZGo5PuUNnN/ku9EnGqz6tBdpVXJYSAYpYi6x/zLwfnIETxd2VVfdqT6nTR2F5eaZpPxiBUQjeweI+4Q41REBjd80Umk8K4/1PXyOW1kCf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5p7IR6BkTviTBw7pZGN7MaqhtprBKB0xk2b7nUVedM=;
 b=nbaQuNKGLVwJICaJd4vET3+ZBTk7o+MXbQfRE+KHaKrpdZhNYCEO6TK1MzaXPMmabfEOC0xtel2C3cpq17gaJPfaLHjCT6dRXQ998Ni5vPKQ7ju6pcHIrFNWhUfHBHStrkeiDZjYnX8G9ix0yBopn7mvodPQ00+JEhv8BxZTzvC/5ffUQzuAY+GEJIg9cPevPOsiEvBxIP8GdIJP0zW3rbQHB0wsiq30la3NlaMdfqv2NfHNVoZnTE2bU6lUu5dBwqdrxmFax1Eo3PJmuZkb5jTlcjOCDCu28zZZSQGJsf5BspnOd1WS7PXbxaS9vGOkwQbdZy/mt7YvvIdg5H9QYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5p7IR6BkTviTBw7pZGN7MaqhtprBKB0xk2b7nUVedM=;
 b=maoWR+lS4tucNoUS5no03sAOfr3j9LjjIjjm9Wzij7kNAspT2lRI4U811Yx/ldevll306lgg+PnXYjxv3RjjcFuE7a9ZwuZGEkZAxrHddQg2kl5a0l/2axPBaf2F9niq1V385t5Or9ZqS+geTgtWd29anCkEOGk+nvaSpyWT2UM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by PH7PR12MB7871.namprd12.prod.outlook.com (2603:10b6:510:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 13:40:29 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::251:b545:952c:18dd]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::251:b545:952c:18dd%7]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 13:40:29 +0000
Message-ID: <720ee881-e3f3-4beb-a567-fed6e5b9949e@amd.com>
Date: Fri, 26 Jan 2024 07:40:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: SVSM Development Call Jan 17th, 2024
Content-Language: en-US
To: Jacob Xu <jacobhxu@google.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <jroedel@suse.de>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
References: <6C4D2A02-3B78-4F3F-AD1A-87A1C24CB8CD@suse.de>
 <CAJ5mJ6ix_+pJc+ty8OgEdZt4gwBXhJd00DbhccESJYZh9_wsUQ@mail.gmail.com>
 <CAJ5mJ6hJ_u62YwYae8Y6b7EFe6HRh8LBmtKyN5nCW8V8654_5w@mail.gmail.com>
From: Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <CAJ5mJ6hJ_u62YwYae8Y6b7EFe6HRh8LBmtKyN5nCW8V8654_5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::17) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|PH7PR12MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: c13e5111-2eaf-41fd-4d9c-08dc1e745c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d9PN4CTV/jRGZJvTBD1QehfBF63VKysc2ov4kUFbfp/FjxyATol4+rW1bXBne2PsYk/OvKxJWPq9apRKJxHeqfjdY6KaOmPsrxhRQvqb7bz4XnEVFIqx1d59UR8+pfZFcz9j4kR8xrAqxgjVEoPDdzQhX/84DCPLpIcMWfV+fhHMTSCxSzYXNqUJ2FOmRSzzVuKDAl3XQ91dcGIpEDVQzGlI/5RzOJhRlyTpjxPHOvzj5ZrHN+cnCT6/roKIIgHX8mqBNTlvdHeGl0XM4yg6FDAcEA/mCEr4UAZZLHlINzl65gI/apjfFmzOGxnPq0jxPJbubb817UOWN/kirGQ4Cxi/O2Dl1F9f6lHTYXWEWswmc/jB7naEUdmqEpXc+KN6RvaJbEm4K2Kg3lJY9ITzkENr+jssQh//ml3entxY23kywy4A4kL+s6o5vRxoDmuVQcVIf9obCh/fTIesSEPmtF5n5Lrj16B3BfWrcyy9tW0sjlmOqsZrZ6FdMMkKv4V/1VGYjw8E9QOLru8yAOpp3S7mWM481t7tNXJW9FJM2oqtIlnFlfIzkfRtuyFdV2dYdxrHtjk9asdm2L9T79j8JEvek7mEStHgyqsG2WCDAApz8ChDeEmUUmJdnhggfSNP/clzwFwcB0rwmCxbLsvT1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(26005)(2616005)(6506007)(6512007)(53546011)(83380400001)(66574015)(8936002)(8676002)(4326008)(5660300002)(44832011)(6486002)(316002)(966005)(478600001)(66476007)(31696002)(66556008)(86362001)(66946007)(110136005)(38100700002)(3480700007)(31686004)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG5vVzF3Y2cwZzlzN3laR0FXNjIwQkdOY3FuWCtMbGNhaisyUGZkK0NKN1Fn?=
 =?utf-8?B?MWNCTGdVVjlBc2tPa3BOaGxGNTZjSWJiUHgwVERmQngrVHRZMnMwN3kwTkY1?=
 =?utf-8?B?YUdkd3NHQVlLTVhNckMzSUNHVm1BWUhXVkdGZzl3bjZ5cUc1TnEwK0kwWmow?=
 =?utf-8?B?em9IVGpYNTJ6Njd4NjNjekx5aVNYbnBZdE5laVRQTXlJbHpEM0lOWklnV3lH?=
 =?utf-8?B?Z0Y0blM4N2UvejRlQTI4SjhrZTZscDVNbHg4WExEMHVHSER5S3JJcloyRi9v?=
 =?utf-8?B?QldTY1VEMDhoR2ZJdm9lTVRRWUNsVkZRSzF3alZhdmRkVUtYWW1IZk9CVFZE?=
 =?utf-8?B?eU1ZVTNuQVc3VExseVlOcnlUZENkMWZ1Y1ZDVmNRMkFwMldIMDdwZlFRY0th?=
 =?utf-8?B?dnlzVXYrTWhuU2YrMFlMcXdkYTlyQ3FacHBib0ZIMnJCOHMyZ1JjWmdGVGYx?=
 =?utf-8?B?QUF5YUNFdVM5d2tkb1ZQUTJELzBvK1hNanI0RnVZNncrY1lBMVh0eDNNaGtZ?=
 =?utf-8?B?dmN2aWxVeU53UFlnbGtkRDltYkxNSThOUG9iTWNFaWxIanY3K1lVME9wbC8z?=
 =?utf-8?B?NFFQekFVK1NGZTl4OEhZQlJpdkkrNmh5L1YwUXNjNVZjNWZxOW1YQTRIN1FY?=
 =?utf-8?B?VzRPZk9pYU9xSlFWODBmZkNpN0lHN3p2MDNQQWV0QVhPTHBSOGt1WWJYRGxy?=
 =?utf-8?B?S0J3NTAzb2RjTDk3M0hDNVo1ZXMxV0lWVUZJWG5vcDlVVUxaOEhaaVAyaXAz?=
 =?utf-8?B?bklvTG1ETExlVWJZWjVodi9FSkQyVks3WjNPV2JSaGhjQ1ZLVGVRb2VzQUxt?=
 =?utf-8?B?WnFzNFI2QkxMYmJwcnZEMFZHWU5yT2krK1VDdEEveGZsTGh4QlRvYkFGSlhD?=
 =?utf-8?B?RXN0dWIvSEJXZTZoTzd0TEpyRFZ1ZWMwTXB3UU4rYmlxaXlwbzVySmhXOFJp?=
 =?utf-8?B?QmdRUmh0d0JqbTV3U0hMYjA0MlBLbTJnMmQ1UE9za05OczFPQUhPQ2I0c1Yv?=
 =?utf-8?B?Wm5QWDRtanRTN1NHWkNrVnVJUEl2TEx3OTVIajZma2lIYzNhaFVHU3NBRnVL?=
 =?utf-8?B?ZFRUZEc1NTY3OW5qQmZSUEdYWVZiaTVqUWtxaHlWYTZMUmdKVGIrNkxHaGFL?=
 =?utf-8?B?MWFpVDhhbWVoaTluSzFoa3cwY3dwdnJQcy9HdzhIcWVQdmtidmdmODdMSUdE?=
 =?utf-8?B?MnlOYk1hWXZJS2xJVjlDZm1GY2dzV1RYck1Tb1lqd3M4NHZEM3BiQTU1NXVy?=
 =?utf-8?B?S1UySUJISnpYaVZveVhKczdjYk8yeFdSTFZ3Q1ZDUmNqNFNTcERrUFh6aEpv?=
 =?utf-8?B?ZDZ3TU03QjhhRzJyc05sTEdUSG0wTVg5cnoxZVZyWjM2bVZBUnN0OHM0K3lT?=
 =?utf-8?B?R3dqUWlsbGl4OWk2WURoVE44bUFWZEN1TGlDV0hVejFNaVE3dUtQNWdvY3Zh?=
 =?utf-8?B?YmViK2RBWTNnMFlBVUdNUU9nSGUrdDZ2RGttUitDL1NTbmMyNnRkZWJhekI5?=
 =?utf-8?B?cFRlMHQvTTY3NWs0YXJweHVxSmtQamQ1ZHJ2VWlKdGFwWUtvRlR1Wlc2aEJx?=
 =?utf-8?B?ZnBHaklRWnhYZUxmdTdWMGZkZ0pRNmk5WkRVMzg0M1lIWk8vcWtNRTFZd2Uw?=
 =?utf-8?B?OUpCc28yOWMrZ0pvb29MOUtIb0NqaHRZcGZ5a2pCZkhhSi8weUpkLzNPTzdY?=
 =?utf-8?B?V29tSE9mZk4ra0kvRUFOR21rZWNEK2dhbURrWWFRMTljNjNVVjJndlpoYjBL?=
 =?utf-8?B?cWNzYkVvWkNnZzFIZmdDRkZNU21nUktiYlJzNTdDU2JrMnF4MzJ3VUhMMjdQ?=
 =?utf-8?B?blJrbEN2VE1xWkhoR2swOGFvUCtqUXpTdlNRRE9wNEVQdUdVVVByTW9yTkRy?=
 =?utf-8?B?dXYrN0tieDhid3VNcHNldnRXNEMvTHZXMFBuc3B0R1RiWHBZa2g0Q3ZlSHlE?=
 =?utf-8?B?Zms3T1pSTGRDTUhCMm81eVN0Z3FtaFo0Vk1PTzRRRjY3eXp6ZW5FbXY4eWdw?=
 =?utf-8?B?bENMSXBPbjdHMXBtejFXRVlNM3JaTElzSVN6cVFNNWhDZ0NoR3puQjZpQTVU?=
 =?utf-8?B?V0hrcE1ZeUFLZ3RzaHk5WmlsUWpKWS9yRG1wMzhnOEZ5VDl5clVOMUlIVWJJ?=
 =?utf-8?Q?NpE+vF/Sy04hzi/3FDKBfnuy4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13e5111-2eaf-41fd-4d9c-08dc1e745c01
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 13:40:28.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2KyAtKcB5o3Sd1AZNcAF9ra0bkrzuoGWx5VThhtf9Ns4lQNqYyGr+ik6dokwlZ2Cn5yajqsYXfHcnlQErbBVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7871

Thanks Jacob!

Carlos

On 1/17/24 11:46, Jacob Xu wrote:
> (re-sending as plain text instead of html message)
> 
> Hi Carlos,
> 
> Here's a link to the AP boot race condition mentioned during the call,
> it's on the SNP host-kernel patches.
> 
> https://www.spinics.net/lists/kernel/msg5058122.html
> 
> 
> On Wed, Jan 17, 2024 at 9:39 AM Jacob Xu <jacobhxu@google.com> wrote:
>>
>> Hi Carlos,
>>
>> Here's a link to the AP boot race condition mentioned during the call, it's on the SNP host-kernel patches.
>>
>> https://www.spinics.net/lists/kernel/msg5058122.html
>>
>> Jacob
>>
>> On Wed, Jan 17, 2024 at 4:48 AM Jörg Rödel <jroedel@suse.de> wrote:
>>>
>>> Hi all,
>>>
>>> Just a reminder for todays SVSM Development call at 9am PST/6pm CET.
>>>
>>> If you have any agenda items you want to see covered, please let me know. Otherwise we will just do the usual rounds of updates and Q&A.
>>>
>>> We meet as usual at https://meet.google.com/ppv-xehx-dvb
>>>
>>> Regards,
>>>
>>> Jörg Rödel
>>> jroedel@suse.de
>>>
>>> SUSE Software Solutions Germany GmbH
>>> Frankenstraße 146
>>> 90461 Nürnberg
>>> Germany
>>> https://www.suse.com/
>>>
>>> Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
>>> (HRB 36809, AG Nürnberg)
>>>
>>>
