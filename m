Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29D579C9
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 15:13:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGT5Y4fjw/a17fQmAq5g7xjKRxm4gQjIWC3/Hj1e1jgbWg4712Bw8zs+CAPbkWosDkmgROS3CWwYV0tOur61DX6i5x0NT2fiooshiCtPBG9IMXriSU9uW2P7CZpIugHjXHJuL1I69C81FoQcR6E2W2DCGpPz6fObo2hBKcwRBY3cGJFB2FZOgbCS+d8oW5pXISfjRH2VPeGuzjeUYZ86kOSROSS6obtjifSngM1F57oxlsqQgbruuoap6Poa0VpsPPNIQGrwDBHA95k5G1MFciXxJNduoPGc0Dg0KvVgq3bAcecb0EFAhRNfCkpqCyq7P/Y/V6Qsg2kb7hL2yBVkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6aWCVx0ntWhMp7aSOwG+LGiCBtc9igixFM1cwtjYco=;
 b=R2+BioOpauF8OPpWqSJY7Mgo3czU6uwc6f+Apc52yH6FnRt9JQOKub2+k12Q/UMaSsrww42WWUmUNs1OWgu6Ta1AqwLIF76ypqWJHI0zCJf3qzpnm+JrKONd6dW/GuHdAhGVmOmJw0FFs9cJNrQWewFbYLpEPPhXdcmbZ3HvHIGB3tUPJ0ff6nZqyS+Xo4obNXbfvy1c2lYWzj5y1St9++z1gCdLNqPgAC8ZSlSsIA5EL6ufR+wwxKLlb/p0kTjw9K9gvzt6667cnbYLPGoBVRzctdona0nD35ddNasWiVlfGSux/UAi2ldtNGEpaYj/XnoKTOOKspQxggxPscYlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6aWCVx0ntWhMp7aSOwG+LGiCBtc9igixFM1cwtjYco=;
 b=JLPl5nLgePz2JwurkGSMrbObWV2FfM5jckeWtkP0j61uRKzatOt3xTsLuxC0zxP2k5ImjY6qMc7vgjzzY1TcoiTzg9UDa248AV1TPi6ypxkHV0aok2X+42+inULsNL6MDfuGFw8utzZlygPLzMLBIBuQSDooZAFvLm/1P0Q3T4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by BY5PR12MB4855.namprd12.prod.outlook.com (2603:10b6:a03:1dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 15:13:51 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%3]) with mapi id 15.20.6002.013; Thu, 12 Jan 2023
 15:13:51 +0000
