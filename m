Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B023A2
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 23:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L26nESq7r6mzQZNwRYqybfVc51wk2NVn9SHcmlDSmjnAxEH23Ahr3hp27F8cOEhqtDdjHjx8NLSATfNpxCzOHqewOlBnBS09gEDt9eD+eNB9YPBbVNgQPobqeKyMIZl9VFqv8KWb95hqDtmJpXVGqxd3Nxl+y3a3vHt9o3pwkDRsl6fWhdW0r31C4X2Ad48LB14Bcw7ezEDpYzYe/gxr7bXy9lW+iwSA1bXxh9vNRPth7nBpxIOrjPDLsma6Vt8eRye65zZZfYkv9l+kK3yAJmkKpqmOR+lmQ7kKA5BsKP8gQnkSJlWK2yoMKudg4wb2HRp7uCHpc5QotXftvkb7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtY2NPQWEpiTm8slyt1OSxHZ0+cMez9/8B2MPf207Fg=;
 b=F/MOBxBJp+iwF8qnKIC/AALjOoM1/VPz+pPn6BG80bbdyMBtpSvjHv07ogXDhSjiXDSJ60uNY9K1pPo5a3/0KtQpeGJ/Se6H9foDu4N12awIkIcOf796ofvvRYvPX4hpRlibbHg2m2NUSOMLphuAeFd6WKtAcB/bmEZLXDJ6p9fxm0jIpLKqs/ntgjgzInURiCr7fBnJGPAXVFegv+1QbPwuyUN8I3hGK4CQk06oKHiUYQb6HEnUparxBbQ35U3RDhMzDJSCS+/wAL/tMA3qc+TORJcpuV8ebcfEnZHiGs8BE6Z4KEOMAeh9GTZpN2AS0faCU6pGFJnXjvUeQZzDwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtY2NPQWEpiTm8slyt1OSxHZ0+cMez9/8B2MPf207Fg=;
 b=350+pj5VEqnHSrMGkpQ7O6lXIYaACgbzxJwB1als8DZnuDm/rBWvz4OIpINtq1AGqptXSk3hwnYQBF025fYifhBkAbAkuNE9CsnVsNLp0vEdATkLXC0z9eIuEkn8sjC/mtUn6thlQoA+/NPtOiCi/5VVpFqCWxqNHCaulLmeJpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by PH7PR12MB6738.namprd12.prod.outlook.com (2603:10b6:510:1a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 23:00:13 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 23:00:13 +0000
Message-ID: <c29bf3a5-2970-245a-40af-569fc933282e@amd.com>
Date: Tue, 10 Jan 2023 17:00:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
 <6303283f-cf1c-8be6-9359-69d556a89554@amd.com>
 <7f6782cb049398e9fc28176fc15456f55a3365ea.camel@HansenPartnership.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <7f6782cb049398e9fc28176fc15456f55a3365ea.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::8) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|PH7PR12MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f026d55-6996-4fc5-f845-08daf35e6e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OBPi2d6An+17XdjnNp0fHEJWYTF2D5RN+lyGh5AwyKBHv9NAuG+3T2JQymSeB6lebx8Dv1WyV7OKgpAk56LyORg2WXNDfzq4hCZiOyOEJ93w+eDhx2CLN50zMGS5bzNKW6SrEZ8DSuuwLROAwz0/1Pxqxpa0cqHJSjjbfG57jvWSOY3zsATA/EtmpUdSWrOxaVL8aw5bvn6EqzpNt0ptZQ8FFkJW8uYPKXj+WPAWZ4DiX6T9V9HqASYlD4cNKg8yMxOixuIup1h/tSIZHuZX5jQM63KI4PgOGRR2kjor5IziKEZHm7UvoHdo45c4QRAjJEbJrnG3gZQsp8n1t1ea0Si1xkJVLWoNgxLSQlqckC2uDuLZLp8dNQigzf3ibxQsseXKrpzLTc8hRsyKiyvnFJ98Fr+B6DkOso35TC3uIjZurzz6h7r+7ABewElhZt0BEnhHLFv4ZgE1y70KETrhJToPtHcGm7kYOT2tNrndUPxXV7AiZCShmKzL2IRGj9RKcwZhkUphBIvXGBjfuUTsvhP99X5Sp+JhWgPCUMQbC0zmAr5gOQ7XlIx0nPgLgoGv7qm4ESZyznut3i7HwMhwrTi9Tc9QCjFCeunRDUIOgyePdrjcE9f0GzEyPzzlNw0Vu8SuIHIKQ0xWebuyB7tuPMXuolxT3eQWiy/5d+qSftCAxyYc6s55K8kS/WVbgqW2/faO3+G4DxjjqL0ocL7y+PLpjjkHt0APd+XUZYMr1Jo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199015)(38100700002)(86362001)(41300700001)(66946007)(8676002)(31696002)(66556008)(66476007)(110136005)(8936002)(2906002)(5660300002)(316002)(6512007)(2616005)(186003)(6506007)(26005)(53546011)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXhXMDhzSHRjSTlIb2pGZk9DeUZpclRZSUVOZDJLWlA5WUlSQ1pOVXlOOEM5?=
 =?utf-8?B?Z1N4S0UvKy91RWk5VGxvUjRXVER6bGhUb1NLbGFFSTV6Z2hVRVhLaTRGdERq?=
 =?utf-8?B?b1E0MG9lQkY5QlMxNjVuMmdnT3EzRWZkSjdQQTBRY3NqOUJUZm1WQW8rWlRR?=
 =?utf-8?B?U1hFTVFUcTFFZEJ6bDFKUlZNRm9iTjBIb2NScEdnTlo5U2hLSkY2UDZuQW1o?=
 =?utf-8?B?Z3RPc0IrdjNyKzVURW5Lbk8rWDNjMUdDbFkrRG9UZFpCelMyak80eXRablZj?=
 =?utf-8?B?N3JQbUV6VE9pR0dmUnFIUHUwT3RtTE16TmxISS9hL09YdTFuSEthUTBJU3J1?=
 =?utf-8?B?T214amFiblNFczR0bTdGS1NMUEpVdlk1VUoyckM0dzV4Zmkrd0o0eGFUMWVk?=
 =?utf-8?B?NWRTdkRNSklmLzg1bVNkN0xXMXV5OVEwVGpxclhkaUViWklBUEpKU2wrb0VG?=
 =?utf-8?B?S3NsTEJJOEdobUpUM3RlcWVDa3dzdzhSZCtyUEwvZG1uWThxa2d6V0NMRW5S?=
 =?utf-8?B?b2s5enVMdURJdjM4S0hwdkliK2NBdTZMZnZRYURENWZMSTBJcVNFei9xbExl?=
 =?utf-8?B?ZjVIS3VkRDlrRzFDd1kySUdFN1VjdEIvNFkzcFUvUkhKT05zTGVyVUUweXMy?=
 =?utf-8?B?TnZXdWZVZncwTWtNcnNmQmdNNmZWY1k1WCtyZVV3YlNSUitXN3N6WHFZMmlx?=
 =?utf-8?B?VnhEbEFhWU9HYm9wWkxmSUlLTDdST0Yyd0xhTkM5ZjB0bWRKSXBMNkRhT3F5?=
 =?utf-8?B?WmRqelhDS2FpSU9BVnYyTkJGWmc0VlA2dUhSTFpXYTNxRC9xYURiMW03QU1a?=
 =?utf-8?B?a3V1ZUFTYlZMS013ZFRrbmY0UHEvZENoZStVWGZwVXV2aU9GZ1hET3FtL1dT?=
 =?utf-8?B?U0ZBUUlpK0hRRnRveGlnMnFqUFNFYTVhVFFVaWJGVkhMKzdXTzJTTkY0MFZN?=
 =?utf-8?B?UW9CSHkwMUZ4QlhuT1kremNmL2R2SmpzeTZnVDJ6eG9abTAwQUZyT2NLL0sr?=
 =?utf-8?B?M3U5K1RQVXFCVCthMy80MVdwTE05YzZsc25rTXNGeG56RXk2b1VsYjRscHd5?=
 =?utf-8?B?ZUIxempweHd2ZnhQOWNxQ1dvMFcwSDUyYTFBWGRLcXFWK2tPSk5CZmRmYzF6?=
 =?utf-8?B?S2t3ODJFMGlKdEV0TyswZForNXo1QURFemUvRlBaV1M4NmxwM0lTRkNsU21M?=
 =?utf-8?B?WjRiS0NZYk5aRlRHeHlEdVl5by8xWUlmNGZHSUF2aHRDUnpKZUxaaU1aaWJX?=
 =?utf-8?B?Slg4b01QaENTQXVSYk9tcG1hNThUMlVJN25zQTlQN0tqMXBwMnhkN2FWRm5w?=
 =?utf-8?B?aVFHK1VJQlNZZXBnaHhrenNUV0lQQnRNVEEvbmMrWHRlSzVVRWRlaUNRakZa?=
 =?utf-8?B?bFlUaCtEVVpuUHRCZTVSV2NMME5LU2o2OGR2blB1Y2F2MEJsR1pldEcvZlJS?=
 =?utf-8?B?YXQ1cmRNdWFDRndhOHhzQ3lLS3ZIRUh5RVNrQlNGeFRBQzNGeWV5RUdNTmtn?=
 =?utf-8?B?RTV1Vm1pb0hnNzRiaURqTXhlRTh0bGVZS093NXlCa2grbkFFSElxYjJZY1FZ?=
 =?utf-8?B?MjBmQVZPeUp5K3pqeGVZUWM2eEpHZ1ZYM1YxQVlVR2MrVlJMb1FScEFVUTJv?=
 =?utf-8?B?QnYvQXcwL0haTjEvUitPSVdxT3YwektWekRXVkxZTlM2ZDZZWHJlcTNrVzNz?=
 =?utf-8?B?Q3BtV2dHQ0RZbFprUmsxS0RKYnB0SmxlK1FhWExIZnRHSDg2RURkb1BtbzFS?=
 =?utf-8?B?MC9tcEExSGlkbitjRWw2TWRRKzR0MWZFSFBjU09mN3VMVTFMMnFJb1FWZkRS?=
 =?utf-8?B?SnlQTGpxaEJYSUZCUlVNOEkyd2lCc2lUa0RjRHc3WWZBTkFrUXB5RS9mTDd5?=
 =?utf-8?B?eHZneVJOWStlNXRYK1FEK1IrNDZoa1VPbGZKNzZ0N0loak92R0JDQVRKQjRv?=
 =?utf-8?B?eW9HdzNLdTk0V2JURUJaakltMUR0NnV0U25zM3FzWnJsdllDaHFUOGJhMUF5?=
 =?utf-8?B?RmYyMVBhWkN1dmQ0QmxWUGRYcDRoclJEY2ZOS1ZuYnFKNHhZVHlyeU5XQ1Zi?=
 =?utf-8?B?cWZ1V1JVZmhsY1BkR1V1NG1SYllUNEdUbEhKb2lFMzI0OHBXWmV2YTBicTFk?=
 =?utf-8?Q?E/Goa34MV6e3h2I9jG5A9tLrT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f026d55-6996-4fc5-f845-08daf35e6e82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 23:00:13.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boBmOoAUhryAgD64webxVCIDlPQwc0wWpHDw2/Dx3rn7qm5u8ft4n8KqBFht9jUa+ww7I4fs0duphBm7hQCsjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6738



