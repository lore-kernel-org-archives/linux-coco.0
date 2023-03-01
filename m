Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F352F32
	for <linux-coco@lists.linux.dev>; Wed,  1 Mar 2023 14:00:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsYGkNuJO+dSPFjjjeRt76RyzrvQzExJKqNsHxA3voDzal7ayw1bbD/43Xvds5HOYkwV4FbGX3vxzzac7a7anaMPQd6koKJ26wx6s4eOPiju6HmjOTs5oArPbb5l7VZuzhMG21l/H3py5fan8R7ySuuDCCRTtWlbN2p+z6KT+9GdVpT1y0jJCswSHyfFwfT9WNGH9j2S85FVop9kNcHrA1s2SdQKlHQwZrU8oVgmL1LIlhOjNPscopeDnW7QjnFMKIxcaOQz6eVnjh9yGtq2XnXyygGamJr+P6MDlMyXLSoSevn5AXcjTOVTa9uk9Q62/Ki5dlkBJBfLxEOODQd4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waoooZULINIQ2olbl99d7XWBmrBaqWE2W8NH7XG3SE8=;
 b=SqDZsI/A/W/iL9KGrvbK4liS1CSbS9VQ2RYswMja9tCrfSYyMDXIWtq5my0D4yTt8XhVYB1tmGWMPXjiYVfqlWp0Voql2GBDDDSml7D3wDq+pB1Astjqts5aPGPDEUjO3DwfB7LeoYwTfLuTQxkPVJoIIXqmQUV3+N0OZphNpEh/spA3DPNdCAOcHxgeJzSwLB7zzlcofK8Y0zVYK8lhFaRcUKj1rthhGkxAa1Mq5fn2WUN9kQ1h/xOg7Bld2lqfS0IBxCI/xWOoLaj1QwiAOgbmJyriVZsZa8zGTIcbvEga6aRNQT3tRW6QLXqFwM7RBPC3hPO+V2abW4DeEm0ohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waoooZULINIQ2olbl99d7XWBmrBaqWE2W8NH7XG3SE8=;
 b=JwWJFVi7yufk5XSu3pOyonoCAkxhp6yG66nPlMuFl5TZWsthB9zNWuCqzdHpsoOCcjQOrr+7/puL6j37+lQupr0XZw55QDeyDt4DYY8XTTGqA2YN1EEvnyRMG7tKtVEK+Z1z/O8BHb2QK0CAJVUljvGU71nk+SdiQ98MGuRT7UU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 14:00:22 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%5]) with mapi id 15.20.6156.017; Wed, 1 Mar 2023
 14:00:22 +0000