Message-ID: <6705338d-2fb7-4f6d-6a5b-2a860e894a20@amd.com>
Date: Thu, 12 Jan 2023 09:13:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Christophe de Dinechin <dinechin@redhat.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <m2tu0wrjv0.fsf@redhat.com>
 <777e87d6c77b2c6287040242f1f2759266778eff.camel@HansenPartnership.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <777e87d6c77b2c6287040242f1f2759266778eff.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:610:b1::27) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|BY5PR12MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbd171b-8117-453c-1bc4-08daf4af9ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WiR2xXsJ+nD+VzsHfWATp0ktQ+tZD9VHxSgnU8PBd/BUcELx34F7CKlfx9NeIfJLi++JOlWohoqKWu/LbWaBLS9njKk6w9KpJcwmi4HE33+t8G/VSdMWwVq9nuksx7wrbtlgT0D0Y0AE0BHjghCdYV0K5tEBDaNYImErCYxfM7B6VTTKr9K3iZ5zIwnbxhliB7c8dhz4Ka+zPbnOktVrh5WPJoOOd5aGvJvQM+8ybLgq1faf4jBVMHtkWHO16FcmUK01bwm2kX688Ju0dKi4Rzd0BSH+0aYSSrD1tTy5MR9/rV4V8e6RNHnEvqIg2svS4w7Qzg4jjmHdAO8VQV/KojkdyKV7UGhcbvhjee2g0mIaZKv/2aavtdjilpcwDzVTEj4WCBCi+TDN9Ef+MpnOppPIcS6FU16bm6qUwOeX9PV05lldBGAp2Dq8fKd1JVEmIAXleTvbcvbsnxP73xHcsMbfI73USYj2GwZDNkzlZukuEt/iGyMSdCZ8bzcp3a98PXa2POMGeEXTG+KOhCWUDEuKiAN3yhUV2fXypMtkvKENqm6jMlPM/tEKcaM8M/mPh2qAYwll4QrZSlMiVA4jBK2dsxnR8lCRxJ3WwS699E+7jud97nd0Vxo/n3URIpI3Xiho8YHXVmo/LmmJUUsEWiTxl6661TjciLt1nwXTZmVJjGs7JNQIZSewvwqQ07MLad73GsVaprYL/46k2Veudao4HJtAIBpw/JHHSX+TheY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(86362001)(31696002)(31686004)(110136005)(2616005)(54906003)(316002)(8676002)(66476007)(66556008)(66946007)(478600001)(26005)(186003)(6512007)(6486002)(6506007)(53546011)(38100700002)(36756003)(83380400001)(41300700001)(4326008)(2906002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWpEWkk1RUUyWVNJOTBia3RvVFJIVWlXRHN1dGl0aUF3aDVLRmhtK1JtbFdR?=
 =?utf-8?B?dUlaWGFTeUY5SkZ4RTB3ZEsyWHZVVWRVSm5lV0JGdUxia3dmTW5XbHpZZklt?=
 =?utf-8?B?TW5vU1ZCMW9qWXh3UXY5N21CcXVWT2xqTzRCSzAzWlRmOUlJNVp5Wm03R01u?=
 =?utf-8?B?S3lYRGFQU3dYc2U2K2h6MjFvaERrWTBSYlFPWkpXQzkvN29TWG1USmxwZmR3?=
 =?utf-8?B?ekRJdVJTRjh3RFhjQTYrRVc5OHhZTTcweW81cTQ4WVVvbG9oTlEvSXJ6ZzZu?=
 =?utf-8?B?YlVERTVFdjVlc3o5aUlTNEh5b2lsQ3VUb0l5b1VybWt4VnoyTmJpWUtabXMw?=
 =?utf-8?B?S3ZvUUZMR0FwekwydVYrSUFVZlhwalFvcHJFckdnc3AvbzVGajQ0eU1remNW?=
 =?utf-8?B?QUU0TTM4SDIxUWE5U3JMM2NnYy9TeXBEM2RmdDJLTm5WdEtyQUFiekc5MkRU?=
 =?utf-8?B?bFJmM1gwd0VBWTVYcTcxc2g0MFJZRXVuVmcvZlY1Zmg3eXBNaDhpSW5uZTNX?=
 =?utf-8?B?R3pEd045REdXWnZxSms0VFpuRlQ1d1ZveEV6NmF3NGYrZzVCa1d5bWg2bEtH?=
 =?utf-8?B?MURsejZlZVN4bFptaUFWWStqZGJqVFltWEpRd2t2dW4xNll1MjNXSE16TFVo?=
 =?utf-8?B?WkczTkN1Z1VldEhzdEZPVmNBTVpZTENpYi8rVE1OUSs3TktPUGIyZmRYd0d6?=
 =?utf-8?B?cENGN0pFV0p4bEhnU3UreXRybVBVYkkyNHRxOUM2L3AxL1I4aVFjVlhJVndV?=
 =?utf-8?B?ZVVpbk5NU21rOTRSbGtuaHRTMzc3N3dXd0dxMkJOanhxOUtEYjdFMjlxbWFm?=
 =?utf-8?B?YWxBSU1OTkc4THRZaTRBbm51bkhIeldYTkZNN3R2WjhYcXVKVXlaV3NueU1J?=
 =?utf-8?B?a3lORERGcU9sdUxCNytRRnp2WndzcjEwS2cyRC9JSEZmaS9WRWJpMHNmd1Zl?=
 =?utf-8?B?YUNUL0FicTZZV3g1ZklKcWRKQjBHVVRtcFgzZVlMZk1tc1V2emwzYzk1L2J5?=
 =?utf-8?B?UHZCYndCeXZyR3NKVk02UXhVMjY4QkpHdXhqM2M5NXk4d0xFRFR3M3kzOEVX?=
 =?utf-8?B?UVdpOXFubXI2eVFtbld1NVliVFdwSXFUUG1XcGN6amY0SFBQWEg1cDJvd3d3?=
 =?utf-8?B?V2YxNnRZRHM4d29aaUo1VGFTaHFXdjZ0NHBFR3h5d1ZkS2N3QldEYjJZNE9Z?=
 =?utf-8?B?L0x3WnVna1QzQkZJb1orNUxtbHBMRExuRjh3N1ozNXFJUzlKYzdwRE5NTW8w?=
 =?utf-8?B?cVFXemkxZ0tGblZXSHpGeC9ncXJUY3VLd3RuYVpPbW9CZWpvQ1ZqcTd1c1Ur?=
 =?utf-8?B?SE5vb2NSdjdWTDJiWTJ0MXJpajVBcW54YmJhWHVuNm1hU0JTTXo0U1hNd3ZI?=
 =?utf-8?B?aEE2OFl0M29FVG5wbHZKaDJIcmNBVWxmaU8rWnBOTFZsc1I4bUJGbWxCbzAz?=
 =?utf-8?B?SG5MZ2pzRXhmVkZBbkhtWnBxSGZpNCtpZ2pJaU5HR3V5SVBoNWRQcnZvaDFM?=
 =?utf-8?B?SFdvT2FiMmpJMWFZRkR4Njl6RUxkcWdRUHhGOWdyNWFEVU9MaG9ML1FoRXV3?=
 =?utf-8?B?VFhQY0s4Q3dGcTlqUHhpU2ZMOUZsZ0lCU2JZL3A5a2ROM2k1SUpPVzR5cnlK?=
 =?utf-8?B?Rmd1N3B5aFN3UUREQ2lqZnozckFsU2JOMERsWlR0WGRaUHJKMkhjUXY5cWlY?=
 =?utf-8?B?dUJZNjJsai9uQ0Q3cTB0Z3owOG12TVpqT3hSOTdpYVZOYmVON0VxWURuaEdP?=
 =?utf-8?B?aHhSVGZuV3J4UFlMeDYyV0JZQWhVZmVtT3JJTlI0Q0gwVkFVb3N3MkFjaTd0?=
 =?utf-8?B?TGdPMWp1Q2Y2R2RoU0lDdDRyRTJoNkRQSXlQdi9lbXduK2pweFJDSmtGbEFn?=
 =?utf-8?B?WXNqRStGVkdSQ3Jzb0sxL3J4YzBmbFNYdWRuRGpjd0FaMllMemM4eFdmb2pI?=
 =?utf-8?B?NzVxcHdXK21uQldIMUhlVy9uTWE3Q1R0aUVtSUNOSm9oMnRuQVduSlFpZFd0?=
 =?utf-8?B?LzJ4SnEzNlNyMURKazhGMFA0YUhkOWVtNUxHcXNnaUxNVTJybWVvYWduRkJq?=
 =?utf-8?B?T1BRdmlPZnlzbXNrQzRaUkZEU1Q0YS9PYlZoenZHQWNMTWFEaFNQOTU0b0Qw?=
 =?utf-8?Q?wUWs/bEIi5gKoYD/cxuNlbA2Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbd171b-8117-453c-1bc4-08daf4af9ccf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:13:51.5025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMpPKr5rggMBS/ZvahmPmOB/qMy/Tty4QEGS9VtcCJg2lcsn6WLyQhK7DLw5t+YFijO+grCQPhl9KUUqNrRMXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4855

On 1/12/23 07:57, James Bottomley wrote:
> On Wed, 2023-01-11 at 17:39 +0100, Christophe de Dinechin wrote:
> [...]
>> p29: Table 14: How can RAX be used as command ordinal and command
>> response size if it's already used for call identifier / result
>> value?
> 
> I think there's a bug on the first table: in the prototype we use RAX
> [in] (not RCX [in]) for the pointer to the request/response buffer and
> RAX [out] as the SVSM return code.

No, it's not a bug. You'll need to use RCX as the pointer to the 
request/response buffer because RAX, per calling convention, contains the 
protocol id and call id.

> 
> The shared response buffer has the platform command as the first word
> when it goes down and the response length as the first word when it
> comes back, which I think is what the second table is meant to show.

Right, I commented already that it was a typo and should have been an 
offset with a value of 0.

Thanks,
Tom

> 
>> p30: Why would you need 4 bytes for the TPM command ordinal? This
>> causes the TPM command size to be misaligned. What about 2 bytes for
>> command ordinal, one byte for locality, and one reserved byte?
> 
> It comes straight from the MSSIM protocol.  The actual vTPM service
> routine sends the buffer down unmodified to the vTPM command routines.
> If the size of this gets changed, the entire command would have to be
> copied to a new buffer to send it to the MSSIM vTPM.
> 
> James
> 
