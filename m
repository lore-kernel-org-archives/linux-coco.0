Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FB0947B
	for <linux-coco@lists.linux.dev>; Wed, 23 Aug 2023 09:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoupusKfB75APz0NhUt97nIAo6nNec1PbfkCtu4SXpo2VCIkP/lFvyMU0vWsVaA7Krya8UxwIAasVyeeAV0B0y6mxscnmFQUg9hNYNzF0JQzCD6QsIJQ27Khh4w/p54A6pSSqnA027Avm/IuuoD0K/ua2+8YlV/D8i//aM3itGVYiTw5aNaXnR4bR7+rAZX4TvKBPTcqK8k04HvXEXCVDZqGCiLzUSlNckx7ILLnLnZ9EfVK8O0z2R5rFRsIlHI+xp8arvNhEkz0f42PV7bhpn7iee7Ixth8ETIx1IRaHlk4ex1CTwDWaOfzPLz7XMtfvw4NrragA7een9ZHpIzoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSlRLbjENHF3PnRmdeYqVg52wrHDmepE7IB4E8FORRI=;
 b=oRkVo2rkRHchQgC6Dy1o7Myq2sft8Ue6PKSXvbzTr+4bFlN+GCVSsri/iMfsEHncc3+d+Kzssx2/rznedQCLqFcGuedzLGxbTNdniI5ziyIjdqZfsCiidtGAACEIAQazAsQAZ92tO3bW91tPAox0ORTSVlW0X6/ASCS9MvsZg2tkQoYfKtpRUO9QKjAqZXzH6FDwQkX8OI4VzrzyBPUeu3fYxuUDyWbvwt8wISKjoeo4cXSmgq9mzk3D0+ms3yv9oTMTiifznJILLYjtmwtS5fRlEaghWxwdykj0ASmRYkjRxmaxBr6qAcmjUndmPzCQr2VrqgEADV6jDa8vQ1mBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSlRLbjENHF3PnRmdeYqVg52wrHDmepE7IB4E8FORRI=;
 b=M4stdxo9OpzcLTXXlmOsyDLhMC4HtVv0xJ/DtNBVqDaZV8d83q7WtIgQxfF9vV0YBzEhbPA/5uTJKoPVHlc47f+qQz4braD8weiu8U9Hb49RlgNerFSbgFdI7UHapYs8Azv1D2u4wB4GWQ8RA9MDH3cn6s9dFjXkFhI5M7d/3oM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2843.namprd12.prod.outlook.com (2603:10b6:5:48::24) by
 DM8PR12MB5414.namprd12.prod.outlook.com (2603:10b6:8:3e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.26; Wed, 23 Aug 2023 09:23:00 +0000
Received: from DM6PR12MB2843.namprd12.prod.outlook.com
 ([fe80::e64e:9886:22bf:e7e7]) by DM6PR12MB2843.namprd12.prod.outlook.com
 ([fe80::e64e:9886:22bf:e7e7%7]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 09:22:59 +0000
Message-ID: <7696a627-aac0-eacd-ad9a-45385d444dec@amd.com>
Date: Wed, 23 Aug 2023 19:22:51 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [ANNOUNCE] SVSM development mailing list
Content-Language: en-US
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
 amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev
References: <ZORyduBLCO-QEJKE@suse.de>
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <ZORyduBLCO-QEJKE@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0011.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::16) To DM6PR12MB2843.namprd12.prod.outlook.com
 (2603:10b6:5:48::24)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2843:EE_|DM8PR12MB5414:EE_
X-MS-Office365-Filtering-Correlation-Id: 1581e0ee-fc19-4831-d2da-08dba3ba8acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AdUKKziywU3qqquh7JZI7YQpb3w3JfMuDMXREBwZTRyQqu1qdF1wn2QCvUUynG3dUmDKRkwb9/iNXerzuCD0tEV0Vfo36Ok9OuyNVF3ggbpLLERgc0uRcTX20QfEH3/cgS8jTVnD1aVYbDuWaLu1ZSlp8802iQK4pzVVyc8FhknL7virVqM0cxQNoc0tY1wzv2MBdZyiQ8fgrGKllVhOePUtwkYtFM6kIogvYVJYmVyWO+Fg8oAXY8JkYksmhRfS21VKvWLCeQ2/kYDnj9s5ZHAILM3c1J1BAoqylMMNfNunjQbdymlYe42/fjHWRpiD7gBhCxstbznRHnLkD+bB8aXIUuLiYL8OZLDG5Nnm8UPHo+x5lYPYRfgYRvU0sVeD1YYOkY5i4Y4jZ3Os08gBBz6oupS0sQb23HMDmfY+9EH9/tPFnCk456HzbeR5HmpIGlPY3XtLd9XoutTqqp2XZ/yRGBzkK8pSQNsy/R9cjIhl8FH8kI6mWVVSdD2NOM5hgatb4ozv1+Vi4R6gkxZBh23VF3KY34xRQYt29fTB1LIN2kb6i1Pl4oIu+XdGAM9kHIfNOfwT9OVo8O9FlQWyIk1kWWfsCAhb+pX3WnwY4D8EgmKmNThwq/m+AUshIFIDhgfqWR4VO3+jXEDF+hKaE8HmTunLF78I4TtZtdBXhUTkE02XuB6r1uL+8c5X2xWX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2843.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(186009)(451199024)(1800799009)(2616005)(6506007)(6486002)(316002)(53546011)(8936002)(8676002)(66556008)(66476007)(66946007)(6512007)(41300700001)(26005)(5660300002)(6666004)(478600001)(966005)(31686004)(4744005)(31696002)(36756003)(2906002)(38100700002)(45980500001)(130980200001)(223123001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVNZDA0M3ZTQ05jbkJwL00xTExUWk8xbGVDeFhpTm1UYWgvdDhsT3diVlRE?=
 =?utf-8?B?NnF4WnFTL1dEaGphM3FUZ21WMEVRVkJjK05keGxmdFlHeWhCbk9icEZWeUFZ?=
 =?utf-8?B?TEE4c3NwUGFtQU1rTDJUUVJIME9DaXR1djR2NHVEQ3RVcGF0NjAwV1VEcVUr?=
 =?utf-8?B?TlM0V0p5YTVlR016elZTZ1RaSzkyU2FNa012NW1GTEQvN3NCT1BFWThKeitX?=
 =?utf-8?B?REtFTWJOUzZEQ2JmYkt4TFZ1STg0L3F5MjVTejlqUnMydnI4TG1ZOXdCTHRo?=
 =?utf-8?B?MXNmQ0NlSGsrQWlwUUlBYXRYd1R4a3ptZnZ1T1grVHQveDdMZC82eWlLMFJy?=
 =?utf-8?B?cEtFUFkrekUxdzY4Rk9JY1NMdzIvdG56eVRNaFY2emtuVGdwL1VsUWEwZHps?=
 =?utf-8?B?MUpTV2tvemx2OSt6QldlQjFrM0cvSWlmT3lEc1pnUHgreWRrVXd4Z0V4b3Bt?=
 =?utf-8?B?TmFHc3JZNHhwRDRPK21oYUQ4Zm5sQzYxWFlOOHFaWUpkMUpKUEwwMVh5eUdh?=
 =?utf-8?B?MG0zeUVrampBY01iWWtuUXVFdlJTZW4rSGQ5N0pWRGFISnVIMTE0NjloZExK?=
 =?utf-8?B?UC9GSDJWODZKVFlDOGhEdGYvVTg2V1FENExEeWFXSXZUVHNPMWhMdW9kUDZR?=
 =?utf-8?B?VXNobnh6d3dkVU5ZTk9kd081SHRxSE1VZXcxMjZTeFJpQ3JMbGpiOTAzd0Rn?=
 =?utf-8?B?Wlo3Mkt5YjlFQ24yM2lQT0Z2bHpZTlVrNFNpc0ZjMHo3WmtsbExMOXYyckFX?=
 =?utf-8?B?VGlWWGNqTEtURHVMMEFHKytZZ2NBOFQwdEIzcVhJZWE5YlZPZzlwWTBUVHhU?=
 =?utf-8?B?MFk0blRsczREOE93NFdHZ2w3b1VxWXdYdjRZRFhXbUp4TlVMSnZLUjBLWWVN?=
 =?utf-8?B?ZmdZdXMwcHpJQmFsVUFzVkp5d3JBR3lBOVRTSlJRbmVsNlZjamJyRGQ0N2lP?=
 =?utf-8?B?WFJkMVNVbWN2bkljR01mNkFtSkg2SGxZRnFhN0ZLVzhoVVhKanV1VWxiSmlN?=
 =?utf-8?B?b2hhRi9BN2NkUW8rM1hRY1VhMFhmUnBMaXg0ZHNkSE4vMFhnUGQ1ZTVvdnY2?=
 =?utf-8?B?aTd2QkduVitxUWY5S3dCRHpCMHpZRUhRU0RDU25Pemc1K3RPZFpiK3pJczc1?=
 =?utf-8?B?ZSsxbjBNVERDdmsyNHRJeU5LZE02R0hYY0RQSnBpUjJrb2tHLzhuUEZVOFZF?=
 =?utf-8?B?NEgrYktYQzAwZ2hkcXE0czMyb3BhSStYODFkRE5DVHNydVhTQ0lJNFFocXpx?=
 =?utf-8?B?VHVQcHBMQTR5N08vM0JYKzZVbmNXZ2xNZm51c1hvdHdVaHRLSExySjBDMVlU?=
 =?utf-8?B?a1F1ZEVOS3pxSHlGUCs0R0RNTmJVdXJyOG8wTDBOMldhSkhsY2pQaVB2QldE?=
 =?utf-8?B?OTF4NkQ3RmVvZm1RcjQ3M0JZK1NkcEFyeE9HcWZvRGtoTno4OVNYNURNRERx?=
 =?utf-8?B?a0EzUlVoUXlGWElxK0JnOTZqVFJJMmRTMGwzVHRBcUFzaXR1aC9oZWxmWXVP?=
 =?utf-8?B?UTAvSTJqMkVnMGpMWkQ1a0d4R3NKNXdtakJsQ0VEUlp6UlIyMUYrVHllblZL?=
 =?utf-8?B?R2hkRnc5a3JOQm15TWk5Y0swNWdLUEVBeEd1S0M5QkVBbng3YWIxWGl6SW9Y?=
 =?utf-8?B?NGdIYjZITzlCVUNJNEMwN1owWUw5S1gvc09WQVBmbDNNUkYyTkFEa3ZKZzdT?=
 =?utf-8?B?N2ozTFpOYlk1ZmdOR21hb2FtMkpqRXFQWTJhS0NHeHFubXE0VGF6bFE2TEpK?=
 =?utf-8?B?RGt0bkhISjlUNlhmbjEvU0hOQjdId3RseGhNZmc2MUI3NmhEaDZSNU0wQkti?=
 =?utf-8?B?ampSdEp6QWlxcUMxVWVwQTFocm9BQlVReUd5MGVFeEdRMzU4azVwZjQ3VzF3?=
 =?utf-8?B?YjB6U3VDV1BRRlFKRC84NVRWUDIwUDFyMExuQTlWdnB6NFo4NU9kOUVuTDdU?=
 =?utf-8?B?NXkySU8zTUpKK0tLbW9QQ0JxM3dvWU5ja1VGdGRpYTVKL3RPM0RQMmhvdnJk?=
 =?utf-8?B?OXJNRWtpRTVUam12cVI4WjZnY1JpWVE2eUpzL0xnbU05dE9FbTBSWWhFTVpy?=
 =?utf-8?B?c2RhSy8wb21Kd3BQR09nUlpnenl3RVZlYWpmOHNuaWF4ejZmbmtqTnEwUXdx?=
 =?utf-8?Q?G5umDM6RsmP1dV5/LMzi+dn7w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1581e0ee-fc19-4831-d2da-08dba3ba8acc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2843.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 09:22:59.5695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3Za8wUhS7hPK6AqOtj8Ddh2HUEQ5Kykx4qjF4nNEsU4B0BTY04Ai+ie6Rg1cTk1qCzgCzv64LkT2S6ejmmvog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5414

On 22/8/23 18:31, Jörg Rödel wrote:
> Hi,
> 
> I'd to invite everyone interested in the development of
> Coconut-SVSM to join the newly created svsm-devel mailing list. The list
> address is
> 
> 	svsm-devel@coconut-svsm.dev
> 
> It is hosted by mailman, the link to subscribe is
> 
> 	https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel


I wonder how hard would it be to add this to nntp.lore.kernel.org...

> 
> The list will be used as an addition to GitHub for discussions on the
> further development of the Coconut-SVSM project.
> 
> The archives are public, so please do not post any confidential or NDA
> content to this list.
> 
> Regards,
> 

-- 
Alexey