Message-ID: <83f6f3e1-b026-8700-e838-2dc01cb219d8@amd.com>
Date: Wed, 1 Mar 2023 08:00:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.61
Content-Language: en-US
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
 Jon Lange <jlange@microsoft.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <Y+yqpq+S3N/lIKjQ@suse.de> <069c74a5-2735-adba-5748-090e80550c9e@amd.com>
 <Y/jGcMhXfEm8MCYK@suse.de>
 <MN0PR21MB3072CC6E9027D4B75560E05FCAA89@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y/mrpV/pPxUontKF@suse.de>
 <MN0PR21MB30720428EC5692B2E9BE29FACAAF9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y/8TMl9M3WmDRBoG@suse.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <Y/8TMl9M3WmDRBoG@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:610:50::16) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed5820a-c11a-4c70-4133-08db1a5d4c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2m+nRlqxfL22y6hZMXNABoy3iw31me8uGVJfL+TX8gVn48ubbrUj2PmY1z7b2W5+fpY7vnx4Zlvy8elVT4Qt5U/EsrX44tvyi/OW82qeoGMJ2lB0vBpdDPlIF0F92C0SHjfhssjI+V6rCTZX1arSfW2nvH6LeWU0NyZ9UphTYSYmuD8XMllOOTVw4bFQIcaWYeFWJn6TzwmQaNdC6yYlOGtlYIDblSsBrzLobMyickeqLOGCvHSrLopgoHvySDkeIzyr1QO06TBeQigmiJW10DhUVmmzwGU/LSRS76MV//os7tqnY2CxmFnu1lg278TmStdiXXDaHUVFxeCFpCK6DDwNXdugjAD4Cnkcm8XXRwzg3y8dTatFrqlPobSE8I7SIWvyM1ERDJaDdaojshdRmUcWx/PIG4Oyq1lgU2YG6lnBD7O9q6yaMcOIL5GZM4in62PDnOZhRwoRW9/pz5touNwisPmvNadfJ+adc705P7BLYZNMxd43/auYc64VXtoaTBh+PD/MzxWHwy/3bdRTTjehfoNYJA2P3WbwjBpGrShWpuj8SsGoPKNVy13QgWIinB+f9yFS/9Tbjg/+cjgsun61LOVZ74e6+XegJm9ivE/dMV59vwp73o2zNIRChDAsj/W6SWLhXddPlmZy8WZ2CC1IGV/Wc1ZR5uWGyIe6MExW63zTc08my37G1vEBlFnrSqWnaWh3ay30ZizF67FFC0Ejk69nH8jILMFR37JCuDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199018)(31686004)(36756003)(83380400001)(478600001)(316002)(66574015)(54906003)(110136005)(4326008)(8676002)(38100700002)(6512007)(6506007)(53546011)(2616005)(186003)(26005)(6486002)(5660300002)(66556008)(66476007)(66946007)(31696002)(86362001)(41300700001)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1JnYTBwWmFPSDRtN2UydDVsOVFKVXlVUmorZ2Q0aVhGOU1WTDhQM3N6NXpi?=
 =?utf-8?B?amxPV0NRUzRYUWU2SnNncEhEdE9DWm9scXZQUnJwZFhmQ3RCbXZSVUVvL2o5?=
 =?utf-8?B?M3pzODVQWDZxT0gzZFhUWGczaE5FUE9LTHZFTXhiRDdPTWZwc2pZK1o1RGFV?=
 =?utf-8?B?WG1SM2YreG9Jd1RYK0xXZWNoZHJZRHlKT0xkcXFndmNhZS9UYmNPSm9PL0hw?=
 =?utf-8?B?dnNMQXZidG9PdThjTXhzV3VuRVF1dUpGaGM5VlNRbHRqVDB6WnJQVW94c2tQ?=
 =?utf-8?B?U1Y2ZVRUTFNmZ28wWXVMU2RKQStzSEVEbkgxRGt0YVdiQlpQSFF2LzZpR0U4?=
 =?utf-8?B?YXBzMHIvMzJoamhWYnU5QVk1bGNiSmhnV3dHUUJjTHlHZEJOK3d2bDRndnAx?=
 =?utf-8?B?Uk53ZnVhN3pSM3YrRVdHeUIzVWQ0T21OU2ZiRFdEaTJ6bEdTS01FKzFEWnpE?=
 =?utf-8?B?ZmVaZWRUNnZYeGtITlRYR0NkcDEyTDBHU081QVRnWmlKZ1Y1Mlk0aWF1TEdW?=
 =?utf-8?B?Ym1mdVNhVk9oSmRFMzB0UTAyRHpqenVWSklLckIvakI1OWpTUXNDbllKVEV4?=
 =?utf-8?B?T0hYOTFxSjIzZDNETERDTkpkVVp4Y2c2YjBhVjlQcE5ZNzZwK1Z5dk5meFpJ?=
 =?utf-8?B?Q0wzcXdPRUZJWGo1cnd2S3lBditzSFNEYitReVBRTjU2K1RyaEFla2VHUFVK?=
 =?utf-8?B?bGp3VlBjZFpuMWQ0MGhTaUszQ3IrWU0wT1hTbUZ3RDZ5eVZVbUlwSnlwZmVr?=
 =?utf-8?B?bFJpODRPN3MrUkpqZnhnb3dPdUNmNmZzZFBBaER4dnNudVpNcG9jdnBkNWli?=
 =?utf-8?B?L3Y5SmsxZDJQWjRVREQ4SU4yUzVoQmdRS25YeXFHM2ZqK2FRWCtwZTh1UXdh?=
 =?utf-8?B?YVdzVmZNeldXdlhFVm5tbXQ0RllpbmZOdW9MR0tvMCtqWU1iZTk0c2pCaDdh?=
 =?utf-8?B?NStBN1hEaFMxdmZINldaOHhHdUJnd0ptRVBmOStXY1IvQ3dha2EreTVSamE5?=
 =?utf-8?B?R3g2ZVlkL1FFS0cyZ2IxSzV4NDNYQUZxK0hEQmVQcy90TXpXazl2T1JuUUxY?=
 =?utf-8?B?cytBS1M0ODc4eVlPZ3lsWkFpQ0YwVlBSVEpIS29DSVZXNUhkZWNBTnovaC9p?=
 =?utf-8?B?OGZBTnlXakZrdDdmbU9hSWVmYzZBRXBmVkdPdkpnRXpVSXBUc0M1YjMxc2Jp?=
 =?utf-8?B?NnBxZ21SL3AvakZuVlNuSkwyZTZSeWRLNVJJaXV0azd3UW5NNG1iblhVOE0z?=
 =?utf-8?B?NktzOGhPNFg3aitKaU5DMlg1UjQ1SC9OMzVpK0hwaFJDN05CYTFvanVpbm5o?=
 =?utf-8?B?ZXd1ZHFhWFRRV1N6enJVaXNuazdkbEM4bCtIRStybnU3TTdsZEx6U2RYRjJK?=
 =?utf-8?B?SmN3VkwrNWRGRzlGOUM0Nk5YYkpZTnN6dGlpWUVBeXo5TW8wZGFlMTEvZ3J5?=
 =?utf-8?B?YS9NdGNpbEtON0s3WnNncnJqa2xIZWZ4azBwb0hCL1RvWkh2SHZXUkhrUEc4?=
 =?utf-8?B?VmVFam1USUVrb3N5S1Y4c0xPZlRhOFZDR2tvZEMydE9zdWdoLzdaRExWQ3Fq?=
 =?utf-8?B?SDRWRWdoajc1eCtWVnBJdWlEQ3JER294dWtvOWdJN2xsT0c3YlA2NzBnaUFW?=
 =?utf-8?B?eDFFZXdtRG9KZGMyb0Z0UmYwaE1Iem8vTko3K1ZNais5WU1BZlFuWjRSNCtL?=
 =?utf-8?B?ckVBU3BKMW44emRFdWJ5QzlMYUY4YkxCVUNUeDJSbGp5L2F3NCt5ZGdCRVE5?=
 =?utf-8?B?ak9nNFhSSGZkU045TTVQRWc1Mkc4ODdDOHgvclJqcHhXWnkveVhqdjBtS0JT?=
 =?utf-8?B?TkUzanJNa1ZCNmJvTTI1cm1pYmZMalpDUWYxUHVqWkVPZUJwT0szOUtzQTlW?=
 =?utf-8?B?UStPRFE0aTJDb2FzUXRaeit6YlF4eVQxcTZSeFV4N2xYSm5wWjI2NkJzVTFG?=
 =?utf-8?B?emQzck5RNU9hdW91V3gvbHhNUEYxc09kcUJMdFdXa0J2N2IvODUxaW8wVHJL?=
 =?utf-8?B?QnpUcXMrVXcycE5jOXRuOUdvMmpKNENsVDFLdFpTSzBicmIxL3ZpdkMxK29G?=
 =?utf-8?B?eHF4dG5ka01MbTY4cGZyR2plUDdJbThsakk2MU50a3BkRm1Ed3dUaHV0ZWwz?=
 =?utf-8?Q?pSFPNuiaCkZfe45o9AxmhrEiI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed5820a-c11a-4c70-4133-08db1a5d4c91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 14:00:22.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSqot5lcSNFJZ3edb36pHt1mh3Zq1Jk+WmjY+L3pBO34v3JtJ1TZWSWozneZCQ9yUyQOiLNWeTNA2InIewbzsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350