On 1/10/23 15:47, James Bottomley wrote:
> On Tue, 2023-01-10 at 15:32 -0600, Tom Lendacky wrote:
> [...]
>> My thoughts were to again use GUIDs to identify the key and key-type
>> present, i.e. EK RSA-2048 or EK EC (NIST-P256), etc:
>>
>>          16-byte data GUID (e.g. EK EC (NIST-P256))
>>          4-byte data length
>>          data
>>
>>          16-byte data GUID (e.g. SRK EC (NIST-P256))
>>          4-byte data length
>>          data
> 
> I really wouldn't use GUIDS because the TPM structures should all be
> self describing.  The structure we're thinking of packing into the
> attestation report to be hashed with the nonce is the TPMT_PUBLIC of
> the EK.  The algorithm, attributes, policy and name hash which are in
> the public area should define the exact template that was used to
> construct the public key.  Note that there are about 2^70 possible
> combinations, which is why I don't think you want a GUID for each one

Ok, so this is different from what was originally talked about being just 
the EK EC key andr the SRK EC key.

A GUID still works, though, to describe that the TPMT_PUBLIC supplied is 
for the EK - unless you want to go with the known handles, e.g. 0x81010001 
for the EK RSA handle or 0x81010002 for the EK EC handle, etc. You still 
need to identify what key is represented by the TPMT_PUBLIC structure, 
right, or am I missing something about the TPMT_PUBLIC structure?

Thanks,
Tom

> ...
> 
> James
> 
> 