On 3/1/23 02:56, Jörg Rödel wrote:
> Hi Jon,
> 
> On Mon, Feb 27, 2023 at 05:03:07PM +0000, Jon Lange wrote:
>> It's true that the SVSM will not know if it is under attack in these
>> circumstances.  However, delivery of the #NPF prevents the SVSM from
>> making any forward progress, which is equivalent to a denial of
>> service.
> 
> Right, I sometimes forget there there is no guarantee for forward
> progress, just for confidentiality in SEV-SNP VMs (and CoCo VMs in
> general).
> 
> The interesting question here is how RMPADJUST behaves when it tries to
> revoke the VMSA flag of a VMSA page that is currently executing.
> Documentation does not state an IN_USE error code return, so I guess it
> will also cause an #NPF.

We should not be in the situation where that occurs, since the RMPADJUST 
won't be performed until the SVME flag is cleared. Once the SVSM flag is 
cleared, the VMSA can't execute so the RMPADJUST should just work.

But, yes, it would be interesting to see what happens. I might try to test 
that just to see the result.

Thanks,
Tom

> 
>> Is there a reason a failure code is useful instead of just blocking
>> (or spinning) in the SVSM until execution can complete successfully?
>> This situation can only arise in the face of a malicious VMM, and such
>> blocking is no different than the (malicious) VMM choosing not to
>> schedule the VM at all.  Is there something uniquely useful the higher
>> VMPL would achieve from observing a failure code instead of just
>> waiting for completion?
> 
> It would allow the VM to make forward progress, but in a situation where
> it is under attack this is probably a bad idea anyway.
> After some more thinking I came to the conclusion that the VM must make
> sure that to-be-retired VMSAs point to a code-path where it can not
> escape anymore, like an AP-HLT loop with a zeroed IDT. This is important
> to consider also for higher-level VMPLs.
> 
> Regards,
> 
